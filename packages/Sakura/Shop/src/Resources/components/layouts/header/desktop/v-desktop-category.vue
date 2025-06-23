<template>
    <!-- Button to trigger mega menu -->
    <button
        type="button"
        class="flex items-center gap-x-[10px] px-5 py-3 text-base font-medium cursor-pointer hover:text-navyBlue"
        @click="openModal"
    >
        <span class="icon-menu text-2xl"></span>
        Каталог
    </button>

    <!-- Mega Menu Modal -->
    <div
        v-if="isModalOpen"
        class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-start justify-center"
        @click="closeModal"
    >
        <div
            class="bg-white mt-[78px] w-full max-w-[1260px] max-h-[80vh] overflow-y-auto rounded-lg shadow-xl relative"
            @click.stop
        >
            <button
                @click="closeModal"
                class="absolute right-4 top-4 p-2 hover:bg-gray-100 rounded-full"
                aria-label="Close menu"
            >
                <span class="icon-cross text-2xl"></span>
            </button>

            <!-- Loading State -->
            <div v-if="isLoading" class="p-9">
                <div class="flex items-center gap-5">
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
            </div>

            <!-- Categories Content -->
            <div v-else class="p-9">
                <div class="flex flex-wrap gap-14 mb-4">
                    <div
                        v-for="category in categories"
                        :key="category.id"
                        class="min-w-[250px] max-w-[300px]"
                    >
                        <p
                            class="text-lg font-medium text-navyBlue mb-5 hover:text-[#060C3B]"
                        >
                            <a :href="category.url" @click="closeModal">
                                {{ category.name }}
                            </a>
                        </p>

                        <ul v-if="category.children.length" class="space-y-3">
                            <li
                                v-for="subCategory in category.children"
                                :key="subCategory.id"
                                class="text-sm font-medium text-zinc-500 hover:text-navyBlue transition-colors duration-200"
                            >
                                <a :href="subCategory.url" @click="closeModal">
                                    {{ subCategory.name }}
                                </a>

                                <ul
                                    v-if="subCategory.children.length"
                                    class="pl-4 mt-2 space-y-2"
                                >
                                    <li
                                        v-for="thirdLevel in subCategory.children"
                                        :key="thirdLevel.id"
                                        class="text-sm text-zinc-500 hover:text-navyBlue transition-colors duration-200"
                                    >
                                        <a
                                            :href="thirdLevel.url"
                                            @click="closeModal"
                                        >
                                            {{ thirdLevel.name }}
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "v-desktop-category",

    data() {
        return {
            isLoading: true,
            isModalOpen: false,
            categories: [],
        };
    },

    mounted() {
        this.get();

        // Close modal on ESC key
        document.addEventListener("keydown", (e) => {
            if (e.key === "Escape" && this.isModalOpen) {
                this.closeModal();
            }
        });
    },

    methods: {
        get() {
            this.$axios
                .get(route("shop.api.categories.tree"))
                .then((response) => {
                    this.isLoading = false;
                    this.categories = response.data.data;
                })
                .catch((error) => {
                    console.log(error);
                });
        },

        openModal() {
            this.isModalOpen = true;
            document.body.style.overflow = "hidden";
        },

        closeModal() {
            this.isModalOpen = false;
            document.body.style.overflow = "";
        },
    },
};
</script>
