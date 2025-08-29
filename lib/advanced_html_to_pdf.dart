library advanced_html_to_pdf;

import 'dart:typed_data';
import 'dart:io' show File, Directory;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

/// Options for generating a PDF from HTML
class HtmlToPdfOptions {
  /// Target filename (without extension)
  final String filename;

  /// Optional subdirectory inside documents or temp directory
  final String? directory;

  /// Paper format (defaults to [PdfPageFormat.a4])
  final PdfPageFormat paperFormat;

  /// If true, use temporary directory instead of documents
  final bool useTemp;

  HtmlToPdfOptions({
    required this.filename,
    this.directory,
    this.paperFormat = PdfPageFormat.a4,
    this.useTemp = false,
  });
}

/// Utility class for HTML → PDF conversion
class AdvancedHtmlToPdf {
  AdvancedHtmlToPdf._();

  /// Converts an HTML string to raw PDF bytes
  static Future<Uint8List> fromHtmlToBytes(
      String html, {
        HtmlToPdfOptions? options,
      }) async {
    return await Printing.convertHtml(
      format: options?.paperFormat ?? PdfPageFormat.a4,
      html: html,
    );
  }

  /// Converts HTML to a PDF file and saves to disk.
  ///
  /// Returns the saved file path.
  static Future<String> fromHtmlToFile(
      String html, {
        required HtmlToPdfOptions options,
      }) async {
    final Uint8List pdfBytes = await fromHtmlToBytes(html, options: options);
    return await _writePdf(pdfBytes, options);
  }

  /// Internal helper to write bytes to file
  static Future<String> _writePdf(
      Uint8List pdfBytes,
      HtmlToPdfOptions options,
      ) async {
    final baseDir = options.useTemp
        ? await getTemporaryDirectory()
        : await getApplicationDocumentsDirectory();

    final targetDir = options.directory != null
        ? Directory('${baseDir.path}/${options.directory}')
        : baseDir;

    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }

    final sanitizedFilename =
    options.filename.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
    final filePath = '${targetDir.path}/$sanitizedFilename.pdf';

    final file = File(filePath);
    await file.writeAsBytes(pdfBytes, flush: true);
    return file.path;
  }

  /// Convenience method: generate a file and return it as [File]
  static Future<File> fromHtmlToFileObject(
      String html, {
        required HtmlToPdfOptions options,
      }) async {
    final path = await fromHtmlToFile(html, options: options);
    return File(path);
  }
}
