import axios from 'axios';
import secrets from '../secrets';
import JwtService from '../services/JwtService';

const useAxios = () => {
    let api = null;
    if (JwtService.getToken()) {
        api = axios.create({
            baseURL: secrets.URL_DRF,
            headers: {
                "Content-type": "application/json",
                "Authorization": `Bearer ${JwtService.getToken()}`
            }
        });

    } else {
        api = axios.create({
            baseURL: secrets.URL_DRF,
            headers: {
                "Content-type": "application/json",
            }
        });
    }

    api.interceptors.response.use(
        (response) => response,
        (error) => {
            if (error.response.status === 403) {
                if (error.response.data.detail == 'You are not an active') {
                    window.location.href = "/authenticate"
                } else {
                    sessionStorage.removeItem("time")
                    JwtService.destroyToken();
                    window.location.reload();
                    window.location.href = "/"
                }
            }
            return Promise.reject(error);
        }
    );

    return api;
}
export default useAxios;