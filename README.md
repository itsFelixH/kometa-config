
<img src="https://kometa.wiki/en/nightly/assets/images/icons/logo-full.png" alt="Kometa">

# Kometa Config

My [Kometa](https://github.com/Kometa-Team/Kometa) configuration for managing collections, overlays, and metadata across Plex libraries.

## What's Included

- **Collections** — movie and TV collections using smart filters, Trakt, IMDb, and Letterboxd
- **Overlays** — status banners via [UMTK/TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa) (Coming Soon, New, Returning, etc.)
- **Metadata** — custom posters and sort titles for franchise grouping
- **Playlists** — cross-library playlists

## Usage

```bash
git clone https://github.com/itsFelixH/kometa-config.git
```

1. Set up Kometa following the [Kometa Wiki](https://kometa.wiki/)
2. Add your API keys to your `config.yml` (Plex, TMDb, Trakt, MDBList)
3. Adjust library names to match your Plex server

For help setting up Kometa itself, refer to the [Kometa Wiki](https://kometa.wiki/).

<details>
<summary><b>File Structure</b></summary>

```
├── movies.yml            Movie collection definitions
├── tv.yml                TV show collection definitions
├── playlists.yml         Cross-library playlists
├── metadata/
│   ├── movies.yml        Custom movie metadata
│   └── tv/               Per-franchise TV metadata (MCU, Star Wars, etc.)
└── fonts/                Custom fonts used by overlays
```

</details>

<details>
<summary><b>Dependencies</b></summary>

- [Kometa](https://github.com/Kometa-Team/Kometa) (nightly image)
- [UMTK/TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa) for status overlays (optional)
- Plex Media Server
- API keys: TMDb, Trakt, MDBList

</details>

<details>
<summary><b>Run Order</b></summary>

Kometa processes each library in this order:

1. **Operations** — mass rating/genre updates, stale collection cleanup
2. **Metadata** — custom posters and sort titles
3. **Collections** — smart filters and external lists
4. **Overlays** — UMTK/TSSK status banners

</details>

## Additional Information

For Kometa related questions or issues, join the [Kometa Discord Server](https://discord.gg/uvXgYS73Qf).

You can find all posters I used on [The Poster Database](https://theposterdb.com/) or on [MediUX](https://mediux.pro/).

## Thanks

If you wish to say thanks, you can [buy me a coffee](https://ko-fi.com/cptneptun) or text me on Discord (`CptNeptun#9041`).
