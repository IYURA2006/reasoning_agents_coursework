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
        N13 - node
        N14 - node
        N15 - node
        N16 - node
        N17 - node
        N18 - node
        N19 - node
        gift-shop - node

        Blue-dragon - patient
        Pink-dragon - patient
        Green-dragon - patient
        Purple-dragon - patient
        Orange-dragon - patient
        Yellow-dragon - patient
        Gold-dragon - patient
        Red-dragon - patient

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

        (Connected N3 N13)

        (Connected N13 N14)
        (Connected N14 N13)

        (Connected N14 N15)
        (Connected N15 N14)

        (Connected N15 N16)
        (Connected N16 N15)

        (Connected N14 N4)

        (Connected N4 N18)
        (Connected N18 N4)

        (Connected N18 N19)
        (Connected N19 N18)


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

        (Connected N12 N17)
        (Connected N17 N12)

        (Connected N12 gift-shop)
        (Connected gift-shop N12)


        (Location-courier Zog N9)

        (Location-patient Blue-dragon N10)
        (Location-patient Pink-dragon N5)
        (Location-patient Green-dragon N7)
        (Location-patient Purple-dragon N11)
        (Location-patient Orange-dragon N6)
        (Location-patient Yellow-dragon N8)
        (Location-patient Gold-dragon N2)
        (Location-patient Red-dragon N1)


        (Serves N15 Plaster)
        (Serves N15 Healing-balm)
        (Serves N16 Bandage)
        (Serves N14 Cough-syrup)
        (Serves N19 Stethoscope)
        (Serves N17 Peppermint)


        (Order-placed Blue-dragon Peppermint)
        (Order-placed Blue-dragon Bandage)
        (Order-placed Blue-dragon Stethoscope)

        (Order-placed Pink-dragon Plaster)
        (Order-placed Pink-dragon Peppermint)
        (Order-placed Pink-dragon Cough-syrup)

        (Order-placed Green-dragon Stethoscope)
        (Order-placed Green-dragon Cough-syrup)
        (Order-placed Green-dragon Peppermint)

        (Order-placed Purple-dragon Bandage)
        (Order-placed Purple-dragon Healing-balm)
        (Order-placed Purple-dragon Plaster)

        (Order-placed Orange-dragon Plaster)
        (Order-placed Orange-dragon Peppermint)
        (Order-placed Orange-dragon Bandage)

        (Order-placed Yellow-dragon Bandage)
        (Order-placed Yellow-dragon Stethoscope)
        (Order-placed Yellow-dragon Healing-balm)

        (Order-placed Gold-dragon Stethoscope)
        (Order-placed Gold-dragon Peppermint)
        (Order-placed Gold-dragon Cough-syrup)

        (Order-placed Red-dragon Cough-syrup)
        (Order-placed Red-dragon Stethoscope)
        (Order-placed Red-dragon Plaster)


        (Is-gift-shop gift-shop)
    )

    (:goal
        (bought-gift)
    )





)