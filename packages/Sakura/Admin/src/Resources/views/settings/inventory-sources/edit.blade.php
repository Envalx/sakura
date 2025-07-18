<x-admin::layouts>
    <x-slot:title>
        @lang('admin::app.settings.inventory-sources.edit.title')
    </x-slot>

    {!! view_render_event('application.admin.settings.inventory_sources.edit.before', ['inventorySource' => $inventorySource]) !!}

    <x-admin::form 
        :action="route('admin.settings.inventory_sources.update', $inventorySource->id)"
        enctype="multipart/form-data"
        method="PUT"
    >

        {!! view_render_event('application.admin.settings.inventory_sources.edit.edit_form_controls.before', ['inventorySource' => $inventorySource]) !!}

        <div class="flex items-center justify-between gap-4 max-sm:flex-wrap">
            <p class="text-xl font-bold text-gray-800 dark:text-white">
                @lang('admin::app.settings.inventory-sources.edit.title')
            </p>

            <div class="flex items-center gap-x-2.5">
                <!-- Back Button -->
                <a
                    href="{{ route('admin.settings.inventory_sources.index') }}"
                    class="transparent-button hover:bg-gray-200 dark:text-white dark:hover:bg-gray-800"
                >
                    @lang('admin::app.settings.inventory-sources.edit.back-btn')
                </a>
                    
                <!-- Save Inventory -->
                <div class="flex items-center gap-x-2.5">
                    <button 
                        type="submit"
                        class="primary-button"
                    >
                        @lang('admin::app.settings.inventory-sources.edit.save-btn')
                    </button>
                </div>
            </div>
        </div>

        <!-- Full Pannel -->
        <div class="mt-3.5 flex gap-2.5 max-xl:flex-wrap">
    
            <!-- Left Section -->
            <div class="flex flex-1 flex-col gap-2 max-xl:flex-auto">

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.general.before', ['inventorySource' => $inventorySource]) !!}

                <!-- General -->
                <div class="box-shadow rounded bg-white p-4 dark:bg-gray-900">
                    <p class="mb-4 text-base font-semibold text-gray-800 dark:text-white">
                        @lang('admin::app.settings.inventory-sources.edit.general')
                    </p>

                    <!-- Code -->
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.settings.inventory-sources.edit.code')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="text"
                            id="code"
                            name="code"
                            rules="required"
                            :value="old('code') ?? $inventorySource->code"
                            :label="trans('admin::app.settings.inventory-sources.edit.code')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.code')"
                        />

                        <x-admin::form.control-group.error control-name="code" />
                    </x-admin::form.control-group>

                    <!-- Name -->
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.settings.inventory-sources.edit.name')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="text"
                            id="name"
                            name="name"
                            rules="required"
                            :value="old('name') ?? $inventorySource->name"
                            :label="trans('admin::app.settings.inventory-sources.edit.name')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.name')"
                        />

                        <x-admin::form.control-group.error control-name="name" />
                    </x-admin::form.control-group>

                    <!-- Description -->
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label>
                            @lang('admin::app.settings.inventory-sources.edit.description')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="textarea"
                            class="text-gray-600 dark:text-gray-300"
                            id="description"
                            name="description"
                            :value="old('description') ?? $inventorySource->description"
                            :label="trans('admin::app.settings.inventory-sources.edit.description')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.description')"
                        />

                        <x-admin::form.control-group.error control-name="description" />
                    </x-admin::form.control-group>
                </div>

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.general.after', ['inventorySource' => $inventorySource]) !!}

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.contact_info.before', ['inventorySource' => $inventorySource]) !!}

                <!-- Contact Information -->
                <div class="box-shadow rounded bg-white p-4 dark:bg-gray-900">
                    <p class="mb-4 text-base font-semibold text-gray-800 dark:text-white">
                        @lang('admin::app.settings.inventory-sources.edit.contact-info')
                    </p>

                    <!-- Contact Name -->
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.settings.inventory-sources.edit.contact-name')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="text"
                            name="contact_name"
                            id="contact_name"
                            rules="required"
                            :value="old('contact_name') ?? $inventorySource->contact_name"
                            :label="trans('admin::app.settings.inventory-sources.edit.contact-name')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.contact-name')"
                        />

                        <x-admin::form.control-group.error control-name="contact_name" />
                    </x-admin::form.control-group>

                    <!-- Contact Email -->
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.settings.inventory-sources.edit.contact-email')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="email"
                            id="contact_email"
                            name="contact_email"
                            rules="required|email"
                            :value="old('contact_email') ?? $inventorySource->contact_email"
                            :label="trans('admin::app.settings.inventory-sources.edit.contact-email')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.contact-email')"
                        />

                        <x-admin::form.control-group.error control-name="contact_email" />
                    </x-admin::form.control-group>

                    <!-- Contact Number -->
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label>
                            @lang('admin::app.settings.inventory-sources.edit.contact-number')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="text"
                            id="contact_number"
                            name="contact_number"
                            rules="required"
                            :value="old('contact_number') ?? $inventorySource->contact_number"
                            :label="trans('admin::app.settings.inventory-sources.edit.contact-number')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.contact-number')"
                        />

                        <x-admin::form.control-group.error control-name="contact_number" />
                    </x-admin::form.control-group>

                    <!-- Contact Fax -->
                    <x-admin::form.control-group class="!mb-0">
                        <x-admin::form.control-group.label>
                            @lang('admin::app.settings.inventory-sources.edit.contact-fax')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="text"
                            id="contact_fax"
                            name="contact_fax"
                            :value="old('contact_fax') ?? $inventorySource->contact_fax"
                            :label="trans('admin::app.settings.inventory-sources.edit.contact-fax')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.contact-fax')"
                        />

                        <x-admin::form.control-group.error control-name="contact_fax" />
                    </x-admin::form.control-group>
                </div>

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.contact_info.after', ['inventorySource' => $inventorySource]) !!}

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.source_address.before', ['inventorySource' => $inventorySource]) !!}

                <!-- Create Inventory -->
                <v-source-address></v-source-address>

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.source_address.after', ['inventorySource' => $inventorySource]) !!}

            </div>

            <!-- Right Section -->
            <div class="flex w-[360px] max-w-full flex-col gap-2">

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.accordion.settings.before', ['inventorySource' => $inventorySource]) !!}

                <!-- Settings -->
                <x-admin::accordion>
                    <x-slot:header>
                        <div class="flex items-center justify-between">
                            <p class="p-2.5 text-base font-semibold text-gray-800 dark:text-white">
                                @lang('admin::app.settings.inventory-sources.edit.settings')
                            </p>
                        </div>
                    </x-slot>
                
                    <x-slot:content>
                        <!-- Latitute -->
                        <x-admin::form.control-group>
                            <x-admin::form.control-group.label>
                                @lang('admin::app.settings.inventory-sources.edit.latitude')
                            </x-admin::form.control-group.label>

                            <x-admin::form.control-group.control
                                type="text"
                                id="latitude"
                                name="latitude"
                                :value="old('latitude') ?? $inventorySource->latitude"
                                :label="trans('admin::app.settings.inventory-sources.edit.latitude')"
                                :placeholder="trans('admin::app.settings.inventory-sources.edit.latitude')"
                            />

                            <x-admin::form.control-group.error control-name="latitude" />
                        </x-admin::form.control-group>

                        <!-- Longitude -->
                        <x-admin::form.control-group>
                            <x-admin::form.control-group.label>
                                @lang('admin::app.settings.inventory-sources.edit.longitude')
                            </x-admin::form.control-group.label>

                            <x-admin::form.control-group.control
                                type="text"
                                id="longitude"
                                name="longitude"
                                :value="old('longitude') ?? $inventorySource->longitude"
                                :label="trans('admin::app.settings.inventory-sources.edit.longitude')"
                                :placeholder="trans('admin::app.settings.inventory-sources.edit.longitude')"
                            />

                            <x-admin::form.control-group.error control-name="longitude" />
                        </x-admin::form.control-group>

                        <!-- Priority -->
                        <x-admin::form.control-group>
                            <x-admin::form.control-group.label>
                                @lang('admin::app.settings.inventory-sources.edit.priority')
                            </x-admin::form.control-group.label>

                            <x-admin::form.control-group.control
                                type="text"
                                id="priority"
                                name="priority"
                                :value="old('priority') ?? $inventorySource->priority"
                                :label="trans('admin::app.settings.inventory-sources.edit.priority')"
                                :placeholder="trans('admin::app.settings.inventory-sources.edit.priority')"
                            />

                            <x-admin::form.control-group.error control-name="priority" />
                            
                        </x-admin::form.control-group>

                        <!-- Status -->
                        <x-admin::form.control-group class="!mb-0">
                            <x-admin::form.control-group.label>
                                @lang('admin::app.settings.inventory-sources.edit.status')
                            </x-admin::form.control-group.label>

                            @php $selectedValue = old('status') ?: $inventorySource->status; @endphp

                            <x-admin::form.control-group.control
                                type="hidden"
                                name="status"
                                value="0"
                            />

                            <x-admin::form.control-group.control
                                type="switch"
                                name="status"
                                value="1"
                                :label="trans('admin::app.settings.inventory-sources.edit.status')"
                                :placeholder="trans('admin::app.settings.inventory-sources.edit.status')"
                                :checked="(bool) $selectedValue"
                            />

                            <x-admin::form.control-group.error control-name="status" />
                        </x-admin::form.control-group>
                    </x-slot>
                </x-admin::accordion>

                {!! view_render_event('application.admin.settings.inventory_sources.edit.card.accordion.settings.after', ['inventorySource' => $inventorySource]) !!}

            </div>
        </div>

        {!! view_render_event('application.admin.settings.inventory_sources.edit.edit_form_controls.after', ['inventorySource' => $inventorySource]) !!}

    </x-admin::form>

    {!! view_render_event('application.admin.settings.inventory_sources.edit.after', ['inventorySource' => $inventorySource]) !!}

    @pushOnce('scripts')
        <script
            type="text/x-template"
            id="v-source-address-template"
        >
            <!-- Source Address -->
            <div class="box-shadow rounded bg-white p-4 dark:bg-gray-900">
                <p class="mb-4 text-base font-semibold text-gray-800 dark:text-white">
                    @lang('admin::app.settings.inventory-sources.edit.source-address')
                </p>

                <!-- Country -->
                <x-admin::form.control-group>
                    <x-admin::form.control-group.label class="required">
                        @lang('admin::app.settings.inventory-sources.edit.country')
                    </x-admin::form.control-group.label>
    
                    <x-admin::form.control-group.control
                        type="select"
                        id="country"
                        name="country"
                        rules="required"
                        v-model="country"
                        :label="trans('admin::app.settings.inventory-sources.edit.country')"
                        :placeholder="trans('admin::app.settings.inventory-sources.edit.country')"
                    >
                        @foreach (core()->countries() as $country)
                            <option value="{{ $country->code }}">
                                {{ $country->name }}
                            </option>
                        @endforeach
                    </x-admin::form.control-group.control>
    
                    <x-admin::form.control-group.error control-name="country" />
                </x-admin::form.control-group>

                <!-- State -->
                <x-admin::form.control-group>
                    <x-admin::form.control-group.label class="required">
                        @lang('admin::app.settings.inventory-sources.edit.state')
                    </x-admin::form.control-group.label>
    
                    <template v-if="haveStates()">
                        <x-admin::form.control-group.control
                            type="select"
                            id="state"
                            name="state"
                            rules="required"
                            v-model="state"
                            :label="trans('admin::app.settings.inventory-sources.edit.state')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.state')"
                        >
                            <option 
                                v-for='(state, index) in countryStates[country]'
                                :value="state.code"
                            >
                                @{{ state.default_name }}
                            </option>
                        </x-admin::form.control-group.control>
                    </template>
    
                    <template v-else>
                        <x-admin::form.control-group.control
                            type="text"
                            id="state"
                            name="state"
                            rules="required"
                            :value="old('state') ?? $inventorySource->code"
                            v-model="state"
                            :label="trans('admin::app.settings.inventory-sources.edit.state')"
                            :placeholder="trans('admin::app.settings.inventory-sources.edit.state')"
                        />
                    </template>

                    <x-admin::form.control-group.error control-name="state" />
                </x-admin::form.control-group>

                <!-- City -->
                <x-admin::form.control-group>
                    <x-admin::form.control-group.label class="required">
                        @lang('admin::app.settings.inventory-sources.edit.city')
                    </x-admin::form.control-group.label>

                    <x-admin::form.control-group.control
                        type="text"
                        id="city"
                        name="city"
                        rules="required"
                        :value="old('city') ?? $inventorySource->city"
                        :label="trans('admin::app.settings.inventory-sources.edit.city')"
                        :placeholder="trans('admin::app.settings.inventory-sources.edit.city')"
                    />

                    <x-admin::form.control-group.error control-name="city" />
                </x-admin::form.control-group>

                <!-- Street -->
                <x-admin::form.control-group>
                    <x-admin::form.control-group.label class="required">
                        @lang('admin::app.settings.inventory-sources.edit.street')
                    </x-admin::form.control-group.label>

                    <x-admin::form.control-group.control
                        type="text"
                        name="street"
                        id="street"
                        rules="required"
                        :value="old('street') ?? $inventorySource->street"
                        :label="trans('admin::app.settings.inventory-sources.edit.street')"
                        :placeholder="trans('admin::app.settings.inventory-sources.edit.street')"
                    />

                    <x-admin::form.control-group.error control-name="street" />
                </x-admin::form.control-group>

                <!-- Post Code -->
                <x-admin::form.control-group class="!mb-0">
                    <x-admin::form.control-group.label class="required">
                        @lang('admin::app.settings.inventory-sources.edit.postcode')
                    </x-admin::form.control-group.label>

                    <x-admin::form.control-group.control
                        type="text"
                        id="postcode"
                        name="postcode"
                        rules="required"
                        :value="old('postcode') ?? $inventorySource->postcode"
                        :label="trans('admin::app.settings.inventory-sources.edit.postcode')"
                        :placeholder="trans('admin::app.settings.inventory-sources.edit.postcode')"
                    />

                    <x-admin::form.control-group.error control-name="postcode" />
                </x-admin::form.control-group>
            </div>
        </script>

        <script type="module">
            app.component('v-source-address', {
                template: '#v-source-address-template',

                data() {
                    return {
                        country: "{{ old('country') ?? $inventorySource->country }}",

                        state: "{{ old('state') ?? $inventorySource->state }}",

                        countryStates: @json(core()->groupedStatesByCountries())
                    }
                },

                methods: {
                    haveStates() {
                        if (this.countryStates[this.country] && this.countryStates[this.country].length) {
                            return true;
                        }

                        return false;
                    },
                }
            })
        </script>
    @endpushOnce
</x-admin::layouts>
