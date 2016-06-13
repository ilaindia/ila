// Display Error Message
function Error_Msg(_Msg) {
    $.alert.open('error', _Msg);
}
// Display Warning Message
function Warning_Msg(_Msg) {
    $.alert.open('warning', _Msg);
}
// Display Success Message
function Success_Msg(_Msg) {
    $.alert.open('success', _Msg);
}
// Display Confirmation Message
function Confirm_Msg(btn, _Msg, validationgroupname) {

    var validated = false;
    //Check Form Validation Is Passed
    if (validationgroupname !== '' && typeof (validationgroupname) != "undefined" && typeof (validationgroupname) != "NaN" && typeof (validationgroupname) != "null") {
        validated = Page_ClientValidate(validationgroupname);
    }
    else {
        validated = true;
    }

    if (validated) {
        //If Validation Is Passed Show Confirm Box
        $.alert.open('warning', _Msg, { A: 'Yes', B: 'No' }, function (button) {
            //If User Press Yes Button Do Postback
            if (button == 'A') {
                if ($(btn).prop('tagName') === 'INPUT' || $(btn).prop('tagName') === 'SELECT') {
                    javascript:__doPostBack($(btn).attr("name"), '');
                } else if ($(btn).prop('tagName') === 'A') {
                    var i = $(btn).attr("href");
                    i = i.slice(25, i.length);
                    i = i.substring(0, i.length - 5);
                    javascript:__doPostBack(i, '');
                }
            }
        });
    }
    return false;
}