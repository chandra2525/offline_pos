import 'package:pdf/widgets.dart' as pw;
import 'package:point_of_sales/models/cart_item_model.dart';
import 'package:printing/printing.dart';

class ReceiptService {
  Future<void> printReceipt(
      List<CartItem> cartItems, double totalAmount) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Receipt', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 16),
            pw.Text('Date: ${DateTime.now().toIso8601String()}'),
            pw.SizedBox(height: 16),
            pw.Text('Items:', style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 8),
            pw.ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(item.product.name),
                    pw.Text(
                        '${item.quantity} x \$${item.product.price.toStringAsFixed(2)}'),
                  ],
                );
              },
            ),
            pw.SizedBox(height: 16),
            pw.Text('Total: \$${totalAmount.toStringAsFixed(2)}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}
