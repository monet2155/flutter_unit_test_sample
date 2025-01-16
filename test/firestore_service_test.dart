// test/firestore_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/firestore_service.dart';
import 'package:mockito/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';

// Generate Mock classes for Firestore and its components
@GenerateNiceMocks([
  MockSpec<FirebaseFirestore>(),
  MockSpec<CollectionReference>(),
  MockSpec<DocumentReference>(),
  MockSpec<DocumentSnapshot>(),
])
import 'firestore_service_test.mocks.dart';

void main() {
  group('FirestoreService Tests', () {
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference<Map<String, dynamic>> mockCollection;
    late MockDocumentReference<Map<String, dynamic>> mockDocument;
    late MockDocumentSnapshot<Map<String, dynamic>> mockSnapshot;
    late FirestoreService firestoreService;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollection = MockCollectionReference();
      mockDocument = MockDocumentReference();
      mockSnapshot = MockDocumentSnapshot();

      firestoreService = FirestoreService(firestore: mockFirestore);

      when(mockFirestore.collection(any)).thenReturn(mockCollection);
      when(mockCollection.doc(any)).thenReturn(mockDocument);
    });

    test('Should fetch document data', () async {
      // Arrange
      final mockData = {'name': 'Test User', 'age': 25};
      when(mockDocument.get()).thenAnswer((_) async => mockSnapshot);
      when(mockSnapshot.data()).thenReturn(mockData);

      // Act
      final result = await firestoreService.getDocument('users', '123');

      // Assert
      expect(result, equals(mockData));
      verify(mockFirestore.collection('users')).called(1);
      verify(mockCollection.doc('123')).called(1);
      verify(mockDocument.get()).called(1);
    });
  });
}
