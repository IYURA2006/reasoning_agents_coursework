(define (problem zogs-problem)
    (:domain zogs-world)
    (:objects 
        N1 - node
        N2 - node
        N3 - node
        N4 - node
        N5 - node
        N6 - node
        N7 - node
        N8 - node
        N9 - node
        N10 - node
        N11 - node
        N12 - node
        gift-shop - node

        Blue-dragon - patient
        Pink-dragon - patient
        Green-dragon - patient
        Purple-dragon - patient
        Zog - courier

        Peppermint - item
        Bandage - item
        Plaster - item
        Stethoscope - item
        Cough-syrup - item
        Healing-balm - item
    )

    (:init
        (Connected N1 N2)
        (Connected N2 N1)

        (Connected N2 N3)
        (Connected N3 N2)

        (Connected N3 N4)
  
        (Connected N4 N5)
        (Connected N5 N6)

        (Connected N5 N2)

        (Connected N6 N1)
        (Connected N1 N6)

        (Connected N6 N7)
        (Connected N7 N6)

        (Connected N7 N8)
        (Connected N8 N7)

        (Connected N9 N10)
        (Connected N10 N9)

        (Connected N9 N1)
        (Connected N1 N9)

        (Connected N11 N9)
        (Connected N12 N11)

        (Connected N1 N12)

        (Connected N12 gift-shop)
        (Connected gift-shop N12)


        (Location-courier Zog N9)
        (Location-patient Blue-dragon N10)
        (Location-patient Pink-dragon N5)
        (Location-patient Green-dragon N7)
        (Location-patient Purple-dragon N11)


        (Serves N2 Plaster)
        (Serves N2 Healing-balm)
        (Serves N3 Bandage)
        (Serves N3 Cough-syrup)
        (Serves N6 Stethoscope)
        (Serves N12 Peppermint)


        (Order-placed Blue-dragon Peppermint)
        (Order-placed Blue-dragon Bandage)
        (Order-placed Pink-dragon Plaster)
        (Order-placed Green-dragon Stethoscope)
        (Order-placed Green-dragon Cough-syrup)
        (Order-placed Purple-dragon Healing-balm)

        (Is-gift-shop gift-shop)
        (Is-madam-dragon N4)

        (=(stamina) 20)
        (=(max-stamina) 40)

        (=(length-road N1 N2) 2)
        (=(length-road N2 N1) 2)

        (=(length-road N2 N3) 2)
        (=(length-road N3 N2) 2)

        (=(length-road N3 N4) 3)
       

        (=(length-road N4 N5) 3)
        (=(length-road N5 N2) 2)
        (=(length-road N5 N6) 4)

        (=(length-road N6 N1) 3)
        (=(length-road N1 N6) 3)

        (=(length-road N6 N7) 2)
        (=(length-road N7 N6) 2)

        (=(length-road N7 N8) 9)
        (=(length-road N8 N7) 9)

        (=(length-road N9 N10) 2)
        (=(length-road N10 N9) 2)

        (=(length-road N9 N1) 4)
        (=(length-road N1 N9) 4)

        (=(length-road N11 N9) 2)
        (=(length-road N1 N12) 7)
        (=(length-road N12 gift-shop) 2)
        (=(length-road N12 N11) 4)

        (=(length-road gift-shop N12) 2)


    )

    (:goal
        (bought-gift)
    )





)