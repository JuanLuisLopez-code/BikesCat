import React from "react";
import { useParams } from "react-router-dom";
import LoginRegisterForm from '../../components/LoginRegister/LoginRegisterForm';
import { useUser } from "../../hooks/useUser";
const ForgotPassword = () => {
    const { token } = useParams();
    const { RecoveryPassword, ForgotPassword, errorsUser } = useUser();

    const callComponent = token
        ?
        <div>
            <h1>Recovery Password</h1>
            <LoginRegisterForm sendData={(data) => RecoveryPassword(data, token)} errorsUser={errorsUser} />
        </div>
        :
        <div>
            <h1>Forgot Password</h1>
            <LoginRegisterForm sendData={(data) => ForgotPassword(data)} errorsUser={errorsUser} />
        </div>

    return (
        <div>
            {callComponent}
        </div>
    )
}

export default ForgotPassword;