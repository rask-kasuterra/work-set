var firebase = require('firebase/app');
require('firebase/auth');

var config = {
    apiKey: "<API_KEY>",
    authDomain: "<PROJECT_ID>.firebaseapp.com",
    projectId: "<PROJECT_ID>",
    storageBucket: "<BUCKET>.appspot.com",
    messagingSenderId: "<SENDER_ID>",
    appId: "<APP_ID>",
    measurementId: "<MEASUREMENT_ID>"
};
firebase.initializeApp(config);

// Django のバックエンドにリクエストを送信
firebase.auth().signInWithEmailAndPassword(email, password).then(function(user) {
    return user.getIdToken().then(idToken => {
        // idTokenを次のAPIリクエストで使用します
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'http://localhost:8000/api/some_endpoint');
        xhr.setRequestHeader('Authorization', 'Bearer ' + idToken);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    console.log('Successful request:', xhr.responseText);
                } else {
                    console.log('Request error:', xhr.statusText);
                }
            }
        }
        xhr.send();
    });
}).catch(function(error) {
    // ログインエラーのハンドリングをここで行います
    console.error(error);
});
