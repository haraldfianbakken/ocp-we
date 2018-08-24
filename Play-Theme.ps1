$test=@"
using System;
using System.IO;
using System.Media;

public class Beep
{
    public static void Play( double frequency, double duration )
    {
        BeepBeep( 1000, frequency, duration );
    }

    private static void BeepBeep( double Amplitude, double Frequency, double Duration )
    {
        double Amp = ( ( Amplitude * ( System.Math.Pow( 2, 15 ) ) ) / 1000 ) - 1;
        double DeltaFT = 2 * Math.PI * Frequency / 44100.0;

        int Samples = (int)(441.0 * Duration / 10.0);
        int Bytes = Samples * sizeof(int);
        int[] Hdr = { 0X46464952, 36 + Bytes, 0X45564157, 0X20746D66, 16, 0X20001, 44100, 176400, 0X100004, 0X61746164, Bytes };

        using ( MemoryStream MS = new MemoryStream( 44 + Bytes ) )
        {
            using ( BinaryWriter BW = new BinaryWriter( MS ) )
            {
                for ( int I = 0; I < Hdr.Length; I++ )
                {
                    BW.Write( Hdr[I] );
                }
                for ( int T = 0; T < Samples; T++ )
                {
                    short Sample = System.Convert.ToInt16( Amp * Math.Sin( DeltaFT * T ) );
                    BW.Write( Sample );
                    BW.Write( Sample );
                }

                BW.Flush();
                MS.Seek( 0, SeekOrigin.Begin );
                using ( SoundPlayer SP = new SoundPlayer( MS ) )
                {
                    SP.PlaySync();
                }
            }
        }
    }
}
"@

Add-Type -TypeDefinition $test

[Beep]::Play(440,500)
[Beep]::Play(440,500)
[Beep]::Play(440,500)
[Beep]::Play(349,350)
[Beep]::Play(523,150)

[Beep]::Play(440,500)
[Beep]::Play(349,350)
[Beep]::Play(523,150)
[Beep]::Play(440,1000)

[Beep]::Play(659,500)
[Beep]::Play(659,500)
[Beep]::Play(659,500)
[Beep]::Play(698,350)
[Beep]::Play(523,150)

[Beep]::Play(415,500)
[Beep]::Play(349,350)
[Beep]::Play(523,150)
[Beep]::Play(440,1000)

[Beep]::Play(880,500)
[Beep]::Play(440,350)
[Beep]::Play(440,150)
[Beep]::Play(880,500)
[Beep]::Play(830,250)
[Beep]::Play(784,250)

[Beep]::Play(740,125)
[Beep]::Play(698,125)
[Beep]::Play(740,250)

[Beep]::Play(455,250)
[Beep]::Play(622,500)
[Beep]::Play(587,250)
[Beep]::Play(554,250)

[Beep]::Play(523,125)
[Beep]::Play(466,125)
[Beep]::Play(523,250)

[Beep]::Play(349,125)
[Beep]::Play(415,500)
[Beep]::Play(349,375)
[Beep]::Play(440,125)

[Beep]::Play(523,500)
[Beep]::Play(440,375)
[Beep]::Play(523,125)
[Beep]::Play(659,1000)

[Beep]::Play(880,500)
[Beep]::Play(440,350)
[Beep]::Play(440,150)
[Beep]::Play(880,500)
[Beep]::Play(830,250)
[Beep]::Play(784,250)

[Beep]::Play(740,125)
[Beep]::Play(698,125)
[Beep]::Play(740,250)

[Beep]::Play(455,250)
[Beep]::Play(622,500)
[Beep]::Play(587,250)
[Beep]::Play(554,250)

[Beep]::Play(523,125)
[Beep]::Play(466,125)
[Beep]::Play(523,250)

[Beep]::Play(349,250);
[Beep]::Play(415,500)
[Beep]::Play(349,375)
[Beep]::Play(523,125)

[Beep]::Play(440,500)
[Beep]::Play(349,375)
[Beep]::Play(261,125)
[Beep]::Play(440,1000)

 