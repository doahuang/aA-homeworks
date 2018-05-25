import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {result: 0, num1: '', num2: ''};

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.minus = this.minus.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here
  setNum1(e) {
    this.setState({num1: parseInt(e.target.value) || ''});
  }

  setNum2(e) {
    this.setState({num2: parseInt(e.target.value) || ''});
  }

  add(e) {
    this.setState({result: this.state.num1 + this.state.num2})
  }

  minus(e) {
    this.setState({result: this.state.num1 - this.state.num2})
  }

  multiply(e) {
    this.setState({result: this.state.num1 * this.state.num2})
  }

  divide(e) {
    this.setState({result: this.state.num1 / this.state.num2})
  }

  clear(e) {
    this.setState({result: 0, num1: '', num2: ''})
  }

  render(){
    const { result, num1, num2 } = this.state;
    return (
      <div>
        <h1>Result: {result}</h1>
        <strong>num1</strong><input onChange={this.setNum1} value={num1}></input>
        <strong>num2</strong><input onChange={this.setNum2} value={num2}></input>
        <button onClick={this.add}>+</button>
        <button onClick={this.minus}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clear}>CLEAR</button>
      </div>
    );
  }
}

export default Calculator;
