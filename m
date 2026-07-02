Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AEDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfeQVzy7M4lefzUDckto9D0NJkiUjBGQ4oKxkwviFJs=; b=lr/1VUBgbRd3r+vsP9dXKhw1Qk
	nneg+TvEkZCTUN0td3Nw5haeRUcx1u3LXpY6NqY9UC263W8JGJ9FBQDVj+jwLvGDx0FklECGozuRZ
	GtnSHKw6iCB8UI/WT02VP7D42tduVvCXbCgFlYN2Yny8z/5md2kHfXXgt7gYe+iWYQ4Pgo3dLorSU
	IYvlorm60bYDG/BTVQoKgd7WZphXtRnuszERgpugruas2S+dCRTU9808yVCInCPZB+x3ZwHF6Jesw
	LPTO8GzUPlRs83TPXLQKthR5HMq3lgNNTZ8bzakNMBb8Rb0wivZkpXE1ppufTEqCIjQzuG7oa11VM
	LYBYWdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKla-00000005503-1gS5;
	Thu, 02 Jul 2026 16:59:58 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKlX-000000054zW-38E1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:59:57 +0000
Received: from roadster.musicnaut.iki.fi (85-76-33-40-nat.elisa-mobile.fi [85.76.33.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4grjmK36dmz49Q5N;
	Thu, 02 Jul 2026 19:59:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1783011589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AfeQVzy7M4lefzUDckto9D0NJkiUjBGQ4oKxkwviFJs=;
	b=GkJ9HOoycFOGbxLFMHKxFv/kfhEcZQxL3duwoIlOq5EkUog3KyKYMqfEDsbCFr31jrilb1
	+bNab/mtjoPOghtFeeYl1Z0c0mG2IN1fbhZf9VkXye/jhFOFittFjgF1vuaxThqWxXMxkb
	oS/7F3+p6v2hbcWYo4s9ccCOEb72EUlADSsfN4Pk40DmWEP5u8Wfll97qdnMe9Wrx0zcv/
	7l3/DJPrU7PphQPIFCOIK9uPgL++7HCvC5rQDdtCdtvD0Yvnqr+SUY80MCFlRTEjzVCFuY
	Rnvbg7wDPfnoNbn2TxpefIzzjI4KTNDJ2mQGv3ab3/u2kVpPh4oz88KgsEUAng==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1783011589;
	b=r2Asa+3N5St+n0wQwxx4gA6DFeEK2DHp3x23wq+lZHBCV1I5bDzjwl7s306ah90buJPiFe
	wBNkEQQ+glpnemw+lQZAOXECgfNi7ui7YKcQ6qbO7f0WAOcIotjNkOT7KIEliJ8uqofbyR
	NaG4C094Gy+N7CAX7BbvzUhBBRTbmzcrcWMqbwYWx+Sqx1+++fS5GVD3utCyw0JLeyR32B
	FxiskcuIlifwx2DffPaxBQYK6g+plceh6+20PdHXl2KLsqUv31N6CDIRTNw2CiYc8cnYwt
	fnQotKRUjD1UKh50apkX+mtttndXNgUELTDv0+9nSruhWIcrmSfJ1f/G0Q5L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1783011589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AfeQVzy7M4lefzUDckto9D0NJkiUjBGQ4oKxkwviFJs=;
	b=r0deE2r0l3QDs6njbKGirYsF6nGKoj2OyluUDVpU8xxRyKKevX4GBJsf9NvVb7lkLdMH2G
	g6YxEqXfkC4HJKe7WyTWrDZYJFww0f3CB26tIkYK0+XvzJ875NJEjPZ4cwu68JOgxF3hhL
	eFfAp7KE4SV38DwEjYwZ9Mh9caUZhC7PoENKOheCczjWzHopD1z4l7jMsH2pL/0JfCb4oP
	7jvAUMX4M34KCF0dicVLFaEv09DetCeHdHHD3Zsz5SY/U/gpsGuI6mtGxp31wv9IGhbZa1
	1Nw7BtaToTC4b/C/urghmysE61Eb0a9pGz4uYDkZxkXGSLfmHa4iYpaKx76+/A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Thu, 2 Jul 2026 19:59:43 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 04/19] ARM: deprecate support for ARM1136r0
Message-ID: <akaY_1tXCYACSbcP@roadster.musicnaut.iki.fi>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-5-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_095956_090968_5281F53D 
X-CRM114-Status: GOOD (  24.65  )
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

Hi,

On Wed, Jul 01, 2026 at 11:23:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This CPU revision remains a special case as it is now incompatible
> with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
> that one is fairly rare these days, so let's plan to remove all of
> them after the 2026 LTS kernel release.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi> # OMAP

A.

> ---
>  arch/arm/mach-imx/Kconfig       |  5 ++++-
>  arch/arm/mach-omap2/Kconfig     | 15 ++++++++++++---
>  arch/arm/mach-versatile/Kconfig |  5 ++++-
>  arch/arm/mm/Kconfig             |  2 ++
>  4 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 041e73ad203a..f85a5f8c0a58 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -40,13 +40,16 @@ if ARCH_MULTI_V6
>  comment "ARM1136 platforms"
>  
>  config SOC_IMX31
> -	bool "i.MX31 support"
> +	bool "i.MX31 support (DEPRECATED)"
>  	depends on !SMP
>  	select CPU_ARM1136R0
>  	select MXC_AVIC
>  	help
>  	  This enables support for Freescale i.MX31 processor
>  
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
> +
>  config SOC_IMX35
>  	bool "i.MX35 support"
>  	select CPU_ARM1136R1
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index 13987ffbba00..79f8afe3a6bf 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -207,18 +207,24 @@ comment "OMAP Core Type"
>  	depends on ARCH_OMAP2
>  
>  config SOC_OMAP2420
> -	bool "OMAP2420 support"
> +	bool "OMAP2420 support (DEPRECATED)"
>  	depends on ARCH_OMAP2
>  	default y
>  	select OMAP_DM_SYSTIMER
>  	select OMAP_DM_TIMER
>  	select SOC_HAS_OMAP2_SDRC
> +	help
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  config SOC_OMAP2430
> -	bool "OMAP2430 support"
> +	bool "OMAP2430 support (DEPRECATED)"
>  	depends on ARCH_OMAP2
>  	default y
>  	select SOC_HAS_OMAP2_SDRC
> +	help
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  config SOC_OMAP3430
>  	bool "OMAP3430 support"
> @@ -249,11 +255,14 @@ config MACH_NOKIA_N810_WIMAX
>  	bool
>  
>  config MACH_NOKIA_N8X0
> -	bool "Nokia N800/N810"
> +	bool "Nokia N800/N810 (DEPRECATED)"
>  	depends on SOC_OMAP2420
>  	default y
>  	select MACH_NOKIA_N810
>  	select MACH_NOKIA_N810_WIMAX
> +	help
> +	  This machine is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  endmenu
>  
> diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> index de42da7de8c8..1ee9b6608d71 100644
> --- a/arch/arm/mach-versatile/Kconfig
> +++ b/arch/arm/mach-versatile/Kconfig
> @@ -110,11 +110,14 @@ config INTEGRATOR_CM1026EJS
>  	select CPU_ARM1026
>  
>  config INTEGRATOR_CM1136JFS
> -	bool "Integrator/CM1136JF-S core module"
> +	bool "Integrator/CM1136JF-S core module (DEPRECATED)"
>  	depends on ARCH_INTEGRATOR_AP
>  	depends on ARCH_MULTI_V6
>  	depends on !SMP
>  	select CPU_ARM1136R0
> +	help
> +	  This machine is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  config ARCH_INTEGRATOR_CP
>  	bool "Support Integrator/CP platform"
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index f3d71e89a31f..27010b9389ad 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -410,6 +410,8 @@ config CPU_ARM1136R0
>  	help
>  	  These early revisions of ARM1136 lack support for the
>  	  ARMv6k extensions for multiprocessing.
> +	  Support for this revision is scheduled for removal
> +	  from the kernel in early 2027.
>  
>  config CPU_ARM1136R1
>  	bool
> -- 
> 2.39.5
> 

