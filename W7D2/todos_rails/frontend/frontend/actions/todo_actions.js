import * as TodosAPIUtil from '../util/todo_api_util.js';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
export const TODO_ERROR = 'TODO_ERROR';

export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const todoError = error => ({
  type: TODO_ERROR,
  error
});

// export const createTodo = error => ({
//   type: TODO_ERROR,
//   error
// });

export const fetchTodos = () => dispatch => (
  TodosAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = (formTodo) => dispatch => (
  TodosAPIUtil.createTodos(formTodo).then(todo => dispatch(receiveTodo(todo)))
);
