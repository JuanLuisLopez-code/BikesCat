import emailjs from '@emailjs/browser';
import secrets from '../secrets';

const sendEmail = (data) => {

    const templateParams = {
        "email": data.email,
        "username": data.username,
        "btoa": btoa(data.email)
    }

    emailjs.send(secrets.YOUR_SERVICE_ID, secrets.YOUR_TEMPLATE_ID, templateParams, secrets.YOUR_PUBLIC_KEY)
        .then(function (response) {
            console.log('SUCCESS!', response.status, response.text);
        }, function (error) {
            console.log('FAILED...', error);
        });

};

const EmailService = {
    sendEmail
};

export default EmailService;