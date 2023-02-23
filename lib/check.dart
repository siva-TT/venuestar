/* import "package:collection/collection.dart";

void main() {
  final dataSet = [
    {
      "PtsType": "Gaming Bonus",
      "Earned": "30 Apr 2021",
      "ValidUntil": "30 Apr 2022",
      "Points": "-2000.00"
    },
    {
      "PtsType": "Loyalty Bonus",
      "Earned": "31 May 2021",
      "ValidUntil": "31 May 2022",
      "Points": "351.50"
    },
    {
      "PtsType": "Loyalty Standard",
      "Earned": "30 Apr 2021",
      "ValidUntil": "30 Apr 2022",
      "Points": "-86.00"
    },
    {
      "PtsType": "Loyalty Standard",
      "Earned": "31 May 2021",
      "ValidUntil": "31 May 2022",
      "Points": "-73.00"
    }
  ];

  var groupByData = groupBy(dataSet, (obj) => obj['PtsType']);
  groupByData.forEach((data, list) {
    // Header
    print('${data}:');

    // Group
    list.forEach((listItem) {
      // List item
      print(
          '${listItem["PtsType"]}=${listItem["Earned"]}, ${listItem["ValidUntil"]},${listItem["Points"]}');
    });
    // day section divider
    print('\n');
  });
}
 */
/*void main() {
  String word = "Deivanai";

  Map<String, int> letterValues = {
    "a": 1,
    "b": 3,
    "c": 3,
    "d": 2,
    "e": 1,
    "f": 4,
    "g": 2,
    "h": 4,
    "i": 1,
    "j": 8,
    "k": 5,
    "l": 1,
    "m": 3,
    "n": 1,
    "o": 1,
    "p": 3,
    "q": 10,
    "r": 1,
    "s": 1,
    "t": 1,
    "u": 1,
    "v": 4,
    "w": 4,
    "x": 8,
    "y": 4,
    "z": 10
  };
  var a = word
      .toLowerCase()
      .split('')
      .fold(0, (score, letter) => score + letterValues[letter]!);
  print(a);

  print(word);
}*/
void main() {
  String word = "Deivanai";
  a obj = new a();
  obj.score(word);
  print(obj.score(word));
}

class a {
  var values = {
    "AEIOULNRST": 1,
    "DG": 2,
    "BCMP": 3,
    "FHVWY": 4,
    "K": 5,
    "JX": 8,
    "QZ": 10
  };
  int score(String word) {
    return word.split('').fold(0, (int total, letter) {
      var valuesKey = values.keys
          .singleWhere((String key) => key.contains(letter.toUpperCase()));

      var a = 0;
      a = a + total + values[valuesKey]!;

      return a;
    });
  }
}
