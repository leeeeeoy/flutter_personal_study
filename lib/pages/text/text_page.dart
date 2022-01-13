import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Colors.lightBlueAccent,
                child: Text(
                  '텍스트 스타일 테스트입니다.\n두번째 줄바꿈 테스트입니다',
                  style: TextStyle(
                    fontSize: 24,
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                color: Colors.redAccent,
                child: Text(
                  '텍스트 스타일 테스트입니다.\n두번째 줄바꿈 테스트입니다',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                color: Colors.lightGreenAccent,
                child: Text(
                  '텍스트 스타일 테스트입니다.\n두번째 줄바꿈 테스트입니다',
                  style: TextStyle(
                    fontSize: 24,
                    wordSpacing: 10,
                  ),
                ),
              ),
              Container(
                color: Colors.yellowAccent,
                child: Text(
                  '텍스트 스타일 테스트입니다.\n두번째 줄바꿈 테스트입니다',
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
