<img src="https://kometa.wiki/en/nightly/assets/images/icons/logo-full.png" alt="Kometa">

# Kometa Config

My [Kometa](https://github.com/Kometa-Team/Kometa) configuration for managing collections, overlays, and metadata across Plex libraries.

## What's Included

- **Collections** — movie and TV collections using smart filters, IMDb, and MDBList
- **Overlays** — status banners via [UMTK/TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa) (Coming Soon, New, Returning, etc.)
- **Artwork Management** — managed automatically by [AURA](https://github.com/mediux-team/AURA) with 1-click MediUX linking from PiBoard
- **Custom Show Structure** — dedicated metadata definitions for complex multi-part episode orders (e.g. `money_heist.yml`)
- **Playlists** — cross-library playlists

## Usage

```bash
git clone https://github.com/itsFelixH/kometa-config.git
```

1. Set up Kometa following the [Kometa Wiki](https://kometa.wiki/)
2. Add your API keys to your `config.yml` (Plex, TMDb, MDBList)
3. Adjust library names to match your Plex server

For help setting up Kometa itself, refer to the [Kometa Wiki](https://kometa.wiki/).

<details>
<summary><b>File Structure</b></summary>

```
├── movies.yml            Movie collection definitions
├── tv.yml                TV show collection definitions
├── playlists.yml         Cross-library playlists
├── metadata/
│   └── tv/
│       └── money_heist.yml  Custom multi-part episode ordering & metadata
├── fonts/                Custom fonts used by overlays
```

</details>

<details>
<summary><b>Dependencies</b></summary>

- [Kometa](https://github.com/Kometa-Team/Kometa) (nightly image)
- [UMTK/TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa) for status overlays (optional)
- [AURA](https://github.com/mediux-team/AURA) for artwork management via [MediUX](https://mediux.pro/) (with 1-click linking via PiBoard)
- Plex Media Server
- API keys: TMDb, MDBList

</details>

<details>
<summary><b>Run Order</b></summary>

Kometa processes each library in this order:

1. **Collections** — creates/updates smart and static collections (`movies.yml` / `tv.yml`)
2. **Metadata** — applies custom show metadata (`metadata/tv/money_heist.yml`)
3. **Overlays** — applies status banners to posters/backdrops (`overlays/`)
4. **Playlists** — updates cross-library playlists (`playlists.yml`)

</details>

<details>
<summary><b>Collection Categories</b></summary>

### Movies (`movies.yml`)

| Category | Source | Notes |
|----------|--------|-------|
| Studio / Network | Plex smart filter | Disney, Pixar, Marvel, DC, Studio Ghibli, etc. |
| Franchise / Universe | TMDb / IMDb | MCU, Star Wars, Harry Potter, Middle-earth, etc. |
| Decade / Era | Plex smart filter | 80s, 90s, 2000s, 2010s, 2020s |
| Genre Charts | MDBList | Top rated by genre |
| Dynamic Lists | IMDb / Trakt | Trending, Popular, Award Winners |

### TV Shows (`tv.yml`)

| Category | Source | Notes |
|----------|--------|-------|
| Network / Platform | Plex smart filter | Netflix, HBO, Apple TV+, Disney+, Prime, etc. |
| Genre Collections | Plex smart filter | Anime, Documentary, Reality, etc. |
| Franchise | TMDb / IMDb | Star Wars, Marvel, Star Trek, Doctor Who |
| Status-Based | UMTK smart filter | Returning Series, In Production, Ended |

</details>

<details>
<summary><b>Overlay Rules</b></summary>

Status overlays are managed by [UMTK/TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa):

| Overlay | Trigger | Position |
|---------|---------|----------|
| Coming Soon | Unreleased item with release date | Top-left ribbon |
| New Episode / Season | Episode aired within last 7 days | Top-left badge |
| Returning Series | Show renewed for next season | Bottom bar |
| Ended / Cancelled | Show has concluded production | Bottom bar |

Overlays use the custom fonts located in `fonts/`.

</details>

---

## Related Projects

- [AURA](https://github.com/mediux-team/AURA) — Artwork management via MediUX with automated Plex syncing
- [UMTK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa) — Upcoming movies & TV show status overlays
- [ImageMaid](https://github.com/Kometa-Team/ImageMaid) — Metadata cleaner and Plex DB optimizer
