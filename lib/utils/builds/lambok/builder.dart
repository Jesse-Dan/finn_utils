// lib/utils/builds/lambok/builder.dart
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generator.dart';

Builder lambokBuilder(BuilderOptions options) =>
    SharedPartBuilder([LambokGenerator()], 'lambok');
