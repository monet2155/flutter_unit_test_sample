import 'package:flutter_unit_test_sample/cat.dart';
import 'package:mockito/annotations.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat_test.mocks.dart';

void main() {
  var cat = MockCat();
}
