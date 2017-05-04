class Contact extends React.Component {
  constructor(props) {
    super(props);
    this.state = {removed: false};
  }

  destroy() {
    var self = this;
    $.ajax({ 
      url: '/api/v1/contacts/' + this.props.contact.id, 
      type: 'DELETE', 
      success: (res) => {
        self.setState({removed: true});
      }
    });
  }

  render () {
    if (this.state.removed) {
      return <tr className="hide"></tr>;
    }

    const {
      id,
      first_name,
      last_name,
      email_address,
      phone_number,
      company_name
    } = this.props.contact;

    return (
      <tr>
        <td>{first_name}</td>
        <td>{last_name}</td>
        <td>{email_address}</td>
        <td>{phone_number}</td>
        <td>{company_name}</td>
        <td><div className="btn btn-danger" onClick={this.destroy.bind(this)}>X</div></td>
      </tr>
    );
  }
}

