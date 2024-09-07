/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/**/*.{js,jsx,ts,tsx}", "./components/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        Rubik: ['Rubik-Regular'], // This refers to the Rubik-Regular font
        RubikBold: ['Rubik-Bold'],
        RubikMedium: ['Rubik-Medium'],
        RubikLight: ['Rubik-Light'],
        RubikBlack: ['Rubik-Black'],
      },
      colors: {
        primary: {
          100: '#F0F9F4',
          200: '#DAEEE1',
          300: '#C7EEDE',
          400: '#858A76',
          500: '#606c38',
          600: '#495a2c',
          700: '#3d4c26',
          800: '#313e20',
          900: '#272f1a',
        },
        secondary: {

          100: '#F0F9F4',
          200: '#D9F3E9',
          300: '#B3E6D2',
          400: '#425A27',
          500: '#283618',
          600: '#1f2912',
          700: '#17220e',
          800: '#0f180a',
          900: '#0a1207',
          


        },
        danger: {
          100: '#FEECEC',
          200: '#FCDADA',
          300: '#F9B7B7',
          400: '#F57E7E',
          500: '#FF686A',
          600: '#D94A4A',
          700: '#B93A3A',
          800: '#9A2D2D',
          900: '#7A2222',

        },
        success:{
          100: '#F0F9F4',
          200: '#D9F3E9',
          300: '#B3E6D2',
          400: '#80D6B1',
          500: '#4DC88F',
          600: '#3BAF6F',
          700: '#2C8E55',
          800: '#1F6E3B',
          900: '#144A2A',
        },
        warning:{
          100: '#FFFAF0',
          200: '#FFF5E1',
          300: '#FFEFC2',
          400: '#FFE99E',
          500: '#FFE376',
          600: '#FFD95D',
          700: '#FFC94A',
          800: '#FFB93A',
          900: '#FFA82D',
        },
        general: {
          100: '#F8F0FB',
          200: '#fefae0',
          300: '#dda15e',
          400: '#e0e0e0',
          500: '#bc6c25',
          600: '#a15e1e',
          700: '#8a5117',
          800: '#333333',
          900: '#1A1A1A',
      },


      },
    },
  },
  plugins: [],
}

