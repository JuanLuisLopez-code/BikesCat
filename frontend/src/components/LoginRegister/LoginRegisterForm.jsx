import React from "react";
import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import * as Yup from 'yup';
import { useNavigate, useLocation, useParams } from 'react-router-dom';
import './LoginRegisterForm.scss';
import { auth, provider } from '../../services/FirebaseService';
import { signInWithPopup } from "firebase/auth";

const LoginRegisterForm = ({ sendData, errorsUser }) => {
    const { pathname } = useLocation();
    const path = pathname.split('/')[1];
    const { token } = useParams();
    const navigate = useNavigate();
    const passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
    let validators = null;
    if (path === 'login') {
        validators = Yup.object().shape({
            username: Yup.string().required('Username is required').min(3).max(15),
            password: Yup.string().required().min(8, 'Password must have a least 8 characters'),
        });
    } else if (path === 'register') {
        validators = Yup.object().shape({
            username: Yup.string().required('Username is required').min(3).max(15),
            password: Yup.string().required().min(8, 'password must have a least 8 characters').matches(passwordRegex, 'At least one uppercase letter, one lowercase letter, one number and a special character'),
            passwordConfirmation: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match'),
            email: Yup.string().email().required()
        });
    } else if (path === 'forgot' && !token) {
        validators = Yup.object().shape({
            email: Yup.string().email().required()
        });

    } else if (path === 'forgot' && token) {
        validators = Yup.object().shape({
            password: Yup.string().required().min(8, 'password must have a least 8 characters').matches(passwordRegex, 'At least one uppercase letter, one lowercase letter, one number and a special character'),
            passwordConfirmation: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match'),
        });
    }

    const {
        register,
        handleSubmit,
        formState: { errors }
    } = useForm({
        resolver: yupResolver(validators)
    });

    const redirectButton = path === 'login'
        ?
        <p className="message">Not registered? <a onClick={() => navigate('/register')}>Create an account</a></p>
        :
        <p className="message">Already registered? <a onClick={() => navigate('/login')}>Sign In</a></p>


    const emailFrom = path === 'register'
        ?
        <div>
            <input type="text" placeholder="Email" name="email" {...register('email')} />
            <div className="error">{errors.email?.message}</div>
        </div>
        : ''

    const repeatPasswordForm = path === 'register'
        ?
        <div>
            <input type="password" placeholder="Repeat password" name="passwordConfirmation" {...register('passwordConfirmation')} />
            <div className="error">{errors.passwordConfirmation?.message}</div>
        </div>
        : ''

    const passwordInput = path === 'forgot' && !token
        ?
        ''
        :
        <div>
            <input type="password" placeholder="Password" name="password" {...register('password')} />
            <div className="error">{errors.password?.message}</div>
        </div>

    const usernameInput = path === 'forgot' && !token
        ?
        <div>
            <input type="text" placeholder="Email" name="email" {...register('email')} />
            <div className="error">{errors.email?.message}</div>
        </div>
        :

        path === 'forgot' && token
            ?
            ''
            :

            < div >
                <input type="text" placeholder="Username" name="username" {...register('username')} />
                <div className="error">{errors.username?.message}</div>
            </div >

    const nameButton = path === 'forgot' && token
        ?
        <button className="buttonPath">Recovery</button>
        :
        <button className="buttonPath">{path}</button>

    const recoveryPassword = token
        ?
        <div>
            <input type="password" placeholder="Repeat password" name="passwordConfirmation" {...register('passwordConfirmation')} />
            <div className="error">{errors.passwordConfirmation?.message}</div>
        </div>
        :
        ''

    const getGoogleLog = () => {
        signInWithPopup(auth, provider)
            .then((data) => {
                data.user.type_register = "google"
                sendData(data.user)
            })
    }



    return (
        <div className="login-page">
            <div className="form">
                <form className="login-form" onSubmit={handleSubmit(sendData)}>
                    {usernameInput}
                    {emailFrom}
                    {passwordInput}
                    {repeatPasswordForm}
                    <div className="error">{errorsUser}</div>
                    {recoveryPassword}
                    {nameButton}
                    <div className="col-lg-5">
                        <button className="btn btn-block social-login google" onClick={getGoogleLog}>
                            <span className="social-icons">
                                <img src="https://cdn-icons-png.flaticon.com/512/300/300221.png" alt="" style={{"width" : "10%"}} />
                            </span>
                            <span className="align-middle">Login with Google</span>
                        </button>
                    </div>
                    {redirectButton}
                    <p className="message">Forgot Password? <a onClick={() => navigate('/forgot')}>Click here</a></p>
                </form>
            </div>
        </div>
    )
}

export default LoginRegisterForm;