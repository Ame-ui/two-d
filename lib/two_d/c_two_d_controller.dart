import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:two_d_app/two_d/m_two_d_method.dart';

import '../method_enum.dart';

class TwoDMethodController extends GetxController {
  List<TwoDMethod> methodList = [
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.none, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.brother, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.firstSeries, xNeedNum: true),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.lastSeries, xNeedNum: true),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.evenEven, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.oddOdd, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.evenOdd, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.oddEven, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.talLonePar, xNeedNum: true),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.duplicate, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.evenDuplicate, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.oddDuplicate, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.sum, xNeedNum: true),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.power, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.netKha, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.firstEven, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.lastEven, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.firstOdd, xNeedNum: false),
    TwoDMethod(twoDMethodTypes: TwoDMethodTypes.lastOdd, xNeedNum: false)
  ];
  List<String> numberList = [];

  int selectedIndex = 0;
  String selectedNumber = '0';
  TwoDMethodTypes selectedMethod = TwoDMethodTypes.none;

  List<String> filterList = [];

  void filterNumbers() {
    switch (selectedMethod) {
      //1
      case TwoDMethodTypes.none:
        filterList.clear();
        break;
      //2
      case TwoDMethodTypes.brother:
        filterList.clear();
        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if ((first - second).abs() == 1) {
            filterList.add(element);
          }
        }
        update();

        break;
      //3
      case TwoDMethodTypes.firstSeries:
        filterList.clear();
        for (var element in numberList) {
          if (element.startsWith(selectedNumber)) {
            filterList.add(element);
          }
        }
        update();

        break;
      //4
      case TwoDMethodTypes.lastSeries:
        filterList.clear();
        for (var element in numberList) {
          if (element.endsWith(selectedNumber)) {
            filterList.add(element);
          }
        }
        update();
        break;
      //5
      case TwoDMethodTypes.evenEven:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if (first % 2 == 0 && second % 2 == 0) {
            filterList.add(element);
          }
        }
        update();
        break;
      //6
      case TwoDMethodTypes.oddOdd:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if (first % 2 != 0 && second % 2 != 0) {
            filterList.add(element);
          }
        }
        update();
        break;
      //7
      case TwoDMethodTypes.evenOdd:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if (first % 2 == 0 && second % 2 != 0) {
            filterList.add(element);
          }
        }
        update();
        break;
      //8
      case TwoDMethodTypes.oddEven:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if (first % 2 != 0 && second % 2 == 0) {
            filterList.add(element);
          }
        }
        update();
        break;
      //9
      case TwoDMethodTypes.talLonePar:
        filterList.clear();

        for (var element in numberList) {
          if (element.contains(selectedNumber)) {
            filterList.add(element);
          }
        }
        update();
        break;
      //10
      case TwoDMethodTypes.duplicate:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();

          if (strList.first == strList.last) {
            filterList.add(element);
          }
        }
        update();
        break;
      //11
      case TwoDMethodTypes.evenDuplicate:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if ((first % 2 == 0 && second % 2 == 0) && (first == second)) {
            filterList.add(element);
          }
        }
        update();
        break;
      //12
      case TwoDMethodTypes.oddDuplicate:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          if ((first % 2 != 0 && second % 2 != 0) && (first == second)) {
            filterList.add(element);
          }
        }
        update();
        break;
      //13
      case TwoDMethodTypes.sum:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);
          String sum = '${first + second}';
          if (sum.endsWith(selectedNumber)) {
            filterList.add(element);
          }
        }
        update();
        break;
      //14
      case TwoDMethodTypes.power:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);
          int second = int.parse(strList.last);

          if ((first - second).abs() == 5) {
            filterList.add(element);
          }
        }
        update();
        break;
      //15
      case TwoDMethodTypes.netKha:
        filterList.clear();
        List<String> netKha = ['07', '18', '14', '35', '42'];
        for (var element in numberList) {
          var reverse = '${element.split('').last}${element.split('').first}';
          for (var e in netKha) {
            if (e == element || e == reverse) {
              filterList.add(element);
              break;
            }
          }
        }
        update();
        break;
      //16
      case TwoDMethodTypes.firstEven:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);

          if (first % 2 == 0) {
            filterList.add(element);
          }
        }
        break;
      //17
      case TwoDMethodTypes.lastEven:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int last = int.parse(strList.last);

          if (last % 2 == 0) {
            filterList.add(element);
          }
        }
        break;
      //18
      case TwoDMethodTypes.firstOdd:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int first = int.parse(strList.first);

          if (first % 2 != 0) {
            filterList.add(element);
          }
        }
        break;
      //19
      case TwoDMethodTypes.lastOdd:
        filterList.clear();

        for (var element in numberList) {
          var strList = element.split('').toList();
          int last = int.parse(strList.last);

          if (last % 2 != 0) {
            filterList.add(element);
          }
        }
        break;
      default:
    }
  }

  @override
  void onInit() {
    numberList =
        List.generate(100, (index) => index < 10 ? '0$index' : '$index');
    super.onInit();
  }
}
