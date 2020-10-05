// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

abstract class A {
  int get property1; // ok

  void set property1(int i);

  int get property2; // ok

  void set property2(int? i);

  int? get property3; // error

  void set property3(int i);

  int property4; // ok

  int? property5; // ok

  covariant int property6; // ok

  A(this.property4, this.property5, this.property6);
}

abstract class B1 {
  int get property1;

  int get property2;

  int? get property3;

  final int property4;

  final int property5;

  final int? property6;

  B1(this.property4, this.property5, this.property6);
}

abstract class B2 implements B1 {
  void set property1(int i); // ok

  void set property2(int? i); // ok

  void set property3(int i); // error

  void set property4(int i); // ok

  void set property5(int? i); // ok

  void set property6(int i); // error
}

abstract class C1 {
  void set property1(int i);

  void set property2(int? i);

  void set property3(int i);

  int property4;

  int? property5;

  int property6;

  C1(this.property4, this.property5, this.property6);
}

abstract class C2 implements C1 {
  int get property1; // ok

  int get property2; // ok

  int? get property3; // error

  int get property4; // ok

  int get property5; // ok

  // This results in two errors; one for the getter/setter type mismatch and one
  // for the getter override.
  int? get property6; // error
}

abstract class D1 {
  int get property1;

  int get property2;

  int? get property3;
}

abstract class D2 {
  void set property1(int i);

  void set property2(int? i);

  void set property3(int i);
}

abstract class D3 implements D1, D2 /* error on property3 */ {}

abstract class D4 implements D3 /* no need for error on property3 */ {}

main() {}
