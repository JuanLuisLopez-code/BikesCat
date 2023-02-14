import React from 'react';
import './Authenticated.scss';
import { useParams } from "react-router-dom";



const Authenticated = () => {
    const { email } = useParams();
    console.log(email)

    const ReturnHtml =
        email
            ?
            <div>
                <h1>Hola</h1>
                <h2>{email}</h2>
            </div>
            :
            <div className="box-wrapper">
                <div className="feature-photo">
                    <div className="footer">
                        <a className="readmore" href="#"></a>
                    </div>
                    <div className="info">
                        <h4>Please verify your account.</h4>
                        <span className="description">
                            In order to use the page correctly, it is necessary to enter your email and verify the account
                        </span>
                    </div>
                    <div className="footer">
                        <a className="readmore" href="#"></a>
                    </div>
                </div>
            </div>


    return (
        <div>
            {ReturnHtml}
        </div>

    )
}

export default Authenticated;