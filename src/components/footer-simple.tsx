import {
  PiGithubLogoDuotone,
  PiGitlabLogoSimpleDuotone,
  PiTwitterLogoDuotone,
  PiLinkedinLogoDuotone,
} from 'react-icons/pi';

export function FooterSimple() {
  return (
    <footer className="bg-white rounded-lg shadow sm:flex sm:items-center sm:justify-between p-4 sm:p-6 xl:p-8 dark:bg-gray-800">
      <p className="mb-4 text-sm text-center text-gray-500 dark:text-gray-400 sm:mb-0">
        {`© 2019-${new Date().getFullYear()}. All rights reserved.`}
      </p>
      <div className="flex justify-center items-center space-x-1">
        <a
          href="https://twitter.com/EddyDigitalTech"
          data-tooltip-target="tooltip-facebook"
          className="inline-flex justify-center p-2 text-gray-500 rounded-lg cursor-pointer dark:text-gray-400 dark:hover:text-white hover:text-gray-900 hover:bg-gray-100 dark:hover:bg-gray-600"
        >
          <PiTwitterLogoDuotone className="w-5 h-5" />
          <span className="sr-only">Facebook</span>
        </a>
        <a
          href="https://gitlab.com/EddyBel"
          data-tooltip-target="tooltip-twitter"
          className="inline-flex justify-center p-2 text-gray-500 rounded-lg cursor-pointer dark:text-gray-400 dark:hover:text-white hover:text-gray-900 hover:bg-gray-100 dark:hover:bg-gray-600"
        >
          <PiGitlabLogoSimpleDuotone className="w-5 h-5" /> <span className="sr-only">Twitter</span>
        </a>
        <a
          href="https://github.com/EddyBel"
          data-tooltip-target="tooltip-github"
          className="inline-flex justify-center p-2 text-gray-500 rounded-lg cursor-pointer dark:text-gray-400 dark:hover:text-white hover:text-gray-900 hover:bg-gray-100 dark:hover:bg-gray-600"
        >
          <PiGithubLogoDuotone className="w-5 h-5" />
          <span className="sr-only">Github</span>
        </a>
        <a
          href="https://www.linkedin.com/in/eduardo-rangel-eddybel/"
          data-tooltip-target="tooltip-dribbble"
          className="inline-flex justify-center p-2 text-gray-500 rounded-lg cursor-pointer dark:text-gray-400 dark:hover:text-white hover:text-gray-900 hover:bg-gray-100 dark:hover:bg-gray-600"
        >
          <PiLinkedinLogoDuotone className="w-5 h-5" />
          <span className="sr-only">Linkedin</span>
        </a>
      </div>
    </footer>
  );
}
