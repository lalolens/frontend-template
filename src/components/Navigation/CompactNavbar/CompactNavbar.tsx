import "./CompactNavbar.css";
import { Link } from "react-router-dom";

import navData from "../../../data/navbar.json";

function CompactNavbar() {
  return (
    <div className="navbar">
      <nav>
        <ul>
          {navData.map((item) => (
            <li key={item.name}>
              <Link to={item.url}>{item.name}</Link>
            </li>
          ))}
        </ul>
      </nav>
    </div>
  );
}

export default CompactNavbar;
