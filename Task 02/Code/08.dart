void main() {
  List<dynamic> l1 = [
    "Salah",
    20,
    [50, 11, 30, 76, 82],
  ];

  l1.add("Ahmed");

  l1.remove(50);

  l1[1] = "Ali";

  l1.add([10, 5, 7]);

  List l2 = l1[2];
  l2.sort();

  print(l1);
  // [Salah, Ali, [11, 30, 50, 76, 82], Ahmed, [10, 5, 7]]
}
