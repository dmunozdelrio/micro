import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
  build: {
    lib: {
      entry: './src/main.jsx',
      name: 'Trending',
      fileName: 'trending',
    },
  },
})
