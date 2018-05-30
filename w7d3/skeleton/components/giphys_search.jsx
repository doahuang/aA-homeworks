import React from 'react';

import GiphysIndex from './giphys_index';

export default class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ''
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearchGiphys('hello');
  }

  handleChange(e) {
    this.setState({
      searchTerm: e.target.value
    })
  }

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm)
      .then(this.setState({
        searchTerm: ''
      }));
  }

  render() {
    return (
      <div>
        <h1>Giphy</h1>
        <input
          onChange={this.handleChange}
          value={this.state.searchTerm} />
        <button onClick={this.handleSubmit}>search</button>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}
