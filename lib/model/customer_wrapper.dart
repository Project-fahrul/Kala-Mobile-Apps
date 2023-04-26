import 'package:customer_retention/model/customer_regular_model.dart';

class CustomerWrapper {
  List<CustomerRegularModel> customerRegulars = List.empty(growable: true);

  set setCustomerRegulars(List<CustomerRegularModel> data) =>
      customerRegulars = data;
  get getCustomerRegulars => customerRegulars;
}
