import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:rest_client/rest_client.dart';

void main() {
  test('UpdateProfileRequest serialization', () {
    const request = UpdateProfileRequest(
      name: 'Test Accou',
      username: null,
      introduction: null,
      location: null,
    );

    final jsonMap = request.toJson();
    print('JSON Map: $jsonMap');

    final jsonString = json.encode(jsonMap);
    print('JSON String: $jsonString');

    expect(jsonMap['name'], 'Test Accou');
    // Depending on includeIfNull config, these might be present as null or absent
    // Default freezed/json_serializable behavior is usually includeIfNull: true?
    // Let's see what happens.
  });
}
