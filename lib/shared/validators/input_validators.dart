String? validateConfirmPassword(String? value, String? confirmValue) {
  var errorMsg = 'password is require';
  var invalidMsg = 'password is invalid';
  var invalidConfirmMsg = 'password does not match';
  final regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$');

  if (value == null || value.isEmpty) {
    return errorMsg;
  }

  var res = (regExp.hasMatch(value) && !(value == confirmValue))
      ? invalidConfirmMsg
      : !regExp.hasMatch(value)
          ? invalidMsg
          : null;
  return res;
}
