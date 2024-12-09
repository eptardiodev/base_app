import 'package:base_app/data/remote/remote_constants.dart';
import 'package:base_app/domain/user/i_user_converter.dart';
import 'package:base_app/domain/user/user_model.dart';

class UserConverter implements IUserConverter{

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json[RemoteConstants.user_id] ?? "",
        // logoUrl: json[RemoteConstants.logo_url] ?? "",
        firstName: json[RemoteConstants.first_name] ?? "",
        lastName: json[RemoteConstants.last_name] ?? "",
        // middleName: json[RemoteConstants.middle_name] ?? "",
        fullName:
            '${json[RemoteConstants.first_name] ?? ''} ${json[RemoteConstants.last_name] ?? ''}',
        email: json[RemoteConstants.email] ?? "",
        // title: json[RemoteConstants.title] ?? "",
        // secondaryEmail: json[RemoteConstants.secondary_email] ?? "",
        // webSite: json[RemoteConstants.website] ?? "",
        primaryPhone: json[RemoteConstants.primary_hone] ?? "",
        // secondaryPhone: json[RemoteConstants.secondary_phone] ?? "",
        // faxNumber: json[RemoteConstants.fax_number] ?? "",
        // userType: json[RemoteConstants.user_type] ?? "",
        // customerName: json[RemoteConstants.customer_name] ?? "",
        // userFullName:
        //     '${json[RemoteConstants.first_name] ?? ''} ${json[RemoteConstants.middle_name] ?? ''} ${json[RemoteConstants.last_name] ?? ''}',
        // customerId: json[RemoteConstants.customer_id] ?? "",
        // nickName: json[RemoteConstants.nickname] ?? "",
        // initials: json[RemoteConstants.initials] ?? "",
        // supervisorName: json[RemoteConstants.supervisor_name] ?? "",
        // titleDescription: json[RemoteConstants.title_description] ?? "",
        // userRole: json[RemoteConstants.user_role] ?? "",
        // timeZone: json[RemoteConstants.time_zone] ?? "",
        // defaultLang: json[RemoteConstants.default_language] ?? "",
        firstLoggedOn: DateTime.tryParse(json[RemoteConstants.first_logged_on] ?? '') ,
        // addressList: List<String>.from(json[RemoteConstants.address_list] ?? []),
        // userSignature: json[RemoteConstants.user_signature] ?? ''
        );
  }

  @override
  Map<String, dynamic> toJson(UserModel model) {
    return {
      RemoteConstants.user_id: model.userId,
      // RemoteConstants.logo_url: model.logoUrl,
      RemoteConstants.first_name: model.firstName,
      RemoteConstants.last_name: model.lastName,
      // RemoteConstants.middle_name: model.middleName,
      RemoteConstants.full_name: model.fullName,
      RemoteConstants.email: model.email,
      // RemoteConstants.title: model.title,
      // RemoteConstants.secondary_email: model.secondaryEmail,
      // RemoteConstants.website: model.webSite,
      RemoteConstants.primary_hone: model.primaryPhone,
      // RemoteConstants.secondary_phone: model.secondaryPhone,
      // RemoteConstants.fax_number: model.faxNumber,
      // RemoteConstants.user_type: model.userType,
      // RemoteConstants.customer_name: model.customerName,
      // RemoteConstants.user_full_name: model.userFullName,
      // RemoteConstants.customer_id: model.customerId,
      // RemoteConstants.nickname: model.nickName,
      // RemoteConstants.initials: model.initials,
      // RemoteConstants.supervisor_name: model.supervisorName,
      // RemoteConstants.title_description: model.titleDescription,
      // RemoteConstants.user_role: model.userRole,
      // RemoteConstants.address_list: model.addressList,
      // RemoteConstants.default_language: model.defaultLang,
      // RemoteConstants.time_zone: model.timeZone,
      // RemoteConstants.active: true,
    };
  }
}
