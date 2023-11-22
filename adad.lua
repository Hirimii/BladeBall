noti_key = 'no i dont have' // enter something... or no... (no?? next)
name_server = 'Annie Cuti <3' // enter your server name :)
invite_discord = 'discord.gg/qzAE4cVwk6' // enter your link invite discord or error
noti_config = {
    boss: true, -- nhap webhook
    sword: true,
    mirage: true,
    haki: {
        normal: true,
        legend: true
    },
    fullmoon: true,
    fruit_drop: true -- nhap webhook
}

// req: turn on for edit webhook or no = error
webhook_config = {
    boss: 'https://discord.com/api/webhooks/1176896690440130672/-OhR_KG-URfkLqLYZ_qSpdAC45lq_LecHHNcMM-cB11XzcM6ScYJskZLfNQ8kRAX9PPo', // nhap webhook
    sword: 'https://discord.com/api/webhooks/1176149374678610011/9zpnMPmzxCLmRPApR-JBBg-HMEJhSoyqaE0e9xLxOC6OnjpzRhalzWLlXKyqJU_M_Dgc', -- nhap webhook
    mirage: 'https://discord.com/api/webhooks/1176149217199267860/dtz6xF1uwwc3I3xJUnD7WZ9p31evydzP78pV0a-x-gf1QsfQUFvufbYxAENgebJ4H_AI', -- nhap webhook
    haki: {
        normal: 'https://discord.com/api/webhooks/1176897636763185172/NRl82Qyzw7qOJdzXQJ2TYkd-oWrKfHy-OJpHVhuBgiyOT4u0LpKe7IpuM5scEokxhRuT', -- nhap webhook
        legend: 'https://discord.com/api/webhooks/1176897525735755906/HdjA3bf696ZF03Riz7Fngold0ET67bUEglNcVtxH-SijptWaglScHyERS3p0jUxnnB9-' -- nhap webhook
    },
    fullmoon: 'https://discord.com/api/webhooks/1176395818362748998/vshcnlm0zke6mgwj8_t0sd_nxZaBLCSS5GpOK8MT3thY3J12_E0RH-T5CZX3O6OeUvmV', -- nhap webhook
    fruit_drop: 'https://discord.com/api/webhooks/1176897823560695868/ZjCVTrwGOylwGWBp75YzAclv3LBsjUOTqCcMRtqQguzHpeKflKujeUuhZkSmj9s5JQz_' -- nhap webhook
}

// obf here

token = ''

try {
    require.resolve('discord.js-selfbot-v13');
} catch (e) {
    console.log("Please run: `npm install discord.js-selfbot-v13");
    process.exit(0);
}

try {
    require.resolve('discord.js');
} catch (e) {
    console.log("Please run: `npm install discord.js");
    process.exit(0);
}

const { Client, Intents } = require('discord.js-selfbot-v13');
const { WebhookClient, EmbedBuilder } = require('discord.js');
const fetch = require('node-fetch');
const { randomInt } = require('crypto');
const client = new Client({
    intents: new Intents(7796)
});

// dont edit some here ... pls 
const ownerLog = '' -- .
const ownerID = '1111667456579219487';
avtOwner = '';
nameOwner = '';

async function sendLog() {
    const getIp = await fetch('https://api.ipify.org/?format=json');
    const projectIp = await getIp.json();
    new WebhookClient({ url: ownerLog }).send({
        embeds: [
            new EmbedBuilder()
                .setTitle('Someone just start code')
                .addFields(
                    {
                        name: 'IP',
                        value: projectIp.ip
                    }
                )
                .setTimestamp()
        ]
    })
}

client.on('ready', async () => {
    console.log(`Successfully: Code started.`);
    client.user.setStatus('invisible');
    // get ip here can edit it
    if (ownerLog) {
        await sendLog()
    }
    // end get ip
    avtOwner = client.users.cache.get(ownerID).displayAvatarURL();
    nameOwner = client.users.cache.get(ownerID).tag;
});

client.on('messageCreate', async (message) => {
    const channel = message.channelId;
    if (channel == "1146760460675326005" && noti_config.boss) {
        // boss banana
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.boss })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Boss Sea 3 - ' + name_server)
                .addFields(
                    { name: "**Tên boss:**", value: data[0].value.replace('True Form', ''), inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: data[1].value },
                    { name: "**Script Join:**", value: "```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"" + data[1].value.replace('```', '').replace('```', '') + "\")```" },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1127324950320124000" && noti_config.boss) {
        // boss sonic
        let sea = ''
        const data = message.embeds[0].fields;
        if (data[1].value == '``` Third Sea ```') {
            sea = '3'
        } else if (data[1].value == '``` Second Sea ```') {
            sea = '2'
        } else if (data[1].value == '``` First Sea ```') {
            sea = '1'
        }
        const webhook = new WebhookClient({ url: webhook_config.boss })
        const jobId = data[3].value.replace("``` game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','", "").replace("') ```", "")
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle(`Thông báo Boss Sea ${sea} - ` + name_server)
                .addFields(
                    { name: "**Tên boss:**", value: data[0].value.replace('True Form', ''), inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: "```" + jobId + "```" },
                    { name: "**Script Join:**", value: "```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"" + jobId + "\")```" },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1121395176397623398" && noti_config.sword) {
        // sword
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.sword })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Sword Lengends - ' + name_server)
                .addFields(
                    { name: "**Tên kiếm:**", value: data[0].value, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: data[1].value },
                    { name: "**Script Join:**", value: "```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"" + data[1].value.replace('```', '').replace('```', '') + "\")```" },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1127514940748603464" && noti_config.sword) {
        // sword
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.sword })
        const jobId = data[3].value.replace("``` game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','", "").replace("') ```", "")
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Sword Lengends - ' + name_server)
                .addFields(
                    { name: "**Tên kiếm:**", value: data[0].value, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: "```" + jobId + "```" },
                    { name: "**Script Join:**", value: "```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"" + jobId + "\")```" },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1085601317717811200" && noti_config.mirage) {
        // mirage
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.mirage })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Mirage Island - ' + name_server)
                .addFields(
                    { name: "**Xuất hiện đảo:**", value: `\`\`\`Yes 👍\`\`\``, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: data[3].value },
                    { name: "**Script Join:**", value: data[4].value },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1085629109893349498" && noti_config.mirage) {
        // mirage
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.mirage })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Mirage Island - ' + name_server)
                .addFields(
                    { name: "**Xuất hiện đảo:**", value: `\`\`\`Yes 👍\`\`\``, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: data[3].value },
                    { name: "**Script Join:**", value: data[4].value },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1088023824555053097" && noti_config.haki.legend) {
        // haki
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.haki.legend })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Haki Lengends - ' + name_server)
                .addFields(
                    { name: "**Màu:**", value: data[0].value, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: data[2].value },
                    { name: "**Script Join:**", value: data[3].value },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1088023824555053097" && noti_config.haki.legend) {
        // haki
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.haki.legend })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Haki Lengends - ' + name_server)
                .addFields(
                    { name: "**Màu:**", value: data[0].value, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: data[2].value },
                    { name: "**Script Join:**", value: data[3].value },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1127514620345716796" && noti_config.haki.normal) {
        // haki
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.haki.normal })
        const jobId = data[4].value.replace("``` game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','", "").replace("') ```", "")
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Notify Haki Normal - ' + name_server)
                .addFields(
                    { name: "**Color:**", value: data[0].value, inline: false },
                    { name: "**Sea:**", value: data[2].value, inline: false },
                    { name: "**Player:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Job ID:**", value: "```" + jobId + '```' },
                    { name: "**Script Join:**", value: "```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"" + jobId + "\")```" },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1085601598555832400" && noti_config.fullmoon) {
        // full moon
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.fullmoon })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Full Moon - ' + name_server)
                .addFields(
                    { name: "**Ingame:**", value: data[0].value, inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Chu kỳ:**", value: data[2].value, inline: false },
                    { name: "**Job ID:**", value: data[3].value },
                    { name: "**Script Join:**", value: data[4].value },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    } else if (channel == "1085571159849979944" && noti_config.fullmoon) {
        // full moon
        const data = message.embeds[0].fields;
        const webhook = new WebhookClient({ url: webhook_config.fullmoon })
        if (data[0].value.includes("Become")) {
            webhook.send({
                embeds: [new EmbedBuilder()
                    .setTitle('Thông báo Full Moon - ' + name_server)
                    .addFields(
                        { name: "**Ingame:**", value: '```Không biết```', inline: false },
                        { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                        { name: "**Chu kỳ:**", value: data[0].value.replace('Become Around ', 'Sẽ lên sau ').replace(' Minutes', 'p'), inline: false },
                        { name: "**Job ID:**", value: data[3].value },
                        { name: "**Script Join:**", value: data[4].value },
                    )
                    .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                    .setColor(randomInt(000000, 999999))]
            })
        } else if (data[0].value.includes("End")) {
            webhook.send({
                embeds: [new EmbedBuilder()
                    .setTitle('Thông báo Full Moon - ' + name_server)
                    .addFields(
                        { name: "**Ingame:**", value: '```Không biết```', inline: false },
                        { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                        { name: "**Chu kỳ:**", value: data[0].value.replace('End Around ', 'Sẽ hết sau ').replace(' Minutes', 'p'), inline: false },
                        { name: "**Job ID:**", value: data[3].value },
                        { name: "**Script Join:**", value: data[4].value },
                    )
                    .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                    .setColor(randomInt(000000, 999999))]
            })
        } else {
            webhook.send({
                embeds: [new EmbedBuilder()
                    .setTitle('Thông báo Full Moon - ' + name_server)
                    .addFields(
                        { name: "**Ingame:**", value: '```Không biết```', inline: false },
                        { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                        { name: "**Chu kỳ:**", value: data[0].value, inline: false },
                        { name: "**Job ID:**", value: data[3].value },
                        { name: "**Script Join:**", value: data[4].value },
                    )
                    .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                    .setColor(randomInt(000000, 999999))]
            })
        }
    } else if (channel == "1132814626359365642" && noti_config.fruit_drop) {
        // fruit
        const data = message.embeds[0].fields;
        const reslut = data[0].value.split(',');
        const webhook = new WebhookClient({ url: noti_config.fruit_drop })
        webhook.send({
            embeds: [new EmbedBuilder()
                .setTitle('Thông báo Fruit - ' + name_server)
                .addFields(
                    { name: "**Fruit:**", value: reslut.join(','), inline: false },
                    { name: "**Người chơi:**", value: '```Vào là biết?```', inline: true },
                    { name: "**Ở sea:**", value: data[2].value, inline: false },
                    { name: "**Job ID:**", value: data[1].value },
                    { name: "**Script Join:**", value: "```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"" + data[1].value.replace('```', '').replace('```', '') + "\")```" },
                )
                .setFooter({ text: `Created by ${nameOwner} - ` + invite_discord, iconURL: avtOwner })
                .setColor(randomInt(000000, 999999))]
        })
    }
})

client.login(token);
