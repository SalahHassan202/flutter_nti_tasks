// task 01

import 'dart:io';

void main() {
  Map<String, String> dec = {
    "JIT": "Just-In-Time compilation: compiling code during runtime",
    "AOT": "Ahead-Of-Time compilation: compiling code before runtime",
    "Flutter Engine": "Responsible for rendering and animations",
    "Widget Tree": "Contains all widgets",
    "Element Tree": "Connects widgets with render objects",
    "RenderObject Tree": "Handles layout and drawing",
    "Platform Channel": "Communication between Flutter and native code",
    "Embedder": "Connects Flutter with the operating system",
    "Skia": "Graphics engine used for drawing UI",
    "Impeller": "New rendering engine for better performance",
    "Dart VM": "Runs Dart code and manages memory",
    "Tree Shaking": "Removes unused code to reduce app size",
  };

  print("============================================");
  print("All keys & values in dectionary");
  for (String key in dec.keys) {
    print("\n$key:");
    print(dec[key]);
  }

  print("============================================");
  print("\nEnter a word to search:");
  String search = stdin.readLineSync()!;

  if (dec.containsKey(search)) {
    print("\nDefinition:");
    print(dec[search]);
  } else {
    print("\nword not found.");
  }

  print("============================================");
  print("\nAdd a new word");
  print("Enter word name:");
  String newword = stdin.readLineSync()!;

  print("Enter word definition:");
  String newDefinition = stdin.readLineSync()!;

  dec[newword] = newDefinition;

  print("\nword added successfully!");

  print("============================================");
  print("Updated Dictionary");
  for (String key in dec.keys) {
    print("\n$key:");
    print(dec[key]);
  }
}
