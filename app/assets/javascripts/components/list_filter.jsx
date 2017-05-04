class ListFilter extends React.Component {
  onFilterChange(event) {
    this.props.onFilterChange(event.target.checked);
  }

  render () {
    return (
      <form>
        <p>
          <input type="checkbox" 
                 checked={this.props.comAddressesOnly} 
                 onChange={this.onFilterChange.bind(this)}
          />
          {' '}
          Only show .com email addresses
        </p> 
      </form>
    )
  }
}

