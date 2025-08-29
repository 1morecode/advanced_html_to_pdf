import 'package:flutter/material.dart';
import 'package:advanced_html_to_pdf/advanced_html_to_pdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced HTML to PDF Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PdfDemoPage(),
    );
  }
}

class PdfDemoPage extends StatefulWidget {
  const PdfDemoPage({super.key});

  @override
  State<PdfDemoPage> createState() => _PdfDemoPageState();
}

class _PdfDemoPageState extends State<PdfDemoPage> {
  String? filePath;

  Future<void> _generatePdf() async {
    /// Example HTML with enough content for multiple pages
    final html = """
    <html>
      <head>
            <style>
      @page {
        margin: 100px 40px 80px 40px; /* top, right, bottom, left */
      }

      body { 
        font-family: Arial, sans-serif; 
        padding: 0; 
      }

      .page-number:before {
        content: counter(page);
      }
    </style>
      </head>
      <body>
        <header>
          Advanced HTML to PDF - Header
        </header>
        <h1>Welcome to Advanced HTML to PDF</h1>
        <p>This is page 1. It demonstrates how you can convert HTML into a multi-page PDF document using Flutter.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.</p>
        <p>Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris.</p>
        
        <div style="page-break-before: always;"></div>
        
        <h1>Page 2 Title</h1>
        <p>This is page 2. The page-break is controlled using <code>&lt;div style="page-break-before: always;"&gt;</code>.</p>
        <p>Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.</p>
        <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
         
        <footer>
          Advanced HTML to PDF - Footer</span>
        </footer>
      </body>
    </html>
    """;

    final path = await AdvancedHtmlToPdf.fromHtmlToFile(
      html,
      options: HtmlToPdfOptions(filename: "demo"),
    );

    setState(() => filePath = path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HTML to PDF Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _generatePdf,
              child: const Text("Generate PDF"),
            ),
            if (filePath != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "PDF saved at:\n$filePath",
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
