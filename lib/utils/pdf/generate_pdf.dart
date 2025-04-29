// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// import '../helpers/date_helper.dart';

// pw.Document generateEntryPdf(EntryModel entry) {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return [
//           // Header Section
//           pw.Center(
//             child: pw.Text(
//               "GODOWN TRANSFER",
//               textAlign: pw.TextAlign.center,
//               style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
//             ),
//           ),
//           pw.SizedBox(height: 20),

//           pw.Text("ID: ${entry.id}", style: pw.TextStyle(fontSize: 16)),
//           pw.SizedBox(height: 2),
//           pw.Text(
//             "Date: ${DateHelper.formatDate(entry.date)}",
//             style: pw.TextStyle(fontSize: 16),
//           ),
//           pw.SizedBox(height: 2),
//           pw.Text(
//             "From Godown: ${entry.from!.name}",
//             style: pw.TextStyle(fontSize: 16),
//           ),
//           pw.SizedBox(height: 2),
//           pw.Text(
//             "To Godown: ${entry.to!.name}",
//             style: pw.TextStyle(fontSize: 16),
//           ),
//           pw.SizedBox(height: 10),

//           // Table Section
//           pw.TableHelper.fromTextArray(
//             headers: ["Item", "Quantity"],
//             data:
//                 entry.items!.map((item) {
//                   return [item.item?.name ?? "N/A", item.quantity.toString()];
//                 }).toList(),
//             columnWidths: {0: pw.FlexColumnWidth(), 1: pw.FlexColumnWidth()},
//             cellAlignments: {
//               0: pw.Alignment.centerLeft,
//               1: pw.Alignment.centerRight,
//             },
//             border: pw.TableBorder.all(),
//             headerStyle: pw.TextStyle(
//               fontSize: 14,
//               fontWeight: pw.FontWeight.bold,
//             ),
//             cellAlignment: pw.Alignment.centerLeft,
//           ),

//           pw.SizedBox(height: 20),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.end,
//             children: [
//               pw.Text(
//                 "Total quantity: ${entry.items?.fold(0, (sum, item) => sum + (item.quantity ?? 0))}",
//                 style: pw.TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//           pw.SizedBox(height: 20),
//           // Footer Section
//           pw.Align(
//             alignment: pw.Alignment.centerRight,
//             child: pw.Text(
//               "Checked by: ${entry.createdBy?.name.toString().toUpperCase()}",
//               style: pw.TextStyle(fontSize: 16),
//             ),
//           ),
//         ];
//       },
//     ),
//   );

//   return pdf;
// }

// pw.Document generateGodownPdf(WarehouseModel godown) {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return [
//           // Header Section
//           pw.Center(
//             child: pw.Text(
//               "STOCK SUMMARY",
//               textAlign: pw.TextAlign.center,
//               style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
//             ),
//           ),
//           pw.SizedBox(height: 20),

//           pw.Text("Godown: ${godown.name}", style: pw.TextStyle(fontSize: 16)),
//           pw.SizedBox(height: 10),

//           // Table Section
//           pw.TableHelper.fromTextArray(
//             headers: ["Item", "Quantity"],
//             data:
//                 godown.stocks!.map((item) {
//                   return [item.item?.name ?? "N/A", item.quantity.toString()];
//                 }).toList(),
//             columnWidths: {0: pw.FlexColumnWidth(), 1: pw.FlexColumnWidth()},
//             cellAlignments: {
//               0: pw.Alignment.centerLeft,
//               1: pw.Alignment.centerRight,
//             },
//             border: pw.TableBorder.all(),
//             headerStyle: pw.TextStyle(
//               fontSize: 14,
//               fontWeight: pw.FontWeight.bold,
//             ),
//             cellAlignment: pw.Alignment.centerLeft,
//           ),
//           pw.SizedBox(height: 20),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.end,
//             children: [
//               pw.Text(
//                 "Total quantity: ${godown.stocks?.fold(0, (sum, item) => sum + (item.quantity ?? 0))}",
//                 style: pw.TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ];
//       },
//     ),
//   );

//   return pdf;
// }
