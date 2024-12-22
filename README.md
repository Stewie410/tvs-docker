# 🌲 tvs-docker

An alpine-based terraria server container & compose template; based on [`hexlo/terraria-server-docker`](https://github.com/hexlo/terraria-server-docker).

## 📦 Dependencies

Clients and server must be running compatible versions of Terraria to connect.

- `docker` or compatible engine
  - `docker compose` or equivalent is recommended

## 📋 Configuration

The majorify of the configuration is handled through the `server-config.conf` file, which is loaded by the server on boot; an example of which can be found in [`server-config.conf`](config/server-config.conf).

Here's a quick breakdown of each of these settings:

| Option | Description | Values |
| :----- | :---------- | :----- |
| `world` | Absolute or Relative Path to worldfile to be loaded | `name.wld` or `/path/to/name.wld` |
| `autocreate` | Size of the world to be created if `world` does not exist | `0`: disable, `1`: small, `2`: medium, `3`: large |
| `difficulty` | World difficulty to generate, if enabled | `0`: classic, `1`: expert, `2`: master, `3`: journey |
| `maxplayers` | Maximum number of players allowed in the server | `1-16` |
| `password` | The password required to connect to the server | any string |
| `worldname` | Name of the world to autocreate, if enabled | any string |
| `motd` | Message to be displayed when a player connects | any string |
| `worldpath` | Absolute or relative path where world files are stored | `worlds` or `/opt/terraria/worlds` |
| `banlist` | Absolute or relative path to list of banned players | `banlist.txt` or `/opt/terraria/banlist.txt` |
| `secure` | Enable anticheat protection | `0`: disable, `1`: enable |
| `language` | Language used on the server | `en-US`, `de-DE`, `it-IT`, `fr-FR`, `es-ES`, `ru-RU`, `zh-Hans`, `pt-BR`, `pl-PL` |
| `upnp` | Use UPnP to try opening server port automatically | `0`: disable, `1`: enable |
| `npcstream` | Reduce enemy skipping but increase bandwidth usage | `1+` |
| `priority` | Server priority | `0`: realtime, `1`: high, `2`: above normal, `3`: normal, `4`: below normal, `5`: idle |
| `journeypermission_time_setfrozen` | Who can freeze time | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_time_setdawn` | Who can set time to Dawn | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_time_setnoon` | Who can set time to Noon | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_time_setdusk` | Who can set time to Dusk | `0`: no players, `1`: host, `2:` everyone |
| `journeypermission_time_setmidnight` | Who can set time to Midnight | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_time_setspeed` | Who can adjust the time speed | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_godmode` | Who can use godmode | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_wind_setstrength` | Who can set the wind strength | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_wind_setfrozen` | Who can freeze the wind | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_rain_setstrength` | Who can set the rain strength | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_rain_setfrozen` | Who can freeze the rain | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_increaseplacementrange` | Who can change the placement range | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_setdifficulty` | Who can change the difficulty | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_biomespread_setfrozen` | Who can toggle biome spread | `0`: no players, `1`: host, `2`: everyone |
| `journeypermission_setspawnrate` | Who can change spawn rate | `0`: no players, `1`: host, `2`: everyone |

For additional information on configuration options, please visit [the wiki](https://terraria.wiki.gg/wiki/Guide:Setting_up_a_Terraria_server#Making_a_configuration_file).
In addition, [`terrariaconfig.dotslashsteve.sh`](https://terrariaconfig.dotslashsteve.sh/) can be used to generate a config file for you.

### 📨 Environment Variables

Breaking from the original project, this fork only provides a single environment variable for configuration:

| Variable | Default Value | Description | Example |
| :------- | :------------ | :---------- | :------ |
| `TERRARIA_VERSION` | `latest` | Specify the semver version of Terraria to install, or `latest` to use the most recent version | `1.4.4.9` or `latest` |

## 🌎 World Generation

World generation is recommended to be defined in the configuration file; however this can also be done manually.  For more information, please visit [the wiki](https://terraria.wiki.gg/wiki/Guide:Setting_up_a_Terraria_server).

## 💻 Console Commands

Please refer to the [official wiki](https://terraria.wiki.gg/wiki/Server#List_of_console_commands) for what console-commands are available.

Unfortunately, these cannot be entered in-game, and requires attaching to the container directly.  When doing so, ensure `<C-p><C-q>` is used to detach from the container without stopping the process.
