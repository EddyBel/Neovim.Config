import { useState } from 'react';
import { Link } from 'react-router-dom';
import { NavBar } from './navbar';
import { NAVIGATION_PRIMARY, NAVIGATION_SECONDARY } from '../web.config';

type PropsNavigation = {
  children?: any;
};

export function Navigation(props: PropsNavigation) {
  const [watchNavigation, setWachNavigation] = useState<boolean>(false);

  const toogleViewNavigation = () => setWachNavigation(!watchNavigation);

  return (
    <div className="antialiased bg-gray-50 dark:bg-gray-900">
      <NavBar key="navbar-example" onClick={toogleViewNavigation} />
      {/* Sidebar */}
      <aside
        className={`fixed top-0 left-0 z-40 w-64 h-screen pt-14 transition-transform ${
          watchNavigation ? 'translate-x-0' : '-translate-x-full'
        } bg-white border-r border-gray-200 md:translate-x-0 dark:bg-gray-800 dark:border-gray-700`}
        aria-label="Sidenav"
        id="drawer-navigation"
      >
        <div className="overflow-y-auto py-5 px-3 h-full bg-white dark:bg-gray-800">
          <form action="#" method="GET" className="md:hidden mb-2">
            <label htmlFor="sidebar-search" className="sr-only">
              Search
            </label>
            <div className="relative">
              <div className="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                <svg
                  className="w-5 h-5 text-gray-500 dark:text-gray-400"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    fillRule="evenodd"
                    clipRule="evenodd"
                    d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                  />
                </svg>
              </div>
              <input
                type="text"
                name="search"
                id="sidebar-search"
                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="Search"
              />
            </div>
          </form>
          <ul className="space-y-2">
            {NAVIGATION_PRIMARY.map((option) => (
              <li key={`option-primary ${option.name}`}>
                <Link
                  to={option.direction}
                  className="flex items-center p-2 text-base font-medium text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group"
                >
                  {option.icon}
                  <span className="ml-3">{option.name}</span>
                </Link>
              </li>
            ))}
          </ul>
        </div>
      </aside>
      <main className="p-4 md:ml-64 h-auto pt-20">{props.children}</main>
    </div>
  );
}

// <ul className="pt-5 mt-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
//           {NAVIGATION_SECONDARY.map((option) => (
//             <li>
//               <Link
//                 to={option.direction}
//                 className="flex items-center p-2 text-base font-medium text-gray-900 rounded-lg transition duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group"
//                 key={`option-secondary ${option.name}`}
//               >
//                 {option.icon}
//                 <span className="ml-3">{option.name}</span>
//               </Link>
//             </li>
//           ))}
//         </ul>
