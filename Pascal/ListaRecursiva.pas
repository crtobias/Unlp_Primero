Program main;
type
    lista = ^nodo;

    persona = record 
        nombre:string;
        id:integer;
    end;

    nodo = record
        dato:persona;
        sig:lista;
    end;

    // crear lista recursiva mientra id <> -1

procedure leerDato(var d:persona);
begin
    WriteLn('ingrese id');
    readLn(d.id);
    if(d.id <> -1) then begin
        WriteLn('ingrese nombre');
        readLn(d.nombre);
    end;
end;

procedure cargarListaAdelante(var l:lista);
var
    d:persona;
    nue:lista;
begin
    leerDato(d);
    if(d.id <> -1) then begin
        new(nue);
        nue^.dato:=d;
        nue^.sig:=l;
        l:=nue;
        cargarListaAdelante(l);
    end;
end;

procedure imprimirLista(l:lista);
begin
    if (l <> nil) then begin
        writeln('ID: ', l^.dato.id, '  Nombre: ', l^.dato.nombre);
        imprimirLista(l^.sig);  // llamada recursiva con el siguiente nodo
    end;
end;


var
    listaMain:lista;
begin
    WriteLn('inicio');
    cargarListaAdelante(listaMain);
    WriteLn('fin');
    imprimirLista(listaMain);
End.