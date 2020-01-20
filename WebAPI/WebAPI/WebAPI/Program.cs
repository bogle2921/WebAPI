using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using Newtonsoft.Json;
using System.IO;


class Program {
    static void Main(string[] args) {
        using (WebClient webClient = new WebClient()) {
            WebClient client = new WebClient();
            var json = client.DownloadString("http://api.open-notify.org/astros.json");
            File.WriteAllText("space.json", json);
        }
    }
}
