(define (domain zogs-world)
    (:requirements :adl)

    (:types 
        node item actors
        courier patient - actors
    )

    (:predicates
        (Connected ?x - node ?y - node)
        (Location  ?a - actors ?x - node)
        (Picked-up ?i - item)
        (Serves ?x - node ?i - item)
        (Order-placed ?p - patient ?i - item)
        (Order-cleared ?p - patient ?i - item)
        (Bought-gift)

        (Is-gift-shop ?x - node)

    )

    (:action MOVE
        :parameters (?n1 - node ?c - courier ?n2 - node)
        :precondition (and (Connected ?n1 ?n2) (Location ?c ?n1))
        :effect (and
        (Location ?c ?n2)
        (not (Location ?c ?n1))
    )
    
    )

    (:action PICK-UP
        :parameters (?x - item ?loc - node ?courier - courier)
        :precondition (and (not(Picked-up ?x)) (Location ?courier ?loc) (Serves ?loc ?x))
        :effect (and (Picked-up ?x))
    )

    (:action DELIVERY
        :parameters (?courier - courier ?x - item ?patient - patient ?loc- node)
        :precondition (and (Location ?courier ?loc) (Location ?patient ?loc) (Order-placed ?patient ?x) (Picked-up ?x))
        :effect (and (Order-cleared ?patient ?x) (not(Picked-up ?x)) )
    )

    (:action BUY-GIFT
        :parameters (?courier - courier ?loc - node)
        :precondition ( and (Location ?courier ?loc)  (Is-gift-shop ?loc) 
            (forall (?p - patient ?i - item)
                (imply
                    (order-placed ?p ?i)
                    (order-cleared ?p ?i)
                )
            )
        )
        :effect (and(Bought-gift))
    
    )
)