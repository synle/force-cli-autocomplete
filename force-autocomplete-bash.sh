_force_cli_completion()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}

    # handle for null pointer
    local prevprev=""
    if [ $COMP_CWORD -gt 1 ]; then
        prevprev=${COMP_WORDS[COMP_CWORD-2]}
    fi

    local ALL_COMMANDS="login logout logins active whoami describe sobject field record bulk fetch import export query apex log oauth test security version update push aura password notify limits"
    local ALL_TYPES="ActionLinkGroupTemplate AnalyticSnapshot CustomApplication AppMenu ApprovalProcess AssignmentRules AuthProvider AuraDefinitionBundle", hasFolder: true, onlyFolder: tru AutoResponseRules CallCenter PlatformCachePartition Certificate ChannelLayout ApexClass Community ApexComponent ConnectedApp CorsWhitelistOrigin CustomApplicationComponent CustomMetadata CustomPermission Dashboard", hasFolder: tru ExternalDataSource DataCategoryGroup DelegateGroup Document", hasFolder: tru EmbeddedServiceConfig EmailTemplate", hasFolder: tru EscalationRules CustomFeedFilter FlexiPage FlowDefinition Flow GlobalPicklist Group HomePageComponent HomePageLayout InstalledPackage CustomLabels Layout LeadConvertSettings Letterhead MatchingRules NamedCredential CustomObject CustomObjectTranslation ApexPage PathAssistant PermissionSet PostTemplate Profile", extension: ".profile PostTemplate PostTemplate Profile Queue QuickAction RemoteSiteSetting Report", hasFolder: tru ReportType Role Scontrol Settings SharingRules SiteDotCom CustomSite StaticResource SynonymDictionary CustomTab ApexTrigger CustomPageWebLink Workflow CspTrustedSite"
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
        test)
            COMPREPLY=( $(compgen -W "-namespace -v" -- $cur) )
            return 0;
        ;;
        record)
            COMPREPLY=( $(compgen -W "get create update delete" -- $cur) )
            return 0;
        ;;
        create)
            if [ $prevprev = 'record' ];
            then
                COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            fi
            return 0;
        ;;
        update)
            if [ $prevprev = 'record' ];
            then
                COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            fi
            return 0;
        ;;
        upsert)
            COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            return 0;
        ;;
        delete)
            if [ $prevprev = 'record' ];
            then
                COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            fi
            return 0;
        ;;
        list)
            if [ $prevprev = 'field' ];
            then
                COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            fi
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
        sobject)
            COMPREPLY=( $(compgen -W "list create delete import" -- $cur) )
            return 0;
        ;;
        oauth)
            COMPREPLY=( $(compgen -W "create" -- $cur) )
            return 0;
        ;;
        log)
            COMPREPLY=( $(compgen -W "delete" -- $cur) )
            return 0;
        ;;
        notify)
            COMPREPLY=( $(compgen -W "true false" -- $cur) )
            return 0;
        ;;
        security)
            COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            return 0;
        ;;
        query)
            if [ $prevprev = 'force' ];
            then
                COMPREPLY=( $(compgen -W "--format:csv" -- $cur) )
            else
                COMPREPLY=( $(compgen -W "$ALL_STANDARD_OBJECTS" -- $cur) )
            fi

            return 0;
        ;;
        bulk)
            COMPREPLY=( $(compgen -W "insert update upsert query retrieve job batch batches" -- $cur) )
            return 0;
        ;;
        import)
            COMPREPLY=( $(compgen -W "-rollbackonerror -runalltests -checkonly -purgeondelete -allowmissingfiles -autoupdatepackage -test -testlevel -ignorewarnings -directory -verbose" -- $cur) )
            return 0;
        ;;

        # all commands
        help)
            COMPREPLY=( $(compgen -W "$ALL_COMMANDS" -- $cur) )
            return 0;
        ;;
        force)
            COMPREPLY=( $(compgen -W "$ALL_COMMANDS help" -- $cur) )
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
}
complete -F _force_cli_completion force
