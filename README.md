# knife

The knife CLI for Chef Infra.

## Maintainers

Davin Taddeo (davin@chef.io) maintains this habitat repo, but is not a maintainer of the knife gem or source code

## Type of Package

This is a binary package for the knife binary

A binary package is something that packages up a standalone binary, something that does not need to run under the Habitat supervisor (i.e. core/dep). They are often used as dependencies of other packages. Binary packages do not have a run file and do not need to define pkg_svc_run in the plan.sh file.

## Usage

Use this package where you would like to utilize the knife command line tool but might not want all of chef-workstation

```null
Usage: knife sub-command (options)
    -s, --server-url URL             Chef Infra Server URL.
        --chef-zero-host HOST        Host to start Chef Infra Zero on.
        --chef-zero-port PORT        Port (or port range) to start Chef Infra Zero on. Port ranges like 1000,1010 or 8889-9999 will try all given ports until one works.
    -k, --key KEY                    Chef Infra Server API client key.
        --[no-]color                 Use colored output, defaults to enabled.
    -c, --config CONFIG              The configuration file to use.
        --config-option OPTION=VALUE Override a single configuration option.
        --defaults                   Accept default values for all questions.
    -d, --disable-editing            Do not open EDITOR, just accept the data as is.
    -e, --editor EDITOR              Set the editor to use for interactive commands.
    -E, --environment ENVIRONMENT    Set the Chef Infra Client environment (except for in searches, where this will be flagrantly ignored).
        --[no-]fips                  Enable FIPS mode.
    -F, --format FORMAT              Which format to use for output. (valid options: 'summary', 'text', 'json', 'yaml', or 'pp')
        --[no-]listen                Whether a local mode (-z) server binds to a port.
    -z, --local-mode                 Point knife commands at local repository instead of Chef Infra Server.
    -u, --user USER                  Chef Infra Server API client username.
        --print-after                Show the data after a destructive operation.
        --profile PROFILE            The credentials profile to select.
    -V, --verbose                    More verbose output. Use twice (-VV) for additional verbosity and three times (-VVV) for maximum verbosity.
    -v, --version                    Show Chef Infra Client version.
    -y, --yes                        Say yes to all prompts for confirmation.
    -h, --help                       Show this help message.

Available subcommands: (for details, knife SUB-COMMAND --help)

** CHEF ORGANIZATION MANAGEMENT COMMANDS **
knife org create ORG_SHORT_NAME ORG_FULL_NAME (options)
knife org delete ORG_NAME
knife org edit ORG
knife org list
knife org show ORGNAME
knife org user add ORG_NAME USER_NAME
knife org user remove ORG_NAME USER_NAME

** ACL COMMANDS **
knife acl add MEMBER_TYPE MEMBER_NAME OBJECT_TYPE OBJECT_NAME PERMS
knife acl bulk add MEMBER_TYPE MEMBER_NAME OBJECT_TYPE REGEX PERMS
knife acl bulk remove MEMBER_TYPE MEMBER_NAME OBJECT_TYPE REGEX PERMS
knife acl remove MEMBER_TYPE MEMBER_NAME OBJECT_TYPE OBJECT_NAME PERMS
knife acl show OBJECT_TYPE OBJECT_NAME

** BOOTSTRAP COMMANDS **
knife bootstrap [PROTOCOL://][USER@]FQDN (options)

** CLIENT COMMANDS **
knife client bulk delete REGEX (options)
knife client create CLIENTNAME (options)
knife client delete [CLIENT [CLIENT]] (options)
knife client edit CLIENT (options)
knife client key create CLIENT (options)
knife client key delete CLIENT KEYNAME (options)
knife client key edit CLIENT KEYNAME (options)
knife client key list CLIENT (options)
knife client key show CLIENT KEYNAME (options)
knife client list (options)
knife client reregister CLIENT (options)
knife client show CLIENT (options)

** CONFIG COMMANDS **
knife config list (options)
knife config show [OPTION...] (options)
Displays the value of Chef::Config[OPTION] (or all config values)
knife config use [PROFILE]

** CONFIGURE COMMANDS **
knife configure (options)
knife configure client DIRECTORY

** COOKBOOK COMMANDS **
knife cookbook bulk delete REGEX (options)
knife cookbook delete COOKBOOK VERSION (options)
knife cookbook download COOKBOOK [VERSION] (options)
knife cookbook list (options)
knife cookbook metadata COOKBOOK (options)
knife cookbook metadata from file FILE (options)
knife cookbook show COOKBOOK [VERSION] [PART] [FILENAME] (options)
knife cookbook upload [COOKBOOKS...] (options)

** DATA BAG COMMANDS **
knife data bag create BAG [ITEM] (options)
knife data bag delete BAG [ITEM] (options)
knife data bag edit BAG ITEM (options)
knife data bag from file BAG FILE|FOLDER [FILE|FOLDER..] (options)
knife data bag list (options)
knife data bag show BAG [ITEM] (options)

** ENVIRONMENT COMMANDS **
knife environment compare [ENVIRONMENT..] (options)
knife environment create ENVIRONMENT (options)
knife environment delete ENVIRONMENT (options)
knife environment edit ENVIRONMENT (options)
knife environment from file FILE [FILE..] (options)
knife environment list (options)
knife environment show ENVIRONMENT (options)

** EXEC COMMANDS **
knife exec [SCRIPT] (options)

** GROUP COMMANDS **
knife group add MEMBER_TYPE MEMBER_NAME GROUP_NAME
knife group create GROUP_NAME
knife group destroy GROUP_NAME
knife group list
knife group remove MEMBER_TYPE MEMBER_NAME GROUP_NAME
knife group show GROUP_NAME

** KNIFE COMMANDS **
Usage: /hab/pkgs/chef-davin/knife/17.2.18/20210608142443/ruby-bin/knife (options)

** NODE COMMANDS **
knife node bulk delete REGEX (options)
knife node create NODE (options)
knife node delete [NODE [NODE]] (options)
knife node edit NODE (options)
knife node environment set NODE ENVIRONMENT
knife node from file FILE (options)
knife node list (options)
knife node policy set NODE POLICY_GROUP POLICY_NAME (options)
knife node run_list add [NODE] [ENTRY [ENTRY]] (options)
knife node run_list remove [NODE] [ENTRY [ENTRY]] (options)
knife node run_list set NODE ENTRIES (options)
knife node show NODE (options)

** PATH-BASED COMMANDS **
knife delete [PATTERN1 ... PATTERNn]
knife deps PATTERN1 [PATTERNn]
knife diff PATTERNS
knife download PATTERNS
knife edit [PATTERN1 ... PATTERNn]
knife list [-dfR1p] [PATTERN1 ... PATTERNn] (options)
knife show [PATTERN1 ... PATTERNn] (options)
knife upload PATTERNS (options)
knife xargs [COMMAND] (options)

** RAW COMMANDS **
knife raw REQUEST_PATH (options)

** RECIPE COMMANDS **
knife recipe list [PATTERN]

** REHASH COMMANDS **
knife rehash

** ROLE COMMANDS **
knife role bulk delete REGEX (options)
knife role create ROLE (options)
knife role delete ROLE (options)
knife role edit ROLE (options)
knife role env_run_list add [ROLE] [ENVIRONMENT] [ENTRY [ENTRY]] (options)
knife role env_run_list clear [ROLE] [ENVIRONMENT] (options)
knife role env_run_list remove [ROLE] [ENVIRONMENT] [ENTRIES] (options)
knife role env_run_list replace [ROLE] [ENVIRONMENT] [OLD_ENTRY] [NEW_ENTRY] (options)
knife role env_run_list set [ROLE] [ENVIRONMENT] [ENTRIES] (options)
knife role from file FILE [FILE..] (options)
knife role list (options)
knife role run_list add [ROLE] [ENTRY [ENTRY]] (options)
knife role run_list clear [ROLE] (options)
knife role run_list remove [ROLE] [ENTRY] (options)
knife role run_list replace [ROLE] [OLD_ENTRY] [NEW_ENTRY] (options)
knife role run_list set [ROLE] [ENTRIES] (options)
knife role show ROLE (options)

** SEARCH COMMANDS **
knife search INDEX QUERY (options)

** SERVE COMMANDS **
knife serve (options)

** SSH COMMANDS **
knife ssh QUERY COMMAND (options)

** SSL COMMANDS **
knife ssl check [URL] (options)
knife ssl fetch [URL] (options)

** STATUS COMMANDS **
knife status QUERY (options)

** SUPERMARKET COMMANDS **
knife supermarket download COOKBOOK [VERSION] (options)
knife supermarket install COOKBOOK [VERSION] (options)
knife supermarket list (options)
knife supermarket search QUERY (options)
knife supermarket share COOKBOOK [CATEGORY] (options)
knife supermarket show COOKBOOK [VERSION] (options)
knife supermarket unshare COOKBOOK

** TAG COMMANDS **
knife tag create NODE TAG ...
knife tag delete NODE TAG ...
knife tag list NODE

** USER COMMANDS **
knife user create USERNAME --email EMAIL --password PASSWORD (options)
knife user delete USER (options)
knife user dissociate USERNAMES
knife user edit USER (options)
knife user invite add USERNAMES
knife user invite list
knife user invite rescind [USERNAMES] (options)
knife user key create USER (options)
knife user key delete USER KEYNAME (options)
knife user key edit USER KEYNAME (options)
knife user key list USER (options)
knife user key show USER KEYNAME (options)
knife user list (options)
knife user password USERNAME [PASSWORD | --enable-external-auth]
knife user reregister USER (options)
knife user show USER (options)

** VAULT COMMANDS **
knife vault create VAULT ITEM VALUES (options)
knife vault delete VAULT ITEM (options)
knife vault download VAULT ITEM PATH (options)
knife vault edit VAULT ITEM (options)
knife vault isvault VAULT ITEM (options)
knife vault itemtype VAULT ITEM (options)
knife vault list (options)
knife vault refresh VAULT ITEM
knife vault remove VAULT ITEM VALUES (options)
knife vault rotate all keys
knife vault rotate keys VAULT ITEM (options)
knife vault show VAULT [ITEM] [VALUES] (options)
knife vault update VAULT ITEM VALUES (options)

** YAML COMMANDS **
knife yaml convert YAML_FILENAME [RUBY_FILENAME]
```
