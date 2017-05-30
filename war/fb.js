function post_tweet(tweetmessage)
{
FB.login(function() {
		FB.api('/me/feed', 'post', {message: tweetmessage});
		document.getElementById('the_Text').innerHTML='Thanks for posting the message';
    }, {scope: 'publish_actions'});
}

function getUserDetails()
{
		FB.api('/me',function(response){
			document.getElementById('Username').value=response.name;
			document.getElementById('UserId').value=response.id;
			document.getElementById('uname').value=response.name;
		});
}

function send_message()
{
		FB.ui({
		method: 'share',
		href:'https://apps.facebook.com/twitter/tweets.jsp'
		});		
}
window.fbAsyncInit = function() {

  FB.init({

        appId : '1934273176817608',

        cookie : true, // enable cookies to allow the server to access 

        // the session

        xfbml : true, // parse social plugins on this page

        version : 'v2.5' // use version 2.5

  });
  
  function checkLoginState() {

      FB.getLoginStatus(function(response) {

            statusChangeCallback(response);

      });

}
  
 
  function statusChangeCallback(response) {

      console.log('statusChangeCallback');

      console.log(response);

      if (response.status === 'connected') {

    	  document.getElementById('status').innerHTML='succesfully connected';

       } else if (response.status === 'not_authorized') {
            
             document.getElementById('status').innerHTML = 'Please log ' +'into this app.';

       } else {
            
             document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.';

       }

}
  
  FB.getLoginStatus(function(response) {

        statusChangeCallback(response);

        });

  };

  (function(d, s, id) {

        var js, fjs = d.getElementsByTagName(s)[0];

        if (d.getElementById(id)) return;

        js = d.createElement(s); js.id = id;

        js.src = "//connect.facebook.net/en_US/sdk.js";

        fjs.parentNode.insertBefore(js, fjs);

  }(document, 'script', 'facebook-jssdk'));