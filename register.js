// ==UserScript==
// @name     Unnamed Script 164581
// @version  1
// @grant    none
// @include  http://localhost/register
// ==/UserScript==
 
function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
       result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
 }

 var username = makeid(10)
 var password = makeid(10)
 var email = makeid(5) + '@' + makeid(5) + '.com' 

 document.getElementsByName('name')[0].value = username
 document.getElementsByName('email')[0].value = email
 document.getElementsByName('password')[0].value = password
 document.getElementById('_submit').click()
