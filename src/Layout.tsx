import { Outlet } from "react-router-dom";

import WideNavbar from "./components/Navigation/WideNavbar/WideNavbar";
import Footer from "./components/Footer/Footer";

function Layout() {
  return (
    <div>
      <header>
        <WideNavbar />
      </header>
      <main>
        <Outlet />
      </main>
      <footer>
        <Footer />
      </footer>
    </div>
  );
}

export default Layout;
