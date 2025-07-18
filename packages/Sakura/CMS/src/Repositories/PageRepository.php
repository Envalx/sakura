<?php

namespace Sakura\CMS\Repositories;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Sakura\CMS\Models\PageTranslationProxy;
use Sakura\Core\Eloquent\Repository;

class PageRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\CMS\Contracts\Page';
    }

    /**
     * @return \Sakura\CMS\Contracts\Page
     */
    public function create(array $data)
    {
        $model = $this->getModel();

        foreach (core()->getAllLocales() as $locale) {
            foreach ($model->translatedAttributes as $attribute) {
                if (isset($data[$attribute])) {
                    $data[$locale->code][$attribute] = $data[$attribute];
                }
            }

            $data[$locale->code]['html_content'] = str_replace('=&gt;', '=>', $data[$locale->code]['html_content']);
        }

        $page = parent::create($data);

        $page->channels()->sync($data['channels']);

        return $page;
    }

    /**
     * @param  int  $id
     * @return \Sakura\CMS\Contracts\Page
     */
    public function update(array $data, $id)
    {
        $page = $this->find($id);

        $locale = $data['locale'] ?? app()->getLocale();

        $data[$locale]['html_content'] = str_replace('=&gt;', '=>', $data[$locale]['html_content']);

        $page = parent::update($data, $id);

        $page->channels()->sync($data['channels']);

        return $page;
    }

    /**
     * Checks slug is unique or not based on locale
     *
     * @param  int  $id
     * @param  string  $urlKey
     * @return bool
     */
    public function isUrlKeyUnique($id, $urlKey)
    {
        $exists = PageTranslationProxy::modelClass()::where('cms_page_id', '<>', $id)
            ->where('url_key', $urlKey)
            ->limit(1)
            ->select(\DB::raw(1))
            ->exists();

        return ! $exists;
    }

    /**
     * Retrieve category from slug
     *
     * @param  string  $urlKey
     * @return \Sakura\CMS\Contracts\Page
     */
    public function findByUrlKey($urlKey)
    {
        return $this->model->whereTranslation('url_key', $urlKey)->first();
    }

    /**
     * Retrieve category from slug
     *
     * @param  string  $urlKey
     * @return \Sakura\CMS\Contracts\Page|\Exception
     */
    public function findByUrlKeyOrFail($urlKey)
    {
        $page = $this->model->whereTranslation('url_key', $urlKey)->first();

        if ($page) {
            return $page;
        }

        throw (new ModelNotFoundException)->setModel(
            get_class($this->model), $urlKey
        );
    }
}
