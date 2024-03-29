import React, { Suspense } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Loading from './components/Loading/Loading';
import Header from './components/Header/Header';
import Footer from './components/Footer/Footer';
import { ToastContainer } from 'react-toastify';
import { StationContext } from './context/StationsContext';
import './App.scss';
import { BikesContextProvider } from "./context/BikesContext";
import { SlotsContextProvider } from "./context/SlotsContext";
import { UserContextProvider } from './context/UserContext';
import { IncidentsContextProvider } from "./context/IncidentsContext";
import { NotificationsContextProvider } from "./context/NotificationsContext";

//Guards
import AdminGuard from './services/guards/AdminGuard';
import TwoFAGuard from './services/guards/2FAGuard';
import { NoAuthGuard } from './services/guards/AuthGuard';
import { Help2FA } from './services/guards/AuthGuard';
import { AuthGuard } from './services/guards/AuthGuard';

function App() {

  const NotFound = React.lazy(() => import('./pages/NotFound/NotFound'));
  const Home = React.lazy(() => import('./pages/Home/Home'));
  const Dashboard = React.lazy(() => import('./pages/Dashboard/Dashboard'));

  //Bikes Dashboard
  const BikesList = React.lazy(() => import('./pages/Dashboard/Bikes/BikesList'));
  const BikesCreate = React.lazy(() => import('./pages/Dashboard/Bikes/BikesCreate'));
  const BikesUpdate = React.lazy(() => import('./pages/Dashboard/Bikes/BikesUpdate'));

  //Station Dashboard
  const StationList = React.lazy(() => import('./pages/Dashboard/Stations/StationsList'));
  const StationsCreate = React.lazy(() => import('./pages/Dashboard/Stations/StationsCreate'));
  const StationsUpdate = React.lazy(() => import('./pages/Dashboard/Stations/StationsUpdate'));

  //SLot Dashboard
  const SlotsList = React.lazy(() => import('./pages/Dashboard/Slots/SlotsList'));
  const SlotsDetails = React.lazy(() => import('./pages/Dashboard/Slots/SlotsDetails'));

  //Rent Dashboard
  const RentList = React.lazy(() => import('./pages/Dashboard/Rent/RentList'));

  //Incidents Dashboard
  const IncidentsList = React.lazy(() => import('./pages/Dashboard/Incidents/IncidentsList'));

  //Station Client
  const StationsClientList = React.lazy(() => import('./pages/StationsClient/StationsClientList'));
  const StationDetails = React.lazy(() => import('./pages/StationDetails/StationDetails'));

  //Login/Register
  const Login = React.lazy(() => import('./pages/Login/Login'));
  const Register = React.lazy(() => import('./pages/Login/Register'));
  const Forgot = React.lazy(() => import('./pages/Login/Forgot'));

  //Profile
  const Profile = React.lazy(() => import('./pages/Profile/Profile'));
  const NotificationsUser = React.lazy(() => import('./pages/NotificationsUser/NotificationsUser'));

  //Authenticated
  const AuthenticatedUser = React.lazy(() => import('./pages/Authenticated/Authenticated'));

  // 2FA
  const TwoPageFA = React.lazy(() => import('./pages/2FA/2FA'));

  return (
    <div>
      <Suspense fallback={<Loading />}>
        <BrowserRouter>
          <UserContextProvider>
            <StationContext>
              <IncidentsContextProvider>
                <BikesContextProvider>
                  <SlotsContextProvider>
                    <NotificationsContextProvider>
                      <Header />
                      <ToastContainer
                        position="top-right"
                        autoClose={2500}
                        hideProgressBar={false}
                        newestOnTop={false}
                        closeOnClick
                        rtl={false}
                        pauseOnFocusLoss={false}
                        draggable
                        pauseOnHover
                        theme="light"
                      />
                      <Routes>
                        <Route path="*" element={<NotFound />} />
                        <Route path="/" element={<Home />} />
                        <Route path="/home" element={<Home />} />

                        <Route element={<><AdminGuard /><TwoFAGuard /></>}>
                          <Route path="/dashboard" element={<Dashboard />} />
                          {/* Dashboard Bikes */}
                          <Route path="/dashboard/bikes" element={<BikesList />} />
                          <Route path="/dashboard/bikes/create" element={<BikesCreate />} />
                          <Route path="/dashboard/bikes/update/:slug" element={<BikesUpdate />} />
                          {/* DASHBOARD STATIONS */}
                          <Route path="/dashboard/stations" element={<StationList />} />
                          <Route path="/dashboard/stations/create" element={<StationsCreate />} />
                          <Route path="/dashboard/stations/update/:slug" element={<StationsUpdate />} />
                          {/* Dashboard Slots */}
                          <Route path="/dashboard/slots" element={<SlotsList />} />
                          <Route path="/dashboard/slots/:id" element={<SlotsDetails />} />
                          {/* Dashboard Rent */}
                          <Route path="/dashboard/rent" element={<RentList />} />
                          {/* Dashboard Incidents */}
                          <Route path="/dashboard/incidents" element={<IncidentsList />} />
                        </Route>
                        {/* Stations Client */}
                        <Route element={<><TwoFAGuard /><Help2FA /></>}>
                          <Route path="/stations" element={<StationsClientList />} />
                          <Route path="/stations/:slug" element={<StationDetails />} />
                        </Route>
                        {/* Login/Register */}
                        <Route element={<NoAuthGuard />}>
                          <Route path="/login" element={<Login />} />
                          <Route path="/register" element={<Register />} />
                          <Route path="/forgot" element={<Forgot />} />
                          <Route path="/forgot/:token" element={<Forgot />} />
                        </Route>
                        {/* Profile */}
                        <Route element={<><TwoFAGuard />< AuthGuard /></>}>
                          <Route path="/profile" element={<Profile />} />
                          <Route path="/notifications" element={<NotificationsUser />} />
                          <Route path="/2FA" element={<TwoPageFA />} />
                        </Route>
                        <Route path="/authenticate" element={<AuthenticatedUser />} />
                        <Route path="/authenticate/:email" element={<AuthenticatedUser />} />
                      </Routes>
                      <Footer />
                    </NotificationsContextProvider>
                  </SlotsContextProvider>
                </BikesContextProvider>
              </IncidentsContextProvider>
            </StationContext>
          </UserContextProvider>
        </BrowserRouter>
      </Suspense>
    </div >
  );
}

export default App;
