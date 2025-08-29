<p align="center">
Advanced HTML to PDF - Package Developed By <a href="https://1morecode.com">1 More Code</a>.
</p>

[![pub package](https://img.shields.io/badge/pub-v0.0.1-orange)](https://pub.dev/packages/advanced_html_to_pdf) [![Build Status](https://img.shields.io/badge/publisher-1morecode.com-lightgrey)](https://1morecode.com)
[![Build Status](https://img.shields.io/badge/platform-flutter%7CAndroid%7CiOS%7CLinux%7CmacOS%7CWindows-blue)](https://flutter.dev)

<p align="center">
Easily convert HTML content into high-quality PDF documents in Flutter.
</p>

---

## 📝 About

**Advanced HTML to PDF** is a simple yet powerful Flutter package that lets you convert **HTML content** into professional **PDF files**.  
It works across **Android, iOS, Linux, macOS, Windows** and supports custom filenames, directories, and paper formats.

---

## ✨ Features

- Convert **raw HTML** into a PDF document
- Fully customizable with **headers, footers, and styles**
- Works with **Flutter mobile, web, and desktop**
- Supports saving in **documents** or **temporary directory**
- Access **file path** and **raw bytes** for sharing

---

## To use import the `advanced_html_to_pdf` package:
```dart
import 'package:advanced_html_to_pdf/advanced_html_to_pdf.dart';
```

#### How to use `AdvancedHtmlToPdf` property:

Example 1. Create HTML to PDF to get Path:
```html
var htmlContent = """
    <html>
      <body>
        <h1>Hello, PDF!</h1>
        <p>This PDF was generated from HTML.</p>
      </body>
    </html>
  """;
```
```dart
final path = await AdvancedHtmlToPdf.fromHtmlToFile(
  htmlContent,
  options: HtmlToPdfOptions(filename: "demo"),
);
```

Example 2. Create HTML to PDF to get File Object:
```html
var htmlContent = """
    <html>
      <body>
        <h1>Hello, PDF!</h1>
        <p>This PDF was generated from HTML.</p>
      </body>
    </html>
  """;
```
```dart
final path = await AdvancedHtmlToPdf.fromHtmlToFileObject(
  htmlContent,
  options: HtmlToPdfOptions(filename: "demo"),
);
```

Example 3. Create HTML to PDF to get fromHtmlToBytes:
```html
var htmlContent = """
    <html>
      <body>
        <h1>Hello, PDF!</h1>
        <p>This PDF was generated from HTML.</p>
      </body>
    </html>
  """;
```
```dart
final path = await AdvancedHtmlToPdf.fromHtmlToBytes(
  htmlContent,
  options: HtmlToPdfOptions(filename: "demo"),
);
```

Here is the output:
[View Demo PDF](https://cdn.jsdelivr.net/gh/1morecode/advanced_html_to_pdf/example/assets/demo.pdf)


## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  advanced_html_to_pdf: ^0.0.1
```

### Issues & Feedback

Please file an [issue](https://github.com/1morecode/advanced_html_to_pdf/issues) to send feedback or report a bug,  
If you want to ask a question or suggest an idea then you can [open an discussion](https://github.com/1morecode/advanced_html_to_pdf/discussions).  
Thank you!

### Contributing

Every pull request is most welcome 🤝.

### Support

If this package saves your time. You can now buy me a coffee! 

Scan bellow QR code or click and don't forget to leave a message there:

<a href="https://bmc.link/1morecode" target="_blank"><img src="https://github.com/1morecode/matertino_radio/assets/57178146/1995d3e2-b061-4655-81d5-df1d41d9bfb6" alt="Buy Me A Coffee" style="height: 160px !important" ></a>
