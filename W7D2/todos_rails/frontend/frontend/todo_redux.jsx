import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import thunk from './middleware/thunk.js';
import {fetchTodos} from './actions/todo_actions.js';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  // const preloadedState = localStorage.state ?
  //   JSON.parse(localStorage.state) : {};
  const store = configureStore();

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
  window.store = store;
  window.thunk = thunk;
  window.fetchTodos = fetchTodos;
});
