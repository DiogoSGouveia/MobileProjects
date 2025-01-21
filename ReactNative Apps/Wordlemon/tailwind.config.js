/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: "class",
  content: ["./app/**/*.{js,jsx,ts,tsx}", "./components/**/*.{js,jsx,ts,tsx}"],
  presets: [require("nativewind/preset")],
  theme: {
    extend: {
      fontFamily: {
        josefin100Thin: ["JosefinSans_100Thin"],
        josefin200ExtraLight: ["JosefinSans_200ExtraLight"],
        josefin300Light: ["JosefinSans_300Light"],
        josefin400Regular: ["JosefinSans_400Regular"],
        josefin500Medium: ["JosefinSans_500Medium"],
        josefin600SemiBold: ["JosefinSans_600SemiBold"],
        josefin700Bold: ["JosefinSans_700Bold"],
      },
      colors: {
        primary: {
          light: "#ffb703",
          dark: "#ffb703",
        },
        secondary: {
          light: "#34D399",
          dark: "#059669",
        },
        accent: {
          correct: "#A5DD9B",
          missing: "#FCDC94",
          incorrect: "#FF8A8A",
        },
        background: {
          light: "#F9F5FF",
          dark: "#000000",
        },
        text: {
          light: "#000000",
          dark: "#F9F5FF",
          correct: "#1D5E32",
          missing: "#8B5E00",
          incorrect: "#8A1F1F",
        },
        border: {
          light: "#E5E5E5",
          dark: "#262626",
          correct: "#1D5E32",
          missing: "#8B5E00",
          incorrect: "#8A1F1F",
        },
        neutral: {
          50: "#FAFAFA",
          100: "#F5F5F5",
          200: "#E5E5E5",
          300: "#D4D4D4",
          400: "#A3A3A3",
          500: "#737373",
          600: "#525252",
          700: "#404040",
          800: "#262626",
          900: "#171717",
        },
        // Add more color schemes as needed
      },
    },
  },
  plugins: [],
};
