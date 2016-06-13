Public Class CreateItemTemplate
    Implements ITemplate
    'Field to store the ListItemType value
    Private myListItemType As ListItemType
    Public _colname As String
    Public _conSuffix As String

    Public Sub New()
    End Sub

    'Parameterrised constructor
    Public Sub New(Item As ListItemType, conSuffix As String, colname As String)
        myListItemType = Item
        _conSuffix = colname
        _colname = colname
    End Sub

    'Overwrite the InstantiateIn() function of the ITemplate interface.
    Public Sub InstantiateIn(container As Control) Implements ITemplate.InstantiateIn
        If myListItemType = ListItemType.Item Then
        End If
    End Sub

    ''' <summary>
    ''' This is the event, which will be raised when the binding happens.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub hfSubID_DataBinding(sender As Object, e As EventArgs)
        Dim txtdata As HiddenField = DirectCast(sender, HiddenField)
        Dim container As GridViewRow = DirectCast(txtdata.NamingContainer, GridViewRow)
        Dim dataValue As Object = DataBinder.Eval(container.DataItem, Convert.ToString("SubID_") & _conSuffix)
        If dataValue <> DBNull.Value Then
            txtdata.Value = dataValue.ToString()
        End If
    End Sub

    ''' <summary>
    ''' This is the event, which will be raised when the binding happens.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub hfMarkDetailSlno_DataBinding(sender As Object, e As EventArgs)
        Dim txtdata As HiddenField = DirectCast(sender, HiddenField)
        Dim container As GridViewRow = DirectCast(txtdata.NamingContainer, GridViewRow)
        Dim dataValue As Object = DataBinder.Eval(container.DataItem, Convert.ToString("hfMarkDetailSlno_") & _conSuffix)
        If dataValue <> DBNull.Value Then
            txtdata.Value = dataValue.ToString()
        End If
    End Sub

    ''' <summary>
    ''' This is the event, which will be raised when the binding happens.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub txtSubMark_DataBinding(sender As Object, e As EventArgs)
        Dim txtdata As TextBox = DirectCast(sender, TextBox)
        Dim container As GridViewRow = DirectCast(txtdata.NamingContainer, GridViewRow)
        Dim dataValue As Object = DataBinder.Eval(container.DataItem, Convert.ToString("txtSubMark_") & _conSuffix)
        If dataValue <> DBNull.Value Then
            txtdata.Text = dataValue.ToString()
        End If
    End Sub

End Class
