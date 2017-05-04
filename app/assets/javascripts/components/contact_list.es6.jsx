class ContactList extends React.Component {
  renderContacts() {
    return this.props.contacts.map((contact) => {
      return <Contact key={contact.id} contact={contact} />;
    });
  }

  render () {
    return (
      <div>
        <div className="btn btn-primary">Filter .com Email Addresses</div>
        <table>
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
      </div>
    )
  }
}

