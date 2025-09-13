Program repaso;
// es un repaso no es algo en especifico simplemente modulos intentando llegar a lo mejor
// en performance y lo que requiera la catedra


// temas de este repaso rapido (arbole de listas , performance)
// juegos con nombre precio y rank(1..10) estrellas
//arbol ordenado por por precios y lista de los juegos con esos precios

// 1) recibe datos y retorna un arbols eficiente para la busqueda por precio que 
// todos los juegos con ese precio

type

arbol = ^nodoArbol;

juego = record
    nombre:string;
    precio:real;
    rank:integer;
end;

lista = ^listaNodo;

listaNodo=record
    dato:juego;
    sig:lista;
end;

datoArbol = record
    precio:real;
    l:lista;
end;

nodoArbol=record
    dato:datoArbol;
    hi:arbol;
    hd:arbol;
end;



procedure agregarAdelante(var l:lista;j:juego);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=j;
    nue^.sig:=nil;

    if ( l = nil ) then begin
        l:=nue;
    end else  begin
        nue^.sig:=l;
        l:=nue;
    end;
end;

procedure insertarArbol(var a:arbol;j:juego);
var
    nue:arbol;
begin
    
    if a=nil then begin
        new(nue);
        nue^.dato.precio:=j.precio;
        nue^.dato.l:=nil;
        nue^.hi := nil;
        nue^.hd := nil;

        agregarAdelante(nue^.dato.l , j);
        a:=nue;
    end else begin
        if j.precio < a^.dato.precio  then begin
            insertarArbol(a^.hi ,j);
        end else if j.precio > a^.dato.precio then begin
            insertarArbol(a^.hd ,j);
        end else begin // esto significa que es mismo precio
            agregarAdelante(a^.dato.l , j);
        end;
    end;
end;

procedure leerJuego(var j:juego);
begin
    writeLn('ingrese precio');
    readLn(j.precio);
    if j.precio <> -1 then begin    
        writeLn('ingrese nombre');
        readLn(j.nombre);
        writeLn('ingrese rank 1...10');
        readLn(j.rank);
    end;
end;

procedure leerArbol(var a:arbol);
var
    j:juego;
begin
    leerJuego(j);
    while j.precio <> -1 do begin
        insertarArbol(a,j);
        leerJuego(j);
    end;
end;


// 2) devolver una lista con los precios de un arbol entre un precio x y otro y
//no hice los tipos porque quedan muchos peor se entiende
// procedure ListaEntre(a:arbol; var l:listaprecios ; min:real ; max:real );
// begin
//     if ( a <> nil ) then begin

//         if( a^.dato.precio > min) then
//             ListaEntre(a^.hi,l,min,max);

//         if (a^.dato.precio >= min) and (a^.dato.precio <= max) then
//             agregarAdelante(l, a^.dato.precio);

//         if( a^.dato.precio < max) then 
//             ListaEntre(a^.hd,l,min,max);

//     end;
// end;




var
    a:arbol;
begin
    a:=nil;
    leerArbol(a);
End.