// lea info de atenciones
// matriculadelmedico , dnipaciente , dia ,
// diagnostico  (valor a,,f) la lectura termina con dni 0

//generar dos estructuras

//un abb ordeado por matricula para cada matricula se almacena
// la cantidad de atenciones realizadas

// un vector con genero y lista de dni de los paciente con ese
// diagnostico

program examen2024;

type

arbol = ^nodoArbol;

atenciones = record
    matriculaDelMedico:integer;
    dniPaciente:integer;
    dia:integer;
    diagnostico:char;
    genero:string;
end;

arbolDato = record
    matriculaDelMedico:integer;
    cant:integer;
end;

nodoArbol = record
    dato:arbolDato;
    hd:arbol;
    hi:arbol;
end;

lista = ^nodoLista;

diagnostico = record
    dni:integer;
    genero:string;
end;

nodoLista = record
    dato:diagnostico;
    sig:lista;
end;

vector = array['A'..'F'] of lista;


procedure leerAtencion(var a:atenciones);
begin
    writeLn('ingrese dni o 0 para terminar');
    readln(a.dniPaciente);
    if(a.dniPaciente <> 0 ) then begin
        writeLn('ingrese dia');
        readln(a.dia);
        writeLn('ingrese diagnostico A..F');
        readln(a.diagnostico);
        writeLn('ingrese matricula del medioc');
        readln(a.matriculaDelMedico);
        writeLn('ingrese el genero');
        readln(a.genero);
    end;
end;

procedure agregarAdelante(var l:lista;diag:diagnostico);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=diag;
    nue^.sig := l;
    l:=nue;
end;

procedure agregarDiagnostico(var v:vector;data:atenciones);
var
    diag:diagnostico;
begin
    diag.dni:=data.dniPaciente;
    diag.genero:=data.genero;
    agregarAdelante(v[data.diagnostico],diag); 
end;


procedure iniciarVector(var v:vector);
begin
    v['A']:=nil;
    v['B']:=nil;
    v['C']:=nil;
    v['D']:=nil;
    v['E']:=nil;
    v['F']:=nil;
end;

procedure insertarArbol(var a:arbol; data:atenciones);
var
    nue:arbol;
begin
    if (a=nil) then begin
        new(nue);
        nue^.hi:=nil;
        nue^.hd:=nil;
        nue^.dato.matriculaDelMedico:=data.matriculaDelMedico;
        nue^.dato.cant:=1;
        a:=nue;
    end else begin
        if( data.matriculaDelMedico > a^.dato.matriculaDelMedico) then begin
            insertarArbol(a^.hd,data);
        end else if ( data.matriculaDelMedico < a^.dato.matriculaDelMedico) then begin
            insertarArbol(a^.hi,data);
        end else begin
            a^.dato.cant:=a^.dato.cant+1;
        end;
    end;
end;

procedure generarEstructuras(var v:vector; var a:arbol);
var
    aten:atenciones;
begin
    a:=nil;
    iniciarVector(v);

    leerAtencion(aten);
    while aten.dniPaciente <> 0 do begin
        insertarArbol(a,aten);
        agregarDiagnostico(v,aten);
        leerAtencion(aten);
    end;
end;

function sumaSuperiores(a:arbol;x:integer):integer;
begin
    if (a = nil) then begin
        sumaSuperiores:=0;
    end else begin
        if (a^.dato.matriculaDelMedico > x) then begin
            sumaSuperiores:=a^.dato.cant+sumaSuperiores(a^.hd,x)+sumaSuperiores(a^.hi,x);
        end else begin
            sumaSuperiores:=sumaSuperiores(a^.hd,x);
        end
    end;
end;

var
    a:arbol;
    v:vector;
    suma:integer;
begin
    generarEstructuras(v,a);

    suma:=sumaSuperiores(a,10);
    writeLn(suma);
end.