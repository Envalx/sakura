<div class="mt-3 flex w-full items-center justify-center px-[60px] py-4 max-1180:px-8">
    <form
        action="{{ route('shop.search.index') }}"
        class="flex w-full max-w-[700px] items-center"
        role="search"
    >
        <label
            for="organic-search"
            class="sr-only"
        >
            @lang('shop::app.components.layouts.header.search')
        </label>

        <div class="relative w-full">
            <div class="icon-search pointer-events-none absolute top-[27%] flex items-center text-xl ltr:left-3 rtl:right-3"></div>

            <input
                type="text"
                name="query"
                value="{{ request('query') }}"
                class="block w-full rounded-lg border border-gray-300 bg-zinc-100 px-11 py-3 text-sm font-medium text-gray-900 transition-all hover:border-gray-400 focus:border-gray-400 lg:text-lg"
                minlength="{{ core()->getConfigData('catalog.products.search.min_query_length') }}"
                maxlength="{{ core()->getConfigData('catalog.products.search.max_query_length') }}"
                placeholder="@lang('shop::app.components.layouts.header.search-text')"
                aria-label="@lang('shop::app.components.layouts.header.search-text')"
                aria-required="true"
                pattern="[^\\]+"
                required
            >

            <button
                type="submit"
                class="hidden"
                aria-label="@lang('shop::app.components.layouts.header.submit')"
            >
            </button>

            @if (core()->getConfigData('catalog.products.settings.image_search'))
                @include('shop::search.images.index')
            @endif
        </div>
    </form>
</div>
