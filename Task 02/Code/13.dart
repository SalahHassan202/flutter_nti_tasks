void main() {
  Counter c = Counter(5);
  c.inc(); // 6
  c.dec(); // 5
  c.reset(); // 0
  print(c.x); // 0
}

class Counter {
  int x;

  Counter(this.x);

  void inc() {
    x++;
  }

  void dec() {
    x--;
  }

  void reset() {
    x = 0;
  }
}
