% -------------------------------------------
%              Knowledge base
% -------------------------------------------

% R1: Every doctoral student is a graduate student.
fof(r1, axiom,
    ! [X] : (doctoralStudent(X) => graduateStudent(X))).

% R2: Every doctoral student has exactly one primary supervisor.
fof(r2, axiom,
    ! [X] : (doctoralStudent(X) =>
        ? [Y] : (primarySupervisorOf(Y,X)
                 & ! [Z] : (primarySupervisorOf(Z,X) => Z = Y)))).

% R3: Every primary supervisor of a doctoral student is a researcher.
% Also types the first/second arguments of primarySupervisorOf.
fof(r3, axiom,
    ! [X,Y] : (primarySupervisorOf(Y,X) =>
        (doctoralStudent(X) & researcher(Y)))).

% R4: Every doctoral student works on at least one research project.
fof(r4, axiom,
    ! [X] : (doctoralStudent(X) =>
        ? [Y] : (researchProject(Y) & worksOn(X,Y)))).

% R5: Every research project has at least one researcher working on it.
fof(r5, axiom,
    ! [Y] : (researchProject(Y) =>
        ? [X] : (researcher(X) & worksOn(X,Y)))).

% R6: Every primary supervisor supervises the corresponding doctoral student.
fof(r6, axiom,
    ! [X,Y] : (primarySupervisorOf(Y,X) => supervises(Y,X))).

% R7: No person supervises themselves.
fof(r7, axiom,
    ! [X] : ~ supervises(X,X)).

% R8: Multiplicity of projects per researcher / researchers per project is permitted

% -------------------------------------------
%                   Facts
% -------------------------------------------

% Doctoral students
fof(f_alice, axiom, doctoralStudent(alice)).
fof(f_david, axiom, doctoralStudent(david)).

% Researchers
fof(f_bob,   axiom, researcher(bob)).
fof(f_carol, axiom, researcher(carol)).

% Research projects
fof(f_aurora, axiom, researchProject(aurora)).
fof(f_helios, axiom, researchProject(helios)).

% Primary supervision
fof(f_ps_bob_alice,   axiom, primarySupervisorOf(bob,alice)).
fof(f_ps_carol_david, axiom, primarySupervisorOf(carol,david)).

% Works-on
fof(f_wo_alice_aurora, axiom, worksOn(alice,aurora)).
fof(f_wo_david_helios, axiom, worksOn(david,helios)).
fof(f_wo_bob_aurora,   axiom, worksOn(bob,aurora)).
fof(f_wo_carol_helios, axiom, worksOn(carol,helios)).


% -------------------------------------------
%                Conjectures
% -------------------------------------------

fof(q4, conjecture,
    ! [X] : (researcher(X) =>
        ? [Y] : (doctoralStudent(Y) & supervises(X,Y)))).