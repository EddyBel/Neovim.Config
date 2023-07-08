import { Navigation, FooterSimple } from './components/index';
import { Views } from './routes/routes';

function App() {
  return (
    <Navigation>
      <Views />
      <FooterSimple />
    </Navigation>
  );
}

export default App;
