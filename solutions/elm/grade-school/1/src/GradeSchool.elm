module GradeSchool exposing (Grade, Result(..), School, Student, addStudent, allStudents, emptySchool, studentsInGrade)

import Dict exposing (..)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Int (List Student)


type Result
    = Added
    | Duplicate


emptySchool : School
emptySchool =
    Dict.empty


addStudent : Grade -> Student -> School -> ( Result, School )
addStudent grade student school =
    if school
        |> Dict.values
        |> List.map (List.member student)
        |> List.map not
        |> List.foldl (&&) True
    then
        case Dict.get grade school of
            Just students -> 
                ( Added, Dict.union (Dict.singleton grade (student :: students)) school)
            Nothing -> 
                ( Added, Dict.union school (Dict.singleton grade [student]) )
    else 
        ( Duplicate, school )


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Maybe.withDefault [] (Dict.get grade school)
        |> List.sort


allStudents : School -> List Student
allStudents school =
    Dict.toList school
        |> List.sortBy Tuple.first
        |> List.map Tuple.second
        |> List.concatMap List.sort
