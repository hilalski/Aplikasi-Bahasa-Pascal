program kelompok1;
uses crt;

{Anggota    : Muhammad Zabbar Falihin
            : Fauziah Filda Mufarrihati
            : Muhammad Fauzan Azima. A
            : Yanuar Nurul Hilal

Program yang kami buat rencana adalah program aplikasi kemahasiswaan yang bermanfaat untuk kehidupan mahasiswa yaitu program MySTIS
Program ini untuk perhitungan IPK, jadwal kuliah, kalender akademik, perhitungan saldo dan belanja, dan organisasi kemahasiswaan

Selamat mencoba, semoga penggunaan aplikasinya tidak menyulitkan dan tergolong mudah!}

type
    datamatakuliah  =record
    nama            :string[31];
    kode            :string[8];
    sks             :byte;
    nilaitugas      :real;
    nilaiuts        :real;
    nilaiuas        :real;
    praktikum       :boolean;
    nilaipraktikum  :real;
    nilaiangka      :real;
    nilaihuruf      :string[2];
    bobotnilai      :real;
    end;

    datajadwal              =record
    matkul                  :string[31];
    singkatan               :string[15];
    hari                    :string[6];
    sesi                    :byte;
    ruangan                 :integer;
    end;

    dataorganisasi          =record
    nama                    :string[26];
    kode                    :byte;
    info                    :string[66];
    ikut                    :boolean;
    checkdata               :boolean;
    end;

    daftarbarang            =record
    kode                    :byte;
    barang                  :string;
    ukuran                  :string;
    harga                   :real;
    end;

    riwayattransaksi        =record
    riwayat                 :real;
    nomor                   :string[9];
    barang                  :byte;
    end;

    arrayriwayatisisaldo    =array[1..100] of riwayattransaksi;
    arrayriwayatkirimsaldo  =array[1..100] of riwayattransaksi;
    arrayriwayatkoperasi    =array[1..100] of riwayattransaksi;
    
    arrayormawa             =array[1..4] of dataorganisasi;
    arrayukm                =array[1..29] of dataorganisasi;
    arraykomunitas          =array[1..5] of dataorganisasi;
    arraymatakuliah         =array[1..14] of datamatakuliah;
    arrayjadwal             =array[1..9] of datajadwal;
    arraydaftarbarang       =array[1..100] of daftarbarang;
    Hari                    =(Senin, Selasa, Rabu, Kamis, Jumat, Sabtu, Minggu);
    tanggalbulan            =1..31;

var
    check                                                                           :boolean;
    tabelinfoutama                                                                  :integer;
    nama                                                                            :string[30];
    predikat                                                                        :string[20];
    namabulan                                                                       :string;
    nim                                                                             :string[9];
    i, j, k, jarakx, jaraky, spasiinput, n, m, totalmatkul                          :integer;
    menuinformasiukm, data_ke, totaldatatabel, n_ukm, n_ormawa, n_komunitas         :integer;
    totalsks, sks1, sks2, n_matkul                                                  :integer;  
    mutu, totalmutu, mutu1, mutu2, totalip, ip1, ip2, ketkemajuanstudi              :real;
    pilihan, pilihan1, pilihan3, pilihan4, pilihan5, pilihan6                       :integer;
    b_awal, b_akhir, l, x, y, tahun, bul, pilihopsikalender                         :integer;
    s, geser                                                                        :integer;
    menuinformasikemahasiswaan, menupendaftaran                                     :integer;
    biayaadmin                                                                      :real;
    isisaldo, kirimsaldo, saldo                                                     :real;
    jumlahtransaksiisisaldo                                                         :integer;
    jumlahtransaksikirimsaldo                                                       :integer;
    jumlahtransaksikoperasi                                                         :integer;
    jumlahpesanan,banyakbarang                                                      :integer;
    hargabarang, totalharga                                                         :real;
    konfirmasi                                                                      :char;

    matakuliah                                                                      :arraymatakuliah;
    jadwal                                                                          :arrayjadwal;
    ormawa                                                                          :arrayormawa;
    ukm                                                                             :arrayukm;
    komunitas                                                                       :arraykomunitas;
    riwayatisisaldo                                                                 :arrayriwayatisisaldo;
    riwayatkirimsaldo                                                               :arrayriwayatkirimsaldo;
    riwayatkoperasi                                                                 :arrayriwayatkoperasi;
    barangkoperasi                                                                  :arraydaftarbarang;
    infohari, hariawalagustus2021, hariawaljanuari2022, hariawalmei2022             :hari;
    tanggal                                                                         :tanggalbulan;


{Program Menu 1 : Daftar Nilai}
procedure informasimatakuliah(var data: arraymatakuliah);
    begin
        data[1].nama       := 'Aljabar Linier';
        data[1].kode       := 'K203301';
        data[1].sks        := 3;
        data[1].praktikum  := false;
        
        data[2].nama       := 'Bahasa Inggris I';
        data[2].kode       := 'K203501';
        data[2].sks        := 2;
        data[2].praktikum  := false;
        
        data[3].nama       := 'Kalkulus';
        data[3].kode       := 'K203302';
        data[3].sks        := 3;
        data[3].praktikum  := false;
        
        data[4].nama       := 'Metode Statistika I';
        data[4].kode       := 'K203303';
        data[4].sks        := 3;
        data[4].praktikum  := true;
        
        data[5].nama       := 'Pendidikan Agama';
        data[5].kode       := 'K200101x';
        data[5].sks        := 3;
        data[5].praktikum  := false;
        
        data[6].nama       := 'Pengantar Demografi';
        data[6].kode       := 'K200201x';
        data[6].sks        := 3;
        data[6].praktikum  := false;
        
        data[7].nama       := 'Pengantar Teknologi Informasi';
        data[7].kode       := 'K200203x';
        data[7].sks        := 3;
        data[7].praktikum  := false;

        data[8].nama       := 'Algoritma dan Pemrograman';
        data[8].kode       := 'K203302';
        data[8].sks        := 3;
        data[8].praktikum  := true;

        data[9].nama       := 'Analisis Data Eksploratif';
        data[9].kode       := 'K203305';
        data[9].sks        := 3;
        data[9].praktikum  := true;

        data[10].nama      := 'Bahasa Indonesia';
        data[10].kode      := 'K200103';
        data[10].sks       := 3;
        data[10].praktikum := false;

        data[11].nama      := 'Bahasa Inggris II';
        data[11].kode      := 'K203502';
        data[11].sks       := 2;
        data[11].praktikum := false;

        data[12].nama      := 'Matematika Diskrit';
        data[12].kode      := 'K203306';
        data[12].sks       := 3;
        data[12].praktikum := false;

        data[13].nama      := 'Pengantar Ekonomi';
        data[13].kode      := 'K200202';
        data[13].sks       := 3;
        data[13].praktikum := false;

        data[14].nama      := 'Statistika Matematika I';
        data[14].kode      := 'K203307';
        data[14].sks       := 3;
        data[14].praktikum := false;
    end;

procedure penilaiannilaiangka(var data: arraymatakuliah);
    begin
        with data[i] do
            begin
                if praktikum = true then
                    nilaiangka := nilaitugas*0.1 + nilaiuts*0.3 + nilaiuas*0.3 + nilaipraktikum*0.3
                else
                    nilaiangka := nilaitugas*0.3 + nilaiuts*0.35 + nilaiuas*0.35;
            end;
    end;

procedure penilaiannilaihuruf(var data: arraymatakuliah);
    begin
        with data[i] do
            begin
                if (nilaitugas = 0) or (nilaiuts = 0) or (nilaiuas = 0) then
                    nilaihuruf:='E'
                else
                    begin
                        if (nilaiangka>=85) and (nilaiangka<=100) then
                            nilaihuruf:='A'
                        else if (nilaiangka>=80) and (nilaiangka<=84.9) then
                            nilaihuruf:='A-'
                        else if (nilaiangka>=75) and (nilaiangka<=79.9) then
                            nilaihuruf:='B+'
                        else if (nilaiangka>=70) and (nilaiangka<=74.9) then
                            nilaihuruf:='B'
                        else if (nilaiangka>=65) and (nilaiangka<=69.9) then
                            nilaihuruf:='C+'
                        else if (nilaiangka>=60) and (nilaiangka<=64.9) then
                            nilaihuruf:='C'
                        else if (nilaiangka>=55) and (nilaiangka<=59.9) then
                            nilaihuruf:='D+'
                        else if (nilaiangka < 55) then
                            nilaihuruf:='D';
                    end;
                case nilaihuruf of
                   'A' : bobotnilai := 4;
                   'A-': bobotnilai := 3.75;
                   'B+': bobotnilai := 3.50;
                   'B' : bobotnilai := 3;
                   'C+': bobotnilai := 2.50;
                   'C' : bobotnilai := 2;
                   'D+': bobotnilai := 1.50;
                   'D' : bobotnilai := 1;
                   'E' : bobotnilai := 0;
                end;
        end;
    end;

procedure tabelinput(var data: arraymatakuliah; s: integer);
    begin
        clrscr;
        informasimatakuliah(matakuliah);
        writeln;
        writeln;
        writeln;
        writeln('          |===============================|=====|=========|=========|=========|===========|=========|=======|');
        writeln('          |          Mata Kuliah          | SKS |  Nilai  |  Nilai  |  Nilai  |   Nilai   |  Nilai  | Nilai |');
        writeln('          |                               |     |  Tugas  |   UTS   |   UAS   | Praktikum |  Angka  | Huruf |');
        writeln('          |===============================|=====|=========|=========|=========|===========|=========|=======|');
        if pilihan1 = 1 then
            x:=0
        else if pilihan1 = 2 then
            x:=7;
        for i:=1+x to 7+x do
            begin
                s:=s+1;
                writeln('          |                               |     |         |         |         |           |         |       |');
                if (i=7+x) then
                    begin
                        writeln('          |_______________________________|_____|_________|_________|_________|___________|_________|_______|');
                    end
                else
                    begin
                        writeln('          |-------------------------------|-----|---------|---------|---------|-----------|---------|-------|');
                    end;
                gotoxy(13, 6+2*s); writeln(data[i].nama);
                gotoxy(46, 6+2*s); writeln(data[i].sks);
                if data[i].praktikum = false then
                    begin
                        gotoxy(80, 6+2*s); textbackground(red); writeln('     -     ');
                    end;
                textbackground(lightgray);
                writeln;
            end;
        writeln('          |                               |     |                                                   |       |');
        writeln('          |             Total             |     |        Indeks Prestasi Semester (IPS)             |       |');
        writeln('          |_______________________________|_____|___________________________________________________|_______|');
    end;

procedure input(var data: arraymatakuliah; s:integer; var k:integer; var totsks:integer; var totmutu, totip:real);
    begin
        k:=0;
        totsks:=0;
        totmutu:=0;
        totip:=0;
        tabelinput(matakuliah, spasiinput);
        for i:=1+x to 7+x do
            begin
                with data[i] do
                    begin
                        s:=s+1;
                        gotoxy(11,27); writeln('Masukkan Nilai Tugas ', nama,'!', '':length(nama));
                        repeat
                            gotoxy(53, 6+2*s); writeln('      | ');
                            gotoxy(53, 6+2*s); readln(nilaitugas);
                        until (nilaitugas>=0) and (nilaitugas<=100);

                        gotoxy(11,27); writeln('Masukkan Nilai UTS ', nama,'!', '':length(nama));
                        repeat
                            gotoxy(63, 6+2*s); writeln('      | ');
                            gotoxy(63, 6+2*s); readln(nilaiuts);
                        until (nilaiuts>=0) and (nilaiuts<=100);

                        gotoxy(11,27); writeln('Masukkan Nilai UAS ', nama,'!', '':length(nama));
                        repeat
                            gotoxy(73, 6+2*s); writeln('      |');
                            if praktikum = false then
                                begin
                                    gotoxy(80, 6+2*s); textbackground(red); writeln('     -     ');
                                end
                            else if praktikum = false then
                                begin
                                    gotoxy(81, 6+2*s); writeln(' ');
                                end;
                            textbackground(lightgray);
                            gotoxy(73, 6+2*s); readln(nilaiuas);
                        until (nilaiuas>=0) and (nilaiuas<=100);

                        if praktikum = true then
                            begin
                                gotoxy(11,27); writeln('Masukkan Nilai Praktikum ', nama,'!', '':length(nama));
                                repeat
                                    gotoxy(81, 6+2*s); writeln('          | ');
                                    gotoxy(84, 6+2*s); readln(nilaipraktikum);
                                until (nilaipraktikum>=0) and (nilaipraktikum<=100);
                            end;
                        penilaiannilaiangka(matakuliah);
                        penilaiannilaihuruf(matakuliah);
                        gotoxy(94, 6+2*s); writeln(nilaiangka:6:2);
                        gotoxy(105, 6+2*s); writeln(nilaihuruf);
                        mutu      := sks * bobotnilai;
                        totmutu   := totmutu + mutu;
                        totsks    := totsks + sks;
                        totip     := totmutu/totsks;
                        gotoxy(45, 23); writeln(totsks:3);
                        gotoxy(104, 23); writeln(totip:4:2);
                        k:=k+1;
                    end;
            end;
        writeln;
        writeln;
        gotoxy(11,27); writeln('Data berhasil dimasukkan. Ketuk untuk kembali!');
        readln;
    end;

procedure predikatmahasiswa(var data: arraymatakuliah; var totip:real);
    begin
        if (totip>=2.50) and (totip<=2.99) then
            predikat := 'Memuaskan'
        else if (totip>=3) and (totip<=3.49) then
            predikat := 'Sangat Memuaskan'
        else if (totip>=3.50) and (totip<=4) then
            begin
                with data[i] do
                    begin
                        if nilaiangka<=69.9 then
                            predikat := 'Dengan Pujian'
                        else
                            predikat := 'Sangat Memuaskan';
                    end;
            end
        else if (totip<2.50) then
            predikat := ' - ';
    end;

procedure kemajuanstudi(var data: arraymatakuliah; k1, k2 :integer; s :integer; totsks1, totsks2:integer; totmutu1, totmutu2, totip1, totip2:real);
    begin
        clrscr;
        writeln;
        writeln('          |===============================|=====|=========|=========|=========|===========|=========|=======|');
        writeln('          |          Mata Kuliah          | SKS |  Nilai  |  Nilai  |  Nilai  |   Nilai   |  Nilai  | Nilai |');
        writeln('          |                               |     |  Tugas  |   UTS   |   UAS   | Praktikum |  Angka  | Huruf |');
        writeln('          |_______________________________|_____|_________|_________|_________|___________|_________|_______|');
        for i:=1 to 7 do
            begin
                s:=s+1;
                writeln('          |                               |     |         |         |         |           |         |       |');
                if (i=7) then
                    begin
                        writeln('          |_______________________________|_____|_________|_________|_________|___________|_________|_______|');
                    end;
                gotoxy(13, 5+s); writeln(data[i].nama);
                gotoxy(46, 5+s); writeln(data[i].sks);
                gotoxy(52, 5+s); writeln(data[i].nilaitugas:6:2);
                gotoxy(62, 5+s); writeln(data[i].nilaiuts:6:2);
                gotoxy(72, 5+s); writeln(data[i].nilaiuas:6:2);
                if data[i].praktikum = false then
                    begin
                        gotoxy(80, 5+s); writeln('     -     ');
                    end
                else if data[i].praktikum = true then
                    begin
                        gotoxy(83, 5+s); writeln(data[i].nilaipraktikum:6:2);
                    end;
                gotoxy(94, 5+s); writeln(data[i].nilaiangka:6:2);
                gotoxy(105, 5+s); writeln(data[i].nilaihuruf);
            end;
        writeln;
        writeln('          |                               |     |                                                   |       |');
        writeln('          |             Total             |     |        Indeks Prestasi Semester (IPS)             |       |         ');
        writeln('          |_______________________________|_____|___________________________________________________|_______|');
        gotoxy(45, 8+s); writeln(totsks1:3);
        gotoxy(104, 8+s); writeln(totip1:4:2);
        writeln;
        for i:=8 to 14 do
            begin
                s:=s+1;
                writeln('          |                               |     |         |         |         |           |         |       |');
                if (i=14) then
                    begin
                        writeln('          |_______________________________|_____|_________|_________|_________|___________|_________|_______|');
                    end;
                gotoxy(13, 9+s); writeln(data[i].nama);
                gotoxy(46, 9+s); writeln(data[i].sks);
                gotoxy(52, 9+s); writeln(data[i].nilaitugas:6:2);
                gotoxy(62, 9+s); writeln(data[i].nilaiuts:6:2);
                gotoxy(72, 9+s); writeln(data[i].nilaiuas:6:2);
                if data[i].praktikum = false then
                    begin
                        gotoxy(80, 9+s); writeln('     -     ');
                    end
                else if data[i].praktikum = true then
                    begin
                        gotoxy(83, 9+s); writeln(data[i].nilaipraktikum:6:2);
                    end;
                gotoxy(94, 9+s); writeln(data[i].nilaiangka:6:2);
                gotoxy(105, 9+s); writeln(data[i].nilaihuruf);
            end;
        writeln;
        writeln('          |                               |     |                                                   |       |');
        writeln('          |             Total             |     |        Indeks Prestasi Semester (IPS)             |       |         ');
        writeln('          |_______________________________|_____|___________________________________________________|_______|');
        gotoxy(45, 12+s); writeln(totsks2:3);
        gotoxy(104, 12+s); writeln(totip2:4:2);
        writeln;

        if (totsks1 = 0) and (totsks2 = 0) then
            begin
                writeln('           Anda belum memasukkan Nilai Semester 1 dan Nilai Semester 2 anda.');
                write('           Masukkan Nilai Semester 1 dan Nilai Semester 2 anda untuk mendapatkan informasi kemajuan studi anda!');
            end
        else if (totsks1 = 0) then
            begin
                writeln('           Anda belum memasukkan Nilai Semester 1 anda.');
                write('           Masukkan Nilai Semester 1 anda untuk mendapatkan informasi kemajuan studi anda!');
            end
        else if (totsks2 = 0) then
            begin
                writeln('           Anda belum memasukkan Nilai Semester 2 anda.');
                write('           Masukkan Nilai Semester 2 anda untuk mendapatkan informasi kemajuan studi anda!');
            end
        else if (totip1>totip2) then
            writeln(' Indeks Prestasi Semester 1 anda lebih baik dibandingkan Indeks Prestasi Semester 2.')
        else if (totip1<totip2) then
            writeln(' Indeks Prestasi Semester 2 anda lebih baik dibandingkan Indeks Prestasi Semester 1.');

        if (totsks1 <> 0) and (totsks2 <> 0) then
            begin
                if totip1>totip2 then
                    begin
                        ketkemajuanstudi := (totip1-totip2)/totip1;
                        write(' Indeks Prestasi Semester 2 anda mengalami penurunan sebesar ', ketkemajuanstudi * 100:0:2, '% atau ', totip1-totip2:0:2, ' lebih rendah dibandingkan Semester 1.');
                    end
                else if totip1<totip2 then
                    begin
                        ketkemajuanstudi := (totip2-totip1)/totip1;
                        write(' Indeks Prestasi Semester 2 anda mengalami peningkatan sebesar ', ketkemajuanstudi * 100:0:2, '% atau ', totip2-totip1:0:2, ' lebih tinggi dibandingkan Semester 1.');
                    end;
            end;
        readkey;
    end;

procedure transkripnilai(var data: arraymatakuliah; s:integer; jumlahmatkul:integer; totsks:integer; totmutu, totip:real);
    begin
        clrscr;
        n_matkul:=1;
        if jumlahmatkul = 14 then
            begin
                x:=0;
                n_matkul:=jumlahmatkul;
            end
        else if jumlahmatkul <> 0 then
            begin
                n_matkul:=jumlahmatkul;
            end;
        writeln;
        writeln('           Nama : ', nama);
        writeln('           NIM  : ', nim);
        writeln('          |====|=============|===============================|=====|=========|=======|=======|===============|');
        writeln('          | No |    Kode     |              Nama             | SKS |  Nilai  | Nilai | Bobot |  Nilai Mutu   |');
        writeln('          |    | Mata Kuliah |          Mata Kuliah          |     |  Angka  | Huruf |       | (SKS x Bobot) |');
        writeln('          |====|=============|===============================|=====|=========|=======|=======|===============|');
        for i:=1 to n_matkul do
            begin
                s:=s+1;
                writeln('          |    |             |                               |     |         |       |       |               |');
                gotoxy(13, 7+s); writeln(i:2);
                gotoxy(20, 7+s); writeln(data[i+x].kode);
                gotoxy(32, 7+s); writeln(data[i+x].nama);
                gotoxy(65, 7+s); writeln(data[i+x].sks);
                gotoxy(71, 7+s); writeln(data[i+x].nilaiangka:6:2);
                gotoxy(82, 7+s); writeln(data[i+x].nilaihuruf);
                gotoxy(89, 7+s); writeln(data[i+x].bobotnilai:4:2);
                gotoxy(100, 7+s); writeln(data[i+x].sks * data[i+x].bobotnilai:5:2);
            end;
        writeln('          |====|=============|===============================|=====|=========|=======|=======|===============|');
        writeln('          |    |             |             Total             |     |         |       |       |               |');
        writeln('          |====|=============|===============================|=====|=========|=======|=======|===============|');
        writeln;
        writeln('           Indeks Prestasi Kumulatif (IPK) : ', totip:4:2);
        predikatmahasiswa(matakuliah, totip);
        writeln('           Predikat                        : ', predikat);
        gotoxy(64, 9+s); writeln(totsks:3);
        gotoxy(99, 9+s); writeln(totmutu:6:2);
        readkey;
    end;

procedure menu1;
    begin
        repeat
            begin
                clrscr;
                totalmatkul:=n+m;
                totalsks:=sks1+sks2;
                totalmutu:=mutu1+mutu2;
                if totalmatkul <> 0 then
                    totalip:=totalmutu/totalsks;
                textcolor(blue);
                gotoxy(56,2); writeln(' ___________ ');
                gotoxy(56,3); writeln('|    _      |');
                gotoxy(56,4); writeln('|  _| |     |');
                gotoxy(56,5); writeln('| | | |  _  |');
                gotoxy(56,6); writeln('| | | |_| | |');
                gotoxy(56,7); writeln('| | | | | | |');
                gotoxy(56,8); writeln('|_|_|_|_|_|_|');
                writeln;

                textcolor(blue);
                gotoxy(30,10); writeln('||=========================================================||');
                gotoxy(30,11); writeln('||                        DAFTAR NILAI                     ||');
                gotoxy(30,12); writeln('||*********************************************************||');
                gotoxy(30,13); writeln('||                                                         ||');
                gotoxy(30,14); writeln('||*********************************************************||');
                gotoxy(30,15); writeln('||                                                         ||');
                gotoxy(30,16); writeln('||*********************************************************||');
                gotoxy(30,17); writeln('||                                                         ||');
                gotoxy(30,18); writeln('||*********************************************************||');
                gotoxy(30,19); writeln('||                                                         ||');
                gotoxy(30,20); writeln('||=========================================================||');
        
                textcolor(magenta);
                gotoxy(34,13); writeln('[1] Masukkan Nilai Semester 1');
                gotoxy(34,15); writeln('[2] Masukkan Nilai Semester 2');
                gotoxy(34,17); writeln('[3] Kemajuan Studi');
                gotoxy(34,19); writeln('[4] Transkrip Nilai');
                writeln;

                textbackground(red);
                textcolor(white);
                gotoxy(102,25); writeln('|===========|');
                gotoxy(102,26); writeln('|5          |');
                gotoxy(102,27); writeln('|  Kembali  |');
                gotoxy(102,28); writeln('|           |');
                gotoxy(102,29); writeln('|===========|');

                textbackground(lightgray);
                textcolor(black);
                gotoxy(51,24); writeln('|==================|');
                gotoxy(51,25); writeln('| Pilihan Anda :   |');
                gotoxy(51,26); writeln('|==================|');
                repeat
                    begin
                        gotoxy(68,25); writeln('  |                 ');
                        gotoxy(68,25); read(pilihan1);
                    end;
                until (pilihan1>=1) and (pilihan1<=5);

                case pilihan1 of
                    1:  input(matakuliah, spasiinput, n, sks1, mutu1, ip1);
                    2:  input(matakuliah, spasiinput, m, sks2, mutu2, ip2);
                    3:  kemajuanstudi(matakuliah, n, m, spasiinput, sks1, sks2, mutu1, mutu2, ip1, ip2);
                    4:  transkripnilai(matakuliah, spasiinput, totalmatkul, totalsks, totalmutu, totalip);
                end;
            end;
        until pilihan1 =5;
    end;


{Program Menu 2 : Jadwal Kuliah}
procedure informasijadwal(var data : arrayjadwal);
    begin
        data[1].matkul    := 'Analisis Data Eksploratif';
        data[1].singkatan := 'ADE';
        data[1].hari      := 'Senin';
        data[1].sesi      := 1;
        data[1].ruangan   := 256;

        data[2].matkul    := 'Matematika Diskrit';
        data[2].singkatan := 'MatDisk';
        data[2].hari      := 'Senin';
        data[2].sesi      := 3;
        data[2].ruangan   := 261;

        data[3].matkul    := 'Pengantar Ekonomi';
        data[3].singkatan := 'PengEko';
        data[3].hari      := 'Selasa';
        data[3].sesi      := 1;
        data[3].ruangan   := 333;

        data[4].matkul    := 'Algoritma dan Pemrograman';
        data[4].singkatan := 'Alpro';
        data[4].hari      := 'Selasa';
        data[4].sesi      := 2;
        data[4].ruangan   := 265;

        data[5].matkul    := 'Analisis Data Eksploratif (P)';
        data[5].singkatan := 'P. ADE';
        data[5].hari      := 'Rabu';
        data[5].sesi      := 2;
        data[5].ruangan   := 328;

        data[6].matkul    := 'Algoritma dan Pemrograman (P)';
        data[6].singkatan := 'P. Alpro';
        data[6].hari      := 'Rabu';
        data[6].sesi      := 3;
        data[6].ruangan   := 254;

        data[7].matkul    := 'Bahasa Indonesia';
        data[7].singkatan := 'B. Indo';
        data[7].hari      := 'Kamis';
        data[7].sesi      := 1;
        data[7].ruangan   := 253;

        data[8].matkul    := 'Bahasa Inggris II';
        data[8].singkatan := 'B. Ing II';
        data[8].hari      := 'Kamis';
        data[8].sesi      := 3;
        data[8].ruangan   := 263;

        data[9].matkul    := 'Statistika Matematika I';
        data[9].singkatan := 'StatMat I';
        data[9].hari      := 'Jumat';
        data[9].sesi      := 3;
        data[9].ruangan   := 337;
    end;

procedure program2(var data : arrayjadwal);
    begin
        clrscr;
        informasijadwal(jadwal);
        writeln;
        writeln('                           JADWAL KULIAH SEMESTER GENAP KELAS 1KS4 POLITEKNIK STATISTIKA STIS             ');
        writeln('                                                TAHUN AKADEMIK 2021/2022                                  ');
        writeln;
        writeln('              |======|=============|=============|=============|=============|=============|=============|');
        writeln('              | Sesi |    Senin    |    Selasa   |     Rabu    |    Kamis    |    Jumat    |    Sabtu    |');
        writeln('              |======|=============|=============|=============|=============|=============|=============|');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |   1  |             |             |             |             |             |             |');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |------|-------------|-------------|-------------|-------------|-------------|-------------|');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |   2  |             |             |             |             |             |             |');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |------|-------------|-------------|-------------|-------------|-------------|-------------|');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |   3  |             |             |             |             |             |             |');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |------|-------------|-------------|-------------|-------------|-------------|-------------|');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |   4  |             |             |             |             |             |             |');
        writeln('              |      |             |             |             |             |             |             |');
        writeln('              |======|=============|=============|=============|=============|=============|=============|');
        
        for i:=1 to 9 do
            begin
                with data[i] do
                    begin
                        case sesi of
                            1:          jaraky:=0;
                            2:          jaraky:=1;
                            3:          jaraky:=2;
                            4:          jaraky:=3;
                        end;
                        case hari of
                            'Senin' :   jarakx:=0;
                            'Selasa':   jarakx:=1;
                            'Rabu'  :   jarakx:=2;
                            'Kamis' :   jarakx:=3;
                            'Jumat' :   jarakx:=4;
                            'Sabtu' :   jarakx:=5;
                        end;
                        gotoxy(29+14*jarakx - length(singkatan) div 2, 9+4*jaraky); writeln(singkatan);
                        gotoxy(24+14*jarakx, 10+4*jaraky); writeln('Ruang : ', ruangan);
                end;
            end;
            gotoxy(15,28); writeln('Jadwal kuliah telah ditampilkan. Ketuk untuk kembali!');
            readln;
        end;

procedure menu2;
    begin
        program2(jadwal);
    end;



{Program Menu 3 : Kalender Akademik}
procedure bulan;
   begin
      case bul of
         1, 13: begin
               tahun:=2021;
               namabulan:='Agustus';
               tanggal:=31;
            end;
         2, 14: begin
               namabulan:='September';
               tanggal:=30;
            end;
         3: begin
               namabulan:='Oktober';
               tanggal:=31;
            end;
         4: begin
               namabulan:='November';
               tanggal:=30;
            end;
         5: begin
               namabulan:='Desember';
               tanggal:=31;
            end;
         6: begin
               tahun:=2022;
               namabulan:='Januari';
               tanggal:=31;
            end;
         7: begin
               namabulan:='Februari';
               tanggal:=28;
               end;
         8: begin
               namabulan:='Maret';
               tanggal:=31;
            end;
         9: begin
               namabulan:='April';
               tanggal:=30;
            end;
         10: begin
               namabulan:='Mei';
               tanggal:=31;
            end;
         11: begin
               namabulan:='Juni';
               tanggal:=30;
            end;
         12: begin
               namabulan:='Juli';
               tanggal:=31;
            end;
         end;
      end;

procedure harikalender;
   begin
      s:=0;
      for infohari:=Senin to Minggu do
         begin
            gotoxy(3,7+2*s); writeln(infohari);
            s:=s+1;
         end;
   end;

procedure tandakalender;
   begin
      case bul of
         1: begin {Agustus 2021}
               case j of
                  1,7,8,14,21,28,29          :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  2,9,12,16,18               :  begin
                                                   textbackground(lightgray);
                                                   textcolor(black);
                                                end;
                  11,17                      :  begin
                                                   textbackground(lightgray);
                                                   textcolor(lightred);
                                                end;
                  13                         :  begin
                                                   textbackground(black);
                                                   textcolor(lightgray);
                                                end;
                  23                         :  begin
                                                   textbackground(cyan);
                                                   textcolor(black);
                                                end;
                  24,30                      :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
               end;
            end;
         2: begin {September 2021}
               case j of
                  1,6,13,20,27               :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  4,11,18,25                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
               end;
            end;
         3: begin {Oktober 2021}
               case j of
                  1,4,25                     :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  2,9,16,23,30               :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  11                         :  begin
                                                   textbackground(green);
                                                   textcolor(magenta);
                                                end;
                  18,21                      :  begin
                                                   textcolor(black);
                                                   textbackground(green);
                                                end;
                  20                         :  begin
                                                   textcolor(lightred);
                                                   textbackground(green);
                                                end;
               end;
            end;
         4: begin {November 2021}
               case j of
                  1,8,15,22,29               :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  6,13,20,27                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
               end;
            end;
         5: begin {Desember 2021}
               case j of
                  1,6                        :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  4,11,18,26                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  13,20                      :  begin
                                                   textbackground(green);
                                                   textcolor(black);
                                                end;
                  10                         :  begin
                                                   textbackground(yellow);
                                                   textcolor(cyan);
                                                end;
                  25                         :  begin
                                                   textcolor(lightred);
                                                   textbackground(red);
                                                end;
                  27                         :  begin
                                                   textbackground(lightgray);
                                                   textcolor(black);
                                                end;
               end;
            end;
         6: begin {Januari 2022}
               case j of
                  1                          :  begin
                                                   textbackground(red);
                                                   textcolor(lightred);
                                                end;
                  2,8,15,22,29               :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  3,10,17,20,24              :  begin
                                                   textbackground(lightgray);
                                                   textcolor(black);
                                                end;
                  7                          :  begin
                                                   textbackground(blue);
                                                   textcolor(black);
                                                end;
                  14                         :  begin
                                                   textbackground(magenta);
                                                   textcolor(black);
                                                end;
                  19                         :  begin
                                                   textbackground(black);
                                                   textcolor(lightgray);
                                                end;
                  31                         :  begin
                                                   textbackground(lightgray);
                                                   textcolor(blue);
                                                end;
               end;
            end;
         7: begin {Februari 2022}
               case j of
                  1,7                        :  begin
                                                   textbackground(lightgray);
                                                   textcolor(blue);
                                                end;
                  5,19,26                    :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  12                         :  begin
                                                   textbackground(red);
                                                   textcolor(blue);
                                                end;
                  13                         :  begin
                                                   textbackground(red);
                                                   textcolor(green);
                                                end;
                  14                         :  begin
                                                   textbackground(cyan);
                                                   textcolor(black);
                                                end;
                  15,21,28                   :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
               end;
            end;
         8: begin {Maret 2022}
               case j of
                  1,3                        :  begin
                                                   textbackground(yellow);
                                                   textcolor(lightred);
                                                end;
                  2,4,7,14,28                :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  5,12,19,26                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  21                         :  begin
                                                   textbackground(yellow);
                                                   textcolor(magenta);
                                                end;
               end;
            end;
         9: begin {April 2022}
               case j of
                  1,18,25                    :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  2,9,16,23,30               :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  4,11                       :  begin
                                                   textbackground(green);
                                                   textcolor(black);
                                                end;
                  15                         :  begin
                                                   textbackground(yellow);
                                                   textcolor(lightred);
                                                end;
               end;
            end;
         10: begin {Mei 2022}
               case j of
                  1                          :  begin
                                                   textbackground(red);
                                                   textcolor(lightred);
                                                end;
                  2                          :  begin
                                                   textbackground(lightgray);
                                                   textcolor(lightred);
                                                end;
                  7,14,21,28                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  9,17,18,19,20,23,25,27,30  :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  16,26                      :  begin
                                                   textbackground(yellow);
                                                   textcolor(lightred);
                                                end;
               end;
            end;
         11: begin {Juni 2022}
               case j of
                  1                          :  begin
                                                   textbackground(yellow);
                                                   textcolor(lightred);
                                                end;
                  2,6                        :  begin
                                                   textbackground(yellow);
                                                   textcolor(black);
                                                end;
                  4,11,18,25                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  13                         :  begin
                                                   textbackground(green);
                                                   textcolor(black);
                                                end;
                  20                         :  begin
                                                   textbackground(green);
                                                   textcolor(lightcyan);
                                                end;
                  27                         :  begin
                                                   textbackground(lightgray);
                                                   textcolor(lightmagenta);
                                                end;
               end;
            end;
         12: begin {Juli 2022}
               case j of
                  1                          :  begin
                                                   textbackground(lightgray);
                                                   textcolor(lightmagenta);
                                                end;
                  2,9,16,23,31               :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  4,11,18,25                 :  begin
                                                   textbackground(lightgray);
                                                   textcolor(lightmagenta);
                                                end;
                  8                          :  begin
                                                   textbackground(blue);
                                                   textcolor(lightmagenta);
                                                end;
                  15                         :  begin
                                                   textbackground(magenta);
                                                   textcolor(lightmagenta);
                                                end;
                  30                         :  begin
                                                   textbackground(red);
                                                   textcolor(lightred);
                                                end;
               end;
            end;
         13: begin {Agustus 2022}
               case j of
                  1,8                        :  begin
                                                   textbackground(lightgray);
                                                   textcolor(blue);
                                                end;
                  6,13,21,28                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  15                         :  begin
                                                   textbackground(lightgray);
                                                   textcolor(brown);
                                                end;
                  16,18,23,29                :  begin
                                                   textbackground(lightgray);
                                                   textcolor(black);
                                                end;
                  17                         :  begin
                                                   textbackground(lightgray);
                                                   textcolor(lightred);
                                                end;
                  22                         :  begin
                                                   textbackground(cyan);
                                                   textcolor(black);
                                                end;
               end;
            end;
         14: begin {September 2022}
               case j of
                  1                          :  begin
                                                   textbackground(lightgray);
                                                   textcolor(black);
                                                end;
                  3                          :  begin
                                                   textbackground(red);
                                                   textcolor(yellow);
                                                end;
                  4,10,17,24                 :  begin
                                                   textbackground(red);
                                                   textcolor(black);
                                                end;
                  5,12,19,26                 :  begin
                                                   textbackground(lightgray);
                                                   textcolor(black);
                                                end;
               end;
            end;
      end;
   end;

procedure tanggalkalender;
   begin
      if (bul = b_awal) then
            geser:=0;
      for j:=1 to tanggal do
         begin
            tandakalender;
            if x=7 then
               begin
                  x:=0;
                  writeln;
                  geser:=geser+3;
               end;
            gotoxy(10+geser,7+2*x); writeln(j:2);
            x:=x+1;
            if (j=tanggal) and (x<>7) then
                  geser:=geser+3;
         end;
   end;


procedure tabel1;
   begin
      clrscr;
      textbackground(lightgray);
      textcolor(black);
      gotoxy(2,2);   writeln('|======|=============================================================================|');
      gotoxy(2,3);   writeln('|      |                                     2021                                    |');
      gotoxy(2,4);   writeln('|      |=================|==============|==============|==============|==============|');
      gotoxy(2,5);   writeln('|      |     Agustus     |   September  |    Oktober   |   November   |   Desember   |');
      gotoxy(2,6);   writeln('|======|=================|==============|==============|==============|==============|');
      gotoxy(2,7);   writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,8);   writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,9);   writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,10);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,11);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,12);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,13);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,14);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,15);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,16);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,17);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,18);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,19);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,20);  writeln('|======|=================|==============|==============|==============|==============|');
   end;

procedure tabel2;
   begin
      clrscr;
      textbackground(lightgray);
      textcolor(black);
      gotoxy(2,2);  writeln('|======|==============================================================|');
      gotoxy(2,3);  writeln('|      |                             2022                             |');
      gotoxy(2,4);  writeln('|      |=================|==============|==============|==============|');
      gotoxy(2,5);  writeln('|      |     Januari     |   Februari   |     Maret    |     April    |');
      gotoxy(2,6);  writeln('|======|=================|==============|==============|==============|');
      gotoxy(2,7);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,8);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,9);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,10); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,11); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,12); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,13); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,14); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,15); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,16); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,17); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,18); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,19); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,20); writeln('|======|=================|==============|==============|==============|');
   end;

procedure tabel3;
   begin
      clrscr;
      textbackground(lightgray);
      textcolor(black);
      gotoxy(2,2);  writeln('|======|=============================================================================|');
      gotoxy(2,3);  writeln('|      |                                     2022                                    |');
      gotoxy(2,4);  writeln('|      |=================|==============|==============|==============|==============|');
      gotoxy(2,5);  writeln('|      |       Mei       |     Juni     |     Juli     |    Agustus   |   September  |');
      gotoxy(2,6);  writeln('|======|=================|==============|==============|==============|==============|');
      gotoxy(2,7);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,8);  writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,9);  writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,10); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,11); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,12); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,13); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,14); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,15); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,16); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,17); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,18); writeln('|------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|');
      gotoxy(2,19); writeln('|      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |');
      gotoxy(2,20); writeln('|======|=================|==============|==============|==============|==============|');
   end;

procedure pembuatankalender;
    begin
        textbackground(lightgray);
        textcolor(black);
        gotoxy(27,1); writeln('KALENDER AKADEMIK POLITEKNIK STATISTIKA STIS TAHUN AKADEMIK 2021/2022');
        textbackground(lightgray);
        textcolor(black);
        for bul:=b_awal to b_akhir do
            begin
                bulan;
                tanggalkalender;
            end;
        textbackground(lightgray);
        textcolor(black);
        gotoxy(70,22); writeln('|==============|=|');
        gotoxy(70,23); writeln('|              | |');
        gotoxy(70,24); writeln('|              | |');
        gotoxy(70,25); writeln('|0. Kembali    |X|');
        gotoxy(70,26); writeln('|______________|_|');
        case pilihan3 of
            1:  begin
                    gotoxy(99,29); textcolor(darkgray); writeln('|Prev|');
                    gotoxy(105,29); textcolor(white); textbackground(cyan); writeln('|1|');
                    gotoxy(108,29); textcolor(black); textbackground(lightgray); writeln('|2||3|');
                    gotoxy(114,29); writeln('|Next|');
                    gotoxy(71,24); writeln('2. Selanjutnya|>');
                    repeat
                        gotoxy(70,28); writeln('                ');
                        gotoxy(86,28); textbackground(lightgray); writeln('                                   ');
                        textbackground(lightgray);
                        gotoxy(70,27); writeln('|                |');
                        gotoxy(70,28); writeln('|Pilihan Anda :  |');
                        gotoxy(70,29); writeln('|================|');
                        gotoxy(86,28); readln(pilihopsikalender);
                    until (pilihopsikalender=0) or (pilihopsikalender=1) or (pilihopsikalender=2);
                    
                    if pilihopsikalender = 2 then
                        pilihan3 := pilihan3+1
                    else if pilihopsikalender = 0 then
                        pilihan3 := 4;
                end;
            2:  begin
                    gotoxy(99,29); writeln('|Prev|');
                    gotoxy(105,29); writeln('|1|');
                    gotoxy(108,29); textcolor(white); textbackground(cyan); writeln('|2|');
                    gotoxy(111,29); textcolor(black); textbackground(lightgray); writeln('|3|');
                    gotoxy(114,29); writeln('|Next|');
                    gotoxy(71,23); writeln('1. Sebelumnya |<');
                    gotoxy(71,24); writeln('2. Selanjutnya|>');
                    repeat
                        gotoxy(70,28); writeln('                ');
                        gotoxy(86,28); textbackground(lightgray); writeln('                                   ');
                        textbackground(lightgray);
                        gotoxy(70,27); writeln('|                |');
                        gotoxy(70,28); writeln('|Pilihan Anda :  |');
                        gotoxy(70,29); writeln('|================|');
                        gotoxy(86,28); readln(pilihopsikalender);
                    until (pilihopsikalender=0) or (pilihopsikalender=1) or (pilihopsikalender=2);
                    
                    if pilihopsikalender = 1 then
                        pilihan3 := pilihan3-1
                    else if pilihopsikalender = 2 then
                        pilihan3 := pilihan3+1
                    else if pilihopsikalender = 0 then
                        pilihan3 := 4;
                end;
            3:  begin
                    gotoxy(99,29); writeln('|Prev|');
                    gotoxy(105,29); writeln('|1||2|');
                    gotoxy(111,29); textcolor(white); textbackground(cyan);  writeln('|3|');
                    gotoxy(114,29); textcolor(darkgray); textbackground(lightgray); writeln('|Next|');
                    textcolor(black); textbackground(lightgray); 
                    gotoxy(71,23); writeln('1. Sebelumnya |<');
                    repeat
                        gotoxy(70,28); writeln('                ');
                        gotoxy(86,28); textbackground(lightgray); writeln('                                   ');
                        textbackground(lightgray);
                        gotoxy(70,27); writeln('|                |');
                        gotoxy(70,28); writeln('|Pilihan Anda :  |');
                        gotoxy(70,29); writeln('|================|');
                        gotoxy(86,28); readln(pilihopsikalender);
                    until (pilihopsikalender=0) or (pilihopsikalender=1) or (pilihopsikalender=2);

                    if pilihopsikalender = 1 then
                        pilihan3 := pilihan3-1
                    else if pilihopsikalender = 0 then
                        pilihan3 := 4;
                end;
        end;
   end;

procedure legenda;
   begin
      textbackground(lightgray);
      textcolor(black);
      gotoxy(89,2); writeln('|=============================|');
      gotoxy(89,3); writeln('|           Legenda           |');
      gotoxy(89,4); writeln('|=============================|');
      for l:=1 to 23 do
         begin
            gotoxy(89,4+l);
            writeln('|                             |');
         end;
      gotoxy(89,27); writeln('|=============================|');
      

      textbackground(black);
      gotoxy(90,5); textcolor(lightgray); writeln('abc');
      textbackground(lightgray);
      textcolor(black);
      gotoxy(94,5); writeln('Rapat Dosen Semester');
      gotoxy(94,6); writeln('Gasal');
      
      textbackground(cyan);
      gotoxy(90,7); writeln('   ');
      textbackground(lightgray);
      gotoxy(94,7); writeln('Awal Tahun');
      gotoxy(94,8); writeln('Akademik/Semester');

      
      textbackground(yellow);
      gotoxy(90,9); writeln('   ');
      textbackground(lightgray);
      gotoxy(94,9); writeln('Perkuliahan');
      
      textbackground(green);
      gotoxy(90,10); writeln('   ');
      textbackground(lightgray);
      gotoxy(94,10); writeln('Ujian Semester');
      
      textbackground(lightgray);

      textcolor(magenta);
      gotoxy(90,11); writeln('abc');
      textcolor(black);
      gotoxy(94,11); writeln('Batas Akhir Pelaporan');
      gotoxy(94,12); writeln('PO Dikti');
      
      textcolor(lightred);
      gotoxy(90,13); writeln('abc');
      textcolor(black);
      gotoxy(94,13); writeln('Libur Nasional');
      
      textcolor(blue);
      gotoxy(90,14); writeln('abc');
      textcolor(black);
      gotoxy(94,14); writeln('PKL Operasional Lapangan');
      
      textcolor(lightcyan);
      gotoxy(90,15); writeln('abc');
      textcolor(black);
      gotoxy(94,15); writeln('Masa Penyelesaian ');
      gotoxy(94,16); writeln('Seminar/Sidang Skripsi/');
      gotoxy(94,17); writeln('Tugas Akhir');

      textcolor(lightmagenta);
      gotoxy(90,18); writeln('abc');
      textcolor(black);
      gotoxy(94,18); writeln('PKL + Masa Penyelesaian');
      gotoxy(94,19); writeln('Seminar/Skripsi/TA');
      
      textcolor(cyan);
      gotoxy(90,20); writeln('abc');
      textcolor(black);
      gotoxy(94,20); writeln('Akhir Kuliah Semester');
      
      textbackground(blue);
      gotoxy(90,21); writeln('   ');
      textbackground(lightgray);
      gotoxy(94,21); writeln('Batas Akhir Penyerahan');
      gotoxy(94,22); writeln('Nilai');
      
      textbackground(magenta);
      gotoxy(90,23); writeln('   ');
      textbackground(lightgray);
      textcolor(black);
      gotoxy(94,23); writeln('Pengumuman Hasil Belajar');

      textcolor(green);
      gotoxy(90,24); writeln('abc');
      textbackground(lightgray);
      textcolor(black);
      gotoxy(94,24); writeln('Batas Akhir Semester');
      
      textcolor(brown);
      gotoxy(90,25); writeln('abc');
      textcolor(black);
      gotoxy(94,25); writeln('Yudisium');

      textcolor(yellow);
      gotoxy(90,26); writeln('abc');
      textcolor(black);
      gotoxy(94,26); writeln('Wisuda');

      gotoxy(2,22); writeln('|=================================================================|');
      gotoxy(2,23); writeln('|                       Hari Libur Nasional                       |');
      case pilihan3 of
         1: y:=4;
         2: y:=5;
         3: y:=9;
      end;
      for l:=1 to ((y+1) div 2) do
         begin
            gotoxy(2,23+l);
            writeln('|                                |');
         end;
      for l:=1 to ((y+1) div 2) do
         begin
            gotoxy(35,23+l);
            writeln('|                                |');
         end;
      if (pilihan3 = 1) then
         begin
            gotoxy(3,24);
            textcolor(red);
            writeln('11 Agu 2021');
            gotoxy(15,24);
            textcolor(black);
            writeln('Tahun Baru Hijriyah');

            gotoxy(3,25);
            textcolor(red);
            writeln('17 Agu 2021');
            gotoxy(15,25);
            textcolor(black);
            writeln('HUT RI');

            gotoxy(36,24);
            textcolor(red);
            writeln('20 Okt 2021');
            gotoxy(48,24);
            textcolor(black);
            writeln('Maulid Nabi');

            gotoxy(36,25);
            textcolor(red);
            writeln('25 Des 2021');
            gotoxy(48,25);
            textcolor(black);
            writeln('Natal');
         end
      else if (pilihan3 = 2) then
         begin
            gotoxy(3,24);
            textcolor(red);
            writeln('01 Jan 2022');
            gotoxy(15,24);
            textcolor(black);
            writeln('Tahun Baru Masehi');

            gotoxy(3,25);
            textcolor(red);
            writeln('01 Feb 2022');
            gotoxy(15,25);
            textcolor(black);
            writeln('Tahun Baru Imlek');

            gotoxy(3,26);
            textcolor(red);
            writeln('01 Mar 2022');
            gotoxy(15,26);
            textcolor(black);
            writeln('Isra Miraj');

            gotoxy(36,24);
            textcolor(red);
            writeln('03 Mar 2022');
            gotoxy(48,24);
            textcolor(black);
            writeln('Hari Raya Nyepi');

            gotoxy(36,25);
            textcolor(red);
            writeln('15 Apr 2022');
            gotoxy(48,25);
            textcolor(black);
            writeln('Jumat Agung');
         end
      else if (pilihan3 = 3) then
         begin
            gotoxy(3,24);
            textcolor(red);
            writeln('01 Mei 2022');
            gotoxy(15,24);
            textcolor(black);
            writeln('Hari Buruh');

            gotoxy(3,25);
            textcolor(red);
            writeln('03 Mei 2022');
            gotoxy(15,25);
            textcolor(black);
            writeln('Idul Fitri');

            gotoxy(3,26);
            textcolor(red);
            writeln('04 Mei 2022');
            gotoxy(15,26);
            textcolor(black);
            writeln('Idul Fitri');

            gotoxy(3,27);
            textcolor(red);
            writeln('16 Mei 2022');
            gotoxy(15,27);
            textcolor(black);
            writeln('Hari Raya Waisak');

            gotoxy(3,28);
            textcolor(red);
            writeln('26 Mei 2022');
            gotoxy(15,28);
            textcolor(black);
            writeln('Kenaikan Isa Almasih');

            gotoxy(36,24);
            textcolor(red);
            writeln('01 Jun 2022');
            gotoxy(48,24);
            textcolor(black);
            writeln('Hari Lahir Pancasila');

            gotoxy(36,25);
            textcolor(red);
            writeln('10 Jul 2022');
            gotoxy(48,25);
            textcolor(black);
            writeln('Idul Adha');

            gotoxy(36,26);
            textcolor(red);
            writeln('30 Jul 2022');
            gotoxy(48,26);
            textcolor(black);
            writeln('Tahun Baru Hijriah');

            gotoxy(36,27);
            textcolor(red);
            writeln('17 Agu 2022');
            gotoxy(48,27);
            textcolor(black);
            writeln('HUT RI');
         end;
         gotoxy(2,24+(y+1) div 2); writeln('|=================================================================|');
   end;

procedure menu3;
    begin
        clrscr;
        hariawalagustus2021:=Minggu;
        hariawaljanuari2022:=Sabtu;
        hariawalmei2022:=Minggu;
        pilihan3:=1;
        repeat
            case pilihan3 of
                1:  begin
                        x:=ord(hariawalagustus2021);
                        b_awal:=1;
                        b_akhir:=5;
                        tabel1;
                        harikalender;
                        legenda;
                        pembuatankalender;
                    end;
                2:  begin
                        x:=ord(hariawaljanuari2022);
                        b_awal:=6;
                        b_akhir:=9;
                        tabel2;
                        harikalender;
                        legenda;
                        pembuatankalender;
                    end;
                3:  begin
                        x:=ord(hariawalmei2022);
                        b_awal:=10;
                        b_akhir:=14;
                        tabel3;
                        harikalender;
                        legenda;
                        pembuatankalender;
                    end;
                4:  writeln('Kembali');
            else
                writeln('Pilihan yang anda masukkan tidak tepat. Masukkan pilihan kembali!');
            end;
        until pilihan3=4;
    end;


{Program Menu 4 : Imapolsat}
procedure dataormawa(var data:arrayormawa);
    begin
        data[1].nama := 'Senat Mahasiswa';
        data[1].kode := 1;
        data[1].info := 'SEMA berperan sebagai pionir seluruh kegiatan UKM di kampus.';

        data[2].nama := 'Dewan perwakilan Mahasiswa';
        data[2].kode := 2;
        data[2].info := 'Menjadi penyalur aspirasi bagi seluruh mahasiswa kepada SEMA.';

        data[3].nama := 'Satuan Penegak Disiplin';
        data[3].kode := 3;
        data[3].info := 'Menjadi wadah untuk mengembangkan nasipnailisme dan kedisiplinan.';

        data[4].nama := 'Resimen Mahasiswa';
        data[4].kode := 4;
        data[4].info := 'Mendisiplinkan dan Membumikan peraturan terhadap Mahasiswa.';
    end;

procedure informasiormawa(var data:arrayormawa);
    begin
        clrscr;
        j:=0;
        dataormawa(ormawa);
        textcolor(blue);
        gotoxy(7,2);writeln('|------|--------------------------------|------------------------------------------------------------------|');
        gotoxy(7,3);writeln('|  No  |    Organisasi Kemahasiswaan    |                          Deskripsi                               |');
        gotoxy(7,4);writeln('|------|--------------------------------|------------------------------------------------------------------|');
        data_ke         :=1;
        totaldatatabel  :=4;
        for i:=data_ke to data_ke+totaldatatabel-1 do
            begin
                j:=j+1;
                gotoxy(7,4+j);
                textcolor(blue);
                writeln('|      |                                |                                                                  |');
                textcolor(magenta);
                gotoxy(11,4+j); writeln(j:2);
                gotoxy(16,4+j); writeln(data[i].nama);
                gotoxy(49,4+j); writeln(data[i].info);
            end;
        textcolor(blue);
        gotoxy(7,wherey);writeln('|------|--------------------------------|------------------------------------------------------------------|');
        textcolor(black);
        gotoxy(7,27); writeln('Informasi organisasi kemahasiswaan telah ditampilkan. Ketuk untuk kembali!');
        readln;
    end;

procedure dataukm(var data:arrayukm);
    begin
        data[1].nama  := 'KSR PMI';
        data[1].kode  := 1;
        data[1].info  := 'UKM yang bergerak di bidang pertolongan pertama dan kemanusiaan.';

        data[2].nama  := 'GPA Cheby';
        data[2].kode  := 2;
        data[2].info  := 'Organisasi pecinta alam yang menjadi bagian dari UKM PMKL.';

        data[3].nama  := 'Komnet';
        data[3].kode  := 3;
        data[3].info  := 'UKM pada bidang pengembangan kemampuan di bidang ilmu komputer.';

        data[4].nama  := 'Forkas';
        data[4].kode  := 4;
        data[4].info  := 'UKM yang berfokus melakukan kajian lebih mengenai ilmu statistik.';

        data[5].nama  := 'SES';
        data[5].kode  := 5;
        data[5].info  := 'UKM yang berfokus di bidang sastra dan bahasa Inggris.';

        data[6].nama  := 'Bimbel';
        data[6].kode  := 6;
        data[6].info  := 'UKM yang berfokus pada bidang akademik di lingkungan kampus.';

        data[7].nama  := 'Nihongobu';
        data[7].kode  := 7;
        data[7].info  := 'UKM yang berfokus menambah keahlian bahasa dan budaya Jepang.';

        data[8].nama  := 'Teater Antik';
        data[8].kode  := 8;
        data[8].info  := 'UKM pada bidang pengembangan bakat seni terutama teater.';

        data[9].nama  := 'XBAR';
        data[9].kode  := 9;
        data[9].info  := 'Mewadahi bakat mahasiswa di bidang musik dan band.';

        data[10].nama  := 'Exelsior';
        data[10].kode  := 10;
        data[10].info  := 'UKM yang berfokus pada bidang vokal dan orkestera.';

        data[11].nama := 'Paradise';
        data[11].kode := 11;
        data[11].info := 'UKM yang berfokus pada bidang seni tari.';

        data[12].nama := 'Rohani Islam';
        data[12].kode := 12;
        data[12].info := 'UKM pada bidang keagamaan Islam.';

        data[13].nama := 'Rohani Kristen';
        data[13].kode := 13;
        data[13].info := 'UKM pada bidang keagamaan Kristen.';

        data[14].nama := 'Rohani Hindu';
        data[14].kode := 14;
        data[14].info := 'UKM pada bidang keagamaan Hindu.';

        data[15].nama := 'Kewirausahaan';
        data[15].kode := 15;
        data[15].info := 'UKM pada bidang kewirausahaan.';

        data[16].nama := 'Media Kampus';
        data[16].kode := 16;
        data[16].info := 'Pusat kegiatan Jurnalistik Mahasiswa.';

        data[17].nama := 'Basket';
        data[17].kode := 17;
        data[17].info := 'UKM pada bidang olahraga bola basket.';

        data[18].nama := 'Futsal';
        data[18].kode := 18;
        data[18].info := 'UKM pada bidang olahraga futsal.';

        data[19].nama := 'Bulstik';
        data[19].kode := 19;
        data[19].info := 'UKM pada bidang olahraga bulutangkis.';

        data[20].nama := 'Voli';
        data[20].kode := 20;
        data[20].info := 'UKM pada bidang olahraga bola voli.';

        data[21].nama := 'Tenis Lapangan';
        data[21].kode := 21;
        data[21].info := 'UKM pada bidang olahraga tenis lapangan.';

        data[22].nama := 'Tenis Meja';
        data[22].kode := 22;
        data[22].info := 'UKM pada bidang olahraga tenis meja.';

        data[23].nama := 'Catur';
        data[23].kode := 23;
        data[23].info := 'UKM pada bidang pembinaan dan pengembangan catur.';

        data[24].nama := 'Bridge';
        data[24].kode := 24;
        data[24].info := 'UKM pada bidang olahraga permainan kartu dengan strategi.';

        data[25].nama := 'E-Sport';
        data[25].kode := 25;
        data[25].info := 'UKM olahraga berbasis game sebagai bidang kompetitif.';

        data[26].nama := 'Silat';
        data[26].kode := 26;
        data[26].info := 'UKM pada bidang beladiri pencak silat.';

        data[27].nama := 'Taekwondo';
        data[27].kode := 27;
        data[27].info := 'UKM pada bidang beladiri taekwondo.';

        data[28].nama := 'Senam';
        data[28].kode := 28;
        data[28].info := 'UKM pada bidang olahraga senam.';

        data[29].nama := 'Billiard';
        data[29].kode := 29;
        data[29].info := 'UKM pada bidang olahraga billiard.';
    end;

procedure informasiukm(var data:arrayukm);
    begin
        repeat
        begin
            clrscr;
            j:=0;
            dataukm(ukm);
            textcolor(blue);
            gotoxy(29,2);  writeln('||===========================================================||');
            gotoxy(29,3);  writeln('||             INFORMASI UNIT KEGIATAN MAHASISWA             ||');
            gotoxy(29,4);  writeln('||***********************************************************||');
            gotoxy(29,5);  writeln('||                                                           ||');
            gotoxy(29,6);  writeln('||***********************************************************||');
            gotoxy(29,7);  writeln('||                                                           ||');
            gotoxy(29,8);  writeln('||***********************************************************||');
            gotoxy(29,9);  writeln('||                                                           ||');
            gotoxy(29,10); writeln('||***********************************************************||');
            gotoxy(29,11); writeln('||                                                           ||');
            gotoxy(29,12); writeln('||***********************************************************||');
            gotoxy(29,13); writeln('||                                                           ||');
            gotoxy(29,14); writeln('||***********************************************************||');
            gotoxy(29,15); writeln('||                                                           ||');
            gotoxy(29,16); writeln('||***********************************************************||');
            gotoxy(29,17); writeln('||                                                           ||');
            gotoxy(29,18); writeln('||===========================================================||');
        
            textcolor(magenta);
            gotoxy(33,5); writeln('[1] UKM Pengabdian Masyarakat dan Kepedulian Lingkungan');
            gotoxy(33,7); writeln('[2] UKM Pendidikan dan Kebudayaan');
            gotoxy(33,9); writeln('[3] UKM Kesenian');
            gotoxy(33,11); writeln('[4] UKM Kerohanian');
            gotoxy(33,13); writeln('[5] UKM Kewirausahaan');
            gotoxy(33,15); writeln('[6] UKM Media Kampus');
            gotoxy(33,17); writeln('[7] UKM Olahraga');
            writeln;

            textbackground(red);
            textcolor(white);
            gotoxy(102,25); writeln('|===========|');
            gotoxy(102,26); writeln('|8          |');
            gotoxy(102,27); writeln('|  Kembali  |');
            gotoxy(102,28); writeln('|           |');
            gotoxy(102,29); writeln('|===========|');

            textbackground(lightgray);
            textcolor(black);
            gotoxy(51,24); writeln('|==================|');
            gotoxy(51,25); writeln('| Pilihan Anda :   |');
            gotoxy(51,26); writeln('|==================|');

            repeat
                begin
                    gotoxy(68,25); writeln('  |                 ');
                    gotoxy(68,25); readln(menuinformasiukm);
                end;
            until (menuinformasiukm>=1) and (menuinformasiukm<=8);
            case menuinformasiukm of
                1:  begin
                        data_ke         :=1;
                        totaldatatabel  :=2;
                    end;
                2:  begin
                        data_ke         :=1+2;
                        totaldatatabel  :=5;
                    end;
                3:  begin
                        data_ke         :=1+2+5;
                        totaldatatabel  :=4;
                    end;
                4:  begin
                        data_ke         :=1+2+5+4;
                        totaldatatabel  :=3;
                    end;
                5:  begin
                        data_ke         :=1+2+5+4+3;
                        totaldatatabel  :=1;
                    end;
                6:  begin
                        data_ke         :=1+2+5+4+3+1;
                        totaldatatabel  :=1;
                    end;
                7:  begin
                        data_ke         :=1+2+5+4+3+1+1;
                        totaldatatabel  :=13;
                    end;
            end;
            if (menuinformasiukm>=1) and (menuinformasiukm<=7) then
            begin
                clrscr;
                textcolor(blue);
                gotoxy(7,2);writeln('|------|----------------------------|------------------------------------------------------------------|');
                gotoxy(7,3);writeln('|  No  |   Unit Kegiatan Mahasiswa  |                          Deskripsi                               |');
                gotoxy(7,4);writeln('|------|----------------------------|------------------------------------------------------------------|');
                for i:=data_ke to data_ke+totaldatatabel-1 do
                    begin
                        j:=j+1;
                        gotoxy(7,4+j);
                        textcolor(blue);
                        writeln('|      |                            |                                                                  |');
                        textcolor(magenta);
                        gotoxy(11,4+j); writeln(j:2);
                        gotoxy(16,4+j); writeln(data[i].nama);
                        gotoxy(45,4+j); writeln(data[i].info);
                    end;
                textcolor(blue);
                gotoxy(7,wherey); writeln('|------|----------------------------|------------------------------------------------------------------|');
                textcolor(black);
                gotoxy(7,27); writeln('Informasi UKM telah ditampilkan. Ketuk untuk kembali!');
                readln;
            end;
        end;
        until menuinformasiukm = 8;
    end;

procedure datakomunitas(var data:arraykomunitas);
    begin
        data[1].nama := 'STIS Berseri';
        data[1].kode := 1;
        data[1].info := 'Komunitas sedekah harian kolektif untuk melatih empati.';

        data[2].nama := 'STIS Mengajar';
        data[2].kode := 2;
        data[2].info := 'Komunitas bidang akademik dan pengajaran terhadap anak-anak.';

        data[3].nama := 'KMNU STIS';
        data[3].kode := 3;
        data[3].info := 'Komunitas untuk menguatkan nilai-nilai Ahlussunnah Wal Jamaah.';

        data[4].nama := 'Descent STIS';
        data[4].kode := 4;
        data[4].info := 'Komunitas pengembangan bakat dan minat bidang ilmu Data Science.';

        data[5].nama := 'STIS Drawing Club';
        data[5].kode := 5;
        data[5].info := 'Komunitas bidang seni menggambar.';
    end;

procedure informasikomunitas(var data:arraykomunitas);
    begin
        clrscr;
        j:=0;
        datakomunitas(komunitas);
        textcolor(blue);
        gotoxy(7,2);writeln('|------|----------------------------|------------------------------------------------------------------|');
        gotoxy(7,3);writeln('|  No  |          Komunitas         |                          Deskripsi                               |');
        gotoxy(7,4);writeln('|------|----------------------------|------------------------------------------------------------------|');
        data_ke         :=1;
        totaldatatabel  :=5;
        for i:=data_ke to data_ke+totaldatatabel-1 do
            begin
                j:=j+1;                
                gotoxy(7,4+j);
                textcolor(blue);
                writeln('|      |                            |                                                                  |');
                textcolor(magenta);
                gotoxy(11,4+j); writeln(j:2);
                gotoxy(16,4+j); writeln(data[i].nama);
                gotoxy(45,4+j); writeln(data[i].info);
            end;
        textcolor(blue);
        gotoxy(7,wherey);writeln('|------|----------------------------|------------------------------------------------------------------|');
        textcolor(black);
        gotoxy(7,27); writeln('Informasi komunitas telah ditampilkan. Ketuk untuk kembali!');
        readln;
    end;

procedure informasiimapolstat;
    begin
        repeat
            clrscr;
            textcolor(blue);
            gotoxy(30,2);  writeln('||=========================================================||');
            gotoxy(30,3);  writeln('||           INFORMASI ORMAWA, UKM, DAN MAHASISWA          ||');
            gotoxy(30,4);  writeln('||*********************************************************||');
            gotoxy(30,5);  writeln('||                                                         ||');
            gotoxy(30,6);  writeln('||*********************************************************||');
            gotoxy(30,7);  writeln('||                                                         ||');
            gotoxy(30,8);  writeln('||*********************************************************||');
            gotoxy(30,9);  writeln('||                                                         ||');
            gotoxy(30,10); writeln('||=========================================================||');
    
            textcolor(magenta);
            gotoxy(34,5); writeln('[1] Organisasi Kemahasiswaan');
            gotoxy(34,7); writeln('[2] Unit Kegiatan Mahasiswa');
            gotoxy(34,9); writeln('[3] Komunitas');
            writeln;

            textbackground(red);
            textcolor(white);
            gotoxy(102,25); writeln('|===========|');
            gotoxy(102,26); writeln('|4          |');
            gotoxy(102,27); writeln('|  Kembali  |');
            gotoxy(102,28); writeln('|           |');
            gotoxy(102,29); writeln('|===========|');

            textbackground(lightgray);
            textcolor(black);
            gotoxy(51,24); writeln('|==================|');
            gotoxy(51,25); writeln('| Pilihan Anda :   |');
            gotoxy(51,26); writeln('|==================|');
        
            repeat
                begin
                    gotoxy(68,25); writeln('  |                 ');
                    gotoxy(68,25); readln(menuinformasikemahasiswaan);
                end;
            until (menuinformasikemahasiswaan>=1) and (menuinformasikemahasiswaan<=4);
            case menuinformasikemahasiswaan of
                1: informasiormawa(ormawa);
                2: informasiukm(ukm);
                3: informasikomunitas(komunitas);
            end;
        until menuinformasikemahasiswaan=4;
    end;

procedure pendaftaranormawa(var data:arrayormawa);
    begin
        clrscr;
        dataormawa(ormawa);
        textcolor(blue);
        gotoxy(41,2); writeln('|=============================|======|');
        gotoxy(41,3); writeln('|         Nama Ormawa         | Kode |');
        gotoxy(41,4); writeln('|=============================|======|');
        for i:=1 to 4 do
            begin
                with data[i] do
                    begin
                        checkdata:=false;
                        ikut:=false;
                        gotoxy(41,4+i); writeln('|                             |      |');
                        gotoxy(43,4+i); writeln(nama);
                        gotoxy(75,4+i); writeln(kode:2);
                    end;
            end;
        gotoxy(41,9); writeln('|=============================|======|');
        textcolor(black);
        writeln;
        repeat
            gotoxy(30,13); write('Masukkan banyak organisasi yang anda akan daftar (maksimal 2) :                          ');
            gotoxy(94,13); readln(n_ormawa);
        until (n_ormawa>=1) and (n_ormawa<=2);
        
        gotoxy(37,15); writeln('|=============================================|');
        gotoxy(37,16); writeln('|             Pendaftaraan Ormawa             |');
        gotoxy(37,17); writeln('|=============================================|');
        for i:=1 to n_ormawa do
            begin
                gotoxy(37,15+3*i); writeln('|                                             |');
                repeat
                    begin
                        gotoxy(39,15+3*i); write('Kode Ormawa =                               | ');
                        gotoxy(53,15+3*i); readln(j);
                        if (data[j].ikut = true) then
                            begin
                                gotoxy(30,19+3*i); writeln('Ormawa sudah dipilih. Pilih organisasi yang lain!          ');
                            end
                        else if (j<1) or (j>4) then
                            begin
                                gotoxy(30,19+3*i); writeln('Kode yang anda masukkan tidak tepat. Masukkan kode kembali!');
                            end;
                    end;
                until (data[j].ikut = false) and (j >= 1) and (j <= 4);
                gotoxy(30,19+3*i); writeln('                                                           ');
                gotoxy(37,16+3*i); writeln('|                                             |');
                gotoxy(39,16+3*i); writeln('Ormawa      = ', data[j].nama);
                gotoxy(37,17+3*i); writeln('|=============================================|');
                data[j].ikut:=true;
            end;
        gotoxy(30,19+3*i); writeln('Data berhasil dimasukkan. Ketuk untuk kembali!');
        readln;
    end;

procedure pendaftaranukm(var data:arrayukm);
    begin
        clrscr;
        spasiinput:=0;
        j:=0;
        dataukm(ukm);
        textcolor(blue);
        gotoxy(18,2); writeln('|====================|======|====================|======|====================|======|');
        gotoxy(18,3); writeln('|      Nama UKM      | Kode |      Nama UKM      | Kode |      Nama UKM      | Kode |');
        gotoxy(18,4); writeln('|====================|======|====================|======|====================|======|');
        for i:=1 to 10 do
            begin
                gotoxy(18,4+i); writeln('|                    |      |                    |      |                    |      |');
            end;
        for i:=1 to 29 do
            begin
                with data[i] do
                    begin
                        checkdata:=false;
                        ikut:=false;
                        if (i = 11) or (i = 21) then
                            begin
                                j:=j+28;
                                spasiinput:=0;
                            end;
                        spasiinput:=spasiinput+1;
                        gotoxy(20+j,4+spasiinput); writeln(nama);
                        gotoxy(43+j,4+spasiinput); writeln(kode:2);
                    end;
            end;
        gotoxy(18,15); writeln('|====================|======|====================|======|====================|======|');
        textcolor(black);

        repeat
            gotoxy(32,19); write('Masukkan banyak UKM yang anda akan daftar (maksimal 3) :                          ');
            gotoxy(89,19); readln(n_ukm);
        until (n_ukm>=1) and (n_ukm<=3);
        
        if (n_ukm = 1) then
            begin
                spasiinput:=2;
                jarakx:=0;
                gotoxy(46,21); writeln('|===========================|');
                gotoxy(46,22); writeln('|      Pendaftaraan UKM     |');
                gotoxy(46,23); writeln('|===========================|');
                gotoxy(46,24); writeln('|                           |');
                gotoxy(46,25); writeln('|                           |');
                gotoxy(46,26); writeln('|===========================|');
            end
        else if (n_ukm = 2) then
            begin
                spasiinput:=1;
                jarakx:=14;
                gotoxy(32,21); writeln('|=======================================================|');
                gotoxy(32,22); writeln('|                    Pendaftaraan UKM                   |');
                gotoxy(32,23); writeln('|===========================|===========================|');
                gotoxy(32,24); writeln('|                           |                           |');
                gotoxy(32,25); writeln('|                           |                           |');
                gotoxy(32,26); writeln('|===========================|===========================|');
            end
        else if (n_ukm = 3) then
            begin
                spasiinput:=1;
                jarakx:=0;
                gotoxy(18,21); writeln('|===================================================================================|');
                gotoxy(18,22); writeln('|                                  Pendaftaraan UKM                                 |');
                gotoxy(18,23); writeln('|===========================|===========================|===========================|');
                gotoxy(18,24); writeln('|                           |                           |                           |');
                gotoxy(18,25); writeln('|                           |                           |                           |');
                gotoxy(18,26); writeln('|===========================|===========================|===========================|');
            end;

        for i:=1 to n_ukm do
            begin
                repeat
                    begin
                        gotoxy(28*spasiinput-8+jarakx,24); write('Kode UKM =                | ');
                        gotoxy(28*spasiinput+3+jarakx,24); readln(j);
                        if (data[j].ikut = true) then
                            begin
                                gotoxy(32,28); writeln('UKM sudah dipilih. Pilih UKM yang lain!                    ');
                                end
                        else if (j<1) or (j>29) then
                            begin
                                gotoxy(32,28); writeln('Kode yang anda masukkan tidak tepat. Masukkan kode kembali!');
                            end;
                    end;
                until (data[j].ikut = false) and (j >= 1) and (j <= 29);
                gotoxy(32,28); writeln('                                                           ');
                gotoxy(28*spasiinput-8+jarakx,25); writeln('UKM      = ', data[j].nama);
                data[j].ikut := true;
                spasiinput := spasiinput+1;
            end;
        gotoxy(32,28); writeln('Data berhasil dimasukkan. Ketuk untuk kembali!');
        readln;
    end;

procedure pendaftarankomunitas(var data:arraykomunitas);
    begin
        clrscr;
        datakomunitas(komunitas);
        textcolor(blue);
        gotoxy(41,2); writeln('|=============================|======|');
        gotoxy(41,3); writeln('|        Nama Komunitas       | Kode |');
        gotoxy(41,4); writeln('|=============================|======|');
        for i:=1 to 5 do
            begin
                with data[i] do
                    begin
                        checkdata:=false;
                        ikut:=false;
                        gotoxy(41,4+i); writeln('|                             |      |');
                        gotoxy(43,4+i); writeln(nama);
                        gotoxy(75,4+i); writeln(kode);
                    end;
            end;
        gotoxy(41,10); writeln('|=============================|======|');
        textcolor(black);
        gotoxy(35,14); write('Jumlah komunitas yang anda dapat daftar maksimal 1.');
        n_komunitas:=1;

        gotoxy(35,16); writeln('|================================================|');
        gotoxy(35,17); writeln('|             Pendaftaraan Komunitas             |');
        gotoxy(35,18); writeln('|================================================|');
        for i:=1 to n_komunitas do
            begin
                gotoxy(35,16+3*i); writeln('|                                                |');
                repeat
                    begin
                        gotoxy(37,16+3*i); write('Kode Komunitas =                               |');
                        gotoxy(56,16+3*i); readln(j);
                        if (data[j].ikut = true) then
                            begin
                                gotoxy(30,20+3*i); writeln('        Komunitas sudah dipilih. Pilih komunitas yang lain!');
                            end
                        else if (j<1) or (j>5) then
                            begin
                                gotoxy(30,20+3*i); writeln('Kode yang anda masukkan tidak tepat. Masukkan kode kembali!');
                            end;
                    end;
                until (data[j].ikut = false) and (j >= 1) and (j <= 5);
                gotoxy(35,20+3*i); writeln('                                                           ');
                gotoxy(35,17+3*i); writeln('|                                                |');
                gotoxy(37,17+3*i); writeln('Komunitas = ', data[j].nama);
                gotoxy(35,18+3*i); writeln('|================================================|');
                data[j].ikut:=true;
            end;
        writeln;
        gotoxy(30,20+3*i); writeln('        Data berhasil dimasukkan. Ketuk untuk kembali!');
        readln;
    end;

procedure pendaftaranimapolstat;
    begin
        clrscr;
        textcolor(blue);
        gotoxy(30,2);  writeln('||=========================================================||');
        gotoxy(30,3);  writeln('||          PENDAFTARAN ORMAWA, UKM, DAN KOMUNITAS         ||');
        gotoxy(30,4);  writeln('||*********************************************************||');
        gotoxy(30,5);  writeln('||                                                         ||');
        gotoxy(30,6);  writeln('||*********************************************************||');
        gotoxy(30,7);  writeln('||                                                         ||');
        gotoxy(30,8);  writeln('||*********************************************************||');
        gotoxy(30,9);  writeln('||                                                         ||');
        gotoxy(30,10); writeln('||=========================================================||');

        textcolor(magenta);
        gotoxy(34,5); writeln('[1] Organisasi Kemahasiswaan');
        gotoxy(34,7); writeln('[2] Unit Kegiatan Mahasiswa');
        gotoxy(34,9); writeln('[3] Komunitas');
        writeln;

        textbackground(red);
        textcolor(white);
        gotoxy(102,25); writeln('|===========|');
        gotoxy(102,26); writeln('|4          |');
        gotoxy(102,27); writeln('|  Kembali  |');
        gotoxy(102,28); writeln('|           |');
        gotoxy(102,29); writeln('|===========|');

        textbackground(lightgray);
        textcolor(black);
        gotoxy(51,24); writeln('|==================|');
        gotoxy(51,25); writeln('| Pilihan Anda :   |');
        gotoxy(51,26); writeln('|==================|');
        repeat
            begin
                gotoxy(68,25); writeln('  |                 ');
                gotoxy(68,25); readln(menupendaftaran);
            end;
        until (menupendaftaran>=1) and (menupendaftaran<=4);

        case menupendaftaran of
            1: pendaftaranormawa(ormawa);
            2: pendaftaranukm(ukm);
            3: pendaftarankomunitas(komunitas);
        end;
    end;

procedure menu4;
    begin
        repeat
            clrscr;
            textbackground(lightgray);
            textcolor(cyan);
            clrscr;
            gotoxy(56,2); writeln(' ___________ ');
            gotoxy(56,3); writeln('|   _____   |');
            gotoxy(56,4); writeln('|  / /|\ \  |');
            gotoxy(56,5); writeln('|  \/ | \/  |');
            gotoxy(56,6); writeln('|  /\ | /\  |');
            gotoxy(56,7); writeln('| /  \|/  \ |');
            gotoxy(56,8); writeln('|/____|____\|');
            writeln;

            textcolor(blue);
            gotoxy(30,10); writeln('||==========================================================||');
            gotoxy(30,11); writeln('|| IKATAN MAHASISWA POLITEKNIK STATISTIKA STIS (IMAPOLSTAT) ||');
            gotoxy(30,12); writeln('||**********************************************************||');
            gotoxy(30,13); writeln('||                                                          ||');
            gotoxy(30,14); writeln('||**********************************************************||');
            gotoxy(30,15); writeln('||                                                          ||');
            gotoxy(30,16); writeln('||==========================================================||');
        
            textcolor(magenta);
            gotoxy(34,13); writeln('[1] Informasi Ormawa, UKM, dan Komunitas');
            gotoxy(34,15); writeln('[2] Pendaftaran Ormawa, UKM, dan Komunitas');
            writeln;

            textbackground(red);
            textcolor(white);
            gotoxy(102,25); writeln('|===========|');
            gotoxy(102,26); writeln('|3          |');
            gotoxy(102,27); writeln('|  Kembali  |');
            gotoxy(102,28); writeln('|           |');
            gotoxy(102,29); writeln('|===========|');

            textbackground(lightgray);
            textcolor(black);
            gotoxy(51,24); writeln('|==================|');
            gotoxy(51,25); writeln('| Pilihan Anda :   |');
            gotoxy(51,26); writeln('|==================|');
            repeat
                begin
                    gotoxy(68,25); writeln('  |                 ');
                    gotoxy(68,25); readln(pilihan4);
                end;
            until (pilihan4>=1) and (pilihan4<=3);
            
            case pilihan4 of
                1:  begin
                        informasiimapolstat; 
                    end;
                2:  begin
                        pendaftaranimapolstat;
                    end;
            end;
        until pilihan4 = 3;
    end;


{Program Menu 5 : DompetSTIS}
procedure isisaldodompetstis(var isi: arrayriwayatisisaldo; isisaldodompet:real; var totalsaldo:real; var transaksi:integer);
    begin
        clrscr;
        textcolor(black);
        gotoxy(74,2);  writeln('==============================================');
        gotoxy(74,3);  writeln('||>>>>>>>>>>>>>>> Saldo Saya <<<<<<<<<<<<<<<||'); 
        gotoxy(74,4);  writeln('==============================================');
        gotoxy(74,5);  writeln('Nama       :                                  ');
        gotoxy(74,7);  writeln('Saldo      :                                  ');
        gotoxy(74,9);  writeln('No. Dompet :                                  ');
        gotoxy(74,10); writeln('==============================================');

        textcolor(green);
        gotoxy(87,5);  writeln(nama);
        gotoxy(87,7);  writeln('Rp', saldo:0:2);
        gotoxy(96,9);  writeln(nim:23);

        textcolor(blue);
        gotoxy(30,13); writeln('||==========================================================||');
        gotoxy(30,14); writeln('||                         ISI SALDO                        ||');
        gotoxy(30,15); writeln('||**********************************************************||');
        gotoxy(30,16); writeln('||                                                          ||');
        gotoxy(30,17); writeln('||                                                          ||');
        gotoxy(30,18); writeln('||                                                          ||');
        gotoxy(30,19); writeln('||                                                          ||');
        gotoxy(30,20); writeln('||==========================================================||');

        textcolor(magenta);
        gotoxy(33,16); writeln('Masukkan jumlah saldo yang akan diisi :');
        gotoxy(33,19); writeln('Biaya Admin : 1%');
        repeat
            gotoxy(33,17); write('Rp                                                       '); textcolor(blue); writeln('||');
            textcolor(magenta);
            gotoxy(35,17); readln(isisaldodompet);
        until (isisaldodompet>=0);
        writeln;
        
        transaksi                       := transaksi+1;
        isi[transaksi].riwayat          := isisaldodompet;
        biayaadmin                      := isisaldodompet*0.01;
        totalsaldo                      := totalsaldo+isisaldodompet-biayaadmin;

        textcolor(red);
        gotoxy(32,27); writeln('Selamat proses isi saldo anda berhasil dilakukan!');
        gotoxy(32,28); writeln('Ketuk untuk kembali!');
        textcolor(green);
        gotoxy(87,7);  writeln('Rp', totalsaldo:0:2);
        textcolor(black);
        readln;
    end;

procedure kirimsaldodompetstis(var kirim: arrayriwayatkirimsaldo; kirimsaldodompet: real; var totalsaldo:real; var transaksi:integer);
    begin
        clrscr;
        textcolor(black);
        gotoxy(74,2);  writeln('==============================================');
        gotoxy(74,3);  writeln('||>>>>>>>>>>>>>>> Saldo Saya <<<<<<<<<<<<<<<||'); 
        gotoxy(74,4);  writeln('==============================================');
        gotoxy(74,5);  writeln('Nama       :                                  ');
        gotoxy(74,7);  writeln('Saldo      :                                  ');
        gotoxy(74,9);  writeln('No. Dompet :                                  ');
        gotoxy(74,10); writeln('==============================================');

        textcolor(green);
        gotoxy(87,5);  writeln(nama);
        gotoxy(87,7);  writeln('Rp', saldo:0:2);
        gotoxy(96,9);  writeln(nim:23);

        textcolor(blue);
        gotoxy(30,13); writeln('||==========================================================||');
        gotoxy(30,14); writeln('||                        KIRIM SALDO                       ||');
        gotoxy(30,15); writeln('||**********************************************************||');
        gotoxy(30,16); writeln('||                                                          ||');
        gotoxy(30,17); writeln('||                                                          ||');
        gotoxy(30,18); writeln('||                                                          ||');
        gotoxy(30,19); writeln('||                                                          ||');
        gotoxy(30,20); writeln('||                                                          ||');
        gotoxy(30,21); writeln('||==========================================================||');

        textcolor(magenta);
        gotoxy(33,16); writeln('Masukkan nomor dompet penerima :');
        gotoxy(33,19); writeln('Masukkan jumlah saldo yang akan dikirim :');
        gotoxy(33,17); readln(kirim[transaksi].nomor);
        gotoxy(33,20); write('Rp'); readln(kirimsaldodompet);
        writeln;

        if (totalsaldo < 0) or (totalsaldo < kirimsaldodompet) then
            begin
                textcolor(red);
                gotoxy(24,27); writeln('Maaf saldo anda kurang dari jumlah kirim saldo, mohon isi saldo terlebih dahulu!');
                gotoxy(24,28); writeln('Ketuk untuk kembali!');
            end
        else
            begin
                textcolor(red);
                gotoxy(24,27); writeln('Selamat proses kirim saldo anda berhasil dilakukan!');
                gotoxy(24,28); writeln('Ketuk untuk kembali!');
                transaksi                       := transaksi+1;
                kirim[transaksi].riwayat        := kirimsaldodompet;
                totalsaldo             := totalsaldo - kirimsaldodompet;

                textcolor(green);
                gotoxy(87,7);  writeln('Rp', totalsaldo:0:2);
                textcolor(black);
            end;
        readln;
    end;

procedure riwayatisisaldodompetstis(riwayatisi: arrayriwayatisisaldo; transaksi:integer);
    begin
        clrscr;
        i:=0;
        gotoxy(30,2); writeln('||==========================================================||');
        gotoxy(30,3); writeln('||                     RIWAYAT ISI SALDO                    ||');
        gotoxy(30,4); writeln('||**********************************************************||');
        if (transaksi > 0) then
            begin
                for i:=1 to transaksi do
                    begin
                        gotoxy(30,3+2*i); writeln('||                                                          ||');
                        gotoxy(34,3+2*i); write('Isi saldo ke-', i, ' : ');
                        writeln(riwayatisi[i].riwayat:0:2);
                        gotoxy(30,4+2*i); writeln('||==========================================================||');
                    end;
            end
        else if (transaksi = 0) then
            begin
                gotoxy(30,5); writeln('||==========================================================||');
            end;
        readln;
    end;

procedure riwayatkirimsaldodompetstis(riwayatkirim: arrayriwayatkirimsaldo; transaksi:integer);
    begin
        clrscr;
        i:=0;
        gotoxy(30,2); writeln('||==========================================================||');
        gotoxy(30,3); writeln('||                    RIWAYAT KIRIM SALDO                   ||');
        gotoxy(30,4); writeln('||**********************************************************||');
        if (transaksi > 0) then
            begin
                for i:=1 to transaksi do
                    begin
                        gotoxy(30,3+2*i); writeln('||                                                          ||');
                        gotoxy(30,4+2*i); writeln('||                                                          ||');
                        gotoxy(34,3+2*i); write('Kirim saldo ke-', i, '    : ');
                        writeln(riwayatkirim[i].riwayat:0:2);
                        gotoxy(34,4+2*i); write(' - Nomor Penerima ke-', i, ' : ');
                        gotoxy(30,5+2*i); writeln('||==========================================================||');
                    end;
            end
        else if (transaksi = 0) then
            begin
                gotoxy(30,5); writeln('||==========================================================||');
            end;
        readln;
    end;

procedure menu5;
    begin
        repeat
            clrscr;
            textcolor(red);
            gotoxy(56,2); writeln(' ___________ ');
            gotoxy(56,3); writeln('|   ______  |');
            gotoxy(56,4); writeln('|  /__|__/  |');
            gotoxy(56,5); writeln('|  \__|__   |');
            gotoxy(56,6); writeln('|   __|__\  |');
            gotoxy(56,7); writeln('|  /__|__/  |');
            gotoxy(56,8); writeln('|___________|');

            textcolor(black);
            gotoxy(74,2);  writeln('==============================================');
            gotoxy(74,3);  writeln('||>>>>>>>>>>>>>>> Saldo Saya <<<<<<<<<<<<<<<||'); 
            gotoxy(74,4);  writeln('==============================================');
            gotoxy(74,5);  writeln('Nama       :                                  ');
            gotoxy(74,7);  writeln('Saldo      :                                  ');
            gotoxy(74,9);  writeln('No. Dompet :                                  ');
            gotoxy(74,10); writeln('==============================================');

            textcolor(green);
            gotoxy(87,5);  writeln(nama);
            gotoxy(87,7);  writeln('Rp', saldo:0:2);
            gotoxy(96,9);  writeln(nim:23); 

            textcolor(blue);
            gotoxy(30,13); writeln('||==========================================================||');
            gotoxy(30,14); writeln('||                        DompetSTIS                        ||');
            gotoxy(30,15); writeln('||**********************************************************||');
            gotoxy(30,16); writeln('||                                                          ||');
            gotoxy(30,17); writeln('||**********************************************************||');
            gotoxy(30,18); writeln('||                                                          ||');
            gotoxy(30,19); writeln('||**********************************************************||');
            gotoxy(30,20); writeln('||                                                          ||');
            gotoxy(30,21); writeln('||**********************************************************||');
            gotoxy(30,22); writeln('||                                                          ||');
            gotoxy(30,23); writeln('||==========================================================||');
            
            textcolor(magenta);
            gotoxy(34,16); writeln('[1] Isi Saldo');
            gotoxy(34,18); writeln('[2] Kirim Saldo');
            gotoxy(34,20); writeln('[3] Riwayat Isi Saldo');
            gotoxy(34,22);  writeln('[4] Riwayat Kirim Saldo');
            writeln;

            textbackground(red);
            textcolor(white);
            gotoxy(102,25); writeln('|===========|');
            gotoxy(102,26); writeln('|5          |');
            gotoxy(102,27); writeln('|  Kembali  |');
            gotoxy(102,28); writeln('|           |');
            gotoxy(102,29); writeln('|===========|');

            textbackground(lightgray);
            textcolor(black);
            gotoxy(51,24); writeln('|==================|');
            gotoxy(51,25); writeln('| Pilihan Anda :   |');
            gotoxy(51,26); writeln('|==================|');
            repeat
                begin
                    gotoxy(68,25); writeln('  |                 ');
                    gotoxy(68,25); readln(pilihan5);
                end;
            until (pilihan5>=1) and (pilihan5<=5);
            
            case pilihan5 of
                1:  isisaldodompetstis(riwayatisisaldo, isisaldo, saldo, jumlahtransaksiisisaldo); 
                2:  kirimsaldodompetstis(riwayatkirimsaldo, kirimsaldo, saldo, jumlahtransaksikirimsaldo);
                3:  riwayatisisaldodompetstis(riwayatisisaldo, jumlahtransaksiisisaldo); 
                4:  riwayatkirimsaldodompetstis(riwayatkirimsaldo, jumlahtransaksikirimsaldo); 
            end;
        until pilihan5 = 5;
    end;

{Program Menu 6 : Koperasi}
procedure datadaftarbarang(var data: arraydaftarbarang);
    begin
        data[1].kode   := 1;
        data[1].barang := 'Seragam Atasan Perempuan';
        data[1].harga  := 80000;

        data[2].kode   := 2;
        data[2].barang := 'Seragam Bawahan Perempuan';
        data[2].harga  := 95000;

        data[3].kode   := 3;
        data[3].barang := 'Seragam Kerudung';
        data[3].harga  := 45000;

        data[4].kode   := 4;
        data[4].barang := 'Bivakmut Perempuan';
        data[4].harga  := 30000;

        data[5].kode   := 5;
        data[5].barang := 'Seragam Atasan Laki-laki';
        data[5].harga  := 80000;

        data[6].kode   := 6;
        data[6].barang := 'Seragam Bawahan Laki-laki';
        data[6].harga  := 98000;

        data[7].kode   := 7;
        data[7].barang := 'Bivakmut Laki-laki';
        data[7].harga  := 30000;

        data[8].kode   := 8;
        data[8].barang := 'Pangkat Tingkat';
        data[8].harga  := 15000;

        data[9].kode   := 9;
        data[9].barang := 'Tas';
        data[9].harga  := 90000;

        data[10].kode   := 10;
        data[10].barang := 'Sepatu Perempuan';
        data[10].harga  := 100000;

        data[11].kode   := 11;
        data[11].barang := 'Sepatu Laki-laki';
        data[11].harga  := 100000;

        data[12].kode   := 12;
        data[12].barang := 'ATK';
        data[12].harga  := 30000;
    end;

procedure belanja(var riwayat:arrayriwayatkoperasi; var data:arraydaftarbarang; var totalsaldo:real; var transaksi:integer);
    begin
        gotoxy(67,2);writeln('|------|---------|-------------------|');
        gotoxy(67,3);writeln('| Kode |  Jumlah |    Total Harga    |');
        gotoxy(67,4);writeln('|------|---------|-------------------|');
        i:=0;
        writeln;
        for i:=1 to jumlahpesanan do
            begin
                banyakbarang:=0;
                gotoxy(67,4+i); writeln('|      |         |                   |');
                gotoxy(69,4+i); readln(j);
                gotoxy(77,4+i); readln(banyakbarang);
                hargabarang:= banyakbarang*data[j].harga;
                totalharga:= totalharga+hargabarang;
                gotoxy(89,4+i); writeln(hargabarang:10:2);
            end;
        gotoxy(67,5+i); writeln('|====================================|');
        gotoxy(67,6+i); writeln('| Total Harga =                      |');
        gotoxy(67,7+i); writeln('|====================================|');
        gotoxy(83,6+i); writeln(totalharga:10:2);


        repeat
            gotoxy(67,8+i); write('Konfirmasi Pembayaran (Y/T) :   ');
            gotoxy(97,8+i); readln(konfirmasi);
        until (upcase(konfirmasi)='Y') or (upcase(konfirmasi)='T');

        if upcase(konfirmasi)= 'Y' then
        begin
        if (totalsaldo <= 0) or (totalsaldo < totalharga) then
            begin
                textcolor(red);
                gotoxy(24,27); writeln('Maaf saldo anda kurang dari total harga, mohon isi saldo terlebih dahulu!');
                gotoxy(24,28); writeln('Ketuk untuk kembali!');
            end
        else
            begin
                textcolor(red);
                gotoxy(24,27); writeln('Selamat proses kirim saldo anda berhasil dilakukan!');
                gotoxy(24,28); writeln('Ketuk untuk kembali!');
                transaksi                   := transaksi+1;
                riwayat[transaksi].riwayat  := totalharga;
                totalsaldo                  := totalsaldo - totalharga;
                textcolor(black);
            end;
        end;
    end;

procedure riwayatkoperasistis(riwayatbelanja: arrayriwayatkoperasi; transaksi:integer);
    begin
        clrscr;
        i:=0;
        gotoxy(30,2); writeln('||==========================================================||');
        gotoxy(30,3); writeln('||                      RIWAYAT BELANJA                     ||');
        gotoxy(30,4); writeln('||**********************************************************||');
        if (transaksi > 0) then
            begin
                for i:=1 to transaksi do
                    begin
                        gotoxy(30,3+2*i); writeln('||                                                          ||');
                        gotoxy(34,3+2*i); write('Belanja ke-', i, '    : ');
                        writeln(riwayatbelanja[i].riwayat:0:2);
                        gotoxy(30,4+2*i); writeln('||==========================================================||');
                    end;
            end
        else if (transaksi = 0) then
            begin
                gotoxy(30,5); writeln('||==========================================================||');
            end;
        readln;
    end;

procedure menukoperasi(var data:arraydaftarbarang);
    begin
            clrscr;
            j:=0;
            textcolor(black);
            gotoxy(2,20);  writeln('==============================================');
            gotoxy(2,21);  writeln('||>>>>>>>>>>>>>>> Saldo Saya <<<<<<<<<<<<<<<||'); 
            gotoxy(2,22);  writeln('==============================================');
            gotoxy(2,23);  writeln('Nama       :                                  ');
            gotoxy(2,24);  writeln('Saldo      :                                  ');
            gotoxy(2,25);  writeln('No. Dompet :                                  ');
            gotoxy(2,26);  writeln('==============================================');

            textcolor(green);
            gotoxy(15,23);  writeln(nama);
            gotoxy(15,24);  writeln('Rp', saldo:0:2);
            gotoxy(22,25);  writeln(nim:23); 

            datadaftarbarang(barangkoperasi);
            textcolor(blue);
            gotoxy(2,2);writeln('|------|----------------------------|-------------------|');
            gotoxy(2,3);writeln('| Kode |         Nama Barang        |       Harga       |');
            gotoxy(2,4);writeln('|------|----------------------------|-------------------|');
            for i:=1 to 12 do
                begin               
                    gotoxy(2,4+i);
                    textcolor(blue);
                    writeln('|      |                            |                   |');
                    textcolor(magenta);
                    gotoxy(6,4+i); writeln(data[i].kode:2);
                    gotoxy(11,4+i); writeln(data[i].barang);
                    gotoxy(40,4+i); writeln('Rp', data[i].harga:10:2);
                end;
            textcolor(blue);
            gotoxy(2,17); writeln('|------|----------------------------|-------------------|');
            gotoxy(2,18); writeln('|                                   |                   |');
            gotoxy(2,19); writeln('|===================================|===================|');
            textcolor(black);
            gotoxy(4,18); writeln('Masukkan jumlah pesanan : ');
            gotoxy(42,18); readln(jumlahpesanan);
            belanja(riwayatkoperasi, barangkoperasi, saldo, jumlahtransaksikoperasi);
            readln;
    end;

procedure menu6;
    begin
        repeat
            clrscr;
            textcolor(green);
            gotoxy(56,2); writeln(' ___________');
            gotoxy(56,3); writeln('|6  ______  |');
            gotoxy(56,4); writeln('|  /_____/  |');
            gotoxy(56,5); writeln('|  /_____/  |');
            gotoxy(56,6); writeln('|  /_____/  |');
            gotoxy(56,7); writeln('|  /_____/  |');
            gotoxy(56,8); writeln('|___________|');

            textcolor(black);
            gotoxy(74,2);  writeln('==============================================');
            gotoxy(74,3);  writeln('||>>>>>>>>>>>>>>> Saldo Saya <<<<<<<<<<<<<<<||'); 
            gotoxy(74,4);  writeln('==============================================');
            gotoxy(74,5);  writeln('Nama       :                                  ');
            gotoxy(74,7);  writeln('Saldo      :                                  ');
            gotoxy(74,9);  writeln('No. Dompet :                                  ');
            gotoxy(74,10); writeln('==============================================');

            textcolor(green);
            gotoxy(87,5);  writeln(nama);
            gotoxy(87,7);  writeln('Rp', saldo:0:2);
            gotoxy(96,9);  writeln(nim:23); 

            textcolor(blue);
            gotoxy(30,13); writeln('||==========================================================||');
            gotoxy(30,14); writeln('||                    Koperasi Mahasiswa                    ||');
            gotoxy(30,15); writeln('||**********************************************************||');
            gotoxy(30,16); writeln('||                                                          ||');
            gotoxy(30,17); writeln('||**********************************************************||');
            gotoxy(30,18); writeln('||                                                          ||');
            gotoxy(30,19); writeln('||==========================================================||');
            
            textcolor(magenta);
            gotoxy(34,16); writeln('[1] Toko Koperasi');
            gotoxy(34,18); writeln('[2] Riwayat Belanja');
            writeln;

            textbackground(red);
            textcolor(white);
            gotoxy(102,25); writeln('|===========|');
            gotoxy(102,26); writeln('|3          |');
            gotoxy(102,27); writeln('|  Kembali  |');
            gotoxy(102,28); writeln('|           |');
            gotoxy(102,29); writeln('|===========|');

            textbackground(lightgray);
            textcolor(black);
            gotoxy(51,24); writeln('|==================|');
            gotoxy(51,25); writeln('| Pilihan Anda :   |');
            gotoxy(51,26); writeln('|==================|');
            repeat
                begin
                    gotoxy(68,25); writeln('  |                 ');
                    gotoxy(68,25); readln(pilihan6);
                end;
            until (pilihan6>=1) and (pilihan6<=3);
            
            case pilihan6 of
                1:  menukoperasi(barangkoperasi); 
                2:  riwayatkoperasistis(riwayatkoperasi, jumlahtransaksikoperasi);
            end;
        until pilihan6 = 3;
    end;

procedure menu7;
    begin
        textbackground(black);
        clrscr;
        textcolor(lightblue);
        gotoxy(36,7);  writeln(' ================================================ ');
        gotoxy(36,8);  writeln('|                                                |');
        gotoxy(36,9);  writeln('|                                                |');
        gotoxy(36,10); writeln('|                                                |');
        gotoxy(36,11); writeln('|                                                |');
        gotoxy(36,12); writeln('|                                                |');
        gotoxy(36,13); writeln('|                                                |');
        gotoxy(36,14); writeln('|                                                |');
        gotoxy(36,15); writeln('|================================================|');

        gotoxy(39,8);  writeln(' __      __          ____  _______  _  ____ ');
        gotoxy(39,9);  writeln('|  \    /  | _   _  |  __||__   __|| ||  __|');
        gotoxy(39,10); writeln('| \ \  / / || | | | | |__    | |   | || |__ ');
        gotoxy(39,11); writeln('| |\ \/ /| || |_| | |__  |   | |   | ||__  |');
        gotoxy(39,12); writeln('| | \  / | ||___  |  __| |   | |   | | __| |');
        gotoxy(39,13); writeln('|_|  \/  |_| ___| | |____|   |_|   |_||____|');
        gotoxy(39,14); writeln('            |_____|                         ');
                   
        gotoxy(35,18); writeln(' ===---===---===---===---===---===---===---===---===');
        gotoxy(35,19); writeln('||  Terima Kasih Sudah Menggunakan Program MySTIS  || ');
        gotoxy(35,20); writeln(' ===---===---===---===---===---===---===---===---===');
        readln;
    end;

procedure menuawal;
    begin
        clrscr;
        textcolor(lightblue);
        gotoxy(36,7);  writeln(' ================================================ ');
        gotoxy(36,8);  writeln('|                                                |');
        gotoxy(36,9);  writeln('|                                                |');
        gotoxy(36,10); writeln('|                                                |');
        gotoxy(36,11); writeln('|                                                |');
        gotoxy(36,12); writeln('|                                                |');
        gotoxy(36,13); writeln('|                                                |');
        gotoxy(36,14); writeln('|                                                |');
        gotoxy(36,15); writeln('|================================================|');

        gotoxy(39,8);  writeln(' __      __          ____  _______  _  ____ ');
        gotoxy(39,9);  writeln('|  \    /  | _   _  |  __||__   __|| ||  __|');
        gotoxy(39,10); writeln('| \ \  / / || | | | | |__    | |   | || |__ ');
        gotoxy(39,11); writeln('| |\ \/ /| || |_| | |__  |   | |   | ||__  |');
        gotoxy(39,12); writeln('| | \  / | ||___  |  __| |   | |   | | __| |');
        gotoxy(39,13); writeln('|_|  \/  |_| ___| | |____|   |_|   |_||____|');
        gotoxy(39,14); writeln('            |_____|                         ');

        gotoxy(35,18); writeln(' ===---===---===---===---===---===---===---===---===');
        gotoxy(35,19); writeln('|| Nama Lengkap :                                  ||');
        gotoxy(35,20); writeln('|| NIM          :                                  ||');
        gotoxy(35,21); writeln(' ===---===---===---===---===---===---===---===---===');
        gotoxy(53,19); textcolor(white); readln(nama); textcolor(lightblue);
        gotoxy(53,20); textcolor(white); readln(nim);
    end;

procedure menu;
    begin
        textbackground(lightgray);
        textcolor(black);
        clrscr;
        gotoxy(2,2);  writeln('  ================================================');
        gotoxy(2,3);  writeln('||                                                ||');
        gotoxy(2,4);  writeln('||                                                ||');
        gotoxy(2,5);  writeln('||                                                ||');
        gotoxy(2,6);  writeln('||                                                ||');
        gotoxy(2,7);  writeln('||                                                ||');
        gotoxy(2,8);  writeln('||                                                ||');
        gotoxy(2,9);  writeln('||                                                ||');
        gotoxy(2,10); writeln('||                                                ||');
        gotoxy(2,11); writeln('||                                                ||');
        gotoxy(2,12); writeln('||================================================||');


        gotoxy(6,3); writeln(' __      __          ____  _______  _  ____ ');
        gotoxy(6,4); writeln('|  \    /  | _   _  |  __||__   __|| ||  __|');
        gotoxy(6,5); writeln('| \ \  / / || | | | | |__    | |   | || |__ ');
        gotoxy(6,6); writeln('| |\ \/ /| || |_| | |__  |   | |   | ||__  |');
        gotoxy(6,7); writeln('| | \  / | ||___  |  __| |   | |   | | __| |');
        gotoxy(6,8); writeln('|_|  \/  |_| ___| | |____|   |_|   |_||____|');
        gotoxy(6,9); writeln('            |_____|                         ');

        textbackground(cyan);
        textcolor(white);
        gotoxy(18,11); writeln('| Edisi Kelas 1KS4 |');
        
        textbackground(lightgray);
        textcolor(blue);
        gotoxy(7,14); writeln(' ___________ ');
        gotoxy(7,15); writeln('|1   _      |');
        gotoxy(7,16); writeln('|  _| |     |');
        gotoxy(7,17); writeln('| | | |  _  |');
        gotoxy(7,18); writeln('| | | |_| | |');
        gotoxy(7,19); writeln('| | | | | | |');
        gotoxy(7,20); writeln('|_|_|_|_|_|_|');

        textcolor(magenta);
        gotoxy(26,14); writeln(' ___________');
        gotoxy(26,15); writeln('|2 _______  |');
        gotoxy(26,16); writeln('| /  | |  \ |');
        gotoxy(26,17); writeln('|||  | |  |||');
        gotoxy(26,18); writeln('|||  | |  |||');
        gotoxy(26,19); writeln('| \__|_|__/ |');
        gotoxy(26,20); writeln('|___________|');

        textcolor(darkgray);
        gotoxy(45,14); writeln(' ___________');
        gotoxy(45,15); writeln('|3 _______  |');
        gotoxy(45,16); writeln('| |_|_|_|o| |');
        gotoxy(45,17); writeln('| |_|o|_|_| |');
        gotoxy(45,18); writeln('| |_|_|x|_| |');
        gotoxy(45,19); writeln('| |x|_|_|_| |');
        gotoxy(45,20); writeln('|___________|');

        textcolor(cyan);
        gotoxy(64,14); writeln(' ___________ ');
        gotoxy(64,15); writeln('|4  _____   |');
        gotoxy(64,16); writeln('|  / /|\ \  |');
        gotoxy(64,17); writeln('|  \/ | \/  |');
        gotoxy(64,18); writeln('|  /\ | /\  |');
        gotoxy(64,19); writeln('| /  \|/  \ |');
        gotoxy(64,20); writeln('|/____|____\|');

        textcolor(red);
        gotoxy(83,14); writeln(' ___________ ');
        gotoxy(83,15); writeln('|5  ______  |');
        gotoxy(83,16); writeln('|  /__|__/  |');
        gotoxy(83,17); writeln('|  \__|__   |');
        gotoxy(83,18); writeln('|   __|__\  |');
        gotoxy(83,19); writeln('|  /__|__/  |');
        gotoxy(83,20); writeln('|___________|');

        textcolor(green);
        gotoxy(102,14); writeln(' ___________');
        gotoxy(102,15); writeln('|6  ______  |');
        gotoxy(102,16); writeln('|  /_____/  |');
        gotoxy(102,17); writeln('|  /_____/  |');
        gotoxy(102,18); writeln('|  /_____/  |');
        gotoxy(102,19); writeln('|  /_____/  |');
        gotoxy(102,20); writeln('|___________|');

        textcolor(black);
        gotoxy(8,22);   writeln('Daftar Nilai');
        gotoxy(26,22);  writeln('Jadwal Kuliah');
        gotoxy(43,22);  writeln('Kalender Akademik');
        gotoxy(65,22);  writeln('Imapolstat');
        gotoxy(84,22);  writeln('DompetSTIS');
        gotoxy(104,22); writeln('Koperasi');
        
        gotoxy(55,2);  writeln('|===============================================================|');
        gotoxy(55,3);  writeln('| Nama  :                                                       |');
        gotoxy(55,4);  writeln('| NIM   :                  | Imapolstat                         |');
        gotoxy(55,5);  writeln('|                          | -                                  |');
        gotoxy(55,6);  writeln('|                          | -                                  |');
        gotoxy(55,7);  writeln('|                          | -                                  |');
        gotoxy(55,8);  writeln('|                          | -                                  |');
        gotoxy(55,9);  writeln('|                          | -                                  |');
        gotoxy(55,10); writeln('| IPK   :                  | -                                  |');
        gotoxy(55,11); writeln('| Saldo : Rp                                                    |');
        gotoxy(55,12); writeln('|===============================================================|');

        gotoxy(65,3);  writeln(nama);
        gotoxy(65,4);  writeln(nim);
        gotoxy(65,10); writeln(totalip:4:2);
        gotoxy(67,11);  writeln(saldo:0:2);

        for i:=1 to 4 do
            begin
                for j:=1 to 29 do
                    begin
                        for k:=1 to 5 do
                            begin
                                if (ormawa[i].ikut = false) and (ukm[j].ikut = false) and (komunitas[k].ikut = false) and (check = false) then
                                    begin
                                        gotoxy(86,5); writeln('Anda belum mengikuti organisasi.');
                                    end
                                else if (ormawa[i].ikut = true) and (ormawa[i].checkdata = false) then
                                    begin
                                        ormawa[i].checkdata := true;
                                        check := true;
                                    end
                                else if (ukm[j].ikut = true) and (ukm[j].checkdata = false) then
                                    begin
                                        ukm[j].checkdata := true;
                                        check := true;
                                    end
                                else if (komunitas[k].ikut = true) and (komunitas[k].checkdata = false) then
                                    begin
                                        komunitas[k].checkdata := true;
                                        check := true;
                                    end;
                            end;
                    end;
            end;

        tabelinfoutama:=0;
        for i:=1 to 4 do
            begin
                if (ormawa[i].ikut = true) and (ormawa[i].checkdata = true) then
                    begin
                        if tabelinfoutama = 0 then
                            begin
                                gotoxy(55,5);  writeln('|                          | -                                  |');
                            end;
                        tabelinfoutama:=tabelinfoutama+1;
                        gotoxy(55,5);  gotoxy(86,4+tabelinfoutama); writeln(ormawa[i].nama);
                    end;
            end;
        for j:=1 to 29 do
            begin
                if (ukm[j].ikut = true) and (ukm[j].checkdata = true) then
                    begin
                        if tabelinfoutama = 0 then
                            begin
                                gotoxy(55,5);  writeln('|                          | -                                  |');
                            end;
                        tabelinfoutama:=tabelinfoutama+1;
                        gotoxy(55,5);  gotoxy(86,4+tabelinfoutama); writeln(ukm[j].nama);
                    end;
            end;
        for k:=1 to 5 do
            begin
                if (komunitas[k].ikut = true) and (komunitas[k].checkdata = true) then
                    begin
                        if tabelinfoutama = 0 then
                            begin
                                gotoxy(55,5);  writeln('|                          | -                                  |');
                            end;
                        tabelinfoutama:=tabelinfoutama+1;
                        gotoxy(55,5);  gotoxy(86,4+tabelinfoutama); writeln(komunitas[k].nama);
                    end;
            end;



        textbackground(red);
        textcolor(white);
        gotoxy(102,25); writeln('|==========|');
        gotoxy(102,26); writeln('|7         |');
        gotoxy(102,27); writeln('|  Keluar  |');
        gotoxy(102,28); writeln('|          |');
        gotoxy(102,29); writeln('|==========|');
        
        textbackground(lightgray);
        textcolor(black);
        gotoxy(51,24); writeln('|==================|');
        gotoxy(51,25); writeln('| Pilihan Anda :   |');
        gotoxy(51,26); writeln('|==================|');
        repeat
            begin
                gotoxy(68,25); writeln('  |                 ');
                gotoxy(68,25); readln(pilihan);
            end;
        until (pilihan>=1) and (pilihan<=7);
        case pilihan of
            1:  menu1;
            2:  menu2;
            3:  menu3;
            4:  menu4;
            5:  menu5;
            6:  menu6;
            7:  menu7;
        end;
    end;

begin
    menuawal;
    repeat
        menu;
    until pilihan = 7;
end.