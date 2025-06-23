{!! view_render_event('application.shop.components.layouts.header.desktop.bottom.before') !!}

{!! view_render_event('application.shop.components.layouts.header.desktop.header-offer.after') !!}

<div class="flex min-h-[78px] w-full items-center justify-between border border-b border-l-0 border-r-0 border-t-0 px-[60px] max-1180:px-8">
    <!-- Left Navigation Section -->
    <div class="flex items-center flex-1">
        {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.logo.before') !!}

        <a
            href="{{ route('shop.home.index') }}"
            aria-label="@lang('shop::app.components.layouts.header.application')"
        >
            <h1 class="title text-black text-xl font-semibold">Akihabara</h1>
            <h3 class="text-black">Магазин японских сувениров</h3>
        </a>

        <!-- Mega Menu -->
        <v-desktop-category class="ml-4"></v-desktop-category>
    </div>

    <!-- Center Logo Section -->
    <div class="flex-1">
        <img
            src="{{ application_asset('images/Frame122.svg') }}"
            alt="Akihabara Logo"
            class=""
        />

    </div>

    <!-- Right Navigation Section -->
    <div class="flex items-center gap-x-9 max-[1100px]:gap-x-6 max-lg:gap-x-8">
        <!-- Right Navigation Links -->
        <div class="mt-1.5 flex gap-x-8 max-[1100px]:gap-x-6 max-lg:gap-x-8">
            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.compare.before') !!}

            <!-- Compare был -->

            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.compare.after') !!}

            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.mini_cart.before') !!}

            @if(core()->getCurrentChannel()->locales()->count() > 1 || core()->getCurrentChannel()->currencies()->count() > 1 )
                <div class="max-lg:hidden">
                    <x-shop::layouts.header.desktop.top />
                </div>
            @endif

            <!-- Mini cart -->
            @if(core()->getConfigData('sales.checkout.shopping_cart.cart_page'))
                @include('shop::checkout.cart.mini-cart')
            @endif

            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.mini_cart.after') !!}

            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.profile.before') !!}

            <!-- user profile -->
            <x-shop::dropdown position="bottom-{{ core()->getCurrentLocale()->direction === 'ltr' ? 'right' : 'left' }}">
                <x-slot:toggle>
                    <span
                        class="icon-users inline-block cursor-pointer text-2xl"
                        role="button"
                        aria-label="@lang('shop::app.components.layouts.header.profile')"
                        tabindex="0"
                    ></span>
                </x-slot>

                <!-- Guest Dropdown -->
                @guest('customer')
                    <x-slot:content>
                        <div class="grid gap-2.5">
                            <p class="font-dmserif text-xl">
                                @lang('shop::app.components.layouts.header.welcome-guest')
                            </p>

                            <p class="text-sm">
                                @lang('shop::app.components.layouts.header.dropdown-text')
                            </p>
                        </div>

                        <p class="py-2px mt-3 w-full border border-zinc-200"></p>

                        {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.customers_action.before') !!}

                        <div class="mt-6 flex gap-4">
                            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.sign_in_button.before') !!}

                            <a
                                href="{{ route('shop.customer.session.create') }}"
                                class="primary-button m-0 mx-auto block w-max rounded-2xl px-7 text-center text-base max-md:rounded-lg ltr:ml-0 rtl:mr-0"
                            >
                                @lang('shop::app.components.layouts.header.sign-in')
                            </a>

                            <a
                                href="{{ route('shop.customers.register.index') }}"
                                class="secondary-button m-0 mx-auto block w-max rounded-2xl border-2 px-7 text-center text-base max-md:rounded-lg max-md:py-3 ltr:ml-0 rtl:mr-0"
                            >
                                @lang('shop::app.components.layouts.header.sign-up')
                            </a>

                            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.sign_up_button.after') !!}
                        </div>

                        {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.customers_action.after') !!}
                    </x-slot>
                @endguest

                <!-- Customers Dropdown -->
                @auth('customer')
                    <x-slot:content class="!p-0">
                        <div class="grid gap-2.5 p-5 pb-0">
                            <p class="font-dmserif text-xl">
                                @lang('shop::app.components.layouts.header.welcome')'
                                {{ auth()->guard('customer')->user()->first_name }}
                            </p>

                            <p class="text-sm">
                                @lang('shop::app.components.layouts.header.dropdown-text')
                            </p>
                        </div>

                        <p class="py-2px mt-3 w-full border border-zinc-200"></p>

                        <div class="mt-2.5 grid gap-1 pb-2.5">
                            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.profile_dropdown.links.before') !!}

                            <a
                                class="cursor-pointer px-5 py-2 text-base hover:bg-gray-100"
                                href="{{ route('shop.customers.account.profile.index') }}"
                            >
                                @lang('shop::app.components.layouts.header.profile')
                            </a>

                            <a
                                class="cursor-pointer px-5 py-2 text-base hover:bg-gray-100"
                                href="{{ route('shop.customers.account.orders.index') }}"
                            >
                                @lang('shop::app.components.layouts.header.orders')
                            </a>

                            @if (core()->getConfigData('customer.settings.wishlist.wishlist_option'))
                                <a
                                    class="cursor-pointer px-5 py-2 text-base hover:bg-gray-100"
                                    href="{{ route('shop.customers.account.wishlist.index') }}"
                                >
                                    @lang('shop::app.components.layouts.header.wishlist')
                                </a>
                            @endif

                            <!--Customers logout-->
                            @auth('customer')
                                <x-shop::form
                                    method="DELETE"
                                    action="{{ route('shop.customer.session.destroy') }}"
                                    id="customerLogout"
                                />

                                <a
                                    class="cursor-pointer px-5 py-2 text-base hover:bg-gray-100"
                                    href="{{ route('shop.customer.session.destroy') }}"
                                    onclick="event.preventDefault(); document.getElementById('customerLogout').submit();"
                                >
                                    @lang('shop::app.components.layouts.header.logout')
                                </a>
                            @endauth

                            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.profile_dropdown.links.after') !!}
                        </div>
                    </x-slot>
                @endauth
            </x-shop::dropdown>

            {!! view_render_event('application.shop.components.layouts.header.desktop.bottom.profile.after') !!}
        </div>
    </div>
</div>

@pushOnce('scripts')
    <script
        type="text/x-template"
        id="v-desktop-category-template"
    >
        <div
            class="flex items-center gap-5"
            v-if="isLoading"
        >
            <span
                class="shimmer h-6 w-20 rounded"
                role="presentation"
            ></span>

            <span
                class="shimmer h-6 w-20 rounded"
                role="presentation"
            ></span>

            <span
                class="shimmer h-6 w-20 rounded"
                role="presentation"
            ></span>
        </div>

        <div class="flex items-center" v-else>
            <div class="group relative flex h-[77px] items-center">
                <button class="group relative flex items-center gap-x-3 px-6 py-3 uppercase font-semibold text-black hover:text-navyBlue transition-all duration-300 rounded-xl hover:shadow-md focus:outline-none focus:ring-2 focus:ring-navyBlue focus:ring-opacity-50">
                    <span class="relative flex flex-col items-center justify-center w-6 h-6">
                        <span class="absolute h-0.5 w-6 bg-current rounded-full transition-all duration-300 transform group-hover:rotate-45 group-hover:translate-y-[0.35rem]"></span>
                        <span class="absolute h-0.5 w-6 bg-current rounded-full transition-all duration-300 transform group-hover:-rotate-45 group-hover:translate-y-[-0.35rem]"></span>
                    </span>
                    <span class="relative after:absolute after:bottom-0 after:left-0 after:w-0 after:h-[2px] after:bg-navyBlue after:transition-all after:duration-300 group-hover:after:w-full">
                        Категории
                    </span>
                </button>
                <div class="border border-gray-300 pointer-events-none absolute w-[95vw] left-[-150%] top-[77px] translate-y-1  max-h-[90vh] overflow-auto bg-gray-100 opacity-0 shadow-2xl z-50 transition-all duration-300 ease-[cubic-bezier(0.4,0,0.2,1)] xl:left-[-150%] group-hover:pointer-events-auto group-hover:translate-y-0 group-hover:opacity-100 group-hover:duration-200 backdrop-blur-sm border border-gray-100 rounded-xl before:absolute before:-top-2 before:left-1/2 before:-translate-x-1/2 before:w-4 before:h-4 before:bg-white before:rotate-45 before:border-t before:border-l before:border-gray-200">
                    <div class="container mx-auto px-3 py-3 max-h-[60vh] xl:px-[30px] xl:py-4">
                        <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-7 gap-8">
                            <div
                                v-for="category in categories"
                                class="group relative min-w-[130px] max-w-[150px] grid justify-items-center gap-4 font-medium transition-transform hover:scale-[1.02]"
                            >

                                <a
                                    :href="category.slug"
                                    class="text-center text-lg font-semibold text-gray-800 hover:navyBluetransition-colors relative after:absolute after:bottom-0 after:left-1/2 after:-translate-x-1/2 after:w-0 after:h-[2px] after:bg-navyBlue hover:after:w-3/4 after:transition-all after:duration-300"
                                    v-text="category.name"
                                >
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </script>

    <script type="module">
        app.component('v-desktop-category', {
            template: '#v-desktop-category-template',

            data() {
                return  {
                    isLoading: true,
                    categories: [],
                }
            },

            mounted() {
                this.get();
            },

            methods: {
                get() {
                    this.$axios.get("{{ route('shop.api.categories.index') }}?limit=1000")
                        .then(response => {
                            this.isLoading = false;
                            this.categories = response.data.data;
                            console.log(this.categories);
                        }).catch(error => {
                            console.log(error);
                        });
                },
            },
        });
    </script>
@endPushOnce

{!! view_render_event('application.shop.components.layouts.header.desktop.bottom.after') !!}
