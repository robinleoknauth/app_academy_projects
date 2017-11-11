import React from 'react';


class Tab extends React.Component {

  constructor(props) {
    super(props);
  }


  render() {
    console.log(this.props);
    return (<div>Yaay tab </div>);
  }
}


module.exports = Tab;
