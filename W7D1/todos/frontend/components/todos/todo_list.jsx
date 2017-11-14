import React from 'react';
import {allTodos} from '../../reducers/selectors.js';
import ToDoForm from './todo_form.jsx';
// import App from '../todos/app.jsx';


export default class TodoList extends React.Component {
  // constructor() {
  //
  // }


  render() {
    // debugger;
    return (
      <div>
        <ul>
         {this.props.todos.map( todo => (
          <li>{todo.title} {todo.body}</li>
         ))}
       </ul>
       <ToDoForm />
     </div>
    );
  }
}


/*
  form handleSubmit
  props -> todos in

*/
