import '../providers/menu_provider.dart';

class Item {
  String expandend;
  String title;
  bool isExpanded;

  Item(this.expandend, this.title, this.isExpanded);
}

List<Item> generateItemasList(int sizeofthelist) {
  return List.generate(sizeofthelist, (index) {
    return Item(
      '$index',
      'Item $index',
      false,
    );
  });
}

// List<Item> generateItemasListEvidencecharge(int sizeofthelist) {
//   List<Item> result = [];
//   final carga = menuProvider.cargarEvidenceCarga("cargazerofuncional");
//   int i = 0;
//   carga.then((value) => {
//         result.add(new Item('$i', value[0]['title'], false)),
//         i++,
//       });
//   print(result);
//   print(i);
//   return List.generate(sizeofthelist, (index) {
//     return Item(
//       '$index',
//       'Item $index',
//       false,
//     );
//   });
// }
