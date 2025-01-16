import 'package:flutter_unit_test_sample/cat.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat_test.mocks.dart';

void main() {
  group('cat', () {
    test('cat test', () {
      var cat = MockCat();

      cat.sound();

      verify(cat.sound());
    });

    test('mockito cat when', () {
      // Arrange
      var cat = MockCat();
      when(cat.sound()).thenReturn("Purr");

      // Act
      final result = cat.sound();

      // Assert
      expect(result, "Purr");
    });
  });
}
