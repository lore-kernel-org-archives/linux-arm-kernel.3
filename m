Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADE2C83F3B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He4gDYOHzwBuW3wYsfiHpF8GJ8GFPZnF2uMfPAsyWYc=; b=RPbnZ3H0WCwkccL60MLAW7GeoE
	sNcjrT7On4h3/TEFn+sIlJ5wn/z5HH7ojAzsdHSmS/Z8p3ulL2as6JJwYIBu0xEZJsvQn2d6YKQ+D
	Ap9egCHdNeoPAvmxkNWxJdnVLBL936TsakDz5Fjpfpii+OwSU60X9TECgvxDab1Gik1hAGA0Jc1MC
	1GKP7wIwq8Gb3kDSgdP85wGEY9khPAoiDhFzvvhChQEvslFquEAJBAltrlHf2DD2I5uqQb0Axtxu3
	LawDV6wczSy+QCjsvAXTSE6sBcmabrTM7QhqAaqNy8JwlHs9gSHFlk25UXHXc3VPeXJ3R0xHKmbZs
	aMfrsmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgT0-0000000C28A-06JP;
	Fri, 18 Jul 2025 08:29:18 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgFL-0000000BzrY-20sx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 08:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=He4gDYOHzwBuW3wYsfiHpF8GJ8GFPZnF2uMfPAsyWYc=; b=F555bg/8lmRrKuZIDqKLYd9G9/
	he3SMKffOSI+PFXeRNH8XTtz4X4mfNa4R6qPiSlBJEY5rcBWoWvLNxBgTvkNl0TeFZXiJXlOza7L0
	P88w8ZmElh+fCcvLLWyTD5q2iU4FUDL8IA+LUWNtHLwXR46LBv/R/eWD/Rz/y25YjPGbSwWjrlmSz
	wVmOOE2grqOLLFeh5rXvWNtt4C/92nVBJv/4YqHvdDG3LtynUjYtp7t8d9d4rOfrAt8rMhTVO6c+c
	iOm9VrIDyqhBhV/cq5+VCktaMlzdhK3A+ofXuVqG9ogPfcU0zYXYiKjV9UYq9T9tsx0aw8lD17z02
	tNIRUJcw==;
Date: Fri, 18 Jul 2025 10:14:47 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: rmk+kernel@armlinux.org.uk, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [resend][PATCH v2] arm: omap2: use string choices helper
Message-ID: <20250718101447.4e6ac258@akair>
In-Reply-To: <87ikjq5kqm.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikjq5kqm.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_011511_522460_C3ABBBCD 
X-CRM114-Status: GOOD (  13.67  )
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

Am Fri, 18 Jul 2025 01:52:01 +0000
schrieb Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:

> We can use string choices helper, let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  arch/arm/mach-omap2/board-n8x0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
> index ff2a4a4d8220..969265d5d5c6 100644
> --- a/arch/arm/mach-omap2/board-n8x0.c
> +++ b/arch/arm/mach-omap2/board-n8x0.c
> @@ -167,7 +167,7 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
>  
>  #ifdef CONFIG_MMC_DEBUG
>  	dev_dbg(dev, "Set slot %d power: %s (vdd %d)\n", slot + 1,
> -		power_on ? "on" : "off", vdd);
> +		str_on_off(power_on), vdd);
>  #endif
>  	if (slot == 0) {
>  		if (!power_on)


