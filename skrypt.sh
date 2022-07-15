help()
{
echo "Dostępne opcje: "
echo "--date oraz -d wyświetli dzisiejszą datę"
echo "--logs oraz -l utworzy automatycznie 100 plików logx/logx.txt"
echo "--logs a oraz -l a utworzy automatycznie a plików logx/logx.txt"
echo "--help oraz -h wyświetli listę dostępnych opcji"
echo "--init klonuje całe repozytorium do katalogu, w którym został uruchomiony oraz ustawia ścieżkę w zminnej środowiskowej Path"
echo "--error oraz -e utworzy automatycznie zadaną liczbę plików errorx/errorx.txt"
}

while [ "$1" != "" ]; do
	case $1 in
	--date|-d)
		shift
		date;;
	--logs|-l)
		shift
		if [ -z "$1" ]
		then
			a=100
		else
			a=$1
		fi
		for i in `seq 1 $a`; do
			touch log$i/log$i.txt
			echo "log$i/log$i.txt">>log$i.txt
			echo "skrypt.sh">>log$i.txt
			echo date>>log$i.txt
		shift
		done;;
 	--error|-e)
                shift
                if [ -z "$1" ]
                then
                        a=100
                else
                        a=$1
                fi
                for i in `seq 1 $a`; do
                        touch error$i/error$i.txt
                        echo "error$i/error$i.txt">>error$i.txt
                        echo "skrypt.sh">>error$i.txt
                        echo date>>error$i.txt
                shift
                done;;
	--help|-h)
		shift
		help;;
	--init)
		shift
		git clone https://github.com/dobrywieczur/dsw-WNarz-dziaIT
		PATH="$(pwd)/dsw-WNarz-dziaIT"
	;;
*)
		;;
	esac
done
