Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k29zQPxTNJWQbXPw0Ltz/T0LGZChywsA2/L0nbeoRS0=; b=k3mwJpDnN7HkaCguPAVKx1bn1/
	E+sr6afH4GdlUaS+47MMZs5SMYYHW7Wzk+9zzmHB4IcUllulKd691azdN7Gb8v6hIqN9I+9KzAJJ6
	ObVBFcobH3fwkt7qpaSk4vvc9QpRI6vGBhObls7AUdyaT2NFBhb4AraK7uRAIdFHcEzpB/sd2D9/9
	+cSugNN1iBawi2jGLtmq/u/KKU1EeTjXWUD9/TwOXl5wHPrpCx6+uNTWNKqHYG8MIjkF3XsdbARR9
	1qLQcrrVK+mtnfknR4DCG/ukkkkCtt2GxSX5hxPj+fm5FfyUxKDwsv96/8tg/9PKjft1pBd9nv4UX
	LNUsln2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOuK-00000006ASy-2d4o;
	Mon, 13 Jan 2025 18:11:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOrp-00000006A8j-41hx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87AC9A412B0;
	Mon, 13 Jan 2025 18:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351CAC4CED6;
	Mon, 13 Jan 2025 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736791728;
	bh=fjGnrnA+PJF3XUTyX0tLFDsfny9iP/CBBSsHZyVzpV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FcIfX37/Onopt1lbvQfIy/DUix1JOl6bHWYb93Ec3aDDjmARJcqb+rX0nUsH5PVac
	 ITECje3zkGppJqSvblCbLOZH1SYC8UlSu2bUt1c+594jsxjkUDrskG2LSQAXDe/TqP
	 JIr0TZFVXfaxXfZh+WbfnGGqEXQXe6e4RugP45BSrGNLBPMOuTRs23P4ydr8eKKOrz
	 Z6rLtqI81U0H7Uw7V6W69uzLHhG8meRPOttkIdJke9hF2PcDZtdHaOHaWdvVu/V+6u
	 P3OMOUPUQBnFkxWZo3tQN7ZKTPKB7rrYNmYKF9Mdtg7FdfpNCiAYxN0NBO4TNqN18n
	 jM0rQOoYdAPcw==
Message-ID: <25491f79-323b-421f-8053-36d5655e5323@kernel.org>
Date: Mon, 13 Jan 2025 20:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: ti-sysc: mark AM62 wkup_uart0 as non deferrable
To: Francesco Valla <francesco@valla.it>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org
References: <20250109175211.113945-2-francesco@valla.it>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250109175211.113945-2-francesco@valla.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_100850_067960_D4C44625 
X-CRM114-Status: GOOD (  22.20  )
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



On 09/01/2025 19:52, Francesco Valla wrote:
> The ti-sysc driver implements a probe deferral logic to be sure to probe
> the parent interconnects before their children, postponing the probe of
> interconnects not marked as "early" instances until one of these is
> found.
> 
> Since the driver is alse used for the wkup_uart0 block found on the AM62

alse/also

> SoC, but not for other devices on the same platform, this logic forces
> the probe for it to be artificially deferred 10 times and can lead to
> the device not being probed at all. The missed probe was seen on a
> BeaglePlay with the kernel configuration stripped to bare minimum and
> no module support.
> 
> Add the ranges for wkup_uart0 to the list of "early" interconnect
> instances, forcing the driver to skip the defer logic entirely for this
> device.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/bus/ti-sysc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index f67b927ae4ca..917b7168fbd0 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -687,6 +687,8 @@ static struct resource early_bus_ranges[] = {
>  	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
>  	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
>  	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
> +	/* am62 wkup_uart0 */
> +	{ .start = 0x2b300000, .end = 0x2b300000 + 0x100000, },
>  };
>  
>  static atomic_t sysc_defer = ATOMIC_INIT(10);

While this is probably OK for now, we need to ensure that sysc_defer_non_critical()
is not called for such devices that don't have an interconnect managed by
the sysc driver (i.e. non OMAP based systems).

Maybe this calls for a new compatible for AM62 sysc?

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger


