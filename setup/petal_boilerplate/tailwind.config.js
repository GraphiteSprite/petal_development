const colors = require("tailwindcss/colors");

module.exports = {
  content: [
    "../lib/*_web/**/*.*ex",
    "./js/**/*.js",
    "../../petal_components/**/*.*ex",
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.blue,
        secondary: colors.pink,
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
