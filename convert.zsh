function conversion_not_available {
	input_extension=$1
	output_extension=$2
	echo "
		Conversion from $1 to $2 is not available yet.
		If this is a feasible conversion that would be useful to you, file an issue on github. "
	exit 2
}

function program_needed {
	missing_program=$1
	echo "$1 is required for this conversion"
}

function get_extension {
	echo "${1##*.}"
}

function get_extension_type {
	case $1 in
		bibtex|biblatex|bits|commonmark|commonmark_x|creole|csljson|csv|tsv|\
		djot|docbook|docx|dokuwiki|endnotexml|epub|fb2|gfm|haddock|html|\
		ipynb|jats|jira|json|latex|markdown|markdown_mmd|markdown_phpextra|\
		markdown_strict|mediawiki|man|mdoc|muse|native|odt|opml|org|pod|\
		ris|rtf|rst|t2t|textile|tikiwiki|twiki|typst|vimwiki)
			echo "text"
			;;
		png|jpg|jpeg|tiff|heic|bmp|webp|tif)
			echo "image"
			;;
		mp4|mov|mkv)
			echo "video"
			;;
		wav|mp3)
			echo "audio"
			;;
		pdf|odt|doc|docx|epub) #seperate in case a future document format is needed
			echo "text"
			;;
		*)
			echo "None"
			;;
	esac
}

input_file=$1
output_file=$2

if ! [[ -f $input_file ]] ; then
	echo "$input_file does not exist"
	exit 1
elif [[ -f $output_file ]] ; then
	read -p "$output_file already exists... Overwrite? (Y/n): " confirm
	case $confirm in
			[Yy]*) ;;   # proceed
			*) echo "aborted"; exit 1 ;;
	esac
fi

input_extension="$(get_extension "$input_file")"
output_extension="$(get_extension "$output_file")"

input_type="$(get_extension_type "$input_extension")"
output_type="$(get_extension_type "$output_extension")"

echo "$input_type"
echo "$output_type"

if [[ $input_type == "None" || $output_type == "None" ]] ; then
	conversion_not_available $input_extension $output_extension
elif [[ $input_type == "text" && $output_type == "text" ]] ; then
	pandoc -o $output_file $input_file || missing_program "pandoc"
elif [[ $input_type == "image" && $output_type == "image" ]] ; then
	magick $input_file $output_file || missing_program "magick"
elif [[ $input_type == "audio" && $output_type == "audio" ]] ; then
	ffmpeg -i $input_file -acodec libmp3lame $output_file || missing_program "ffmpeg"
elif [[ $input_type == "video" && $output_type == "video" ]] ; then
	ffmpeg -i $input_file -acodec libmp3lame $output_file || missing_program "ffmpeg"
else
	conversion_not_available $input_extension $output_extension
fi

echo "$input_file > $output_file"
echo "All done"
