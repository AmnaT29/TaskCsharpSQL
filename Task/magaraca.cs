using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main(string[] args)
    {
        
        List<string> dek = new List<string>();     //Lista karata
        deck.AddRange(Enumerable.Repeat("J", 4));   // Inicijalizacija karata
        deck.AddRange(Enumerable.Repeat("Q", 4));   
        deck.AddRange(Enumerable.Repeat("K", 4));   
        deck.AddRange(Enumerable.Repeat("T", 2));   

        // Raspodjela karata na 3 igrača

        Random rnd = new Random();
        List<string> igrac1 = dek.OrderBy(x => rnd.Next()).Take(5).ToList();
        List<string> igrac2 = dek.OrderBy(x => rnd.Next()).Take(4).ToList();
        List<string> igrac3 = dek.Except(igrac1).Except(igrac2).ToList();

        // Varijable za brojanje poteza i runde

        int brPoteza = 0;
        int runda = 1;

        // Varijable za praćenje koji igrač ima koju kartu

        Dictionary<string, int> lokacijaKarte = new Dictionary<string, int>();
        for (int i = 0; i < igrac1.Count; i++)
        {
            lokacijaKarte[igrac1[i]] = 1;
        }
        for (int i = 0; i < igrac2.Count; i++)
        {
            lokacijaKarte[igrac2[i]] = 2;
        }
        for (int i = 0; i < igrac3.Count; i++)
        {
            lokacijaKarte[igrac3[i]] = 3;
        }

        // Varijable za praćenje ko je trenutno na potezu i koliko puta je proslijedio

        int trenutniIgrac = 1;
        int brProslijedjenih = 0;

        
        while (true)
        {
            
            Console.WriteLine("Karte prvog igrača: {0}", string.Join(" ", igrac1));
            Console.WriteLine("Karte drugog igrača: {0}", string.Join(" ", igrac2));
            Console.WriteLine("Karte trećeg igrača: {0}", string.Join(" ", igrac3));

            // Provjera da li su igrači sakupili sve karte

            if (igrac1.GroupBy(x => x).Any(g => g.Count() == 4) && !igrac1.Contains("T"))
            {
                Console.WriteLine("Igra je završena nakon" + brPoteza + "poteza.");
                Console.WriteLine("Pobjednik je Igrač 1!");
                break;
            }
            if (igrac2.GroupBy(x => x).Any(g => g.Count() == 4) && !igrac2.Contains("T"))
            {
                Console.WriteLine("Igra je završena nakon" + brPoteza + "poteza.");
                Console.WriteLine("Pobjednik je Igrač 2!");
                break;
            }
            if (igrac3.GroupBy(x => x).Any(g => g.Count() == 4) && !igrac3.Contains("T"))
            {
                Console.WriteLine("Igra je završena nakon" + brPoteza + "poteza.");
                Console.WriteLine("Pobjednik je Igrač 3!");
                break;
            }
        }
    }
}
           
