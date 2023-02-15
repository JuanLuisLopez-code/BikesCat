import emailjs from '@emailjs/browser';
import secrets from '../secrets';

const sendEmail = (data) => {

    const templateParams = {
        "email": data.email,
        "username": data.username,
        "btoa": btoa(data.email)
    }

    emailjs.send(secrets.YOUR_SERVICE_ID, secrets.YOUR_TEMPLATE_ID_1, templateParams, secrets.YOUR_PUBLIC_KEY)
        .then(function (response) {
            console.log('SUCCESS!', response.status, response.text);
        }, function (error) {
            console.log('FAILED...', error);
        });

}

const forgotPassword = (data) => {
    console.log(data)

    const templateParams = {
        "username": data.user.username,
        "btoa": btoa(data.token)
    }

    emailjs.send(secrets.YOUR_SERVICE_ID, secrets.YOUR_TEMPLATE_ID_2, templateParams, secrets.YOUR_PUBLIC_KEY)
        .then(function (response) {
            console.log('SUCCESS!', response.status, response.text);
        }, function (error) {
            console.log('FAILED...', error);
        });

}

const EmailService = {
    sendEmail,
    forgotPassword
};

export default EmailService;