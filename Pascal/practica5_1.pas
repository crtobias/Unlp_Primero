Program practica;
type

oficina  = record
    codigo:integer;
    dni:integer;
    valor:real;
end;

vector = array[1..100] of oficina;

procedure leerOficina(var o:oficina);
begin
    writeLn('ingrese codigo o 0 para terminar');
    readln(o.codigo);
    if(o.codigo <> 0) then begin
        writeLn('ingrese dni');
        readln(o.dni);
        writeLn('ingrese valor');
        readln(o.valor);
    end;
end;

procedure cargarVector(var v:vector ;var dl:integer);
var
    o:oficina;
    cont:integer;
begin
    cont:=1;
    leerOficina(o);
    while (cont <= 100) and (o.codigo <> 0) do begin
        v[cont]:=o;

        cont:=cont+1;
        leerOficina(o);
    end;
    dl:=cont-1;
end;

procedure ordenarVector(var v:vector ; var dl:integer);
var
    i,x:integer;
    aux:oficina;
    pos:integer;
begin
  
  x:=1;

  for i:=1 to dl do begin
    pos:=i;
    for x:=i+1 to dl do begin
       if v[x].codigo < v[pos].codigo then
            pos := x;
    end;

    aux := v[i];
    v[i] := v[pos];
    v[pos] := aux;
  end;
end;

procedure busquedaDicotomica(v: vector; ini, ult: integer; data: oficina; var pos: integer);
var
    medio: integer;
begin
    if ini > ult then
    begin
        pos := -1;  // No encontrado
        writeln('No encontrado');
    end
    else
    begin
        medio := (ini + ult) div 2;  // Punto medio

        if data.codigo = v[medio].codigo then
        begin
            pos := medio;  // Encontrado
            writeln('Encontrado en la posición ', pos);
        end
        else if data.codigo < v[medio].codigo then
        begin
            busquedaDicotomica(v, ini, medio - 1, data, pos);  // Buscar en la mitad inferior
        end
        else
        begin
            busquedaDicotomica(v, medio + 1, ult, data, pos);  // Buscar en la mitad superior
        end;
    end;
end;

function montoTotal(a: arbol): real;
begin
    if (a = nil) then
        montoTotal := 0
    else
        montoTotal := a^.dato.valor + montoTotal(a^.HI) + montoTotal(a^.HD);
end;


var
    v:vector;
    dl:integer;
begin
    dl:=0;
    cargarVector(v,dl);
    ordenarVector(v,dl);
END.