# Get Release Notes Script

`get_release_notes.sh` is a Bash script that uses the GitHub CLI to fetch release notes from a specified GitHub repository between two version tags. The script saves the release notes in a Markdown file named `release_notes.md`.

## Prerequisites

- **GitHub CLI**: Make sure the GitHub CLI (`gh`) is installed and authenticated on your system. You can follow the [installation guide](https://cli.github.com/) if you haven't set it up yet.

## Usage

### Command Syntax

```bash
./get_release_notes.sh <repo_path> <start_version> <end_version>
```

- `<repo_path>`: The path to your local GitHub repository.
- `<start_version>`: The starting version tag (e.g., `v5.45.0`).
- `<end_version>`: The ending version tag (e.g., `v5.63.0`).

### Example

```bash
./get_release_notes.sh /path/to/repo v5.45.0 v5.63.0
```

This will generate a file named `release_notes.md` in the specified repository directory with all release notes from `v5.45.0` to `v5.63.0`.

## Script Details

### Input Arguments

- `repo_path`: The local path to your GitHub repository.
- `start_version`: The version tag to start collecting release notes.
- `end_version`: The version tag to stop collecting release notes.

### Output

The release notes are saved in a file named `release_notes.md` in the specified repository path.

### How It Works

1. The script navigates to the provided repository path.
2. It uses `gh release list` to fetch all releases and filters them based on the provided version range.
3. It retrieves the release notes for each release using `gh release view` and writes them to `release_notes.md`.

## Setup Instructions

1. **Download the Script**: Clone this repository or download the `get_release_notes.sh` script.
2. **Make the Script Executable**: `chmod +x get_release_notes.sh`

3. **Run the Script** using the command syntax described above.

## Notes

- Ensure you have appropriate access to the GitHub repository and have authenticated with the GitHub CLI (`gh auth login`).
- The script assumes version tags are in a format that allows comparison (e.g., `vX.Y.Z`).

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
