import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/src/interfaces/main_module.dart';

class ModularWidget extends StatefulWidget {
  final MainModule module;

  const ModularWidget({Key key, this.module}) : super(key: key);

  @override
  _ModularWidgetState createState() => _ModularWidgetState();
}

class _ModularWidgetState extends State<ModularWidget> {
  @override
  void initState() {
    super.initState();
    Modular.init(widget.module);
  }

  @override
  void dispose() {
    super.dispose();
    widget.module.cleanInjects();
    print("-- ${widget.module.runtimeType.toString()} DISPOSED");
  }

  @override
  Widget build(BuildContext context) {
    return widget.module.bootstrap;
  }
}
