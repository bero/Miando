unit Main;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.TreeView,
  FMX.Types,
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TMainForm = class(TForm)
    tlbMain: TToolBar;
    pnlMain: TPanel;
    pnlFolders: TPanel;
    pnlThumbNails: TPanel;
    splMain: TSplitter;
    TreeView1: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  Dirutils;

{$R *.fmx}

end.
