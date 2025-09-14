program main;

type

arbolDos=^nodoArbolDos;

arbol = ^nodoArbol;

auto = record
    patente:integer;
    anioFabricacion:integer;
    marca:string;
    color:string;
    modelo:string;
end;

lista = ^nodoLista;

datoLista = record
    color:string;
    patente:integer;
end;

nodoLista = record
  dato:datoLista;
  sig:lista;
end;

datoDos = record
    marca:string;
    l:lista;
end;

nodoArbol = record
    dato:auto;
    hd:arbol;
    hi:arbol;
end;

nodoArbolDos = record
    dato:datoDos;
    hd:arbolDos;
    hi:arbolDos;
end;

//finaliza con marca MMM

procedure agregarAdelante(var l:lista;aut:auto);
var
    data:datoLista;
    nue:lista;
begin
    data.patente:= aut.patente;
    data.color:= aut.color;
    
    new(nue);
    nue^.dato:= data;
    nue^.sig:=l;
    l:=nue;

end;

procedure insertarArbolDos(var a:arbolDos;aut:auto);
var
    nue:arbolDos;
begin
    if( a=nil ) then begin
        new(nue);
        nue^.dato.marca:= aut.marca;
        nue^.dato.l := nil;
        nue^.hi:=nil;
        nue^.hd:=nil;
        agregarAdelante(nue^.dato.l , aut);
        a:=nue;
    end else begin
        
        if ( a^.dato.marca =  aut.marca ) then begin
            agregarAdelante(a^.dato.l , aut);
        end else begin
            if ( aut.marca > a^.dato.marca) then begin
                insertarArbolDos(a^.hd,aut);
            end else begin
                insertarArbolDos(a^.hi,aut);
            end;
        end;

    end;
end;

procedure leerAuto(var dato:auto);
begin
    writeLn('ingrese marca o MMM para terminar');
    readln(dato.marca);
    if ( dato.marca <> 'MMM' ) then begin
        writeLn('ingrese patente');
        readln(dato.patente);
        writeLn('año defabri');
        readln(dato.anioFabricacion);
        writeLn('ingrese color');
        readln(dato.color);
        writeLn('ingrese modelo');
        readln(dato.modelo);
    end;
end;

//arbol por patente
procedure insertarArbol(var a:arbol; dato:auto);
var 
    nue:arbol;
begin
    if a =nil then begin
        new(nue);
        nue^.dato:=dato;
        nue^.hd:=nil;
        nue^.hi:=nil;
        a:=nue;
    end else begin
        
        if a^.dato.patente = dato.patente then begin
            writeLn('duplicado');
        end else begin 
            if( dato.patente > a^.dato.patente) then begin
                insertarArbol(a^.hd,dato);
            end else begin
                insertarArbol(a^.hi,dato);
            end;
        end;

    end;
end;

procedure crearEstructuras(var a:arbol);
var
    dato:auto;
begin
    leerAuto(dato);    
    while dato.marca <> 'MMM' do begin
        insertarArbol(a,dato);
        leerAuto(dato);  
    end;
end;


var
    a:arbol;
begin
    a:=nil;

    crearEstructuras(a);

End.