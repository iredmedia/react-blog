# DocPad Configuration
docpadConfig = {

    # =================================
    # Paths Configuration

    # Reload Paths
    # An array of special paths that when changes occur in, we reload our configuration
    reloadPaths: []  # default

    # Regenerate Paths
    # An array of special paths that when changes occur in, we regenerate our website
    regeneratePaths: []  # default

    # Regenerate Delay
    # The time (in milliseconds) to wait after a source file has
    # changed before using it to regenerate. Updating over the
    # network (e.g. via FTP) can cause a page to be partially
    # rendered as the page is regenerated *before* the source file
    # has completed updating: in this case increase this value.
    regenerateDelay: 100    # default

    # Ignore Paths
    # Can be set to an array of absolute paths that we should ignore from the scanning process
    ignorePaths: []  # default

    # =================================
    # Server Configuration

    # Port
    # Use to change the port that DocPad listens to
    # By default we will detect the appropriate port number for our environment
    # if no environment port number is detected we will use 9778 as the port number
    # Checked environment variables are:
    # - PORT - Heroku, Nodejitsu, Custom
    # - VCAP_APP_PORT - AppFog
    # - VMC_APP_PORT - CloudFoundry
    port: null  # default

    # Max Age
    # The default caching time limit that is sent with the response to the client
    # Can be set to `false` to disable caching
    maxAge: 86400000   # default

    # Server Express
    # The express.js instance that we want DocPad to use
    # If not set, we will create our own
    serverExpress: null  # default

    # Server HTTP
    # The node.js HTTP server instance that we want DocPad to use
    # If not set, we will create our own
    serverHttp: null  # default


    # =================================
    # Middleware Configuration
    # Which middlewares would you like us to activate
    # Setting `extendServer` to `false` will set all of these to `false` automatically

    # Extend Server
    # Whether or not we should extend the server with our custom middleware
    extendServer: true  # default

    # The standard middlewares (bodeParser, methodOverride, express router)
    middlewareStandard: true  # default

    # The standard bodyParser middleware
    middlewareBodyParser: true  # default

    # The standard methodOverride middleware
    middlewareMethodOverride: true  # default

    # The standard express router middleware
    middlewareExpressRouter: true  # default

    # Our own 404 middleware
    middleware404: true  # default

    # Our own 500 middleware
    middleware500: true  # default


    # =================================
    # Logging Configuration

    # Log Level
    # Up to which level of logging should we output
    logLevel: (if ('-d' in process.argv) then 7 else 6)  # default

    # Logger
    #  The caterpillar instance that we want to use
    # If not set, we will create our own
    logger: null  # default

    # Growl
    # Whether or not we should display system notifications as things progress within DocPad
    growl: true  # default

    # Catch Exceptions
    # Whether or not DocPad should catch uncaught exceptions
    catchExceptions: true  # default

    # Report Errors
    # Whether or not we should report errors back to the DocPad Team
    reportErrors: process.argv.join('').indexOf('test') is -1  # default (don't enable if we are running inside a test)

    # Report Statistics
    # Whether or not we should report statistics back to the DocPad Team
    reportStatistics: process.argv.join('').indexOf('test') is -1  # default (don't enable if we are running inside a test)

    # Airbrake Token
    # The airbrake token we should use for reporting errors
    # By default, uses the DocPad Team's token
    airbrakeToken: null  # default

    # MixPanel Token
    # The mixpanel token we should use for reporting statistics
    # By default, uses the DocPad Team's token
    mixpanelToken: null  # default


    # =================================
    # Other Configuration

    # Detect Encoding
    # Should we attempt to auto detect the encoding of our files?
    # Useful when you are using foreign encoding (e.g. GBK) for your files
    # Only works on unix systems currently (limit of iconv module)
    detectEncoding: false

    # Render Single Extensions
    # Whether or not we should render single extensions by default
    renderSingleExtensions: false  # default

    # Render Passes
    # How many times should we render documents that reference other documents?
    renderPasses: 1  # default

    # Check Version
    # Whether or not to check for newer versions of DocPad
    checkVersion: false  # default

    # Welcome
    # Whether or not we should display any custom welcome callbacks
    welcome: false  # default

    # Prompts
    # Whether or not we should display any prompts
    prompts: false  # default

    # Helper Url
    # Used for subscribing to newsletter, account information, and statistics etc
    helperUrl: 'https://docpad.org/helper/'  # default

    # Safe Mode
    # If enabled, we will try our best to sandbox our template rendering so that they cannot modify things outside of them
    # Not yet implemented
    safeMode: false  # default

    # Collections
    # A hash of functions that create collections
    collections: {
        posts: ->
                @getCollection("html").findAllLive({ relativeOutDirPath:'posts' }).setComparator((a, b) -> b.get('date').getTime() - a.get('date').getTime())
    }

    # Regenerate Every
    # Performs a regenerate every x milliseconds, useful for always having the latest data
    regenerateEvery: false  # default


    # =================================
    # Template Configuration

    # Template Data
    # Use to define your own template data and helpers that will be accessible to your templates
    # Complete listing of default values can be found here: http://docpad.org/docs/template-data
    templateData:  # example

        # Specify some site properties
        site:
            # The production url of our website
            url: "http://website.com"

            # The default title of our website
            title: "Your Website"

            # The website description (for SEO)
            description: """
                When your website appears in search results in say Google, the text here will be shown underneath your website's title.
                """

            # The website keywords (for SEO) separated by commas
            keywords: """
                place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
                """


        # -----------------------------
        # Helper Functions

        # Get the prepared site/document title
        # Often we would like to specify particular formatting to our page's title
        # we can apply that formatting here
        getPreparedTitle: ->
            # if we have a document title, then we should use that and suffix the site's title onto it
            if @document.title
                "#{@document.title} | #{@site.title}"
            # if our document does not have it's own title, then we should just use the site's title
            else
                @site.title

        # Get the prepared site/document description
        getPreparedDescription: ->
            # if we have a document description, then we should use that, otherwise use the site's description
            @document.description or @site.description

        # Get the prepared site/document keywords
        getPreparedKeywords: ->
            # Merge the document keywords with the site keywords
            @site.keywords.concat(@document.keywords or []).join(', ')


    # =================================
    # Plugin Configuration

    # Skip Unsupported Plugins
    # Set to `false` to load all plugins whether or not they are compatible with our DocPad version or not
    skipUnsupportedPlugins: true  # default

    # Enable Unlisted Plugins
    # Set to false to only enable plugins that have been explicity set to `true` inside `enabledPlugins`
    enabledUnlistedPlugins: true  # default

    # Enabled Plugins
    enabledPlugins:  # example
        # Disable the Pokemon Plugin
        pokemon: false

        # Enable the Digimon Plugin
        # Unless, enableUnlistedPlugins is set to false, all plugins are enabled by default
        digimon: true

    # Configure Plugins
    # Should contain the plugin short names on the left, and the configuration to pass the plugin on the right
    plugins:  # example
        # Disable NIB within the Stylus Plugin
        stylus:
            useNib: false


    # =================================
    # Event Configuration

    # Events
    # Allows us to bind listeners to the events that DocPad emits
    # Complete event listing can be found here: http://docpad.org/docs/events
    events:  # example

        # Server Extend
        # Used to add our own custom routes to the server before the docpad routes are added
        serverExtend: (opts) ->
            # Extract the server from the options
            {server} = opts
            docpad = @docpad


    # =================================
    # Environment Configuration

    # Locale Code
    # The code we shall use for our locale (e.g. `en`, `fr`, etc)
    # If not set, we will attempt to detect the system's locale, if the locale can't be detected or if our locale file is not found for it, we will revert to `en`
    localeCode: null  # default

    # Environment
    # Which environment we should load up
    # If not set, we will default the `NODE_ENV` environment variable, if that isn't set, we will default to `development`
    env: null  # default

    # Environments
    # Allows us to set custom configuration for specific environments
    environments:  # default
        development:  # default
            # Always refresh from server
            maxAge: false  # default

            # Only do these if we are running standalone via the `docpad` executable
            checkVersion: process.argv.length >= 2 and /docpad$/.test(process.argv[1])  # default
            welcome: process.argv.length >= 2 and /docpad$/.test(process.argv[1])  # default
            prompts: process.argv.length >= 2 and /docpad$/.test(process.argv[1])  # default

            # Listen to port 9005 on the development environment
            port: 9005  # example
}

# Export the DocPad Configuration
module.exports = docpadConfig
