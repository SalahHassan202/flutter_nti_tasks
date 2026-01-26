void main() {
  Map<String, int> mp = {
    'Ali': 3000,
    'Sara': 4000,
    'Ahmed': 3500,
    'Laila': 4500,
  };

  mp['Khaled'] = 5555;

  if (mp.containsKey('Ali')) {
    print(mp['Ali']);
  }

  mp.remove('Ahmed');

  print(mp.keys.toList());
  print(mp.values.toList());

  Map<String, double> m2 = {};
  mp.forEach((k, v) {
    m2[k] = v * 1.10;
  });

  print(m2);
}

// output
//==============================
// 3000
// [Ali, Sara, Laila, Khaled]
// [3000, 4000, 4500, 5555]
// {Ali: 3300.0000000000005, Sara: 4400.0, Laila: 4950.0, Khaled: 6110.500000000001}
