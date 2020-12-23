class TotalLists {
  final String month;
  final int id;
  final double total;
  final bool checked;
  TotalLists({
    this.month,
    this.id,
    this.total,
    this.checked,
  });
}

List<TotalLists> totalLists = [
  TotalLists(
    month: "Jan",
    id: 1,
    total: 20000,
    checked: true,
  ),
  TotalLists(
    month: "Dec",
    id: 2,
    total: 20000,
    checked: false,
  ),
];
