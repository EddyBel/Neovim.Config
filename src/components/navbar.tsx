import { FaGithub } from 'react-icons/fa';
import { HiMenuAlt2 } from 'react-icons/hi';
import { ImLinkedin2 } from 'react-icons/im';
import { TITLE_WEB, WEB_FRONT, LOGO_DIRECTION } from '../web.config';

export function NavBar(props: any) {
  return (
    <nav className="bg-white border-b border-gray-200 px-4 py-2.5 dark:bg-gray-800 dark:border-gray-700 fixed left-0 right-0 top-0 z-50">
      <div className="flex flex-wrap justify-between items-center">
        <div className="flex justify-start items-center">
          <button
            data-drawer-target="drawer-navigation"
            data-drawer-toggle="drawer-navigation"
            aria-controls="drawer-navigation"
            onClick={props.onClick}
            className="p-2 mr-2 text-gray-600 rounded-lg cursor-pointer md:hidden hover:text-gray-900 hover:bg-gray-100 focus:bg-gray-100 dark:focus:bg-gray-700 focus:ring-2 focus:ring-gray-100 dark:focus:ring-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
            <HiMenuAlt2 className="w-6 h-6" />
          </button>
          <a href="https://flowbite.com" className="flex items-center justify-between mr-4">
            <img src={LOGO_DIRECTION} className="mr-3 h-8 rounded-full" alt="Flowbite Logo" />
            <span className="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">{TITLE_WEB}</span>
          </a>
        </div>
        <div className="flex items-center lg:order-2">
          {/* Github Button */}
          <a
            type="button"
            href="https://github.com/EddyBel"
            data-dropdown-toggle="notification-dropdown"
            className="p-2 mr-1 text-gray-500 rounded-lg hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-700 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600"
          >
            <FaGithub className="w-6 h-6" />
          </a>
          {/* Linkedin Button */}
          <a
            type="button"
            href="https://www.linkedin.com/in/eduardo-rangel-eddybel/"
            data-dropdown-toggle="apps-dropdown"
            className="p-2 text-gray-500 rounded-lg hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-700 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600"
          >
            <ImLinkedin2 className="w-6 h-6" />
          </a>
          <div
            className="flex mx-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600"
            id="user-menu-button"
            aria-expanded="false"
            data-dropdown-toggle="dropdown"
          >
            <span className="sr-only">Open user menu</span>
            <img className="w-8 h-8 rounded-full" src={WEB_FRONT} alt="user photo" />
          </div>
        </div>
      </div>
    </nav>
  );
}
