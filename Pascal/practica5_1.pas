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
    memo:integer;
begin
  
  x:=1;

  for i:=1 to dl do begin
    memo:=i;
    for x:=i+1 to dl do begin
       if v[x].codigo < v[memo].codigo then
            memo := x;
    end;


    aux := v[i];
    v[i] := v[memo];
    v[memo] := aux;
  end;
end;


var
    v:vector;
    dl:integer;
begin
    dl:=0;
    cargarVector(v,dl);
    ordenarVector(v,dl);
END.