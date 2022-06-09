import 'package:flutter_test/flutter_test.dart';
import 'package:project/modules/resources/data/models/resource_model.dart';

import '../../mock/mock_resource_model.dart';

void main() {
  test(
    "Should return a model from entity",
    () {
      //act
      final actual = ResourceModel.fromEntity(mockResourceModel);

      //assert
      expect(actual, isA<ResourceModel>());
    },
  );
}
