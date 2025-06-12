import { createApp } from 'vue';
import Header from './components/Header.vue';
import './main.css'         // ensures Tailwind styles are bundled

export function mount(el) {
  createApp(Header).mount(el);
}