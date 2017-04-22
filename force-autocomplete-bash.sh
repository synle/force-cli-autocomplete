_force()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}
    local prevprev=${COMP_WORDS[COMP_CWORD-2]}

    local ALL_COMMANDS="login logout logins active whoami describe sobject field record bulk fetch import export query apex log oauth test security version update push aura password notify limits help"
    local ALL_TYPES="actionLinkGroupTemplates analyticSnapshots applications appMenus approvalProcesses assignmentRules authproviders aura autoResponseRules callCenters cachePartitions certs channelLayouts classes communities components connectedApps corsWhitelistOrigins customApplicationComponents customMetadata customPermissions dashboards dataSources datacategorygroups delegateGroups documents EmbeddedServiceConfig email escalationRules feedFilters flexipages flowDefinitions flows globalPicklists groups homePageComponents homePageLayouts installedPackages labels layouts LeadConvertSettings letterhead matchingRules namedCredentials objects objectTranslations pages pathAssistants permissionsets postTemplates profiles postTemplates postTemplates profiles queues quickActions remoteSiteSettings reports reportTypes roles scontrols settings sharingRules siteDotComSites sites staticresources synonymDictionaries tabs triggers weblinks workflows cspTrustedSites"
    local ALL_HOST="mobile1.t.salesforce.com login.salesforce.com"
    local ALL_STANDARD_OBJECTS="User Contact Lead Case Opportunity Account"

    case "$prev" in
        login)
            COMPREPLY=( $(compgen -W "-i -u -p" -- $cur) )
            return 0;
        ;;
        active)
            COMPREPLY=( $(compgen -W "-a" -- $cur) )
            return 0;
        ;;
        push)
            ALL_PUSH_OPTS="-f -t -n -rollbackonerror -runalltests -checkonly -purgeondelete -allowmissingfiles -autoupdatepackage -test -testlevel -ignorewarnings"
            COMPREPLY=( $(compgen -W "$ALL_PUSH_OPTS" -- $cur) )
            return 0;
        ;;
        fetch)
            ALL_PUSH_OPTS="-f -t -n -d -type -name -directory -unpack -preserve -xml"
            COMPREPLY=( $(compgen -W "$ALL_PUSH_OPTS" -- $cur) )
            return 0;
        ;;
        aura)
            ALL_PUSH_OPTS="push create delete list"
            COMPREPLY=( $(compgen -W "$ALL_PUSH_OPTS" -- $cur) )
            return 0;
        ;;
        record)
            COMPREPLY=( $(compgen -W "get create update delete" -- $cur) )
            return 0;
        ;;
        create)
            COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            return 0;
        ;;
        update)
            COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            return 0;
        ;;
        delete)
            COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            return 0;
        ;;
        describe)
            COMPREPLY=( $(compgen -W "-n -t -json" -- $cur) )
            return 0;
        ;;
        field)
            COMPREPLY=( $(compgen -W "list create type delete" -- $cur) )
            return 0;
        ;;
        help)
            COMPREPLY=( $(compgen -W "$ALL_COMMANDS" -- $cur) )
            return 0;
        ;;

        # arguments
        -i)
            COMPREPLY=( $(compgen -W "$ALL_HOST" -- $cur) )
            return 0;
        ;;
        -t)
            COMPREPLY=( $(compgen -W "$ALL_TYPES" -- $cur) )
            return 0;
        ;;
        -f)
            COMPREPLY=( $( compgen -d   -- $cur));
            return 0;
        ;;
    esac


    COMPREPLY=( $(compgen -W "$ALL_COMMANDS" -- $cur) )
}
complete -F _force force
