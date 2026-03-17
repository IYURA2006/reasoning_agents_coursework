(define (domain zogs-world)
    (:requirements :adl :fluents)

    (:functions
        (expiry-time ?i - item)
        (time ?i - item)
    )

    (:types 
        node
        item
        courier
        patient
    )

    (:predicates
        (Connected ?x - node ?y - node)
        (Location-courier ?c - courier ?x - node)
        (Location-patient ?p - patient ?x - node)
        (Picked-up ?i - item)
        (Serves ?x - node ?i - item)
        (Order-placed ?p - patient ?i - item)
        (Order-cleared ?p - patient ?i - item)
        (Bought-gift)
        (Is-gift-shop ?x - node)

    )

    (:action MOVE
        :parameters (?n1 - node ?c - courier ?n2 - node)
        :precondition (and (Connected ?n1 ?n2) (Location-courier ?c ?n1))
        :effect (and
        (Location-courier ?c ?n2)
        (not (Location-courier ?c ?n1))
        (forall (?i - item)
            (when (Picked-up ?i)
                (increase (time ?i) 1)
            )
        )
    )
    
    )

    (:action PICK-UP
        :parameters (?x - item ?loc - node ?courier - courier)
        :precondition (and (not(Picked-up ?x)) (Location-courier ?courier ?loc) (Serves ?loc ?x))
        :effect (and (Picked-up ?x) (assign (time ?x) 0))
    )

    (:action DELIVERY
        :parameters (?courier - courier ?x - item ?patient - patient ?loc - node)
        :precondition (and (Location-courier ?courier ?loc) (Location-patient ?patient ?loc) (Order-placed ?patient ?x) (Picked-up ?x) (> (expiry-time ?x) (time ?x)) )
        :effect (and (Order-cleared ?patient ?x) (not(Picked-up ?x)) )
    )

    (:action BUY-GIFT
        :parameters (?courier - courier ?loc - node)
        :precondition ( and (Location-courier ?courier ?loc)  (Is-gift-shop ?loc) 
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