import { initializeApp } from "firebase/app";
import { getAuth, GoogleAuthProvider, GithubAuthProvider } from "firebase/auth";
import secrets from "../secrets";

const firebaseConfig = {
    apiKey: secrets.apiKey,
    authDomain: secrets.authDomain,
    projectId: secrets.projectId,
    storageBucket: secrets.storageBucket,
    messagingSenderId: secrets.messagingSenderId,
    appId: secrets.appId,
    measurementId: secrets.measurementId
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const providerGoogle = new GoogleAuthProvider();
const providerGithub = new GithubAuthProvider();
export { auth, providerGoogle, providerGithub }