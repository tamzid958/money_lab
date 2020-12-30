class CostLists {
  final String description, title, time, imgLocation, notes;
  final int id;
  final String currencyCode;
  final double money;
  final bool posMin;
  CostLists({
    this.id,
    this.title,
    this.description,
    this.time,
    this.imgLocation,
    this.currencyCode,
    this.money,
    this.posMin,
    this.notes,
  });
}

List<CostLists> costLists = [
  CostLists(
    id: 1,
    title: "Salary",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    time: "31-12-2020",
    currencyCode: "\$",
    money: 4343,
    posMin: true,
    notes:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
  ),
  CostLists(
    id: 1,
    title: "Salary",
    description: null,
    time: "31-12-2020",
    currencyCode: "\$",
    money: 4343,
    posMin: true,
    notes: null,
  ),
  CostLists(
    id: 1,
    title: "Salary",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    time: "31-12-2020",
    currencyCode: "\$",
    money: 4343,
    posMin: true,
    notes:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
  ),
  CostLists(
    id: 1,
    title: "Movie",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    time: "31-12-2020",
    currencyCode: "\$",
    money: 4343,
    posMin: false,
    notes:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
  ),
  CostLists(
    id: 1,
    title: "Movie",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    time: "31-12-2020",
    currencyCode: "\$",
    money: 4343,
    posMin: false,
    notes:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
  ),
  CostLists(
    id: 1,
    title: "Movie",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    time: "31-12-2020",
    currencyCode: "\$",
    money: 4343,
    posMin: false,
    notes:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
  ),
  CostLists(
      id: 1,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "31-12-2020",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 2,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "31-12-2020",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 3,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "31-12-2020",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
];
