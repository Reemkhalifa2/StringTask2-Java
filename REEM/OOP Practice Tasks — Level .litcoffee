CLASS Movie
	ATTRIBUTES
	title : TEXT
	price : NUMBER
	private seats : NUMBER
	booked : NUMBER

	CONSTRUCTOR(t : TEXT , p : NUMBER)
	SET title TO t 
	SET price TO p
	END CONSTRUCTOR

	METHODS
	PUBLIC GET SEATS()
		RETURN seats
	END METHOD

	PUBLIC BOOKING (tickets)
		IF tickets LESS THAN seats
			SET seats TO seats - tickets 
			SET booked TO booked + tickets
			DISPLAY "TICKETS BOOKED SUCCESFULLY"
		ELSE
			DISPLAY "Not enough seats "
		END IF
	END METHOD
END CLASS


STAT
	BEGIN
		CREATE OBJECT  movie1 OF Movie("The Grinch" , 4.5)
		
		CREATE OBJECT  movie1 OF Movie("Toy Story" , 3.5)
	END
STOP
		
		

	