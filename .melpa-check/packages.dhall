let Schema = ./schema.dhall

let Package = Schema.Package

let TestDriver = Schema.TestDriver

in  [ Package::{
      , pname = "lsp-dart"
      , version = "1.11.8"
      , emacsVersion = "25.2"
      , files =
        [ "lsp-dart.el"
        , "lsp-dart-closing-labels.el"
        , "lsp-dart-code-lens.el"
        , "lsp-dart-dap.el"
        , "lsp-dart-devtools.el"
        , "lsp-dart-flutter-colors.el"
        , "lsp-dart-flutter-daemon.el"
        , "lsp-dart-flutter-fringe.el"
        , "lsp-dart-flutter-widget-guide.el"
        , "lsp-dart-outline.el"
        , "lsp-dart-test-support.el"
        , "lsp-dart-utils.el"
        ]
      , dependencies =
        [ "lsp-treemacs"
        , "lsp-mode"
        , "dap-mode"
        , "ht"
        , "f"
        , "dash"
        , "pkg-info"
        , "dart-mode"
        ]
      , testDrivers = [ TestDriver.ert ]
      , testDependencies = [ "el-mock" ]
      , testExcludes = [ "**/test-helper?(s).el" ]
      , mainFile = Some "lsp-dart.el"
      , recipe =
          ''
          (lsp-dart :fetcher github :repo "akirak/lsp-dart")
          ''
      }
    ]
