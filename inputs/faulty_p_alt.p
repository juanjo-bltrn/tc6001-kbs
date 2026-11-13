% -------------------------------------------
%              Knowledge base
% -------------------------------------------

% R1: Every doctoral student is a graduate student.
fof(r1, axiom,
    ! [X] : (doctoralStudent(X) => graduateStudent(X))).

% R2a (existence): every doctoral student has at least one primary supervisor.
fof(r2a, axiom,
    ! [X] : (doctoralStudent(X) => ? [Y] : primarySupervisorOf(Y,X))).

% R2b (uniqueness): any two primary supervisors of the same doctoral student
% are equal.
fof(r2b, axiom,
    ! [X,Y,Z] : ((doctoralStudent(X) & primarySupervisorOf(Y,X)
                  & primarySupervisorOf(Z,X)) => Y = Z)).

% R3 + typing constraints on primarySupervisorOf: the first argument of the
% relation must be a researcher (R3), the second a doctoral student.
fof(r3_t_ps_super, axiom,
    ! [X,Y] : (primarySupervisorOf(Y,X) => researcher(Y))).
fof(t_ps_student, axiom,
    ! [X,Y] : (primarySupervisorOf(Y,X) => doctoralStudent(X))).

% R4: Every doctoral student works on at least one research project.
fof(r4, axiom,
    ! [X] : (doctoralStudent(X) =>
        ? [Y] : (researchProject(Y) & worksOn(X,Y)))).

% R5: Every research project has at least one researcher working on it.
fof(r5, axiom,
    ! [Y] : (researchProject(Y) =>
        ? [X] : (researcher(X) & worksOn(X,Y)))).

% R6: A primary supervisor supervises the corresponding doctoral student.
fof(r6, axiom,
    ! [X,Y] : (primarySupervisorOf(Y,X) => supervises(Y,X))).

% R7: Nobody supervises themselves.
fof(r7, axiom,
    ! [X] : ~ supervises(X,X)).

% R8: multiplicity of worksOn is permitted, deliberately not encoded.

% -------------------------------------------
%                   Facts
% -------------------------------------------
fof(f_alice,  axiom, doctoralStudent(alice)).
fof(f_david,  axiom, doctoralStudent(david)).
fof(f_bob,    axiom, researcher(bob)).
fof(f_carol,  axiom, researcher(carol)).
fof(f_aurora, axiom, researchProject(aurora)).
fof(f_helios, axiom, researchProject(helios)).

fof(f_ps_bob_alice,   axiom, primarySupervisorOf(bob,alice)).
fof(f_ps_carol_david, axiom, primarySupervisorOf(carol,david)).

fof(f_wo_alice_aurora, axiom, worksOn(alice,aurora)).
fof(f_wo_david_helios, axiom, worksOn(david,helios)).
fof(f_wo_bob_aurora,   axiom, worksOn(bob,aurora)).
fof(f_wo_carol_helios, axiom, worksOn(carol,helios)).

% -------------------------------------------
%                Faulty Axiom
% -------------------------------------------
fof(faulty_all_supervise, axiom,
    ! [X,Y] : ((researcher(X) & doctoralStudent(Y)) => supervises(X,Y))).


% -------------------------------------------
%                 Conjectures
% -------------------------------------------
fof(f_alice_researcher, axiom, researcher(alice)).
