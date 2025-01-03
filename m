Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C7EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GImteROnqULHiFchXLQTzhpJttZLzgZN6ofwaQa8E98=; b=wGiFmEMMDmv9f3FOC+rl6lbmdq
	1lk5sYcJDef5+UkdnN6/ZdWxbOrB/87puF4hLewyZmh6R+ZjbzL32eG06jIFZK6MjwDFjxzdKJxVy
	G2PC3IURsq5S3MOUKcvC5Glc1ZBFoXr0KISOqry8waSY5rS0Ec+ciNTkc0UncrwFjcLdZXJnV2EX0
	NeHh+txaDXU5tiysNSRI84filtdIwRrx8OJ69Hy3AVjwDftdSeAQERH06f+1/K+6B7L3GFjbGac7T
	MMSZ2rwntPbdfPCzS6zsYJLaRpJBfkuB/doxhpUEzRCjDAZA5DeSU7My75AneNQE2KFvNzXabNfjP
	TE3A6dWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkqM-0000000DTne-1BOt;
	Fri, 03 Jan 2025 16:48:14 +0000
Received: from smtp-24.smtpout.orange.fr ([80.12.242.24] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkhT-0000000DRyu-0PYi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:39:06 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Tkh7thvQlgiluTkhAtJugY; Fri, 03 Jan 2025 17:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735922332;
	bh=GImteROnqULHiFchXLQTzhpJttZLzgZN6ofwaQa8E98=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SIjH7vjbbSJIaxUKmhBM3ov4wfqI0MWG9M5HncSgPDIZwGkA8cuMe9jaoJ9kCQJcN
	 l6X1mLcu0p0afX4EQLWzCU1tk6JHQWsSoYCNxxRvqKDryVgbJoAa+NZ3FUVY5VDmBk
	 fGsQSUs6nLeRW8VFjrtGtXikEuPUUg/+vmABh2SAFy4UdH+Bv7FAcUYRM5vo3gDaeT
	 xnd4f8akpir9p8Gv1eJx7n0gUxch0qZdDB7LqeBcWT/+Sg8X4rvQIQa3/SxeBMjoDt
	 KMaLhw3/Ym00PLFzdpfP8SK6jcCqcSXHwkHqVlBcg1raOiko71QEvISzZZgboc2Kek
	 bmSEmk7QzeXQQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 03 Jan 2025 17:38:52 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Date: Fri, 3 Jan 2025 17:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250103063241.2306312-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083904_476185_1A4FA3BC 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Le 03/01/2025 à 07:32, Joey Lu a écrit :
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

...

> +	/* Nuvoton DWMAC configs */
> +	plat_dat->has_gmac = 1;
> +	plat_dat->tx_fifo_size = 2048;
> +	plat_dat->rx_fifo_size = 4096;
> +	plat_dat->multicast_filter_bins = 0;
> +	plat_dat->unicast_filter_entries = 8;
> +	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
> +
> +	priv_data = nvt_gmac_setup(pdev, plat_dat);
> +	if (IS_ERR(priv_data))
> +		return PTR_ERR(priv_data);
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

stmmac_pltfr_remove() is called by the .remove function.
Is it correct to call stmmac_dvr_probe() here, and not stmmac_pltfr_probe()?

> +	if (ret)
> +		return ret;
> +
> +	/* The PMT flag is determined by the RWK property.
> +	 * However, our hardware is configured to support only MGK.
> +	 * This is an override on PMT to enable WoL capability.
> +	 */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);
> +
> +	return 0;
> +}

...

> +static struct platform_driver nvt_dwmac_driver = {
> +	.probe  = nvt_gmac_probe,
> +	.remove = stmmac_pltfr_remove,
> +	.driver = {
> +		.name           = "nuvoton-dwmac",
> +		.pm		= &stmmac_pltfr_pm_ops,
> +		.of_match_table = nvt_dwmac_match,
> +	},
> +};

...

CJ

