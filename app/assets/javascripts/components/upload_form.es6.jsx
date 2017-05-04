class UploadForm extends React.Component {
  onFormSubmit(event) {
    debugger;
    console.log(event.target);
  }

  render () {
    return (
      <form onChange={this.onFormSubmit} className="input-group">
        <input className="form-control" type="file" />
      </form>
    );
  }
}

