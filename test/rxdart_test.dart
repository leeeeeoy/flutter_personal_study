import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test('각 스트림에서 모든 값이 한개이상 방출되었을때, 가장 최근값들을 합쳐 방출해야한다', () async {
    // given
    var a = Stream.fromIterable(['a']),
        b = Stream.fromIterable(['b']),
        c = Stream.fromIterable(['C', 'D']);

    // when
    final stream = Rx.combineLatestList([a, b, c]);

    // then
    await expectLater(
        stream,
        emitsInOrder([
          ['a', 'b', 'C'],
          ['a', 'b', 'D'],
          emitsDone
        ]));
  }, timeout: const Timeout(Duration(seconds: 5)));

  test('각 스트림에서 모든 값이 한개이상 방출되었을때, 가장 최근값들의 `가장 마지막` 값을 합쳐 방출해야한다', () async {
    // given
    var a = Stream.fromIterable(['a']),
        b = Stream.fromIterable(['b']),
        c = Stream.fromIterable(['C', 'D']);

    // when
    final stream = Rx.combineLatest([a, b, c], (List<String> values) => values.last); //결합 조건 추가

    // then
    await expectLater(stream, emitsInOrder(['C', 'D', emitsDone]));
  }, timeout: const Timeout(Duration(seconds: 5)));

  test('0,1,2,3,4,5가 순서적으로 발행되야한다 emitsInOrder', () {
    // given
    var a = Stream.fromIterable([0, 1, 2]);
    var b = Stream.fromIterable([3, 4, 5]);

    // when
    final stream = Rx.concat([a, b]);

    // then
    expect(stream, emitsInOrder([0, 1, 2, 3, 4, 5]));
  }, timeout: const Timeout(Duration(seconds: 5)));
}
