import { globals_variables } from '../data/configuration';

export function Configuration() {
  return (
    <section className="bg-gray-50 dark:bg-gray-900 p-3 sm:p-5 mb-10 min-h-screen">
      <h1 className="mb-4 text-3xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:text-4xl dark:text-white text-center">
        Editor quick settings
      </h1>
      <p className="w-full text-sm font-mono text-gray-500 mt-10 mb-10 text-center">
        The editor has some settings that can be useful and quick to configure, these are found in the globals.lua
        (./lua/globals.lua) file, and are global variables that are used throughout the deeper configuration of the
        plugins.
      </p>

      <div className="mx-auto max-w-screen-xl px-4 lg:px-12">
        {/* Start coding here */}
        <div className="bg-white dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
              <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                  <th scope="col" className="px-4 py-3">
                    Variable
                  </th>
                  <th scope="col" className="px-4 py-3">
                    Type
                  </th>
                  <th scope="col" className="px-4 py-3">
                    Function
                  </th>
                </tr>
              </thead>
              <tbody>
                {globals_variables.map((variable: any) => (
                  <tr
                    className="border-b dark:border-gray-700"
                    key={`configuration ${variable.variable} - ${Math.random()}`}
                  >
                    <th scope="row" className="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                      {variable.variable}
                    </th>
                    <td className="px-4 py-3">{variable.type}</td>
                    <td className="px-4 py-3">{variable.function}</td>
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
