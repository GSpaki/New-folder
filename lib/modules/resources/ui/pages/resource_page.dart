import 'package:flutter/material.dart';
import '../../presentation/presenter/resource_presenter.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResourcePresenter();
  }
}
