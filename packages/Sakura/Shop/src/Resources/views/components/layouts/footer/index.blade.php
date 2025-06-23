{!! view_render_event('application.shop.layout.footer.before') !!}

<!--
    The category repository is injected directly here because there is no way
    to retrieve it from the view composer, as this is an anonymous component.
-->
@inject('themeCustomizationRepository', 'Sakura\Theme\Repositories\ThemeCustomizationRepository')

<!--
    This code needs to be refactored to reduce the amount of PHP in the Blade
    template as much as possible.
-->
@php
    $customization = $themeCustomizationRepository->findOneWhere([
        'type'       => 'footer_links',
        'status'     => 1,
        'channel_id' => core()->getCurrentChannel()->id,
    ]);
@endphp
<footer class="mt-20 bg-darkPink shadow-2xl border-t border-white/10 relative overflow-hidden max-sm:mt-14">
    <div class="container mx-auto px-6 py-8 lg:px-12 xl:py-12">
        <!-- Десктопная версия -->
        <div class="flex justify-between gap-12 border-b border-white/10 max-lg:hidden">
            @if ($customization?->options)
                @foreach ($customization->options as $footerLinkSection)
                    <div class="group">

                        <ul class="grid gap-4">
                            @php
                                usort($footerLinkSection, fn($a, $b) => $a['sort_order'] - $b['sort_order'])
                            @endphp

                            @foreach ($footerLinkSection as $link)
                                <li>
                                    <a href="{{ $link['url'] }}"
                                       class="flex items-center text-white/80 hover:text-white text-sm font-medium transition-all duration-300 hover:translate-x-1 group-hover:opacity-80 hover:!opacity-100
                                              before:content-['→'] before:mr-2 before:opacity-0 before:transition-all before:duration-300 hover:before:opacity-100">
                                        {{ $link['title'] }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                @endforeach
            @endif

        </div>

        <!-- Мобильная версия -->
        <x-shop::accordion
            :is-active="false"
            class="lg:hidden w-full bg-gradient-to-r from-darkBlue/80 to-navyBlue/80 rounded-2xl backdrop-blur-lg border border-white/10 shadow-lg"
        >
            <x-slot:header class="p-4 text-white font-semibold flex items-center justify-between hover:bg-white/5 transition-colors rounded-2xl">
                <span>@lang('shop::app.components.layouts.footer.footer-content')</span>
            </x-slot>

            <x-slot:content class="!bg-white/95 backdrop-blur-lg !p-6 space-y-8">
                @if ($customization?->options)
                    @foreach ($customization->options as $footerLinkSection)
                        <div>

                            <ul class="grid gap-3">
                                @foreach ($footerLinkSection as $link)
                                    <li>
                                        <a href="{{ $link['url'] }}"
                                           class="text-gray-700 hover:text-navyBlue flex items-center transition-all duration-300
                                                  before:content-['-'] before:mr-2 before:opacity-0 hover:before:opacity-100">
                                            {{ $link['title'] }}
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    @endforeach
                @endif
            </x-slot>
        </x-shop::accordion>

    </div>
</footer>
{!! view_render_event('application.shop.layout.footer.after') !!}
