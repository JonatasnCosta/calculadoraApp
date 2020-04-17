import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PDFDiametro extends StatelessWidget {
  final String path;

  PDFDiametro({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}

