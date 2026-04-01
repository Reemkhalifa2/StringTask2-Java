TASK 1 Movie Ticket Booking System ---------------------------------------
CLASS Movie
    ATTRIBUTES
    title : TEXT
    price : NUMBER
    PRIVATE seats : NUMBER
    PRIVATE bookedSeats : NUMBER

    CONSTRECTOR Movie(t: TEXT, p : NUMBER, s : NUMBER)
        SET title TO t
        SET price TO p
        SET seats TO s
        SET bookedSeats TO 0
    END CONSTRUCTOR

    METHOD 
    PUBLIC GET Seats()
        RETURN seats - bookedSeats
    END METHOD


    PUBLIC booking(n)
        IF n LESS THAN OR EQUAL TO Seats() THEN
            SET bookedSeats TO bookedSeats + n
            DISPLAY "Ticket Booked successfully"
            DISPLAY "Available Seats: "  + Seats()
        ELSE
            DISPLAY "Not enough seats"
        END IF

    END METHOD


    METHOD displayMovieInfo()

        DISPLAY "Movie title: " + title
        DISPLAY "Ticket pPrice: " + price
        DISPLAY "Available seats: " + seats()

    END METHOD

END CLASS

START
    BEGIN

        CREATE OBJECT movie1 OF Movie("Toy Story", 3.5, 40)
        movie1.displayMovieInfo()
        movie1.booking(10)
        movie1.booking(45)
        movie1.booking(5)

        CREATE OBJECT movie2 OF Movie("The grinsh", 4, 30)
        movie2.displayMovieInfo()

        REPEAT FROM I = 1 TO 4
            movie2.booking(3)
        END REPEAT

    END
STOP


TASK 2 Employee Payroll System -------------------------------------
CLASS Employee
    ATTRIBUTES
    PRIVATE empName
    PRIVATE baseSalary
    PRIVATE workedHours
    PRIVATE deductions

    CONSTRUCTOR(name: TEXT, salary: : NUMBER )
        SET empName TO name
        SET baseSalary TO salary
    END CONSTRUCTOR


    METHODS

    PUBLIC logHours(h)
        IF h LESS THAN 0 THEN
            DISPLAY "Invalid hours"
        ELSE
            SET workedHours TO workedHours + h
        END IF
    END METHOD


    PUBLIC addDeduction(d)
        IF d LESS THAN 0 THEN
            DISPLAY "Invalid deduction amount"
        ELSE
            SET deductions TO deductions + d
        END IF
    END METHOD


    PUBLIC GrossPay()
        IF workedHours GREATER THAN 40 THEN
            SET overtimePay TO  (workedHours - 40) * (baseSalary / 40) * 1.5
        ELSE
            SET overtimePay TO 0
        END IF
        RETURN baseSalary + overtimePay
    END METHOD


    PUBLIC NetPay()
        SET gross TO calculateGrossPay()
        RETURN gross - deductions
    END METHOD


    METHOD displayPayroll()

        DISPLAY "Employee Name: " + name
        DISPLAY "Hours Worked: " + workedHours
        DISPLAY "Deductions: " + deductions
        DISPLAY "Gross Pay: " + GrossPay()
        DISPLAY "Net Pay: " + NetPay()
    END METHOD

END CLASS



START
    BEGIN

        CREATE OBJECT emp1 OF Employee("Reem", 2000)

        emp1.logHours(35)
        emp1.addDeduction(50)
        CREATE OBJECT emp2 OF Employee("Sara", 1500)
        emp2.logHours(40)
        emp2.addDeduction(80)
        CREATE OBJECT emp3 OF Employee("Sama", 1000)
        emp3.logHours(45)
        emp3.addDeduction(100)
        SET Employee TO LIST[]
        ADD emp1 TO employees
        ADD emp2 TO employees
        ADD emp3 TO employees

        REPEAT FROM I = 1 TO SIZE OF employees
            employees[I].displayPayroll()
        END REPEAT
    END
STOP

TASK 3 Online Food Order System -------------------------------------------

CLASS FoodItem
    ATTRIBUTES 
    prodName : TEXT
    prodPrice : NUMBER
    available : BOOLEAN

    CONSTRUCTOR(name : TEXT , price : NUMBER )
    SET prodName TO name
    SET prodPrice TO price
    SET available TO TRUE
    END CONSTRUCTOR

    METHODS 
    PUBLIC unAvaliable()
        SET available TO FALSE
    END METHOD

    PUBLIC GET Availability()
        RETURN available
    END METHOD
    PUBLIC GET getPrice()
        RETURN prodPrice
    END METHOD


END CLASS


CLASS Order
    ATTRIBUTES
    PRIVATE orderId : TEXT
    PRIVATE orderTotal : NUMBER
    PRIVATE items : LIST

    CONSTRECTOR(id : TEXT )
        SET orderId TO id
        SET ITEMS TO LIST []
    END CONSTRUCTOR

    METHODS

    PUBLIC addItems (item)
        IF GetAvailability EQUALS FALSE
            DISPLAY "Items is not avaiLable"
        ELSE
            ADD item TO items
            SET orderTotal TO orderTotal  + item.getPrice()
        END IF
    END METHOD

    PUBLIC applyCoubon(coubon)
        IF coubon EQUALS "ABC123" THEN
            SET orderTotal TO orderTotal - 1
        ELSE
            DISPLAY "Invalid Coubon"
        END IF
    END METHOD

    PUBLIC PrintReciept()
        DISPLAY "Order ID: " + orderId
        DISPLAY "Total Price" + orderTotal
    END METHOD

END CLASS


START
    BEGIN
        CREATE OBJECT FoodItem1 OF FoodItem("Pizza" , 4.5)
        CREATE OBJECT FoodItem2 OF FoodItem("Noodles" , 2.5)
        CREATE OBJECT FoodItem3 OF FoodItem("Burger" , 2)
        CREATE OBJECT FoodItem4 OF FoodItem("Pasta" 3.9)
        FoodItem4.unAvaliable()
        CREATE OBJECT order1 OF Order("order1")
        order1.addItems(FoodItem1)
        order1.addItems(FoodItem2)
        order1.applyCoubon("AVC")
        order1.PrintReciept()

        SET ITEMLIST TO LIST[]
        ADD FoodItem1 TO ITEMLIST
        ADD FoodItem2 TO ITEMLIST
        ADD FoodItem3 TO ITEMLIST
        ADD FoodItem4 TO ITEMLIST
        CREATE OBJECT order2 OF Order("order2")

        REPEAT FROM I=1 TO SIZE OF ITEMLIST
            order2.addItems(ITEMLIST[I])
        END REPEAT
        order2.PrintReciept()
    END

STOP



TASK 4 School Report Card Generator -----------------------------------

CLASS ReportCard
    ATTRIBUTES
    stdName : TEXT
    scores : LIST
    absence : NUMBER

    CONSTRUCTOR(name: TEXT)
    SET stdName TO Name
    SET scores TO LIST[]
    END CONSTRUCTOR
    METHODS
    PUBLIC addScore(score)
        IF score GREATER THAN OR EQUAL TO 0 AND score LESS THAN OR EQUAL TO 100 THEN
            ADD score TO scores
        ELSE
            DISPLAY "INVALID SCORE"
        END IF
    END METHOD
    PUBLIC addAbsence()
        SET absence TO absence + 1
    END METHOD

    PUBLIC GET getAverage()
         SET SUM TO 0
        REPEAT FROM I =1 TO SIZE OF scores
            SET SUM TO SUM + scores[I]
        END REPEAT
        RETURN SUM / SIZE OF scores
    END METHOD


    PUBLIC Grade()
        IF getAverage() GREATER THAN OR EQUAL TO 90 THEN
            DISPLAY "A"
        ELSE IF getAverage() GREATER THAN OR EQUAL TO 75 THEN
            DISPLAY "B"
        ELSE IF getAverage() GREATER THAN OR EQUAL TO 60 THEN
            DISPLAY "C"
        ELSE IF getAverage() GREATER THAN OR EQUAL TO 50 THEN
            DISPLAY "D"
        ELSE
            DISPLAY "F"
        END IF
    END METHOD

    PUBLIC displayReport()
        DISPLAY "Student Name" + stdName
        DISPLAY "Student Grade" + Grade()
        IF absence GREATER THAN 5 THEN
            DISPLAY "Abcence warning!! " + absence
        ELSE
            DISPLAY "Abcence" + absence
        END IF
    END METHOD
END CLASS

START
    BEGIN
        CREATE OBJECT std1 OF ReportCard("Reem")
        std1.addScore(85)
        std1.addScore(95)
        std1.addScore(120)
        REPEAT FROM I=1 TO 3
            std1.addAbsence()
        END REPEAT
        CREATE OBJECT std2 OF ReportCard("Sara")
        std2.addScore(78)
        std2.addScore(56)
        std2.addScore(122)
        REPEAT FROM I=1 TO 6
            std2.addAbsence()
        END REPEAT
        CREATE OBJECT std3 OF ReportCard("Ahmed")
        std3.addScore(78)
        std3.addScore(56)
        std3.addScore(122)
        REPEAT FROM I=1 TO 4
            std3.addAbsence()
        END REPEAT
        SET STUDENTS TO LIST[]
        ADD std1 TO STUDENTS
        ADD std2 TO STUDENTS
        ADD std3 TO STUDENTS

        REPEAT FROM I = 1 TO SIZE OF STUDENTS
            STUDENTS[I].displayReport()
        END REPEAT
    END
STOP

TASK 5 Gym Membership Tracker ---------------------------------------
CLASS Membership 

    PRIVATE membername : TEXT
    PRIVATE membership : TEXT
    PRIVATE sessions : NUMBER
    PRIVATE attendens : NUMBER

    CONSTRUCTOR(name : TEXT, type : TEXT)
        SET membername TO name
        SET membership TO type
    END CONSTRUCTOR

    METHODS
    PUBLIC settingSessions(type)

        IF type EQUALS "Basic" THEN
            SET sessions TO 10

        ELSE IF type EQUALS "Standard" THEN
            SET sessions TO 20

        ELSE IF type EQUALS "Premium" THEN
            SET sessions TO -1
        END IF

    END METHOD


    PUBLIC attendingSesstions()

        IF sessions EQUALS 0 THEN
            DISPLAY "Please renew your membertship"
        ELSE
            IF sessions GREATER THAN 0 THEN
                SET sessions TO sessions - 1
            END IF
            SET attendens TO attendens + 1
        END IF
    END METHOD


    PUBLIC renew(type)

        SET membership TO type
        setSessions(type)

        DISPLAY "your membership  renewed"

    END METHOD


    PUBLIC showStatus()
        DISPLAY "Member Name: " + name
        DISPLAY "Membership TYPE: " + membership

        IF sessions LESS THAN 0  THEN
            DISPLAY "Premium Sessions: Unlimited"
        ELSE
            DISPLAY "Sessions Left: " + sessions
        END IF

        DISPLAY "Total Attendens: " + attendens

        IF Attendens GREATER THAN OR EQUAL TO 20 THEN
            DISPLAY "Loyalty Reward!!"
        END IF

    END METHOD

END CLASS
START
    BEGIN

        CREATE OBJECT member1 OF Membership ("Reem", "Basic")
        REPEAT FROM I = 1 TO 10
            member1.attendingSesstions()
        END REPEAT
        member1.attendingSesstions()
        member1.renew("Standard")
        REPEAT FROM I = 1 TO 4
            member1.attendingSesstions()
        END REPEAT
        member1.showStatus()

        CREATE OBJECT member2 OF Membership ("Sara", "Standard")
        REPEAT FROM I = 1 TO 15
            CALL member2.attendingSesstions()
        END REPEAT
        member2.showStatus()
        
        CREATE OBJECT member3 OF Membership ("Ahmed", "Premium")
        REPEAT FROM I = 1 TO 20
            CALL member3.attendingSesstions()
        END REPEAT
        member3.showStatus()
    END
STOP        

TASK 6 Hotel Room Booking -----------------------------

CLASS Hotel
    ATTRIBUTES
    PRIVATE roomNumber : NUMBER
    PRIVATE roomType : TEXT
    PRIVATE nightPrice : NUMBER
    PRIVATE bookingStatus : BOOLEAN
    PRIVATE guestName : TEXT
    CONSTRUCTOR(room : NUMBER , type :TEXT, price : NUMBER )
        SET roomNumber TO room
        SET roomType TO type
        SET nightPrice TO price
        SET bookingStatus TO FALSE
    END CONSTRUCTOR

    METHODS
    PUBLIC BOOKROOM(N, name)
        IF bookingStatus EQUALS FALSE THEN
            SET bookingStatus TO TRUE
            SET totalPrice TO N * nightPrice
            SET guestName TO name
            DISPLAY "Room booked for " + name
            DISPLAY "Total cost: " + totalPrice
        ELSE
            DISPLAY "ROOM IS BOOKED"
    END METHOD
    PUBLIC CHECKOUT()
        SET bookingStatus TO FALSE
        DISPLAY "Guest is Checkout"
    END METHOD


    PUBLIC displayStatus()
        IF bookingStatus EQUALS FALSE
            DISPLAY "Room " + roomNumber + " is available"
        ELSE
            DISPLAY "Room " + roomNumber + " occupied by " + name
        END IF
    END METHOD

END CLASS

START
    BEGIN

        CREATE room1 AS Hotel(101 , "Single" , 50)
        CREATE room2 AS Hotel(102 , "Single" , 50)
        CREATE room3 AS Hotel(103 , "Double" , 180)
        CREATE room4 AS Hotel(104 , "Double" , 80)
        CREATE room5 AS Hotel(105 , "Suite" , 120)
        SET rooms TO LIST[]
        ADD room1 TO rooms
        ADD room2 TO rooms
        ADD room3 TO rooms
        ADD room4 TO rooms
        ADD room5 TO rooms
        room1.BOOKROOM(2,"REEM")
        room4.BOOKROOM(4,"Sara")
        room5.BOOKROOM(1,"Noor")
        room5.BOOKROOM(1,"Ahmed")
        REPEAT FROM I=1 TO SIZE OF rooms
            rooms[I].displayStatus()
        END REPEAT
        room1.CHECKOUT()
        room1.BOOKROOM(7,"KHALID")
        REPEAT FROM I=1 TO SIZE OF rooms
            rooms[I].displayStatus()
        END REPEAT
    END 
STOP

TASK 7 Library Book Management --------------------------------------------


CLASS Hotel
    ATTRIBUTES
    PRIVATE bookTitle : TEXT
    PRIVATE bookAuthor : TEXT
    PRIVATE borrowedStatus : BOOLEAN
    PRIVATE name  : TEXT
    CONSTRUCTOR(title : TEXT , author :TEXT )
        SET bookTitle TO title
        SET bookAuthor TO author
        SET borrowedStatus TO FALSE
    END CONSTRUCTOR

    METHODS
    PUBLIC GET Status()
        RETURN borrowedStatus
    END METHOD
    PUBLIC borrow(n)
        IF borrowedStatus EQUALS FALSE THEN
            SET name TO n
            DISPLAY "Book bnorrowed by " + name
            SET borrowedStatus TO TRUE
        ELSE
            DISPLAY "Book not available"
        END IF
    END METHOD
    PUBLIC return()
        IF borrowedStatus EQUALS FALSE THEN 
            DISPLAY " book is available"
        ELSE
            SET borrowedStatus TO FALSE
            DISPLAY "Book is now available"
        END IF
    END METHOD


    PUBLIC displayStatus()
        IF borrowedStatus EQUALS FALSE
            DISPLAY "Book " + bookTitle + " is available"
        ELSE
            DISPLAY "Book" + bookTitle + " is borrowed by " + name
        END IF
    END METHOD

END CLASS

START
    BEGIN
        CREATE book1 AS Hotel("The Tiger","John Vaillant")
        CREATE book2 AS Hotel("Empire of the Summer Moon" , "Gwynne")
        CREATE book3 AS Hotel("River of Doubt " , "Candice Millard")
        CREATE book4 AS Hotel("Shadow Divers " , "Robert Kurson")
        CREATE book5 AS Hotel("Endurance" , "Alfred Lansing")

        book1.borrow("REEM")
        book3.borrow("SARA")
        book4.borrow("SAMA")
        book3.borrow("AHMED")
        SET Books TO LIST[]
        ADD book1 TO Books
        ADD book2 TO Books
        ADD book3 TO Books
        ADD book4 TO Books
        ADD book5 TO Books
        
        REPEAT FROM I=1 TO SIZE OF Books
            Books[I].displayStatus()
        END REPEAT
        book1.return()
        book3.return()
        SET COUNT TO 0
        REPEAT FROM I=1 TO SIZE OF Books
            IF Books[I].Status() EQUALS FALSE THEN
                SET CONT TO COUNT +1
                DISPLAY  Books[I] + "IS AVAILABLE"
            END IF
        END REPEAT
        DISPLAY "THERE IS " + COUNT + "BOOKS AVAILABLE"
    END 
STOP


TASK 9 Hospital Patient System ----------------------------------------
CLASS Patient 
    ATTRIBUTES
    PRIVATE name : TEXT
    PRIVATE age : NUMBER
    PRIVATE symptoms : LIST
    PRIVATE medications : LIST
    PRIVATE  status:TEXT
    CONSTRECTOR(N : TEXT, A : NUMBER)
    SET name TO N 
    SET age TO A
    SET symptoms TO LIST[]
    SET medications TO LIST[]
    END CONSTRUCTOR
    METHODS
    PUBLIC admitted()
        SET status TO TRUE
    END METHOD
    PUBLIC discharged()
        SET status TO FALSE
        DISPLAY "Patiens is discharged"
    END METHOD
    PUBLIC addSymptoms(S)
        ADD S TO symptoms
    END METHOD
    PUBLIC Medicationsprescribe(M)
        IF status EQUALS FALSE THEN
            DISPLAY "Patient should be admitted "
        ELSE
            ADD M TO medications
        END IF
    END METHOD
    PUBLIC Priority()
        IF SIZE OF symptoms GREATER OR EQUAL TO 4 THEN
            DISPLAY "Critical"
        IF SIZE OF symptoms GREATER OR EQUAL TO 2 THEN
            DISPLAY "Medium"
        ELSE
            DISPLAY "Low"
        END IF
    END METHOD
    PUBLIC record()
        DISPLAY "Patient Name: " + name
        DISPLAY "Age" + age
        DISPLAY "Symptoms: "
        REPEAT FROM I=1 TO SIZ EOF symptoms
            symptoms[I]
        END REPEAT
        DISPLAY "medications: "
        REPEAT FROM I=1 TO SIZ EOF medications
            medications[I]
        END REPEAT
        DISPLAY "admission status"
        IF Status EQUALS TRUE THEN
            DISPLAY "Patiens is Addmited"
        ELSE 
            DISPLAY "Patiens is NOT Addmited"
        END IF
    END METHOD
END CLASS
START
    BEGIN

        CREATE p1 OBJECT OF  Patient("Noor", 25)
        CREATE p2 OBJECT OF  Patient("Sara", 25)
        CREATE p3 OBJECT OF  Patient("Ahmed", 15)
        SET patients TO LIST[]
        ADD p1 TO patients
        ADD p2 TO patients
        ADD p3 TO patients
        p1.Medicationsprescribe("PANADOL")
        p1.admit()

        p1.Medicationsprescribe("Paracetamol ")
        p1.addSymptoms("Fever")
        p2.addSymptoms("Cough")
        p2.addSymptoms("Chest Pain")
        p3.addSymptoms("Chest pain")
        p3.addSymptoms("Fever")
        p3.addSymptoms("Cough")
        p3.addSymptoms("Breathing difficulty")


        REPEAT FROM I= 1 TO SIZE OF patients 
            CALL patients[I].priority()
        END REPEAT
        REPEAT FROM I = 1 TO SIZE OF patients
            patients[I].record()
        END REPEAT
    END
STOP

