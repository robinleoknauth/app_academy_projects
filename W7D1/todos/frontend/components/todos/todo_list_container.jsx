import {connect} from 'react-redux';
import TodoList from './todo_list';
import {allTodos} from '../../reducers/selectors.js';
import {receiveTodo} from '../../actions/todo_actions.js';



const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

const ToDoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default ToDoListContainer;
