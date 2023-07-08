import { TITLE_WEB, LOGO_DIRECTION, VERSION_CONFIG } from '../web.config';

const LSP_CLIENTS = {
  javascript: ['tsserver'],
  typescript: ['tsserver'],
  'javascript react': ['tsserver'],
  'typescript react': ['tsserver'],
  python: ['pyright'],
  json: ['jsonls'],
  css: ['cssls'],
  sass: ['cssls'],
  scss: ['cssls'],
  less: ['cssls'],
  html: ['html', 'emmet_ls'],
  go: ['gopls'],
  rust: ['rust_analyzer'],
  bash: ['bashls'],
  vimscript: ['vimls'],
  lua: ['lua_ls'],
  java: ['jdtls'],
  C: ['clangd'],
  'C++': ['clangd'],
  'objective C': ['clangd'],
  'C#': ['csharp_ls'],
  dockerfile: ['dockerls'],
  'docker-Compose': ['docker_compose_language_service'],
  sql: ['sqlls'],
  mysql: ['sqlls'],
  markdown: ['marksman'],
  assembly: ['asm_lsp'],
  arduino: ['arduino_language_server'],
};

const LSP = Object.entries(LSP_CLIENTS);

export function Index() {
  return (
    <div>
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
                Complete configuration for working with neovim
              </h1>
            </header>
            <p className="text-sm text-gray-900 dark:text-white">
              This repository contains my custom configuration for Neovim, an advanced text editor that can be turned
              into a powerful integrated development environment (IDE). With my configuration, Neovim becomes a
              virtually full-featured IDE, supporting multiple programming languages and offering a smooth and agile
              user experience thanks to the use of the Lazy{' '}
              <a href="https://github.com/folke/lazy.nvim" className="text-blue-400">
                https://github.com/folke/lazy.nvim
              </a>{' '}
              plugin manager. You'll find everything you need to start working with Neovim right away, from installing
              plugins to customizing keyboard shortcuts and display options - enjoy the productivity Neovim has to
              offer!.
            </p>
            <img className="rounded-xl mt-14 mb-14" src="/preview.png" />
            <p className="text-sm text-gray-900 dark:text-white">
              This repository was created to share my custom configuration of Neovim, an advanced text editor that I
              have used for a long time for my daily programming work. I have spent many hours customizing and refining
              my configuration to make Neovim perfectly suited to my needs, and I think other programmers could benefit
              from it.
            </p>
            <h2 className="mb-4 mt-4 text-2xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-3xl dark:text-white">
              Configuration requirements
            </h2>
            <ul className="text-sm leading-tight text-gray-900 dark:text-white font-mono list-disc ml-10">
              <li>{'Neovim >= 0.5.0'}</li>
              <li>NerdFont (Recommended source: FiraCode Nerd Font)</li>
              <li>NodeJS</li>
              <li>Python</li>
              <li>Compiler C++</li>
            </ul>
            <h2 className="mb-4 mt-4 text-2xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-3xl dark:text-white">
              Supported languages
            </h2>
            <Table />
            <h2 className="mb-4 mt-4 text-2xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:mt-6 lg:text-3xl dark:text-white">
              Licence
            </h2>
            <p className="text-sm text-gray-900 dark:text-white">
              This project is released under the terms of the MIT license. The MIT license allows users to use, copy,
              modify and distribute the source code of the project with certain restrictions and requirements. For more
              information on the terms and conditions of the MIT license, please refer to the license file included with
              this project or visit https://opensource.org/licenses/MIT.
            </p>
          </article>
        </div>
      </main>
    </div>
  );
}

function Table() {
  return (
    <div className="overflow-x-auto mb-10 mt-10">
      <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" className="px-4 py-3">
              Supported languages
            </th>
            <th scope="col" className="px-4 py-3 text-center">
              Language server
            </th>
          </tr>
        </thead>
        <tbody>
          {LSP.map(([key, value]) => (
            <tr className="border-b dark:border-gray-700" key={`key-value ${key} - ${value} - ${Math.random()}`}>
              <th scope="row" className="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                {key}
              </th>
              <td className="px-4 py-3 text-center">{value}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
