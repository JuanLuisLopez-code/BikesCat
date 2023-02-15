import React from "react";
import LoginRegisterForm from '../../components/LoginRegister/LoginRegisterForm';
import { useUser } from "../../hooks/useUser";
const ForgotPassword = () => {
    const { ForgotPassword, errorsUser } = useUser();
    return (
        <div>
            <h1>Forgot Password</h1>
            <LoginRegisterForm sendData={(data) => ForgotPassword(data)} errorsUser={errorsUser} />
        </div>
    )
}

export default ForgotPassword;