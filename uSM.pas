unit uSM;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DBXFirebird, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Data.DB;

type
  TSM = class(TDSServerModule)
    conEmployee: TSQLConnection;
    dtsCustomer: TSQLDataSet;
    dspCustomer: TDataSetProvider;
    qryAux: TSQLQuery;
  private
    { Private declarations }
  public
    function GetData(): TDataSet;
  end;

implementation


{$R *.dfm}


{ TSM }

function TSM.GetData: TDataSet;
begin
    qryAux.SQL.Clear;
    qryAux.SQL.Add('select * from CUSTOMER');
    qryAux.Open();
    Result := qryAux;
end;

end.

