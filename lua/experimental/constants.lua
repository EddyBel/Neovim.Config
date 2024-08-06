M.COMMANDS = {
    ["go"] = {
        {
            command = "go",
            command_compile = "go build -o output filename.go",
            command_run = "./output"
        }
    },
    ["rust"] = {
        {
            command = "rustc",
            command_compile = "rustc filename.rs -o output",
            command_run = "./output"
        },
        {
            command = "cargo",
            command_compile = "cargo build",
            command_run = "cargo run"
        }
    },
    ["java"] = {
        {
            command = "javac",
            command_compile = "javac filename.java",
            command_run = "java filename" -- Nota: sin extensión .class
        },
        {
            command = "java",
            command_compile = nil,
            command_run = "java filename" -- Nota: sin extensión .class
        }
    },
    ["php"] = {
        {
            command = "php",
            command_compile = nil,
            command_run = "php filename.php"
        }
    },
    ["c++"] = {
        {
            command = "gcc",
            command_compile = "gcc -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "g++",
            command_compile = "g++ -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "clang++",
            command_compile = "clang++ -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "icc",
            command_compile = "icc -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "xlc++",
            command_compile = "xlc++ -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "c++",
            command_compile = "c++ -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "dpcpp",
            command_compile = "dpcpp -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "tce++",
            command_compile = "tce++ -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "aCC",
            command_compile = "aCC -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "pathscale",
            command_compile = "pathscale -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "pgiCC",
            command_compile = "pgiCC -o output filename.cpp",
            command_run = "./output"
        },
        {
            command = "sunCC",
            command_compile = "sunCC -o output filename.cpp",
            command_run = "./output"
        }
    },
    ["python"] = {
        {
            command = "python",
            command_compile = nil,
            command_run = "python filename.py"
        },
        {
            command = "python3",
            command_compile = nil,
            command_run = "python3 filename.py"
        },
        {
            command = "python3.8",
            command_compile = nil,
            command_run = "python3.8 filename.py"
        },
        {
            command = "python3.9",
            command_compile = nil,
            command_run = "python3.9 filename.py"
        },
        {
            command = "python3.10",
            command_compile = nil,
            command_run = "python3.10 filename.py"
        },
        {
            command = "python3.11",
            command_compile = nil,
            command_run = "python3.11 filename.py"
        },
        {
            command = "python3.12",
            command_compile = nil,
            command_run = "python3.12 filename.py"
        },
        {
            command = "py",
            command_compile = nil,
            command_run = "py filename.py"
        },
        {
            command = "pypy",
            command_compile = nil,
            command_run = "pypy filename.py"
        },
        {
            command = "jython",
            command_compile = nil,
            command_run = "jython filename.py"
        },
        {
            command = "ironpython",
            command_compile = nil,
            command_run = "ironpython filename.py"
        },
        {
            command = "stackless",
            command_compile = nil,
            command_run = "stackless filename.py"
        }
    },
    ["javascript"] = {
        {
            command = "node",
            command_compile = nil,
            command_run = "node filename.js"
        },
        {
            command = "nodejs",
            command_compile = nil,
            command_run = "nodejs filename.js"
        },
        {
            command = "deno",
            command_compile = nil,
            command_run = "deno run filename.js"
        },
        {
            command = "jjs",
            command_compile = nil,
            command_run = "jjs filename.js"
        },
        {
            command = "rhino",
            command_compile = nil,
            command_run = "rhino filename.js"
        },
        {
            command = "smjs",
            command_compile = nil,
            command_run = "smjs filename.js"
        },
        {
            command = "spidermonkey",
            command_compile = nil,
            command_run = "spidermonkey filename.js"
        }
    }
}
