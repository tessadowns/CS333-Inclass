#!/bin/bash

main(){
    #source ArgumentEcho.sh "$*" # need to pass the arguments over

    if [ $# -eq 0 ]; then #0 arg given case
        printf "\nError: No arguments provided \nFor help use [-h] or [help]\n"
        return 1
    fi

    #allows for multiple  requests to be handled in a single input
    for arg in "$@" #space delimed args
    do 
        CaseToLower=("${arg,,}")
        case "$CaseToLower" in
            "-h" | "help")
            source help.sh
            ;;

            "-p" | "ping" | "pingsweep")
            printf "\nExecuting a ping sweep across the local network\n"

            source pingsweep.sh
            if [ $? -eq 0 ];then
                printf "\nPing sweep was executed successfully and a log file has been created"
            else
                printf "\nPing sweep was unable to execute\n"
            fi
            ;;
            *)
            printf "\n$arg is not a valid option \nFor help use [-h] or [help]"
        esac
    done
}
main "$@" #must be included to actually call main otherwise nothing will happen