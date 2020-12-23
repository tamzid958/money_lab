class TotalLists {
  String month;
  final int id;
  final double total;

  TotalLists({
    this.month,
    this.id,
    this.total,
  });
}

List<TotalLists> totalLists = [
  TotalLists(
    month: "Jan",
    id: 1,
    total: 20000,
  ),
  TotalLists(
    month: "Dec",
    id: 2,
    total: 20000,
  ),
];
