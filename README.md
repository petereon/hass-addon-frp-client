[frp (Fast Reverse Proxy)](https://github.com/fatedier/frp) is a NAT-traversal capable reverse-proxy. This capability means that your Home Assistant running behind a NAT (network address translation) can be accessed from the internet, provided you do have a server (e.g. free e2-micro in Google Cloud) which does have a public IP address associated.

> [!IMPORTANT]
> This is a fork of a [huxiaoxu2019/hass-addon-frp-client](https://github.com/huxiaoxu2019/hass-addon-frp-client) kindly licensed under MIT by Xiaoxu Hu.

It takes only one parameter, which is a path to `frpc` config. This allows you to provide arbitrary configuration while having `frpc` be run in a managed fashion by Home Assistant OS Supervisor.

> [!CAUTION]
> Misconfigured frpc can expose your Home Assistant instance to the internet without protection
