import { useState, useEffect } from 'react';
import keymaps from '../data/keymaps';

export function KeyBoards() {
  const [keys, setKeys] = useState<any>([]);

  const searchItems = (event: any) => {
    const value: string = event.target.value.toLowerCase();
    const newKeys: any[] = [];

    if (value !== null && value !== '') {
      keymaps.map((key: any) => {
        const keyboard: string = key.key.toLowerCase();
        const command: string = key.command.toLowerCase();
        const mode: string = key.mode.toLowerCase();

        if (keyboard.includes(value) && !newKeys.includes(key)) newKeys.push(key);
        if (command.includes(value) && !newKeys.includes(key)) newKeys.push(key);
        if (mode.includes(value) && !newKeys.includes(key)) newKeys.push(key);
      });

      setKeys(newKeys);
    } else {
      setKeys(keymaps);
    }
  };

  useEffect(() => {
    setKeys(keymaps);
  }, []);

  return (
    <section className="bg-gray-50 dark:bg-gray-900 p-3 sm:p-5 mb-10 min-h-screen">
      <h1 className="mb-4 text-3xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:text-4xl dark:text-white text-center">
        Keyboard shortcuts
      </h1>
      <p className="w-full text-sm font-mono text-gray-500 mt-10 mb-10 text-center">
        This neovim configuration tries as much as possible to use shortcuts common in other code editors, trying to be
        as close as possible to other editors like VSCode but with the accessibility of neovim.
      </p>

      <div className="mx-auto max-w-screen-xl px-4 lg:px-12">
        {/* Start coding here */}
        <div className="bg-white dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
          <div className="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0 md:space-x-4 p-4">
            <div className="w-full">
              <form className="flex items-center">
                <label htmlFor="simple-search" className="sr-only">
                  Search by command, mode or command
                </label>
                <div className="relative w-full">
                  <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg
                      aria-hidden="true"
                      className="w-5 h-5 text-gray-500 dark:text-gray-400"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        fillRule="evenodd"
                        d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                        clipRule="evenodd"
                      />
                    </svg>
                  </div>
                  <input
                    type="text"
                    id="simple-search"
                    onChange={searchItems}
                    className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                    placeholder="Search by keymap, mode or command"
                    required
                  />
                </div>
              </form>
            </div>
          </div>
          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
              <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                  <th scope="col" className="px-4 py-3">
                    Key
                  </th>
                  <th scope="col" className="px-4 py-3">
                    Mode
                  </th>
                  <th scope="col" className="px-4 py-3">
                    Command
                  </th>
                  <th scope="col" className="px-4 py-3">
                    Function
                  </th>
                </tr>
              </thead>
              <tbody>
                {keys.map((key: any) => (
                  <tr
                    className="border-b dark:border-gray-700"
                    key={`keyboard-${key.key} - ${key.command} - ${Math.random()}`}
                  >
                    <th scope="row" className="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                      {key.key}
                    </th>
                    <td className="px-4 py-3">{key.mode}</td>
                    <td className="px-4 py-3">{key.command}</td>
                    <td className="px-4 py-3">{key.function}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
  );
}
