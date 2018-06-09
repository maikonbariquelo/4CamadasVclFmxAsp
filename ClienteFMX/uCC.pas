// 
// Created by the DataSnap proxy generator.
// 09/06/2018 17:49:38
// 

unit uCC;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminClient)
  private
    FGetDataCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetData: TDataSet;
  end;

implementation

function TSMClient.GetData: TDataSet;
begin
  if FGetDataCommand = nil then
  begin
    FGetDataCommand := FDBXConnection.CreateCommand;
    FGetDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDataCommand.Text := 'TSM.GetData';
    FGetDataCommand.Prepare;
  end;
  FGetDataCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FGetDataCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetDataCommand.FreeOnExecute(Result);
end;


constructor TSMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TSMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TSMClient.Destroy;
begin
  FGetDataCommand.DisposeOf;
  inherited;
end;

end.
