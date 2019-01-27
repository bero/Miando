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
    procedure FormCreate(Sender: TObject);
  private
    FItemGridOptions: TTreeViewItem;
    FItemCellReturn: TTreeViewItem;
    FDefaultDrawing: TTreeViewItem;
    FTreeUpdating: Boolean;
    procedure UpdateTreeView;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  FMX.Grid,
  System.TypInfo,
  Dirutils;

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
var
  Item: TTreeViewItem;
  i: Integer;
begin
  FItemGridOptions := TTreeViewItem.Create(Self);
  FItemGridOptions.Text := 'TCustomGrid.Options';
  TreeView1.AddObject(FItemGridOptions);
  for I := Integer(Low(TGridOption)) to Integer(High(TGridOption)) do
  begin
    Item := TTreeViewItem.Create(Self);
    Item.Text := GetEnumName(TypeInfo(TGridOption), I);
    FItemGridOptions.AddObject(Item);
  end;
  FItemGridOptions.Expand;
  FItemCellReturn := TTreeViewItem.Create(Self);
  FItemCellReturn.Text := 'TGridModel.CellReturnAction';
  TreeView1.AddObject(FItemCellReturn);
  for I := Integer(Low(TCellReturnAction)) to Integer(High(TCellReturnAction)) do
  begin
    Item := TTreeViewItem.Create(Self);
    Item.Text := GetEnumName(TypeInfo(TCellReturnAction), I);
    FItemCellReturn.AddObject(Item);
  end;
  FItemCellReturn.Expand;
  FDefaultDrawing := TTreeViewItem.Create(Self);
  FDefaultDrawing.Text := 'TCustomGrid.DefaultDrawing';
  TreeView1.AddObject(FDefaultDrawing);
  UpdateTreeView;
end;

procedure TMainForm.UpdateTreeView;
var
  S: string;
  I: Integer;
begin
  if not FTreeUpdating then
  begin
    FTreeUpdating := True;
    try
      for I := 0 to FItemGridOptions.Count - 1 do
      begin
        try
          S := FItemGridOptions.Items[I].Text;
          FItemGridOptions.Items[I].Enabled := True;
          FItemGridOptions.Items[I].IsChecked := True;
        except
          FItemGridOptions.Items[I].Enabled := False;
          FItemGridOptions.Items[I].IsChecked := False;
        end;
      end;
      FItemGridOptions.IsChecked := False;
      for I := 0 to FItemCellReturn.Count - 1 do
      begin
        try
          S := FItemCellReturn.Items[I].Text;
          FItemCellReturn.Items[I].Enabled := True;
          FItemCellReturn.Items[I].IsChecked := False;
        except
          FItemCellReturn.Items[I].Enabled := False;
          FItemCellReturn.Items[I].IsChecked := False;
        end;
      end;
      FItemCellReturn.IsChecked := True;
      FDefaultDrawing.IsChecked := False;
    finally
      FTreeUpdating := False;
    end;
  end;
end;

end.
