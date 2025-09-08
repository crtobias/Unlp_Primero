

Program ListasProgram;

type

lista = ^nodo;

persona = record
    nombre:string;
    edad:integer;
    dni:integer;
end;

nodo = record
  dato:persona;
  sig:lista;
end;

procedure agregarAdelante(var l:lista; dato:persona);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=dato;

    nue^.sig:=l;
    l:=nue;
end;

// si tenemos el puntero 
procedure agregarAtras(var l:lista; var ult:lista; dato:persona);
var
    nue:lista;
begin
    new(nue);
    nue^.dato := dato;
    nue^.sig := nil;  

    if ult <> nil then
        ult^.sig := nue
    else
        l := nue;       
    ult := nue;   
end;

//si no tenemos puntero
procedure agregarAtrasSin(var l:lista;var ult:lista; dato:persona);
var
    act:lista;
    sig:lista;
    nue:lista;
begin
    new(nue);
    nue^.dato:=dato;
    nue^.sig:=nil;

    if(l=nil) then begin
        ult:=nue;
        l:=nue;
    end else begin
        act:=l;
        sig:=l^.sig;
        while sig <> nil do begin
            act:=act^.sig;
            sig:=act^.sig;
        end;
        ult:=act;

        act^.sig:=nue;
        ult:=nue;
    end;
end;

begin

    writeLn('hola');

END.