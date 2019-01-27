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
  System.Variants,

  DirUtils;

type
  TMainForm = class(TForm)
    tlbMain: TToolBar;
    pnlMain: TPanel;
    pnlFolders: TPanel;
    pnlThumbNails: TPanel;
    splMain: TSplitter;
    TreeView1: TTreeView;
    procedure FormCreate(Sender: TObject);
  private
    fDirTree: TFolderTree;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  FMX.Grid,
  System.TypInfo;

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fDirTree := TFolderTree.Create(TreeView1);
end;

end.
