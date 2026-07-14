Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEB4C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87clj23hFfpt9QBNepHjfZoYycZtPvLMabqLFhkG2z0=; b=Z7k3jR3fIoxwxc7Be5PuBqy29R
	NqciO//Ix6qwRXO3/cnfWqys/GiIms/MoMBWBJLG10uL6206CQa/+Nb6ENT8EbDBK/7bZgGEQozeb
	o6HFclIPxT23bc9sJH2ZPKArLVQg5V3HuM06ht38HfGvKaz7YwKSZ7/0ASvUByGmPOM/JdAnsyJb6
	odTUt2ERfopjksUI+gwutsznvOxKwyBPkwBXAvEeg9BL0J2FBjkr8VtatS6GPRV6ogDieWDCwgTNW
	szo4aptzW4YJ5yQMrTOb/WhJ/Eakr2zJQOK7vhnuNB1/4De/KsTgdrooLo6uxsC4w+zVldM6KOSat
	Og2MVmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuXo-0000000E618-2Vbk;
	Wed, 15 Jul 2026 08:00:40 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuXl-0000000E60D-2nhM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=87clj23hFfpt9QBNepHjfZoYycZtPvLMabqLFhkG2z0=; t=1784102437; x=1785312037; 
	b=5ST0TM8Bbh8xUxze6F+wn08XmjeVQHLcMZEgLb1Llt3km8Z1oA4MmNEoREI9LnPhdNjTG4BrYxo
	4n/EyXnAy7PFUmRZK8rhOOopHW1eKwjdimwRj+227VXUh3hGU+4ogJCca9oJI4wF2xyo2Zvcbc5Dv
	+Slfojq5/jZ4CTgy9rsY8xqhpyofOr8kZ7uS2tpZm56+vi8ny3OM7outNgJBHt5+oJX/8PAsEaASc
	qnCkGX29RzVn8Gr6dySp8s2tjgyiLPJ57DMab+Vo3jc+9wlYF034swpkqGWeTh2Vd11241nlt6J1w
	JRXjW3T43gKqWwPhDFt6F7GvLQCOeaFvVehA==;
Date: Tue, 14 Jul 2026 20:46:36 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, Grazvydas
 Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, Ethan
 Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Daniel Thompson
 <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 16/16] arm: omap2: remove remaining pdata-quirks for
 pandora legacy devices
Message-ID: <20260714204630.0fd6bcb1@kemnade.info>
In-Reply-To: <d380941287c655a3d205ee8b08516d364c0ddec9.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<d380941287c655a3d205ee8b08516d364c0ddec9.1783749722.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_010037_715234_64E2EF79 
X-CRM114-Status: GOOD (  17.24  )
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

On Sat, 11 Jul 2026 08:02:03 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> After updating the pandora-backligt setup and removing the
> omap3pandora sound system and defining related gpios by device tree,
> we can remove omap3_pandora_legacy_init() and the related legacy
> devices completely.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

regarding bisectabily: Do we create mess, if the platform devices via
quirks are disabled?

I am wondering how we handle this. If this patch goes together with the
removal of the legacy drivers, then there might be a situation where
neither the new one nor the old one is available? Split this all up?

If sound discussion takes longer, maybe do the backlight thing alone?

Regards,
Andreas
> ---
>  arch/arm/mach-omap2/pdata-quirks.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/pdata-quirks.c
> b/arch/arm/mach-omap2/pdata-quirks.c index
> b947bacf23a37..aca7097a692ed 100644 ---
> a/arch/arm/mach-omap2/pdata-quirks.c +++
> b/arch/arm/mach-omap2/pdata-quirks.c @@ -268,27 +268,6 @@ static void
> __init omap3_logicpd_torpedo_init(void) omap3_gpio126_127_129();
>  }
>  
> -/* omap3pandora legacy devices */
> -
> -static struct platform_device pandora_backlight = {
> -	.name	= "pandora-backlight",
> -	.id	= -1,
> -};
> -
> -static struct gpiod_lookup_table pandora_soc_audio_gpios = {
> -	.dev_id = "soc-audio",
> -	.table = {
> -		GPIO_LOOKUP("gpio-112-127", 6, "dac",
> GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP("gpio-0-15", 14, "amp",
> GPIO_ACTIVE_HIGH),
> -		{ }
> -	},
> -};
> -
> -static void __init omap3_pandora_legacy_init(void)
> -{
> -	platform_device_register(&pandora_backlight);
> -	gpiod_add_lookup_table(&pandora_soc_audio_gpios);
> -}
>  #endif /* CONFIG_ARCH_OMAP3 */
>  
>  #ifdef CONFIG_SOC_DRA7XX
> @@ -514,8 +493,6 @@ static struct pdata_init pdata_quirks[]
> __initdata = { { "ti,omap3-evm-37xx", omap3_evm_legacy_init, },
>  	{ "ti,am3517-evm", am3517_evm_legacy_init, },
>  	{ "technexion,omap3-tao3530", omap3_tao3530_legacy_init, },
> -	{ "openpandora,omap3-pandora-600mhz",
> omap3_pandora_legacy_init, },
> -	{ "openpandora,omap3-pandora-1ghz",
> omap3_pandora_legacy_init, }, #endif
>  	{ /* sentinel */ },
>  };


