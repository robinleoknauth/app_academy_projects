import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import rootReducer from './reducers/root_reducer.js';
import {receiveTodo, receiveTodos} from './actions/todo_actions.js';
import Root from './components/root.jsx';
import {allTodos} from './reducers/selectors';
// const store1 = configureStore();
// window.store = store1;
// window.store.getState();

document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
});



// akdslfghjaksodfghu

// sldkfbglsakfjbgalksjbg
