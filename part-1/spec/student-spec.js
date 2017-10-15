describe("Student", function(){
  var student;
  var studentName = "Lysette";
  var studentScores = [100, 100, 100, 4, 100];

  // Before each test, create a new student object.
  beforeEach(function(){
    student = new Student({firstName: studentName, scores: studentScores});
  });

  it("has a first name", function() {
    expect(student.firstName).toEqual(studentName);
  });

  it("has scores", function() {
    expect(student.scores).toEqual(studentScores);
  });

  describe("the student's average score", function() {
    it("is the average of all the student's scores rounded down to the nearest whole number", function() {
      expect(student.averageScore()).toEqual(80);
    });
  });

  describe("the student's letter grade", function() {
    it("is an A if the student's average score is 90 or greater", function() {
      spyOn(student, "averageScore").and.returnValue(90);
      expect(student.letterGrade()).toEqual("A");
    });

    it("is a B if the student's average score is 80 or greater but less than 90", function() {
      spyOn(student, "averageScore").and.returnValue(80);
      expect(student.letterGrade()).toEqual("B");
    });

    it("is a C if the student's average score is 70 or greater but less than 80", function() {
      spyOn(student, "averageScore").and.returnValue(70);
      expect(student.letterGrade()).toEqual("C");
    });

    it("is a D if the student's average score is 60 or greater but less than 70", function() {
      spyOn(student, "averageScore").and.returnValue(60);
      expect(student.letterGrade()).toEqual("D");
    });

    it("is an F if the student's average score is less than 60", function() {
      spyOn(student, "averageScore").and.returnValue(59);
      expect(student.letterGrade()).toEqual("F");
    });
  });
});
