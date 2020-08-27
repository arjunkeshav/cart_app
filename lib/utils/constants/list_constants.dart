class ListConstants{


  static List<ChipModel> DYNAMIC_CHIPS = [
    ChipModel(index: 6,text: "Filters",isList: true),
    ChipModel(index: 0,text: "Atmosphere",isList: true),
    ChipModel(index: 1,text: "Gender",isList: true),
    ChipModel(index: 2,text: "Amenities",isList: true),
    ChipModel(index: 3,text: "AgeGroup",isList: true),
    ChipModel(index: 4,text: "Search Radius",isList: true),
    ChipModel(index: 5,text: "Rent Range",isList: true),
  ];

  static List<Gender> groupGenderList = [
    Gender(
      text: "Male Only",
      index: 1,
    ),
    Gender(
      text: "Female Only",
      index: 2,
    ),
    Gender(
      text: "All Genders",
      index: 3,
    ),
  ];
}

class Filter {
  String text;
  int id;
  int index;

  Filter({this.text, this.id,this.index});
}


class ChipModel {
  String text;
  int index;
  bool isList;

  ChipModel({this.text, this.index,this.isList});
}
class Gender {
  String text;
  int index;

  Gender({this.text, this.index});
}
