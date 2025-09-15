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

var
    v:vector;
begin 
    crearEstructura(v);
end.