program prj4CamadasVclFmxAsp;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uMain in 'uMain.pas' {frmMain},
  uSM in 'uSM.pas' {SM: TDSServerModule},
  uSC in 'uSC.pas' {SC: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TSC, SC);
  Application.Run;
end.

