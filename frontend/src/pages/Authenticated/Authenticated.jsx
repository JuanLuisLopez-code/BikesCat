import React from 'react';
import './Authenticated.scss';
import { useParams } from "react-router-dom";
import { useUser } from '../../hooks/useUser';



const Authenticated = () => {
    const { email } = useParams();
    const { changeActive } = useUser();
    if (email) {
        changeActive(email)
    }

    const ReturnHtml =
        email
            ?
            <div className="box-wrapper">
                <div className="feature-photo">
                    <div className="footer">
                        <a className="readmore" href="#"></a>
                    </div>
                    <div className="info">
                        <h4>Authenticated successfully.</h4>
                        <span className="description">
                            Now you can Login
                        </span>
                    </div>
                    <div className="footer">
                        <a className="readmore" href="#"></a>
                    </div>
                </div>
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
                            In order to use the page correctly, now open you'r email and and verify the account
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