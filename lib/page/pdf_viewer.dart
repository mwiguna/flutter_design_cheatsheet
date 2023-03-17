import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:internet_file/internet_file.dart';
import 'package:internet_file/storage_io.dart';
import 'package:pdfx/pdfx.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  String url = 'https://github.com/ScerIO/packages.flutter/raw/fd0c92ac83ee355255acb306251b1adfeb2f2fd6/packages/native_pdf_renderer/example/assets/sample.pdf';
  bool loaded = false;

  var pdfPinchController = null;
  var doc_second = null;

  @override
  void initState(){
    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(url)),
    );

    loadPdfSecond();
  }

  Future<void> loadPdfSecond() async {
    var uint8list = await InternetFile.get(url);
    File file = await File('/data/user/0/com.example.design_cheatsheet/cache/example.pdf').create();
    file.writeAsBytesSync(uint8list);
    doc_second = file.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          Column(
            children: [
              Container(
                height: 300,
                child: PdfViewPinch(
                  controller: pdfPinchController,
                  onDocumentLoaded: (document) {
                    setState(() => loaded = true);
                  },
                  onPageChanged: (page) {
                    setState(() {});
                  },
                ),
              ),

              const SizedBox(height: 10),
              if(loaded) Text(pdfPinchController.page.toString() + "/" + pdfPinchController.pagesCount.toString()),
              const SizedBox(height: 30),
            ],
          ),

          if(doc_second != null) Container(
            height: 300,
            child: PDFView(
              filePath: doc_second,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              onRender: (_pages) {
                print(_pages);
              },
              onError: (error) {
                print("ERROR");
              },
              onPageError: (page, error) {
                print("Page error");
              },
              onViewCreated: (PDFViewController pdfViewController) {},
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
              },
            ),
          ),

        ],
      ),
    );
  }
}
