let stars = ["star-1", "star-2", "star-3", "star-4", "star-5"];

for (let starId in stars) {
  let star = document.getElementById(starId);
  console.log(star);
  star.addEventListener("click", function() {
    if (star.classList.contains("star-fill")) { // star fill -> star
      star.classList.remove("star-fill");
      star.classList.add("star");
    } else { // star -> star fill
      star.classList.remove("star");
      star.classList.add("star-fill");
    }
  });
}
