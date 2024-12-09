


class UserModel {
  String userId;
  // String logoUrl;
  // bool hasLogo;
  String firstName;
  String lastName;
  // String middleName;
  String fullName;
  String email;
  // String title;
  // String secondaryEmail;
  // String webSite;
  String primaryPhone;
  // String secondaryPhone;
  // String faxNumber;
  // String userType;
  // String customerName;
  // String userFullName;
  // String customerId;
  // String nickName;
  // String initials;
  // String supervisorName;
  // String titleDescription;
  // String userRole;
  // String defaultLang;
  // String timeZone;
  // List<String> addressList;
  DateTime? firstLoggedOn;
  // String? userSignature;

  // get parsedUserType => userType.trim().toLowerCase() ==
  //         RemoteConstants.customer.trim().toLowerCase()
  //     ? R.string.contacts_employee
  //     : userType;

  UserModel({
    this.firstLoggedOn,
    this.userId = '',
    // this.logoUrl = '',
    // this.hasLogo = true,
    this.firstName = '',
    this.lastName = '',
    // this.middleName = '',
    this.fullName = '',
    this.email = '',
    // this.title = '',
    // this.secondaryEmail = '',
    // this.webSite = '',
    this.primaryPhone = '',
    // this.secondaryPhone = '',
    // this.faxNumber = '',
    // this.userType = '',
    // this.customerName = '',
    // this.userFullName = '',
    // this.customerId = '',
    // this.nickName = '',
    // this.initials = '',
    // this.supervisorName = '',
    // this.titleDescription = '',
    // this.userRole = '',
    // this.addressList = const [],
    // this.defaultLang = '',
    // this.timeZone = '',
    // this.userSignature,
  });
}

// class UserHeaderModel {
//   final List<UserModel> users;
//   final String headerName;
//
//   UserHeaderModel({required this.users, required this.headerName});
// }
//
// class EmailUserSelectionModel {
//   String key;
//   String name;
//   bool isSelected;
//   String status;
//   String url;
//   String logoUrl;
//
//
//   EmailUserSelectionModel({this.key = '',
//     this.name = '',
//     this.isSelected = false,
//     this.status = '',
//     this.url = '',
//     this.logoUrl = ''});
// }
