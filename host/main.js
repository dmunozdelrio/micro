import { mount as mountHeader } from '../apps/header/dist/header.js';
import { mount as mountTrending } from '../apps/trending/dist/trending.js';
import '../apps/header/dist/header.css';
import '../apps/trending/dist/trending.css';

mountHeader(document.querySelector('#header'));
mountTrending(document.querySelector('#trending'));
