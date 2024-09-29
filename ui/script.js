document.addEventListener("DOMContentLoaded", function () {
  const overlay = document.querySelector(".overlay");

  window.addEventListener("message", function (event) {
      const item = event.data;

      if (item.action === "open") {
          overlay.style.opacity = "1";
          overlay.setAttribute("aria-hidden", "false");
          getPlayerData(); 
      } else if (item.action === "close") {
          overlay.style.opacity = "0";
          overlay.setAttribute("aria-hidden", "true");
      }
  });
})

  document.addEventListener("keyup", function (event) {
      if (event.key === "Escape") {
          fetch("https://Foxy_GetPlayerData/close", {
              method: "POST",
              body: JSON.stringify({}),
          }).catch((error) => console.error("Fetch error:", error));
      }
  });

  function getPlayerData() {
      fetch("https://Foxy_GetPlayerData/getPlayerData" , {
          method: "POST",
          body: JSON.stringify({}),
      })
      .then(response => response.json())
      .then(data => {
        document.getElementById("id").textContent = "ID: " + data.id;
          document.getElementById("playername").textContent = "Játékos Név: " + data.name;
          if (data.sex == "m") {
            document.getElementById("sex").innerHTML = "Nem: " + data.Male;
          } else {
            document.getElementById("sex").innerHTML = "Nem: " + data.Female;
          }
          document.getElementById("birthday").textContent = "Születési Év: " + data.date;
          document.getElementById("Group").textContent = "Group: " + data.group;
          document.getElementById("job").textContent = "Job: " + data.job + " - " + data.job1;
          document.getElementById("jobgrade").textContent = "Rang: " + data.jobgrade + " - " + data.jobgrade1;
          document.getElementById("money").textContent ="Készpénz: " + "$" + data.money;
          document.getElementById("bank").textContent = "Bank: "+ "$" + data.bank;
          document.getElementById("Steamname").textContent = data.Steam + " Játékos adatai";
          document.getElementById("Health").textContent = "Hp-ja: " + data.Health;
          document.getElementById("Armor").textContent = "Armor: " + data.Armor;
          document.getElementById("Vehicle").textContent = "Kocsiai Száma: " + data.vehicleCount;
      })
      .catch(error => console.error("Fetch error:", error));
  }
