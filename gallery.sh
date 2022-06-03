start=`date +%s`
mkdir small
ls -1 *.png | parallel convert -verbose -resize 1050x1050! '{}' 'small/small_{.}.png'
cd small
for name in small_*.png
do
    newname="$(echo "$name" | cut -d "_" -f 2 )"
    cp "$name" "$newname"

done
mkdir small_backup_all
mv small_*.png small_backup_all/
input="../sold.txt"
for img in *.png; do
   width=$(identify -format %W ${img})
   width=$(( ${width} * 3 / 10 ))
   name=$( echo $img | cut -d "." -f1)
   convert                  \
     -verbose               \
     -background '#0008'    \
     -gravity center        \
     -fill white            \
     -font Philosopher-Regular \
     -size ${width}x100     \
      caption:"\#${name}"      \
      "${img}"              \
     +swap                  \
     -gravity south-west         \
     -composite             \
      "labeled_${img}" &
done
sleep 60
input="../sold.txt"
for img in labeled_*.png; do
while IFS= read -r soldimage; do
if [ "$img" == "$soldimage" ]
     then
     convert                  \
     -verbose             \
     -background black    \
     -gravity center        \
     -fill red            \
     -font Philosopher-Regular \
     -pointsize 200 \
     -size 600x \
     caption:"SOLD" \
     "${img}" \
     +swap                  \
     -gravity center         \
     -composite             \
     "${img}" &
fi
done < "$input"
done

sleep 60

mkdir gallery
mv labeled_*.png gallery/
cd gallery
mkdir tiny-png
ls -1 *.png | parallel convert -verbose -resize 400x400! '{}' '{.}.png'
ls -1 *.png | parallel convert -verbose '{}' '{.}.jpg'
mv *.png tiny-png/


col=("1000" "2000" "3000" "4000" "5000" "6000" "7000" "8000" "9000" "10000")
for dir  in ${col[@]}; do
mkdir "$dir"
done
mv labeled_{1..1000}.jpg 1000/
mv labeled_{1001..2000}.jpg 2000/
mv labeled_{2001..3000}.jpg 3000/
mv labeled_{3001..4000}.jpg 4000/
mv labeled_{4001..5000}.jpg 5000/
mv labeled_{5001..6000}.jpg 6000/
mv labeled_{6001..7000}.jpg 7000/
mv labeled_{7001..8000}.jpg 8000/
mv labeled_{8001..9000}.jpg 9000/
mv labeled_{9001..10000}.jpg 10000/

for collection in ${col[@]}; do
montage -limit area 8192 -limit memory 8192 -limit map 8192 -verbose $(ls -v "$collection"/labeled_*.jpg) -background "#000000" -geometry 400x400+2+2 -tile 10x10 gallery_"$collection".jpg &
done

end=`date +%s`

runtime=$((end-start))
echo "Runtime was $runtime seconds"
