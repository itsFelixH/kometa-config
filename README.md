<img src="https://kometa.wiki/en/nightly/assets/images/icons/logo-full.png" alt="Kometa" width="500">

# Kometa Configuration

[![Kometa](https://img.shields.io/badge/Kometa-Nightly-blue?style=flat-square&logo=docker)](https://github.com/Kometa-Team/Kometa)
[![Plex](https://img.shields.io/badge/Plex-Ready-orange?style=flat-square&logo=plex)](https://plex.tv)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

A curated and battle-tested [Kometa](https://github.com/Kometa-Team/Kometa) (formerly *Plex Meta Manager*) configuration for organizing, decorating, and managing Plex Movie and TV Show libraries.

---

## Highlights

- **Smart & Dynamic Collections**: Curated studio hubs (Marvel, Disney, A24), franchise timelines, decade retrospectives, and rating charts (MDBList, IMDb).
- **Overlays**: Status ribbons and banners for TV series (Upcoming, Returning, New Episode, Season Finale) powered by custom typography and [UMTK / TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa).
- **Custom Multi-Part TV Structures**: Dedicated metadata definitions for complex episode/season hierarchies (e.g., `money_heist.yml`).
- **Artwork & Poster Management**: Integrated with [MediUX](https://mediux.pro/) and [AURA](https://github.com/mediux-team/AURA) for automated high-res poster syncing.
- **Cross-Library Playlists**: Pre-configured cross-media playlists across Movies and TV Shows.

---

## Quick Start / Setup

### 1. Clone the repository
```bash
git clone https://github.com/itsFelixH/kometa-config.git
cd kometa-config
```

### 2. Create your `config.yml`
Copy the included template:
```bash
cp config.yml.template config.yml
```

Edit `config.yml` with your own credentials:
- **Plex**: `url` and `token` ([How to find your Plex token](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/))
- **TMDb**: `apikey` (Free from [TheMovieDatabase](https://www.themoviedb.org/settings/api))
- **MDBList**: `apikey` (Free from [MDBList](https://mdblist.com/preferences/))
- **GitHub**: `token` (Optional, prevents GitHub API rate limits)

### 3. Verify Library Names
Open `config.yml` and ensure the library names under `libraries:` match your Plex server (defaults are `Movies` and `TV Shows`).

### 4. Run Kometa
Mount the repository folder into your Kometa container as `/config`:

```yaml
# docker-compose.yml example
services:
  kometa:
    image: kometateam/kometa:nightly
    container_name: kometa
    environment:
      - TZ=Europe/Berlin
      - KOMETA_TIMES=05:00
    volumes:
      - /path/to/kometa-config:/config:rw
    restart: unless-stopped
```

To run a one-time execution:
```bash
docker run --rm -it -v "$(pwd):/config" kometateam/kometa:nightly --run
```

---

## Repository Structure

```
├── config.yml.template     # Ready-to-use sanitized configuration template
├── movies.yml              # Movie collection rules, smart filters & rating charts
├── tv.yml                  # TV show collections, networks & franchise definitions
├── playlists.yml           # Cross-library playlists
├── fonts/                  # Custom typography for overlay badges
│   ├── Avenir_95_Black.ttf
│   └── Juventus-Fans-Bold.ttf
└── metadata/
    ├── movies.yml          # Custom movie poster and metadata overrides
    └── tv/
        └── money_heist.yml # Special multi-part episode ordering & title mappings
```

---

## Collection Rules & Features

### Movies (`movies.yml`)
- **Studio & Network**: Disney, Pixar, Marvel, DC, Studio Ghibli, DreamWorks, A24, Apple TV+, Netflix, etc.
- **Franchise & Universe**: MCU Phase order, Star Wars, Harry Potter, Middle-earth, Alien/Predator, James Bond.
- **Decades**: 80s, 90s, 2000s, 2010s, 2020s smart collections.
- **Dynamic Charts**: Top rated, award winners, and trending lists via MDBList & IMDb.

### TV Shows (`tv.yml`)
- **Networks & Streaming Hubs**: Netflix, HBO, Apple TV+, Disney+, Amazon Prime, Hulu, BBC, etc.
- **Genre & Category Hubs**: Anime, Miniseries, Documentaries, Reality.
- **Franchises**: Star Wars, Marvel, Star Trek, Doctor Who.
- **Status Hubs**: Returning Series, In Production, Ended.

---

## Complementary Tools

- [Kometa Official Documentation](https://kometa.wiki/) — Official wiki & reference guide
- [UMTK / TSSK](https://github.com/netplexflix/Upcoming-Movies-TV-Shows-for-Kometa) — Upcoming media placeholders & status overlays
- [AURA](https://github.com/mediux-team/AURA) — Automated MediUX artwork management
- [ImageMaid](https://github.com/Kometa-Team/ImageMaid) — Automated Plex metadata image cleaner and database optimization

---

## License

Distributed under the MIT License.
