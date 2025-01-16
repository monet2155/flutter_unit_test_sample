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

    test('mockito cat thenAnswer', () {
      // Arrange
      var cat = MockCat();
      var responses = ["Purr", "Meow"];
      when(cat.sound()).thenAnswer((_) => responses.removeAt(0));

      // Act
      final result1 = cat.sound();
      final result2 = cat.sound();

      // Assert
      expect(result1, "Purr");
      expect(result2, "Meow");
    });

    test('mockito cat verify', () {
      var cat = MockCat();

      cat.sound();

      verify(cat.sound()).called(1);
    });
  });
}
