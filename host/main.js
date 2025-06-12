import { mount as mountHeader } from '../apps/header/dist/header.js';
import { mount as mountTrending } from '../apps/trending/dist/trending.js';
import '../apps/header/dist/style.css';
import '../apps/trending/dist/style.css';

mountHeader(document.querySelector('#header'));
mountTrending(document.querySelector('#trending'));
