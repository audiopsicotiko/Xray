show_help() {
    case $1 in
    api | x25519 | tls | run | uuid | version)
        $is_core_bin help $1 ${@:2}
        ;;
    *)
        [[ $1 ]] && warn "Opción desconocida '$1'"
        msg "Script $is_core_name $is_sh_ver por $author"
        msg "Uso: $is_core [opciones]... [argumentos]... "
        msg
        help_info=(
            "Básico:"
            "   v, version                                      Mostrar versión actual"
            "   ip                                              Devolver IP del host actual"
            "   pbk                                             Equivalente a $is_core x25519"
            "   get-port                                        Devolver un puerto disponible"
            "   ss2022                                          Devolver una contraseña usable para Shadowsocks 2022\n"
            "General:"
            "   a, add [protocolo] [args... | auto]            Agregar configuración"
            "   c, change [nombre] [opción] [args... | auto]   Cambiar configuración"
            "   d, del [nombre]                                Eliminar configuración**"
            "   i, info [nombre]                               Ver configuración"
            "   qr [nombre]                                    Información de código QR"
            "   url [nombre]                                   Información de URL"
            "   log                                             Ver registros"
            "   logerr                                          Ver registros de errores\n"
            "Cambios:"
            "   dp, dynamicport [nombre] [inicio | auto] [fin] Cambiar puerto dinámico"
            "   full [nombre] [...]                            Cambiar múltiples parámetros"
            "   id [nombre] [uuid | auto]                      Cambiar UUID"
            "   host [nombre] [dominio]                        Cambiar dominio"
            "   port [nombre] [puerto | auto]                  Cambiar puerto"
            "   path [nombre] [ruta | auto]                    Cambiar ruta"
            "   passwd [nombre] [contraseña | auto]            Cambiar contraseña"
            "   key [nombre] [Clave privada | auto] [Clave pública] Cambiar claves"
            "   type [nombre] [tipo | auto]                    Cambiar tipo de camuflaje"
            "   method [nombre] [método | auto]                Cambiar método de cifrado"
            "   sni [nombre] [ ip | dominio]                   Cambiar serverName"
            "   seed [nombre] [semilla | auto]                 Cambiar semilla mKCP"
            "   new [nombre] [...]                             Cambiar protocolo"
            "   web [nombre] [dominio]                         Cambiar sitio web de camuflaje\n"
            "Avanzado:"
            "   dns [...]                                      Configurar DNS"
            "   dd, ddel [nombre...]                           Eliminar múltiples configuraciones**"
            "   fix [nombre]                                   Reparar una configuración"
            "   fix-all                                        Reparar todas las configuraciones"
            "   fix-caddyfile                                  Reparar Caddyfile"
            "   fix-config.json                                Reparar config.json\n"
            "Gestión:"
            "   un, uninstall                                  Desinstalar"
            "   u, update [core | sh | dat | caddy] [ver]      Actualizar"
            "   U, update.sh                                   Actualizar script"
            "   s, status                                      Estado de ejecución"
            "   start, stop, restart [caddy]                   Iniciar, Detener, Reiniciar"
            "   t, test                                        Probar ejecución"
            "   reinstall                                      Reinstalar script\n"
            "Pruebas:"
            "   client [nombre]                                Mostrar JSON para cliente, solo como referencia"
            "   debug [nombre]                                 Mostrar información de debug, solo como referencia"
            "   gen [...]                                      Equivalente a add, pero solo muestra contenido JSON, no crea archivo, para pruebas"
            "   genc [nombre]                                  Mostrar parte JSON para cliente, solo como referencia"
            "   no-auto-tls [...]                              Equivalente a add, pero deshabilita configuración automática TLS, para protocolos *TLS relacionados"
            "   xapi [...]                                     Equivalente a $is_core api, pero API backend usa el servicio $is_core_name actualmente en ejecución\n"
            "Otros:"
            "   bbr                                            Habilitar BBR, si es compatible"
            "   bin [...]                                      Ejecutar comando $is_core_name, por ejemplo: $is_core bin help"
            "   api, x25519, tls, run, uuid  [...]             Compatible con comandos $is_core_name"
            "   h, help                                        Mostrar esta ayuda\n"
        )
        for v in "${help_info[@]}"; do
            msg "$v"
        done
        msg "Use con precaución del, ddel, esta opción eliminará la configuración directamente; sin confirmación"
        msg "Reportar problemas) $(msg_ul https://github.com/${is_sh_repo}/issues) "
        msg "Documentación(doc) $(msg_ul https://233boy.com/$is_core/$is_core-script/)"
        ;;

    esac
}

about() {
    ####### 要点13脸吗只会改我链接的小人 #######
    unset c n m s b
    msg
    msg "Sitio web: $(msg_ul https://233boy.com)"
    msg "Canal: $(msg_ul https://t.me/tg2333)"
    msg "Grupo: $(msg_ul https://t.me/tg233boy)"
    msg "Github: $(msg_ul https://github.com/${is_sh_repo})"
    msg "Twitter: $(msg_ul https://twitter.com/ai233boy)"
    msg "Sitio $is_core_name: $(msg_ul https://xtls.github.io)"
    msg "Core $is_core_name: $(msg_ul https://github.com/${is_core_repo})"
    msg
    ####### 要点13脸吗只会改我链接的小人 #######
}
