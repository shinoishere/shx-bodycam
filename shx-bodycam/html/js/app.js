window.addEventListener('message', function (event) {
	let e = event.data;
	
	if (e.show == true && e.type == "axon") {
		$(".axon-fullname").html(e.name)
		$(".axon-dept").html(e.dept)
		$(".axon-rank").html(e.rank)
		$(".axon-container").fadeIn(250)
	} else if (e.show == false) {
		if (e.type == "axon") {
			$(".axon-container").fadeOut(250)
		}
	}	
});

function timeShit() {
	let localDate = new Date();
	date = localDate.toLocaleDateString('en-US', { timeZone: 'Turkey', year: 'numeric', month: 'long', day: 'numeric' });
	time = localDate.toLocaleTimeString('en-US', { timeZone: 'Turkey', hour12: false });
	$(".axon-date").html(date)
	$(".axon-time").html(`${time}`)
}

setInterval(timeShit, 1000)