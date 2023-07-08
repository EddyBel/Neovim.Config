import { LOGO_DIRECTION, TITLE_WEB, VERSION_CONFIG } from '../web.config';
import { plugins } from '../data/plugins';

export function Plugins() {
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
              List of configuration plugins
            </h1>
            <p className="w-full text-sm font-mono text-gray-500 mt-10 mb-10">
              This is the list of plugins used by the editor, these plugins improve compatibility with languages and
              enhance the development experience.
            </p>
          </header>

          <ul className="list-disc text-gray-800 dark:text-gray-400">
            {plugins.map((plugin) => (
              <li className="mb-5 ml-10" key={`plugin ${plugin.plugin} ${Math.random()}`}>
                <h3 className="text-2xl text-white uppercase mb-2">{plugin.plugin}</h3>
                <p className="text-sm">{plugin.description}</p>
              </li>
            ))}
          </ul>
        </article>
      </div>
    </main>
  );
}
