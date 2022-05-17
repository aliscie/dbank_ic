import {dbank} from "../../declarations/dbank";

async function load_balance() {
    const balance = await dbank.getBalance();
    let value = document.querySelector("#value")
    value.innerText = Math.round(balance * 100) / 100;
}

window.addEventListener("load", async () => {
    await load_balance();
})


document.querySelector("form").addEventListener("submit", async (e) => {
    e.preventDefault()
    const button = e.target.querySelector("#submit-btn");
    button.setAttribute("disabled", true);

    const depost = document.querySelector("#input-amount");
    const withdrow = document.querySelector("#withdrawal-amount");

    if (depost.value.length > 0) {
        await dbank.topUp(parseFloat(depost.value));
    }
    if (withdrow.value.length > 0) {
        await dbank.withdraw(parseFloat(withdrow.value));
    }

    await load_balance();
    await dbank.compoundInterst();

    button.removeAttribute("disabled");
    depost.value = ""
    withdrow.value = ""


})

