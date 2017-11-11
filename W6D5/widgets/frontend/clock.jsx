import React from 'react';

class Clock extends React.Component {


  constructor() {
    super();
    this.state = {time: new Date()};
  }

  tick() {
    this.setState( {time: new Date()} );
  }

  componentDidMount() {
    setInterval(this.tick.bind(this), 1000);
  }

  render() {
    return (
      <h1>{`${this.state['time']}`}</h1>
    );
  }
}

module.exports = Clock;
