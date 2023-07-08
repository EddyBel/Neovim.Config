import { LOGO_DIRECTION, TITLE_WEB, VERSION_CONFIG } from '../web.config';

export function Install() {
  return (
    <main className="pt-8 pb-16 lg:pt-16 lg:pb-24 bg-white dark:bg-gray-900">
      <div className="flex justify-between px-4 mx-auto max-w-screen-xl">
        <article className="mx-auto w-full max-w-2xl format format-sm sm:format-base lg:format-lg format-blue dark:format-invert">
          <header className="mb-4 lg:mb-6 not-format">
            <address className="flex items-center mb-6 not-italic">
              <div className="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white">
                <img className="mr-4 w-16 h-16 rounded-full" src={LOGO_DIRECTION} alt="logo" />
                <div>
                  <a href="#" rel="author" className="text-xl font-bold text-gray-900 dark:text-white">
                    {TITLE_WEB}
                  </a>
                  <p className="text-base font-light text-gray-500 dark:text-gray-400">
                    Configuration of neovim as an IDE
                  </p>
                  <p className="text-base font-light text-gray-500 dark:text-gray-400">{VERSION_CONFIG} Version</p>
                </div>
              </div>
            </address>
            <h1 className="mb-4 text-3xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:text-4xl dark:text-white">
              How to install neovim configuration
            </h1>
          </header>
          <p className="text-sm leading-tight text-gray-900 dark:text-white">
            Once you have the above requirements you can proceed to install the configuration.
          </p>
          <ul className="mb-10 mt-10 ml-8 list-disc text-gray-900 dark:text-white">
            <li className="mb-10">
              <p className="text-sm leading-tight text-gray-900 dark:text-white ">
                The first thing is to have all the code formatters you like such as `Prettier`, `Black`, `Clang-format`,
                etc. installed on your system. You can install them through the mason plugin by running the `:Mason`
                command and searching for the formatter of your choice but I recommend installing them independently.
              </p>
            </li>
            <li>
              <p className="text-sm ">
                Then you can install the configuration using the following command depending on your environment.
              </p>
              <h3 className="mb-4 mt-4 text-xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-2xl dark:text-white">
                Windows
              </h3>
              <pre className="w-full p-5 rounded-xl bg-gray-950 overflow-x-auto mt-5 mb-5 relative">
                <code>
                  git clone --branch main https://github.com/EddyBel/Neovim.Config.git $HOME\AppData\Local\nvim --depth
                  1 && nvim
                </code>
              </pre>
              <h3 className="mb-4 mt-4 text-xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-2xl dark:text-white">
                Linux and Macos
              </h3>
              <pre className="w-full p-5 rounded-xl bg-gray-950 overflow-x-auto mt-5 mb-5 relative">
                <code>
                  git clone --branch main https://github.com/EddyBel/Neovim.Config.git ~/.config/nvim --depth 1 && nvim
                </code>
              </pre>
              <p className="text-sm ">
                This command will clone the latest version of the repository in the configuration path of neovim, once
                cloned, neovim will be opened with the `nvim` command so that lazy proceeds with the installation of all
                plugins.
              </p>
            </li>
          </ul>
          <h2 className="mb-4 mt-4 text-2xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-3xl dark:text-white">
            How to uninstall the configuration
          </h2>
          <p className="text-sm text-gray-900 dark:text-white">
            You can remove the configuration by deleting the configuration folder (where the `init.lua` file is located)
            and the folder that stores the plugins and their respective plugin manager data (the neovim data folder),
            for this you can use the following command:
          </p>
          <h3 className="mb-4 mt-4 text-xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-2xl dark:text-white">
            Windows cmd
          </h3>
          <pre className="w-full p-5 rounded-xl bg-gray-950 overflow-x-auto mt-5 mb-5 relative">
            <code className="text-gray-900 dark:text-white">
              rmdir /s $HOME\AppData\Local\nvim\ $HOME\AppData\Local\nvim-data\
            </code>
          </pre>
          <h3 className="mb-4 mt-4 text-xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-2xl dark:text-white">
            Windows powershell
          </h3>
          <pre className="w-full p-5 rounded-xl bg-gray-950 overflow-x-auto mt-5 mb-5 relative">
            <code className="text-gray-900 dark:text-white">
              Remove-Item -Recurse -Force $HOME\AppData\Local\nvim\, $HOME\AppData\Local\nvim-data\
            </code>
          </pre>
          <h3 className="mb-4 mt-4 text-xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-2xl dark:text-white">
            Linux and Macos
          </h3>
          <pre className="w-full p-5 rounded-xl bg-gray-950 overflow-x-auto mt-5 mb-5 relative">
            <code className="text-gray-900 dark:text-white">rm -rf ~/.config/nvim ~/.local/share/nvim/</code>
          </pre>
        </article>
      </div>
    </main>
  );
}
