<?php

namespace Sakura\Notification\Repositories;

use Illuminate\Support\Facades\DB;
use Sakura\Core\Eloquent\Repository;

class NotificationRepository extends Repository
{
    /**
     * Specify Model class name
     */
    public function model(): string
    {
        return 'Sakura\Notification\Contracts\Notification';
    }

    /**
     * Return Filtered Notification resources.
     */
    public function getParamsData(array $params): array
    {
        $query = $this->model->with('order');

        if (isset($params['status']) && $params['status'] != 'All') {
            $query->whereHas('order', function ($q) use ($params) {
                $q->where(['status' => $params['status']]);
            });
        }

        if (isset($params['read']) && isset($params['limit'])) {
            $query->where('read', $params['read'])->limit($params['limit']);
        } elseif (isset($params['limit'])) {
            $query->limit($params['limit']);
        }

        $notifications = $query->latest()->paginate($params['limit'] ?? 10);

        $statusCounts = $this->model->join('orders', 'notifications.order_id', '=', 'orders.id')
            ->select('orders.status', DB::raw('COUNT(*) as status_count'))
            ->groupBy('orders.status')
            ->get();

        return ['notifications' => $notifications, 'status_counts' => $statusCounts];
    }

    /**
     * Return Notification resources.
     *
     * @return array
     */
    public function getAll(array $params = [])
    {
        $query = $this->model->with('order');

        $notifications = $query->latest()->paginate($params['limit'] ?? 10);

        $statusCounts = $this->model->join('orders', 'notifications.order_id', '=', 'orders.id')
            ->select('orders.status', DB::raw('COUNT(*) as status_count'))
            ->groupBy('orders.status')
            ->get();

        return ['notifications' => $notifications, 'status_counts' => $statusCounts];
    }
}
