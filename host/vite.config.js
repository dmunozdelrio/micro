import { defineConfig } from 'vite';

export default defineConfig({
  server: {
    host: true,     // o '0.0.0.0'
    port: 5173,
    strictPort: true, // falla si 5173 está ocupado en lugar de auto-moverse
    open: false
  }
});
