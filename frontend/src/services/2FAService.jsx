import Api from './Api';

const TwoFA = {

    checkQRBD(data){
        return Api().put("/checkQRBD", data)
    },
    inputQR(data){
        return Api().put("/inputQR", data)
    }
}

export default TwoFA;