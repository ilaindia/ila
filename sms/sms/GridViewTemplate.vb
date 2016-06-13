Imports System.Web.UI
Imports System.Web.UI.WebControls

Public Class GridViewTemplate
    Implements ITemplate

    Dim _columnName As String
    Dim _templateType As ListItemType

    Sub New(itemType As ListItemType, colname As String)
        '/Stores the template type.
        _templateType = itemType

        '//Stores the column name.
        _columnName = colname
    End Sub

    Private Sub ITemplate_InstantiateIn(container As Control) Implements ITemplate.InstantiateIn
        If _templateType = ListItemType.Item Then
            Dim txt As New TextBox()
            txt.ID = "gvtxt" + _columnName.Replace(" ", "_").Split("-")(0).ToString()
            txt.Attributes.Add("runat", "server")
            txt.CssClass = "form-control"
            AddHandler txt.DataBinding, AddressOf txt_Method
            Dim hf As New HiddenField()
            hf.ID = "gvhf" + _columnName.Replace(" ", "_").Split("-")(0).ToString()
            hf.Value = _columnName.Replace(" ", "_").Split("-")(1).ToString()
            'hf.("runat", "server")
            container.Controls.Add(txt)
            container.Controls.Add(hf)


        End If

        If _templateType = ListItemType.Header Then
            Dim lbl As New Label()
            lbl.Text = _columnName.Replace(" ", "_").Split("-")(0).ToString()
            container.Controls.Add(lbl)

        End If
    End Sub

    Protected Sub txt_Method(sender As Object, e As EventArgs)
        Dim txtData As TextBox = DirectCast(sender, TextBox)
        Dim container As GridViewRow = DirectCast(txtData.NamingContainer, GridViewRow)

        Dim dataValue As Object = DataBinder.Eval(container.DataItem, _columnName)

        txtData.Text = dataValue.ToString()

        'If (dataValue <> DBNull.Value) Then
        '    txtData.Text = dataValue.ToString()
        'End If
    End Sub
End Class
