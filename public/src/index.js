// Firebase App (the core Firebase SDK) is always required and must be listed first
import * as firebase from "firebase/app";

// Add the Firebase products that you want to use
// import "firebase/auth";
import "firebase/firestore";

const firebaseConfig = {
    apiKey: "AIzaSyCyNr4pksBCWW29YabfUgQTLakG766HULY",
    authDomain: "software-engineering-277504.firebaseapp.com",
    databaseURL: "https://software-engineering-277504.firebaseio.com",
    projectId: "software-engineering-277504",
    storageBucket: "software-engineering-277504.appspot.com",
    messagingSenderId: "157030108599",
    appId: "1:157030108599:web:2bc5b29db54ffdd624ec32",
    measurementId: "G-WFLGWYHHS6"
};

// Initialize Firebase
var init = firebase.initializeApp(firebaseConfig);


firebase.firestore().collection('test').add({test:'aaa'})
.then(r=>alert(r))
.catch(e=>alert(e))
