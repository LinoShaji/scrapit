class authenticationData {
  static String getUserCred = r'''
  query get_usercred {
  user_cred{
    id
    name
  }
}
  ''';
}
