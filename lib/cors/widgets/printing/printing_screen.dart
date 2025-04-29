// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:awesome_extensions/awesome_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:printing/printing.dart';
// import 'package:uuid/uuid.dart';

// class PreviewScreen extends StatelessWidget {
//   const PreviewScreen({super.key, this.entryDoc, this.godownDoc});
//   final EntryModel? entryDoc;
//   final WarehouseModel? godownDoc;
//   @override
//   Widget build(BuildContext context) {
//     final id = Uuid().v4();
//     final pdf =
//         entryDoc != null
//             ? generateEntryPdf(entryDoc!)
//             : godownDoc != null
//             ? generateGodownPdf(godownDoc!)
//             : null;

//     if (pdf == null) {
//       return Center(child: Text('Invalid PDF!', style: context.bodyMedium));
//     }
//     return Scaffold(
//       appBar: AppBarWidget(title: 'Print Preview'),
//       body: PdfPreview(
//         build: (format) => pdf.save(),
//         allowSharing: true,
//         allowPrinting: true,
//         canChangeOrientation: false,
//         canChangePageFormat: false,
//         canDebug: false,
//         pdfFileName: "godown-data-$id.pdf",
//       ),
//     );
//   }
// }
