/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./src/Resources/**/*.blade.php", "./src/Resources/**/*.js"],

    theme: {
        container: {
            center: true,

            screens: {
                "2xl": "1440px",
            },

            padding: {
                DEFAULT: "90px",
            },
        },

        screens: {
            sm: "525px",
            md: "768px",
            lg: "1024px",
            xl: "1240px",
            "2xl": "1440px",
            1180: "1180px",
            1060: "1060px",
            991: "991px",
            868: "868px",
        },

        extend: {
            colors: {
                navyBlue: "#d73d6c",
                lightOrange: "#d57276",
                darkGreen: "#d6c2bc",
                darkBlue: "#c0cccc",
                darkPink: "#ea73d2",
            },

            fontFamily: {
                poppins: ["Roboto"],
                dmserif: ["DM Serif Display"],
            },
        },
    },

    plugins: [],

    safelist: [
        {
            pattern: /icon-/,
        },
    ],
};
