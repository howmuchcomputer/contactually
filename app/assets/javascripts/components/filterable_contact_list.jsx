class FilterableContactList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comAddressesOnly: false
    }
  }

  handleComFilterChange(comAddressesOnly) {
    this.setState({comAddressesOnly: comAddressesOnly});
  }

  render () {
    return (
      <div>
        <ListFilter 
          comAddressesOnly={this.state.comAddressesOnly} 
          onFilterChange={this.handleComFilterChange.bind(this)}
        />
        <ContactList 
          contacts={this.props.contacts}
          comAddressesOnly={this.state.comAddressesOnly}
        />
      </div>
    )
  }
}

