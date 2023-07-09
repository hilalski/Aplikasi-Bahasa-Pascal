Program DompetSTIS;
uses crt,strutils;

type
   daftar=record
      barang : string;
      ukuran : string;
      price : real;
   end;

   riwayattransaksi=record
      daritopup: array[1..40] of real;
      darikoperasi:real;
      daritranfer:real;
   end;

var
    transaksi:array [1..40] of riwayattransaksi;
    saldo: array [1..40] of real;
    pilihan:integer;
    lagimenu,maubayar,pilih:char;
    nama,a:string;
    totaluang,topup,uangtransfer:real;
    nomordompet,nomortujuan,bayar,rek,NIM:longint;
    pesan : array [1..15] of daftar;
    kode, i :integer;
    jmlpesan,banyaktransaksi: integer;
    totalprice,o: real;

procedure lagi;
    begin
      writeln();
      gotoxy(35,wherey); write('Ingin memeriksa menu yang lain (Y/T) ? = ');readln(lagimenu);
    end; 
    
procedure saldo2(var uang:real);
var
admin:real;
begin
    if (topup>0) then
        begin
        admin:=topup*0.01;
        saldo[i]:=saldo[i]+topup-admin;
        totaluang:=saldo[i];  
        banyaktransaksi:=banyaktransaksi+1;
        end
    else
        write('Anda salah memasukan input !!');
end;

procedure infosaldo;
begin
   gotoxy(35,wherey); writeln('Saldo saat ini pada dompet STIS ',nama,' Rp ',totaluang:0:2);
end;

procedure transfer;
begin
   textcolor(yellow); gotoxy(38,9); writeln(upcase('Selamat Proses Transfer Anda Berhasil Dilakukan'));
    totaluang:=totaluang-uangtransfer; banyaktransaksi:=banyaktransaksi+1;
   textcolor(white);

end;

procedure tampilpesanan;
begin
   clrscr;
   GotoXY(25,wherey);writeln('   ==============================================================');
   GotoXY(25,wherey);writeln('    ____________________________________________________________');
   GotoXY(25,wherey);writeln('   |                     DAFTAR PESANAN ANDA                    |');
   GotoXY(25,wherey);writeln('   |____________________________________________________________|');
   for i:=1 to jmlpesan do
   begin
   writeln;
      GotoXY(32,wherey);  write(pesan[i].barang);
      GotoXY(75,wherey);writeln('Rp ',pesan[i].price:0:2);
      if pesan[i].barang='Seragam Atasan Perempuan' then
         begin
            GotoXY(32,wherey);write('Ukuran seragam : ');
            GotoXY(84,wherey);writeln(upcase(pesan[i].ukuran));
         end
      else
      if pesan[i].barang='Seragam Bawahan Perempuan' then
         begin
            GotoXY(32,wherey);write('Ukuran seragam : ');
            GotoXY(84,wherey);writeln(upcase(pesan[i].ukuran));
         end
      else
      if pesan[i].barang='Seragam Atasan Laki-laki' then
         begin
            GotoXY(32,wherey);write('Ukuran seragam : ');
            GotoXY(84,wherey);writeln(upcase(pesan[i].ukuran));
         end
      else
      if pesan[i].barang='Seragam Bawahan Laki-laki' then
         begin
            GotoXY(32,wherey);write('Ukuran seragam : ');
            GotoXY(84,wherey);writeln(upcase(pesan[i].ukuran));
         end;
   end;
   
end;

function totalharga (var jmlinput : integer) : real;
begin
   totalharga:=0;
   for i:=1 to jmlinput do
      begin
         totalharga:=totalharga+pesan[i].price;
      end;
   GotoXY(25,wherey); writeln('    ____________________________________________________________');
   GotoXY(32,wherey); write('TOTAL');
   GotoXY(75,wherey); writeln('Rp ',totalharga:0:2);
   o:=totalharga;
   GotoXY(25,wherey); writeln;
   GotoXY(30,wherey); writeln('Untuk melanjutkan proses transaksi silahkan lakukan pembayaran');
   
end;

procedure pembayarankoperasi;
begin
   if (o<totaluang) then
      begin
      GotoXY(30,wherey); write('Anda akan membayar pesanan seharga Rp ',o:0:2,'?(y/t) : '); readln(pilih); 
         if (pilih='y') or (pilih='Y') then 
            begin
               GotoXY(30,wherey); write('Selamat Anda berhasil melakukan pembayaran!!!');
               totaluang:=totaluang-o;
               banyaktransaksi:=banyaktransaksi+1;
            end
         else 
         begin 
         writeln();
         GotoXY(38,wherey); write('PESANAN ANDA DIMASUKAN KE DALAM KERANJANG'); 
         end;
            
      end
   else 
      begin writeln(); 
      textcolor(red); GotoXY(44,wherey); write('!!!SALDO ANDA TIDAK MENCUKUPI!!!'); 
      end;
   readln;

end;

procedure menukoperasi;
label
  ulangkoperasi;
label
  ulangukuran011;
label
   ulangukuran012;
label
   ulangukuran021;
label
   ulangukuran022;

begin
  clrscr;
  GotoXY(30, 2);writeln('       SELAMAT DATANG DI PROGRAM KOPERASI MAHASISWA       ');
  GotoXY(30, 3);writeln('  _____________________________________ _________________ ');
  GotoXY(30, 4);writeln(' |KODE |     Daftar Barang             |   Daftar Harga  |');
  GotoXY(30, 5);writeln(' |_____|_______________________________|_________________|');
  GotoXY(30, 6);writeln(' | 011.|   Seragam Atasan Perempuan    |     Rp 80000    |');
  GotoXY(30, 7);writeln(' | 012.|   Seragam Bawahan Perempuan   |     Rp 95000    |');
  GotoXY(30, 8);writeln(' | 013.|   Seragam Kerudung            |     Rp 45000    |');
  GotoXY(30, 9);writeln(' | 014.|   Bivakmut Perempuan          |     Rp 30000    |');
  GotoXY(30,10);writeln(' | 021.|   Seragam Atasan Laki-laki    |     Rp 80000    |');
  GotoXY(30,11);writeln(' | 022.|   Seragam Bawahan Laki-laki   |     Rp 98000    |');
  GotoXY(30,12);writeln(' | 023.|   Bivakmut Lai-laki           |     Rp 30000    |');
  GotoXY(30,wherey);writeln(' | 031.|   Pangkat Tingkat             |     Rp 15000    |');
  GotoXY(30,wherey);writeln(' | 041.|   Tas                         |     Rp 90000    |');
  GotoXY(30,wherey);writeln(' | 042.|   Sepatu Perempuan            |     Rp 100000   |');
  GotoXY(30,wherey);writeln(' | 043.|   Sepatu Laki-laki            |     Rp 100000   |');
  GotoXY(30,wherey);writeln(' | 051.|   ATK                         |     Rp 30000    |');
  GotoXY(30,wherey);writeln(' |_____|_______________________________|_________________|');
  GotoXY(30,wherey);writeln;
  GotoXY(30,wherey);writeln('              SILAHKAN LAKUKAN PEMESANAN DISINI          ');
  GotoXY(30,wherey);writeln('  =======================================================');
  GotoXY(30,wherey);write('  Masukkan jumlah pesanan Anda : '); readln(jmlpesan);
  for i:=1 to jmlpesan do
  begin
  writeln;
  GotoXY(30,wherey);writeln('  Pesanan ke-',i);
  GotoXY(30,wherey);write('  Masukan Kode Pesanan Anda         : ');readln(kode);
  ulangkoperasi:
   if (kode=011) or (kode=012) or (kode=013) or (kode=014) or (kode=023) or (kode=021) or (kode=022) or (kode=031) or (kode=041) or (kode=042) or (kode=043) or (kode=051) then
      begin
          case kode of
          011: begin
                  pesan[i].price:=80000;
                  pesan[i].barang:='Seragam Atasan Perempuan';
                  GotoXY(32,wherey);write('Ukuran seragam (S/M/L/XL)         : ');readln(pesan[i].ukuran);
                  ulangukuran011:
                  a := upcase(pesan[i].ukuran);
                  case a of
                  'S' : write;
                  'M' : write;
                  'L' : write;
                  'XL': write;
                  else
                  begin
                  GotoXY(32,wherey); writeln('Ukuran yang Anda masukkan tidak terdeteksi!!');
                  GotoXY(32,wherey); write('Silahkan Input Ulang Ukuran        : '); readln(pesan[i].ukuran);
                  goto ulangukuran011;
                  end;
                  end;
              end;
          012: begin
                  pesan[i].price:=95000;
                  pesan[i].barang:='Seragam Bawahan Perempuan';
                  GotoXY(32,wherey);write('Ukuran seragam (S/M/L/XL)         : ');readln(pesan[i].ukuran);
                  ulangukuran012:
                  a := upcase(pesan[i].ukuran);
                  case a of
                  'S' : writeln;
                  'M' : writeln;
                  'L' : writeln;
                  'XL': writeln;
                  else
                  begin
                  GotoXY(32,wherey); writeln('Ukuran yang Anda masukkan tidak terdeteksi!!');
                  GotoXY(32,wherey); write('Silahkan Input Ulang Ukuran        : '); readln(pesan[i].ukuran);
                  goto ulangukuran012;
                  end;
                  end;
              end;
          013: begin
                  pesan[i].price:=45000;
                  pesan[i].barang:='Seragam Kerudung';
              end;
          021: begin
                  pesan[i].price:=80000;
                  pesan[i].barang:='Seragam Atasan Laki-laki';
                  GotoXY(32,wherey);write('Ukuran seragam (S/M/L/XL)         : ');readln(pesan[i].ukuran);
                  ulangukuran021:
                  a := upcase(pesan[i].ukuran);
                  case a of
                  'S' : writeln;
                  'M' : writeln;
                  'L' : writeln;
                  'XL': writeln;
                  else
                  begin
                  GotoXY(32,wherey); writeln('Ukuran yang Anda masukkan tidak terdeteksi!!');
                  GotoXY(32,wherey); write('Silahkan Input Ulang Ukuran         : '); readln(pesan[i].ukuran);
                  goto ulangukuran021;
                  end;
                  end;
              end;
          022: begin
                  pesan[i].price:=98000;
                  pesan[i].barang:='Seragam Bawahan Laki-laki';
                  GotoXY(32,wherey);write('Ukuran seragam (S/M/L/XL)         : ');readln(pesan[i].ukuran);
                  ulangukuran022:
                  a := upcase(pesan[i].ukuran);
                  case a of
                  'S' : writeln;
                  'M' : writeln;
                  'L' : writeln;
                  'XL': writeln;
                  else
                  begin
                  GotoXY(32,wherey); writeln('Ukuran yang Anda masukkan tidak terdeteksi!!');
                  GotoXY(32,wherey); write('Silahkan Input Ulang Ukuran         : '); readln(pesan[i].ukuran);
                  goto ulangukuran022;
                  end;
                  end;
              end;
          023: begin
               pesan[i].price:=30000;
               pesan[i].barang:='Bivakmut Laki-laki';
              end;
          031: begin
                  pesan[i].price:=15000;
                  pesan[i].barang:='Pangkat Tingkat';
              end;
          041: begin
                  pesan[i].price:=90000;
                  pesan[i].barang:='Tas';
              end;
          042: begin
                  pesan[i].price:=100000;
                  pesan[i].barang:='Sepatu Perempuan';
              end;
          043: begin
                  pesan[i].price:=100000;
                  pesan[i].barang:='Sepatu Laki-laki';
              end;
          051: begin
                  pesan[i].price:=30000;
                  pesan[i].barang:='ATK';
              end;
          end;
      end

   else
      begin
      GotoXY(32,wherey); writeln('Anda Salah Input Kode Pesanan!!!');
      GotoXY(32,wherey); write('Silahkan Input Ulang Kode Pesanan : '); readln(kode);
      goto ulangkoperasi;
      end;

  end;
       tampilpesanan;
       totalharga(jmlpesan);
       GotoXY(30,wherey); write('Apakah Anda Ingin Melakukan Pembayaran Sekarang?(y/t) : '); readln (maubayar);
       if (maubayar='y') or (maubayar='Y') then
         pembayarankoperasi
       else  
         begin 
         writeln();
         GotoXY(38,wherey); write('PESANAN ANDA DIMASUKAN KE DALAM KERANJANG'); 
         end;
       readln;
       textcolor(white); lagi;
end;

procedure keranjang;
begin;
exit;
end;

procedure Koperasi;
   begin
   GotoXY(35,wherey);writeln('   |^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|');
   GotoXY(35,wherey);writeln('   |                      KOPERASI MAHASISWA                   |');
   GotoXY(35,wherey);writeln('   |-----------------------------------------------------------|');
   GotoXY(35,wherey);writeln('   |       1. Toko Koperasi       ||     2. Keranjang Anda     |');
   GotoXY(35,wherey);writeln('   |___________________________________________________________|');
   GotoXY(35,wherey);write('    MASUKAN PILIHAN (1/2) : ');readln(pilihan);
   if (pilihan=1) then menukoperasi
   else if (pilihan=2) then keranjang;
   end;


procedure riwayat;
   begin
   gotoxy(35,4); writeln ('Anda Telah Melakukan : ');
   for i:=1 to banyaktransaksi do
      begin
         with transaksi[i] do
            begin
            gotoxy(35,wherey); writeln ('Transaksi ke-',i); 
            transaksi[i].daritopup[i]:=saldo[i];
            end;
         if (banyaktransaksi=1) then 
            gotoxy(35,wherey); writeln ('Dari Isi Saldo = Rp ',(Transaksi[i].daritopup[i]):0:2); 
            gotoxy(35,wherey); writeln ('Dari Koperasi = Rp ',(Transaksi[i].darikoperasi):0:2); 
            gotoxy(35,wherey); writeln ('Dari Transfer = Rp ',(Transaksi[i].daritranfer):0:2); 
            
      end;
   end;


procedure menu;
begin
    textcolor(lightblue);
    gotoxy(86,9);write('||'); gotoxy(86,10);write('||');
    gotoxy(35,8); writeln(' ===---===---===---===---===---===---===---===---===');
    gotoxy(35,11); writeln(' ===---===---===---===---===---===---===---===---===');
    gotoxy(35,10);write('|| Password  : ');
    gotoxy(35,9);write('|| Username  : '); textcolor(white); readln(nama); textcolor(lightblue);
    gotoxy(35,10);write('|| Password  : '); textcolor(white); readln(NIM);
    
    
repeat
    clrscr;
    textcolor(yellow);gotoxy(35,1); writeln('Dompet STIS ',nama,',');
    textcolor(green);
    gotoxy(35,2); writeln('=======================================================');
    gotoxy(35,3); writeln('||>>>>>>>>>> SELAMAT DATANG DI DOMPET STIS <<<<<<<<<<||'); 
    gotoxy(35,4); writeln('=======================================================');
    gotoxy(35,5); writeln('|| 1. Informasi Saldo     |');
    gotoxy(63,5); writeln('4. Koperasi STIS         ||');
    gotoxy(35,6); writeln('|| 2. Isi Saldo           |');
    gotoxy(63,6); writeln('5. Riwayat Transaksi     ||');
    gotoxy(35,7); writeln('|| 3. Transfer            | 6. Keluar                ||');
    gotoxy(35,8); writeln('||                        |                          ||');
    gotoxy(35,9); write('||                        |  '); textcolor(yellow); writeln('No. Dompet : ',NIM);
    textcolor(green);
    gotoxy(88,9); write('||');
    gotoxy(35,10); writeln('=======================================================');
    gotoxy(35,11); writeln('=======================================================');
    

    writeln();

    textcolor(white);
    gotoxy(35,wherey); write('Masukkan Pilihan Anda (1/2/3/4/5): '); readln(pilihan);

    case pilihan of
    1: begin
       infosaldo;
       lagi;
       end;

    2: begin
       gotoxy(35,wherey);write('Masukkan Jumlah Uang Top Up Anda Rp '); readln(topup);
       gotoxy(35,wherey);writeln('Selamat Anda Berhasil Top up Senilai Rp',(topup-0.01*topup):0:2,' (termasuk biaya admin)');
       saldo2(topup);
       lagi;
       end;

    3: begin
       clrscr;
       textcolor(green); gotoxy(35,1);write('`````````````````````````````````````````````````````');
       gotoxy(35,2);write('>>>>>>>>>> MENU TRANSFER ANTAR DOMPET STIS <<<<<<<<<<');
       gotoxy(35,3);write('`````````````````````````````````````````````````````'); textcolor(white);
       gotoxy(35,4);write('Masukkan Nomor Dompet STIS tujuan Anda : '); readln(nomortujuan);
       gotoxy(35,5);write('Masukkan Nominal Uang yang Ditransfer  : Rp '); readln(uangtransfer);
       if (totaluang>uangtransfer) then 
         begin
         gotoxy(35,7);write('Anda akan melakukan transfer senilai Rp ',uangtransfer:0:2);
         gotoxy(35,8);write('Pada Nomor Dompet STIS ',nomortujuan,'?(Y/T) : ');
         readln(pilih);
         if (pilih='y') or (pilih='Y') then transfer
         else begin gotoxy(49,9); textcolor(red); write('PROSES TRANSFER DIBATALKAN'); writeln(); end;
         end
       else 
         begin writeln(); 
         GotoXY(35,wherey); textcolor(red); write('!!!SALDO KAMU TIDAK MENCUKUPI!!!'); writeln();
         end;
       textcolor(white); lagi;
       end;

    4: begin
       clrscr;
       koperasi;
       end;

    5: begin
       clrscr;
       textcolor(green); gotoxy(35,1);write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
       gotoxy(35,2);write('>>>>>>>>>>> RIWAYAT TRANSAKSI DOMPET STIS <<<<<<<<<<<');
       gotoxy(35,3);write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'); textcolor(white);
       riwayat;
       readln;
       end;

    6: begin
                clrscr;
                gotoxy(35,wherey);writeln('Anda berhasil keluar dari dompet stis');
                gotoxy(35,wherey);writeln('-------------------------------------');
                exit;
       end;
    end;

    until (lagimenu='t') or (lagimenu='T');
        writeln();
        writeln('Anda berhasil keluar dari entri data mahasiswa');
        writeln('----------------------------------------------');
    end;

Begin
    clrscr;
    menu;
    writeln('TERIMA KASIH SUDAH MENGGUNAKAN PROGRAM');
    banyaktransaksi:=0;
readln;
end.
