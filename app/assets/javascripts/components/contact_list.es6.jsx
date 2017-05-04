class ContactList extends React.Component {
  renderContacts() {
    return this.props.contacts.map((contact) => {
      if (this.props.comAddressesOnly && contact.email_address.search(/.com$/) === -1) return;
      return <Contact key={contact.id} contact={contact} />;
    });
  }

  render () {
    return (
      <table className="table table-striped">
        <thead>
          <tr>
            <th>First name</th>
            <th>Last name</th>
            <th>Email address</th>
            <th>Phone number</th>
            <th>Company name</th>
            <th colSpan="1"></th>
          </tr>
        </thead>

        <tbody>
          {this.renderContacts()}
        </tbody>
      </table>
    )
  }
}

