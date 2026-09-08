Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264D4C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4hi2ivsLfr2ufMlsG0ARQMmUxC4cRTpVCxzIc4mQOk=; b=yN7fdn93ug5LPjOjr0ePapr9kM
	k4x/RNe4Nc6YftlY7UvxFjbLBZIAQrplxgq/D4qR55cdO0RDDC1UW88iFlIsLLDMeXJD9crmK6AAa
	zTJKl3HOvnh644+a0twNw+QBe87rPbjef/acKS0e5whLQQM8dO+YVPO0fxamABu8PphDhp9yxRrif
	WTgKx0lEG1Hk3mgZGJEt+WeAGD9AVylSkSizpKKcmO+KKLfSHSQbOdMdwyPlwwqRJTtvHZ2LbN1hl
	j42+1FqenoKgCUw5CPohitr4mi8n4UqsmzRY0LhAD6ixS0dJp38dWHOst5PE6Xd7BqoD9wdocrJJs
	pVHVaKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3z50-00000009jyc-1lHi;
	Tue, 08 Sep 2026 16:53:54 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3z4x-00000009jyE-0Hpm;
	Tue, 08 Sep 2026 16:53:51 +0000
Message-ID: <fd157e63-e581-44b6-9e4a-962002669438@infradead.org>
Date: Tue, 8 Sep 2026 09:53:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ARM: deprecated platform removal
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260908152808.3928630-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/8/26 8:27 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In the 7.3 kernel, I marked a number of platforms and features as
> deprecated, with the plan to keep these around for the LTS kernel, but
> remove them in 7.4, see [1].
> 
> Cleaning out the deprecated platform code has turned into a larger effort
> than I expected, currently standing at 300 patches, with a lot of them
> still in need of being split up into smaller ones, see [2] for a current
> snapshot.
> 
> The first series here removes just the bits in arch/arm/mach-*/, plus
> the portions that directly depend on the removed Kconfig symbols where
> these are trivial to remove.
> 
> The parts that are not included are those that remove architectural
> features and device drivers that become unused after this part. Some of
> those may also make their way into 7.4, but at this point I would target
> 7.5 for most of them, to keep the dependencies simple.
> 
> This also gives everyone a chance to voice their objections in case
> that some of the removed platform code does have active users after all,
> before all the corresponding drivers are gone.
> 
>      Arnd
> 
> Links:
> [1] https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3
> 
> Arnd Bergmann (13):
>   ARM: remove sa1100 platform
>   ARM: remove footbridge
>   ARM: remove riscpc
>   ARM: remove legacy pxa board files
>   ARM: orion/dove/mv78xx0: remove all board files
>   ARM: omap2: remove omap24xx support
>   ARM: imx: remove i.MX31 SoC support
>   ARM: imx: remove nommu support
>   ARM: lpc18xx: remove entire platform
>   ARM: stm32: remove stm32f4/f7/h7 MCU support
>   ARM: versatile: remove mps2 support
>   ARM: at91: remove samv7 support
>   ARM: axxia: remove entire platform
> 
>  Documentation/arch/arm/index.rst              |    1 -
>  Documentation/arch/arm/netwinder.rst          |   85 -

I don't see netwinder.rst in any of the single patches.
Should it be in one of them?


[snip]

>  arch/arm/configs/netwinder_defconfig          |   88 -

Same for netwinder_defconfig.

If netwinder is going away, can all of
Documentation/arch/arm/nwfpe/ also go away?

Or do all of these come later (in phase 2 or 3)?

thanks.
-- 
~Randy


