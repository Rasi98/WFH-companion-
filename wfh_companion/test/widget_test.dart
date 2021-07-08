import 'package:flutter_test/flutter_test.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  test("email validation test", () {
    expect(EmailValidator.validate("abc"), false);
    expect(EmailValidator.validate("abc@"), false);
    expect(EmailValidator.validate("@abc"), false);
    expect(EmailValidator.validate("abc@asd@"), false);
    expect(EmailValidator.validate("abc@sad."), false);
    expect(EmailValidator.validate("abc@x.x"), true);
    expect(EmailValidator.validate("abc.x.x"), false);
  });
}
