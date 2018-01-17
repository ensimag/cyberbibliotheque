-- This file can be compiled::
--
--      use -c Classes/classes.cls
--
--

model CyberBibliotheque


---------------------------------------------------------------------------
-- enumerations
---------------------------------------------------------------------------

enum TypeDOeuvre {
    livre,
    film,
    musique
}


---------------------------------------------------------------------------
-- classes
---------------------------------------------------------------------------

class Personne
attributes
    nom : String
end


class Membre < Personne
attributes
    login : String
    motDePasse : String
end


class Employe < Membre
end


class Eleve < Membre
end


class Enseignant < Membre
attributes
    matiere : String
end


class Classe
attributes
    code : String
end


class Emprunt
attributes
    -- TODO
end


class Prolongation
attributes
    -- TODO
end


class Bibliotheque
attributes
    nom : String
end


class Oeuvre
attributes
    type : TypeDOeuvre
    titre : String
    isbn : String
end


class Atelier
attributes
    -- TODO
end



---------------------------------------------------------------------------
-- associations
---------------------------------------------------------------------------

association EstInscritDans between
    Eleve [*] role eleves
    Classe [1] role classe
end


association IntervientDans between
    Enseignant [1..*] role enseignants
    Classe [1..*] role classes
end


association TravailleSur between
    Classe [1] role classe
    Atelier [*] role ateliers
end


association Concerne between
    Emprunt [*] role empruntConcernes
    Atelier [0..1] role atelier
end


association Realise between
    Enseignant [1] -- role XXX  TODO
    Atelier [*] -- role YYY TODO
end




-- TODO:
--      association AEmprunte between
--      association Valide between
--      association Prolonge between
--      association Fourni between
--      association Etudie between
--      association EstAuteurDe between
--
--      + autres associations entre
--        Bibliotheque, Emprunt, Stock, Oeuvre
--        si nécessaire.