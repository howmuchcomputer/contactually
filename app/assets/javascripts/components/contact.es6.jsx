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

  _normalizePhoneNumber(number) {
    let splitNumber = number.split("x");
    let phone = splitNumber[0];
    let extension = splitNumber[1] ? ` x${splitNumber[1]}` : "";
    
    if (phone.length > 10) {
      return `${'+' + phone.slice(0, phone.length - 10) + ' '}${phone.slice(-10).replace(/(\d{3})(\d{3})(\d{4})/, "($1) $2-$3")}${extension}`;
      
    } else {
      return `${phone.replace(/(\d{3})(\d{3})(\d{4})/, "($1) $2-$3")}${extension}`;
    }
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
        <td>{this._normalizePhoneNumber(phone_number)}</td>
        <td>{company_name}</td>
        <td><div className="btn btn-danger" onClick={this.destroy.bind(this)}>X</div></td>
      </tr>
    );
  }
}

