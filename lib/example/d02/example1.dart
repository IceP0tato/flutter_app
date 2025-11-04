// Dart 기본 문법
void main() {
  int age = 25; // 정수
  print("나이 : ${age}");

  double height = 175.5; // 실수
  bool isStudent = false; // 논리
  String name = "유재석"; // 문자열
  print("이름 : ${name}, 키 : ${height}, 학생 여부 : ${isStudent}");

  var city = "서울"; // 자동 타입 추론 (타입 변경 불가능)
  dynamic count = 123; // 자동 타입 (타입 변경 가능)
  count = "123명";
  const PI = 3.14159; // 상수 (런타임 시점)
  final country = "대한민국"; // 상수 (컴파일 시점)

  // List, Map, Set (컬렉션)
  List<String> fruits = ["사과", "바나나", "포도"];
  fruits.add("딸기");
  print("과일 목록 : ${fruits}");

  Map<String, int> scores = { "국어": 90, "영어": 85, "수학": 100 };
  print("점수 목록 : ${scores}");

  Set<int> numbers = { 1, 2, 3, 3, 4, 5 };
  print("중복 없는 집합 : ${numbers}");

  // 함수
  int add(int a, int b) { return a + b; }
  int result = add(3, 5);
  print(result);

  // 익명/화살표 함수
  var multiply = (int x, int y) { return x * y; };
  int result2 = multiply(3, 5);
  print(result2);

  // 클래스, 객체
  Person p1 = new Person("유재석", 50);
  Person p2 = Person("강호동", 40); // new 생략 가능

  // null 타입 (타입명 뒤에 ? 포함)
  String? nickName; // null 포함
  nickName = null;
  print("닉네임 : ${nickName??'미정'}");

  // if, for 제어문은 Java 와 동일

}

// 클래스
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}