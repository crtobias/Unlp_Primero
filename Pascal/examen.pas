program examen;
type


atencion = record 
    matricula:integer;
    dni:integer;
    mes:integer;
    diagnostico:char;
end;

arbol = ^nodoArbol;

data = record
    diagnostico:char;
    dni:integer;
end;

nodoArbol= record
    dato:data;
    hd:arbol;
    hi:arbol;
end;

vector = array[1..12] of arbol;

// metricula 0
procedure leerAtencion(var a:atencion);
begin
    writeLn('ingreseMatricula');
    readln(a.matricula);
    if a.matricula <> 0 then begin
    writeLn('ingrese diag L..P');
    readln(a.diagnostico);
    writeLn('ingrese mes 1..12');
    readln(a.mes);
    writeLn('ingrese dni paciente');
    readln(a.dni);
    end;
end;

procedure insertarArbol(var a:arbol;ate:atencion);
var
    nue:arbol;
begin
    if(a = nil) then begin
        new(nue);
        nue^.hd:=nil;
        nue^.hi:=nil;
        nue^.dato.diagnostico:= ate.diagnostico;
        nue^.dato.dni:= ate.dni;
        a:=nue;
    end else begin
        if ate.dni > a^.dato.dni then begin
            insertarArbol(a^.hd,ate);
        end else begin 
            insertarArbol(a^.hi,ate);
        end;
    end;
end;

procedure iniciarVector(var v:vector);
var
    i:integer;
begin
    for i:=1 to 12 do begin
        v[i]:=nil;
    end;
end;

procedure crearEstructura(var v:vector);
var
    ate:atencion;
begin
    iniciarVector(v);
    leerAtencion(ate);
    while ate.matricula <> 0 do begin
        insertarArbol(v[ate.mes],ate);
        leerAtencion(ate);
    end;
end;

function sacarArbolNodosTotal(a:arbol):integer;
begin
    if a=nil then begin
        sacarArbolNodosTotal:=0;
    end else begin
        sacarArbolNodosTotal:=sacarArbolNodosTotal(a^.hd)+1+sacarArbolNodosTotal(a^.hi)
    end
end;
// en el array saco cual es mas grande
function buscarArbolGrande(v:vector):integer;
var
    mayor:integer;
    x,i:integer;
    memo:integer;
begin
    x:=0;
    for i:=1 to 12 do begin
        memo:=sacarArbolNodosTotal(v[i]);
        if memo > x then begin
            x:= memo;
            mayor:=i;
        end;
    end;

    buscarArbolGrande:=mayor;
end;

function estaDni(a:arbol; dni:integer):boolean;
begin
    if (a = nil) then 
        estaDni := false
    else if (a^.dato.dni = dni) then 
        estaDni := true
    else if (dni > a^.dato.dni) then 
        estaDni := estaDni(a^.hd, dni)
    else 
        estaDni := estaDni(a^.hi, dni);
end;

function buscarPaciente(v:vector;dni:integer):boolean;
var
    i:integer;
    esta:boolean;
begin
    esta := false;
    i:=1;

    while (esta=false) and (i<=12) do begin
        esta:=estaDni(v[i],dni);
        i:=i+1;
    end;

    buscarPaciente := esta;
end;


var
    v:vector;
    mesMayorCant:integer;
    estaElPaciente:boolean;
begin 
    crearEstructura(v);
    mesMayorCant:= buscarArbolGrande(v);
    writeLn(mesMayorCant);
    estaElPaciente:=buscarPaciente(v,22);
    writeLn(estaElPaciente);
end.