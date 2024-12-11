import { defineConfig } from 'vite';

export default defineConfig({
  build: {
    lib: {
      entry: './src/main.jsx',
      name: 'Trending',
      fileName: 'trending',
    },
  },
});
