/** @type {import('tailwindcss').Config} */
module.exports = {
  // NOTE: Update this to include the paths to all of your component files.
  content: ["./app/**/*.{js,jsx,ts,tsx}",  "./components/**/*.{js,jsx,ts,tsx}"],
  presets: [require("nativewind/preset")],
  theme: {
    extend: {
      fontFamily: {Poppins: ['Poppins', 'sans-serif'],
                    PoppinsBold : ['Poppins-Bold', 'sans-serif'],
                    PoppinsMedium : ['Poppins-Medium', 'sans-serif'],
                    PoppinsRegular : ['Poppins-Regular', 'sans-serif'],
                    PoppinsSemiBold : ['Poppins-SemiBold', 'sans-serif'],
                    PoppinsExtraBold : ['Poppins-ExtraBold', 'sans-serif'],
                    PoppinsLight : ['Poppins-Light', 'sans-serif'],
                    PoppinsThin : ['Poppins-Thin', 'sans-serif'],
                    PoppinsExtraLight : ['Poppins-ExtraLight', 'sans-serif'],
                    PoppinsBlack : ['Poppins-Black', 'sans-serif'],
                    PoppinsItalic : ['Poppins-Italic', 'sans-serif'],
                    PoppinsExtraLightItalic : ['Poppins-ExtraLightItalic', 'sans-serif'],
                    PoppinsLightItalic : ['Poppins-LightItalic', 'sans-serif'],
                    PoppinsRegularItalic : ['Poppins-RegularItalic', 'sans-serif'],
                    PoppinsMediumItalic : ['Poppins-MediumItalic', 'sans-serif'],
                    PoppinsSemiBoldItalic : ['Poppins-SemiBoldItalic', 'sans-serif'],
                    PoppinsBoldItalic : ['Poppins-BoldItalic', 'sans-serif'],
                    PoppinsExtraBoldItalic : ['Poppins-ExtraBoldItalic', 'sans-serif'],
      },
      colors: {
        primary: {
          500: "f0f0f0"
        },
        secondary: {
          500: "#4031DE",
        },
        general: {
          100: "#0b0b0b",
          900: "#efefef",
        },
      }
                    
    },
  },
  plugins: [],
};
