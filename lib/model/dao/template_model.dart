class TemplateModel {
  String _name, _token, _phoneNumber, _email;
  int _id;
  TemplateModel(
      this._name, this._token, this._id, this._phoneNumber, this._email);

  String get token => _token;
  String get name => _name;
  String get email => _email;
  get phoneNumber => _phoneNumber;
  int get id => _id;

  set setName(String name) => _name = name;
  set setPhoneNumber(String phone) => _phoneNumber = phone;
}
