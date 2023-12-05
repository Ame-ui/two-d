import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "mm_Mm": mmLocal,
        "en_Us": enLocal,
      };

  Map<String, String> mmLocal = {
    'TwoDMethodTypes.none': 'အလွတ်',
    'TwoDMethodTypes.brother': 'ညိုကီ',
    'TwoDMethodTypes.firstSeries': 'ရှေ့စီးရီး',
    'TwoDMethodTypes.lastSeries': 'နောက်စီးရီး',
    'TwoDMethodTypes.evenEven': 'စုံ စုံ',
    'TwoDMethodTypes.oddOdd': 'မ မ',
    'TwoDMethodTypes.evenOdd': 'စုံ မ',
    'TwoDMethodTypes.oddEven': 'မ စုံ',
    'TwoDMethodTypes.talLonePar': 'တစ်လုံးပါ',
    'TwoDMethodTypes.duplicate': 'အပူး',
    'TwoDMethodTypes.evenDuplicate': 'စုံ အပူး',
    'TwoDMethodTypes.oddDuplicate': 'မ အပူး',
    'TwoDMethodTypes.sum': 'ဘရိတ်',
    'TwoDMethodTypes.power': 'ပါဝါ',
    'TwoDMethodTypes.netKha': 'နက္ခတ်',
    'TwoDMethodTypes.firstEven': 'ရှေ့စုံ',
    'TwoDMethodTypes.lastEven': 'နောက်စုံ',
    'TwoDMethodTypes.firstOdd': 'ရှေ့မ',
    'TwoDMethodTypes.lastOdd': 'နောက်မ',
  };
  Map<String, String> enLocal = {
    'TwoDMethodTypes.none': 'None',
    'TwoDMethodTypes.brother': 'Brother',
    'TwoDMethodTypes.firstSeries': 'First Series',
    'TwoDMethodTypes.lastSeries': 'Last Series',
    'TwoDMethodTypes.evenEven': 'Even Even',
    'TwoDMethodTypes.oddOdd': 'Odd Odd',
    'TwoDMethodTypes.evenOdd': 'Even Odd',
    'TwoDMethodTypes.oddEven': 'Odd Even',
    'TwoDMethodTypes.talLonePar': 'Ta Lone par',
    'TwoDMethodTypes.duplicate': 'Duplicate',
    'TwoDMethodTypes.evenDuplicate': 'Even Duplicate',
    'TwoDMethodTypes.oddDuplicate': 'Odd Duplicate',
    'TwoDMethodTypes.sum': 'Sum',
    'TwoDMethodTypes.power': 'Power',
    'TwoDMethodTypes.netKha': 'Net Kha',
    'TwoDMethodTypes.firstEven': 'First Even',
    'TwoDMethodTypes.lastEven': 'Last Even',
    'TwoDMethodTypes.firstOdd': 'First Odd',
    'TwoDMethodTypes.lastOdd': 'Last odd',
  };
}

xEn() => Get.locale.toString() == 'en_Us';
