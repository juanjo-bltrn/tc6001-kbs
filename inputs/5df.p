% -------------------------------------------
%              Knowledge base
% -------------------------------------------

% R1: Every doctoral student is a graduate student.
fof(r1, axiom,
    ! [X] : (doctoralStudent(X) => graduateStudent(X))).

% R3 (functional form): the primary supervisor of a doctoral student is a researcher.
fof(r3_f, axiom,
    ! [X] : (doctoralStudent(X) => researcher(primarySupervisor(X)))).

% R4: Every doctoral student works on at least one research project.
fof(r4, axiom,
    ! [X] : (doctoralStudent(X) =>
        ? [Y] : (researchProject(Y) & worksOn(X,Y)))).

% R5: Every research project has at least one researcher working on it.
fof(r5, axiom,
    ! [Y] : (researchProject(Y) =>
        ? [X] : (researcher(X) & worksOn(X,Y)))).

% R6 (functional form): the primary supervisor supervises the doctoral student.
fof(r6_f, axiom,
    ! [X] : (doctoralStudent(X) => supervises(primarySupervisor(X),X))).

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

fof(f_ps_alice, axiom, primarySupervisor(alice) = bob).
fof(f_ps_david, axiom, primarySupervisor(david) = carol).

fof(f_wo_alice_aurora, axiom, worksOn(alice,aurora)).
fof(f_wo_david_helios, axiom, worksOn(david,helios)).
fof(f_wo_bob_aurora,   axiom, worksOn(bob,aurora)).
fof(f_wo_carol_helios, axiom, worksOn(carol,helios)).


% -------------------------------------------
%                Conjectures
% -------------------------------------------

% Every doctoral student has a primary
% supervisor who is a researcher and supervises them.

fof(q_common_f, conjecture,
    ! [X] : (doctoralStudent(X) =>
        (researcher(primarySupervisor(X)) & supervises(primarySupervisor(X),X)))).
