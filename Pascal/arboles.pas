Program ArbolesDeLibros;

type


libros = record 
    nombre:string;
    id:integer;
    precio:integer;
end;

arbol = ^nodo;

nodo = record
  ri:arbol;
  le:arbol;
  dato:libros;
end;


procedure insertarDato();
begin

end;

begin
  
    WriteLn('holas');
  
END.