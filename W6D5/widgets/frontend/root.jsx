import React from 'react';
import Clock from './clock';
import Tab from './tab';

const Panes = [{title: "one", content: "I am the first"},
 {title: "two", content: "2"},
  {title: "three", content: "3"}];

class Root extends React.Component {


  render() {
    return (
    <div>
      <Clock/>
      <Tab panes={Panes}/>
    </div>
  );
  }
}

module.exports = Root;
