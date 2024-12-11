import React from 'react';
import ReactDOM from 'react-dom/client'; 
import Trending from './components/Trending';

export function mount(el) {
  const root = ReactDOM.createRoot(el); 
  root.render(<Trending />); 
}
