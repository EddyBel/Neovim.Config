import { HiHome } from 'react-icons/hi';
import { MdOutlineInstallDesktop } from 'react-icons/md';
import { FaKeyboard, FaServer } from 'react-icons/fa';
import { PiNutFill, PiGithubLogoFill } from 'react-icons/pi';
import { BsFillBoxFill } from 'react-icons/bs';
import { RiCalendarTodoFill } from 'react-icons/ri';

export const TITLE_WEB = 'Neovim.Config';

export const WEB_FRONT = 'https://avatars.githubusercontent.com/u/111319309?v=4';

export const LOGO_DIRECTION = '/logo.jpeg';

export const VERSION_CONFIG = 4.5;

export const NAVIGATION_PRIMARY = [
  {
    name: 'Home',
    direction: '/',
    icon: (
      <HiHome className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
  {
    name: 'Install',
    direction: '/installation',
    icon: (
      <MdOutlineInstallDesktop className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
  {
    name: 'Keymaps',
    direction: '/keyboard-shortcuts',
    icon: (
      <FaKeyboard className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
  {
    name: 'Configurations',
    direction: '/configuration',
    icon: (
      <PiNutFill className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
  {
    name: 'Plugins',
    direction: '/plugins',
    icon: (
      <BsFillBoxFill className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
];

export const NAVIGATION_SECONDARY = [
  {
    name: 'Features',
    direction: 'https://github.com/EddyBel/Neovim.Config',
    icon: (
      <FaServer className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },

  {
    name: 'Repository',
    direction: 'https://github.com/EddyBel/Neovim.Config',
    icon: (
      <PiGithubLogoFill className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
  {
    name: 'Future improvements',
    direction: 'https://github.com/EddyBel/Neovim.Config',
    icon: (
      <RiCalendarTodoFill className="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
    ),
  },
];
