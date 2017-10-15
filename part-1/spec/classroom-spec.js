describe("Classroom", function() {
  var classroom, students, jalil, irene, kelvin, myra;


  // Before each test, create a classroom with students.
  beforeEach(function() {
    // Assign student objects to variables.
    jalil  = new Student({firstName: "Jalil", scores: [100, 100]});
    irene  = new Student({firstName: "Irene", scores: [95, 95]});
    kelvin = new Student({firstName: "Kelvin", scores: [94, 94]});
    myra   = new Student({firstName: "Myra", scores: [70, 70]});

    // Assign students.
    students = [jalil, irene, kelvin, myra];

    // Assign classroom.
    classroom = new Classroom(students);
  });

  it("has students", function() {
    expect(classroom.students).toEqual(students);
  });

  it("finds a student by the student's first name", function() {
    expect(classroom.find("Myra")).toEqual(myra);
  });

  describe("identifies honor roll students", function() {
    it("returns only its students with average scores of 95 or greater", function() {
      expect(classroom.honorRollStudents()).toEqual(jasmine.arrayContaining([irene, jalil]));
      expect(classroom.honorRollStudents()).not.toEqual(jasmine.arrayContaining([kelvin, myra]));
    });
  });
});
