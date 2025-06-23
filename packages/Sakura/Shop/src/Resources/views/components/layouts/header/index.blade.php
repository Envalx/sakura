{!! view_render_event('application.shop.layout.header.before') !!}

<header class="shadow-gray sticky top-0 z-10 bg-darkPink shadow-sm max-lg:shadow-none">
    <x-shop::layouts.header.desktop />

    <x-shop::layouts.header.mobile />
</header>

{!! view_render_event('application.shop.layout.header.after') !!}
