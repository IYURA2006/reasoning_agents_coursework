(define (domain zogs-world)
    (:requirements :adl :fluents)

    (:functions
        (stamina)
        (length-road ?n1 - node ?n2 - node)
        (max-stamina)
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
        (Is-madam-dragon ?x - node)

    )

    (:action MOVE
        :parameters (?n1 - node ?c - courier ?n2 - node)
        :precondition (and (Connected ?n1 ?n2) (Location-courier ?c ?n1) (>= (stamina)(length-road ?n1 ?n2) ))
        :effect (and
        (Location-courier ?c ?n2)
        (not (Location-courier ?c ?n1))
        (decrease (stamina) (length-road ?n1 ?n2))
    )
    
    )

    (:action PICK-UP
        :parameters (?x - item ?loc - node ?courier - courier)
        :precondition (and (not(Picked-up ?x)) (Location-courier ?courier ?loc) (Serves ?loc ?x))
        :effect (and (Picked-up ?x))
    )

    (:action DELIVERY
        :parameters (?courier - courier ?x - item ?patient - patient ?loc - node)
        :precondition (and (Location-courier ?courier ?loc) (Location-patient ?patient ?loc) (Order-placed ?patient ?x) (Picked-up ?x))
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


    (:action REPLENISH-STAMINA
        :parameters (?courier - courier ?loc - node)
        :precondition (and (Location-courier ?courier ?loc) (Is-madam-dragon ?loc))
        :effect (assign (stamina) (max-stamina))
    )
)