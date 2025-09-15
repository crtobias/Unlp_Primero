program modulos;
// este programa no va  compilar son modulos sueltos para 
// practicar




//simulamos un vector de personas a ordenar por dni
procedure ordenarArray(var v:vector;dl:integer);
var
    x,i,pos:integer;
    aux:persona;
begin

    for i:=1 to dl-1 do begin
        pos:=i;

        for x:=i+1 to dl do begin
            if(v[x].dni < v[pos].dni) then
                pos:=x;
        end;

        if(pos <> i) then begin
            aux:=v[pos];
            v[pos]:=v[i];
            v[i]:=aux;
        end;

    end;
end;

//buscamos dni en array de personas
procedure busquedaDicotomica(v:vector,ini:integer;fin:integer;dato:persona);
var 
    mitad:integer;
begin
    if (ini > fin ) then begin
        writeLn('dato no encontrado');
    end else begin
            mitad := (ini + fin) div 2;

        if(v[mitad].dni = dato.dni) then begin
            writeLn('dato encontrado');
        end else begin
            if (dato.dni > v[mitad].dni) then begin
                busquedaDicotomica(v,mitad+1,fin,dato);
            end else begin
                busquedaDicotomica(v,ini,mitad-1,dato);
            end;
        end;
    end;
end;

// de un arbol binario de juegos sacar el valor total
// de todos los juegos 
function total(a:arbol;):real;
begin
    if(a=nil) then
        total:=0;
    else 
        total:=total(a^.hd)+total(a^.hi)+a^.dato.precio;
end;
// se usa asi
// pepe:real;
// pepe:=total(a)
// write pepe


// array de juegos ordenar por precio 
procedure ordenarArray(var v:vector;dl:integer);
var
    i,j,pos:integer;
    aux:juego;
begin

    for i:=1 to dl-1 do begin
        pos:=i;
        for j:=i+1 to dl do begin
            if ( v[j].precio > v[pos].precio ) then   
                pos:=j;
        end;

        if (pos<>i) then begin
            aux:=v[i];
            v[i]:=v[pos];
            v[pos]:=aux;
        end;
    end;

end;


