/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_pages/**/*.md',
    './*.html',
    './*.md'
  ],
  theme: {
    extend: {
      colors: {
        primary: '#1E40AF', // Example: change to your color
      },
    },
  },
  plugins: [],
}
