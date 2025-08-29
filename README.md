
# advanced_html_to_pdf

A Flutter package to easily convert HTML content into high-quality PDF documents.

## Features

- Convert raw HTML into a PDF document
- Customize PDF output with headers, footers, and styling
- Works with Flutter mobile, web, and desktop

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  advanced_html_to_pdf: ^0.0.1
```

## Usage

```dart
import 'package:advanced_html_to_pdf/advanced_html_to_pdf.dart';
import 'dart:io';

void generatePdf() async {
  final pdfFile = await AdvancedHtmlToPdf.convertHtml(
    html: "<h1>Hello PDF</h1><p>This is generated from HTML.</p>",
    fileName: "example.pdf",
  );
  print("PDF saved at: $pdfFile");
}
```

## Example App

Check the `/example` folder for a complete Flutter app demonstrating usage.

## License

This project is licensed under the MIT License.
