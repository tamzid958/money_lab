class CostLists {
  final String description, title, time, imgLocation;
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
  });
}

List<CostLists> costLists = [
  CostLists(
      id: 1,
      title: "Salary",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: true),
  CostLists(
      id: 1,
      title: "Salary",
      description: null,
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: true),
  CostLists(
      id: 1,
      title: "Salary",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: true),
  CostLists(
      id: 1,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 1,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 1,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 1,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 2,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
  CostLists(
      id: 3,
      title: "Movie",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      time: "4.5 A.M",
      currencyCode: "\$",
      money: 4343,
      posMin: false),
];
