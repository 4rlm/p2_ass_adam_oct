# Part 1: JavaScript Objects
## Summary
In Part 1 of the assessment, we're going to write JavaScript.  Specifically, we're going to define a pair of custom objects:  `Student` and `Classroom`.  Each of these custom objects will have properties and behaviors specific to itself.  Tests have been written to guide you through the development of each object.


### Running Jasmine Tests
We'll run the tests in the browser by opening the file `SpecRunner.html`, which runs the tests and displays the results.  On the command line navigate to the `part-1` directory and then run
...

```
$ open SpecRunner.html
```

... which should open the HTML file in the default browser.  As you make changes to the JavaScript code, refresh the page to rerun the tests.


## Releases
### Release 0: Student
We'll start by building a student object.  The tests that describe students are in the file `spec/student_spec.js`.  Write your code in the file `student.js`.

It is required to use a `for` loop when iterating over the array of scores in *Release 0*.


### Release 1: Classroom
Once the tests for the custom student object pass, move on to the classroom
object type.  The tests that describe a classroom are in the file `spec/classroom_spec.js`.  Write your code in the file `classroom.js`.

It is required to use `Array.prototype` methods when iterating over the array of students in *Release 1*.


## Conclusion

Once all the tests have passed, you have completed Part 1 of the assessment. If
you haven't done so already, commit your changes and move on to Part 2.
