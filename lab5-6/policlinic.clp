(deftemplate Employee
    (slot name)
    (slot position)
)

(deftemplate Patient
    (slot name)
    (slot isEmployee)
)

(deftemplate Doctor
    (slot name)
    (slot specialty)
    (slot room)
)

(deftemplate Appointment
    (slot day)
    (slot time)
    (slot doctor)
    (slot patient)
)

(deftemplate Schedule
    (slot day)
    (multislot working-hours)
)

(defrule RegistrationStaffFacts
    =>
    (assert (Employee (name "John Doe") (position "Registrar")))
    (assert (Employee (name "Jane Smith") (position "Registrar")))
)

(defrule DoctorFacts
    =>
    (assert (Doctor (name "Dr. Smith") (specialty "Cardiologist") (room "Room 1")))
    (assert (Doctor (name "Dr. Johnson") (specialty "Pediatrician") (room "Room 2")))
)

(defrule ScheduleAppointment
    (initial-fact)
    =>
    (printout t crlf "Enter your name: ")
    (bind ?name (read))
    (printout t crlf "Enter day of appointment: ")
    (bind ?day (read))
    (printout t crlf "Enter time of appointment: ")
    (bind ?time (read))
    (assert (time ?time))
    (printout t crlf "Are you an employee? (yes/no): ")
    (bind ?isEmployee (read))
    (assert (Patient (name ?name) (isEmployee ?isEmployee)))
    (assert (day ?day)) 
    (assert (time ?time))
)

(defrule printAppointment
    (not (printed ?day ?time))
    ?p <- (Patient (name ?name) (isEmployee ?isEmployee))
    (day ?day)
    (time ?time)
    =>
    (if (eq (str-compare ?isEmployee "yes") 0) then
        (assert (Appointment (day ?day) (time ?time) (doctor "Dr. Smith") (patient ?name)))
        (printout t crlf "Appointment scheduled for employee " ?name " on " ?day " at " ?time ". It's free of charge." crlf)
    else
        (assert (Appointment (day ?day) (time ?time) (doctor "Dr. Smith") (patient ?name)))
        (printout t crlf "Appointment scheduled for patient " ?name " on " ?day " at " ?time ". The cost is $50." crlf)
    )
    (assert (printed ?day ?time))
)
