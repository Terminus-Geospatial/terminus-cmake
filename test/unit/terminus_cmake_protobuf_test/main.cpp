/**
 * @file    main.cpp
 * @author  Marvin Smith
 * @date    7/5/2023
*/
#include <education/school.pb.h>
#include <education/student.pb.h>
#include <education/teacher.pb.h>
#include <person.pb.h>
#include <svc_directory.grpc.pb.h>

#include <iostream>

int main() {
    Person p;
    p.set_name("Bob");
    p.set_age(24);

    Student s;
    s.add_grades("A+");

    Teacher t;
    t.add_courses( "Computer Science" );

    School sc;
    sc.mutable_teachers()->Add(std::move(t));
    sc.mutable_students()->Add(std::move(s));

    return 0;
}