object CM: TCM
  OldCreateOrder = False
  Height = 271
  Width = 415
  object conServidor: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=211'
      'HostName=127.0.0.1'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/')
    Connected = True
    Left = 48
    Top = 40
  end
  object cdsCustomer: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCustomer'
    RemoteServer = pconServidor
    Left = 120
    Top = 96
  end
  object pconServidor: TDSProviderConnection
    ServerClassName = 'TSM'
    Connected = True
    SQLConnection = conServidor
    Left = 48
    Top = 96
  end
end
