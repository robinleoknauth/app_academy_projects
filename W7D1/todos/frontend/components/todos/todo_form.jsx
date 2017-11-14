// import uniqueId from '../../utils/uniqueId.js';
import React from 'react';

class TodoForm extends React.Component {
  constructor() {
    super();
    this.state = {
      word: ''
    };
  }

  linkState(key) {
    // here we use '[key]' to set the key to be the value of the 'key' variable,
    // as opposed to a string of 'key'
    return (event => this.setState({[key]: event.currentTarget.value}));
  }

  render () {
    return (
      <div>
        <input type="text" onChange={this.linkState('word')} value={this.state.word}/>
      </div>
    );
  }
}

export default TodoForm;
