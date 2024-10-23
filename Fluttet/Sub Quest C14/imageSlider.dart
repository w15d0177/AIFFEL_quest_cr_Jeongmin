import 'package:flutter/material.dart';
import 'dart:async';

class ImageSlider extends StatefulWidget {
  final List<String> imageList; // 슬라이드할 이미지 리스트
  const ImageSlider({Key? key, required this.imageList}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % widget.imageList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: widget.imageList.length,
        itemBuilder: (context, index) {
          return Image.asset(widget.imageList[index], fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
            print('Current page: $_currentPage');
          });
        },
      ),
    );
  }
}
