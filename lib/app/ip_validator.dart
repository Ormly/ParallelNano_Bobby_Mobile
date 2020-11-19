/// A validator for the button on the [IPScreen].
///
/// It returns an error when an empty or invalid ip is entered
/// on the field and returns null when a valid ip is entered.
class IPValidator {
  static String validateIP(String val) {
    // The regular expression to check the IP address.
    Pattern _pattern =
        r'^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$';
    RegExp _regex = RegExp(_pattern);
    if (val.isEmpty) {
      return 'IP is required!';
    } else if (!_regex.hasMatch(val)) {
      return 'Please write a valid IP address!';
    } else {
      return null;
    }
  }
}
