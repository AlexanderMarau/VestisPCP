{**********************************************************************************}
{ VESTIS PCP  - SISTEMA PARA INDUSTRIAS DE CONFEC��ES.                             } 
{                                                                                  } 
{ Este arquivo � parte do codigo-fonte do sistema VESTIS PCP, � um software livre; }
{ voc� pode redistribu�-lo e/ou modific�-lo dentro dos termos da GNU LGPL vers�o 3 }
{ como publicada pela Funda��o do Software Livre (FSF).                            }
{                                                                                  }
{ Este programa � distribu�do na esperan�a que possa ser �til, mas SEM NENHUMA     }
{ GARANTIA; sem uma garantia impl�cita de ADEQUA��O a qualquer MERCADO ou          }
{ APLICA��O EM PARTICULAR. Veja a Licen�a P�blica Geral GNU/LGPL em portugu�s      }
{ para maiores detalhes.                                                           }
{                                                                                  }
{ Voc� deve ter recebido uma c�pia da GNU LGPL vers�o 3, sob o t�tulo              }
{ "LICENCA.txt", junto com esse programa.                                          }
{ Se n�o, acesse <http://www.gnu.org/licenses/>                                    }
{ ou escreva para a Funda��o do Software Livre (FSF) Inc.,                         }
{ 51 Franklin St, Fifth Floor, Boston, MA 02111-1301, USA.                         }
{                                                                                  }
{                                                                                  }
{ Autor: Adriano Zanini -  vestispcp.indpcp@gmail.com                              }
{                                                                                  }
{**********************************************************************************}


{***********************************************************************************
**  SISTEMA...............: VESTIS PCP                                            **
**  DESCRI��O.............: SISTEMA ERP PARA INDUSTRIAS DE CONFEC��ES             **
**  LINGUAGEM/DB..........: DELPHI XE7  /  SQL SERVER 2014                        ** 
**  ANO...................: 2010 - 2018                                           ** 
**                                                                                **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/DESENVOLVEDOR...: ADRIANO ZANINI                                        **
**  MINHAS AUTORIAS.......:  Vestis PCP e IndPCP                                  **
**  - VESTISPCP (� gratuito, disponivel no GitHub). N�o dou Suporte T�cnico.      **
**  - INDPCP (� pago). Dou Suporte T�cnico.                                       **
**                                                                                **
** -----------------------------------------------------------------------------  **
**                                                                                **
** - VESTISPCP � C�DIGO-FONTE LIVRE. O CODIGO-FONTE N�O PODE SER COMERCIALIZADO.  **
**                                                                                **
** - INDPCP � RESTRITO. SOMENTE EU, O AUTOR, POSSO COMERCIALIZAR O CODIGO-FONTE.  **
**                                                                                **
***********************************************************************************}

unit FRelMovBancario;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Mask, FrmRelatorios, FDatas, ISFEdit,
  ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos;

type
   TFrmRelMovBancario = class(TForm)
      Panel1: TPanel;
      RadioG: TRadioGroup;
      Panel2: TPanel;
      BtnSair: TBitBtn;
      Btn_Imprimir: TBitBtn;
      GroupBox3: TGroupBox;
    chkContaCorrente: TCheckBox;
      RadioGSaldoAnterior: TRadioGroup;
      FrameDatas1: TFrameDatas;
    FrameRelatorios1: TFrameRelatorios;
    EditContaCorrente: TIDBEditDialog;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    chkPlanoConta: TCheckBox;
    EditPlanoContas: TIDBEditDialog;
    EditNomePlanoContas: TEdit;
      procedure Btn_ImprimirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnSairClick(Sender: TObject);
    procedure chkContaCorrenteClick(Sender: TObject);
    procedure chkPlanoContaClick(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelMovBancario: TFrmRelMovBancario;

implementation

uses FPrincipal, SQLServer, Biblioteca, Global,
  FRelMovBancarioSimplificado, FRelMovBancarioAnalitico;

{$R *.DFM}

procedure TFrmRelMovBancario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := cafree;
end;

procedure TFrmRelMovBancario.Btn_ImprimirClick(Sender: TObject);
begin

   // Totais por conta
   If RadioG.ItemIndex = 0 then
   Begin
      FrmRelMovBancarioSimplificado := TFrmRelMovBancarioSimplificado.create(self);
   End;

   // Saldo Di�rio - Anaitico
   If RadioG.ItemIndex = 1 then
   Begin
      FrmRelMovBancarioAnalitico := TFrmRelMovBancarioAnalitico.create(self);
   End;

End;

procedure TFrmRelMovBancario.chkPlanoContaClick(Sender: TObject);
begin
   if chkContaCorrente.Checked = true then
   Begin
      EditPlanoContas.Enabled := False;
   End
   Else
   Begin
      EditPlanoContas.Enabled := true;
      EditPlanoContas.SetFocus;
   End;

end;

procedure TFrmRelMovBancario.chkContaCorrenteClick(Sender: TObject);
begin
   if chkContaCorrente.Checked = true then
   Begin
      EditContaCorrente.Enabled := False;
   End
   Else
   Begin
      EditContaCorrente.Enabled := true;
      EditContaCorrente.SetFocus;
   End;

end;

procedure TFrmRelMovBancario.FormKeyPress(Sender: TObject; var Key: Char);
begin

   If Key = #27 then
      CLOSE;

end;

procedure TFrmRelMovBancario.BtnSairClick(Sender: TObject);
begin
   CLOSE;
end;

end.
