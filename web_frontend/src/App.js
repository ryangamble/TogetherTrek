import React from 'react'
import { Container } from 'react-bootstrap'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import Header from './components/Header'
import Footer from './components/Footer'
import HomeScreen from './screens/HomeScreen'
import RegisterScreen from './screens/RegisterScreen'
import LoginScreen from './screens/LoginScreen'
import ProfileScreen from './screens/ProfileScreen'
import SearchScreen from './screens/SearchScreen'
import CreateTripScreen from './screens/CreateTripScreen'
import EditProfileScreen from './screens/EditProfileScreen'

function App() {
  return (
    <Router>
      <Header />
      <main className='py-3'>
        <Container>
          <Route path='/' component={HomeScreen} exact />
          <Route path='/register' component={RegisterScreen} />
          <Route path='/login' component={LoginScreen} />
          <Route path='/search' component={SearchScreen} exact />
          <Route path='/createtrip' component={CreateTripScreen} />
          <Route path='/profile' component={ProfileScreen} />
          <Route path='/editprofile' component={EditProfileScreen} exact />
        </Container>
      </main>
      <Footer />
    </Router>
  );
}

export default App;