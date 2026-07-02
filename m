Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeDsU4JSwr46k9qyx479qfoNmLDEE+D20WgQzPutxMM=; b=el92i+SoDW1Ts2fIj2P49XGY+9
	WcODBjGde+LTrXaNd6vUhMqdnbueFARh9CWBoIHlig+LYYfeaYbKWktTmXvk3jhtHYMyRDLFCmoKD
	Ke2h1CRGKZobBeVyPPQWQ05gCiGEZMAK3N8iGI2mxuvGdgq4eT/FtpxTNqzueNnfPdexLqNMByXly
	J/yv0hQ+BB4Qcssj/yyW4dgNrfHjB0MErq5ZSj/87u3pvKU0EUpzxRhQCgIMeJyhPC8sgUCL44xWi
	mjLANih2n/g6qmU4Ss/amGGdTIsYaP9rV18TaDK5PcSZE+8mGecVuD56sXQnJsS0mIYiJzZ47iMPr
	2Ytqyqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfD1i-00000003uIh-1HFs;
	Thu, 02 Jul 2026 08:44:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfD1f-00000003uHu-250a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:44:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 676A4288E;
	Thu,  2 Jul 2026 01:43:51 -0700 (PDT)
Received: from [10.1.36.193] (e121487-lin.cambridge.arm.com [10.1.36.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E584E3F905;
	Thu,  2 Jul 2026 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782981835; bh=rPDevm0YRy77Ne+62P1HMegZMMVYnYj/WPFGNqP8hQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nuVyVZ97ajw+6v98/4yS91JCo/Xkwuch52Og9baGNKpm0As7HkehfcOM3vrN9x49A
	 d8N9GHMU1JYWDjRYsfsZPaXsdUAC3MvElbKlWVxslNdPdsPnWznzOR06TMSLtIwUUD
	 yuruJZnUwxa5Yums5P3FG8S2xbngrUfYXS/K+ISI=
Message-ID: <1de8cf96-3e46-4d86-818b-7a2a1ded6166@arm.com>
Date: Thu, 2 Jul 2026 09:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/19] ARM: mark Cortex-M3/M4/M7 based boards as
 deprecated
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-18-arnd@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260701212353.2196041-18-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_014403_627274_AC099149 
X-CRM114-Status: GOOD (  20.65  )
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

On 7/1/26 22:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Cortex-M3/M4/M7 cores were designed as a replacement for the earlier
> ARM7TDMI and ARM9TDMI microarchitectures used in older microcontrollers.
> 
> At the moment, Linux can run these cores either when they are integrated
> into a larger SoC, or as standalone microcontrollers. While there was
> a lot of development work going into Cortex-M support from 2011 to 2016,
> this largely stopped when it became clear that Zephyr and other RTOS
> had taken over that market. To date, the only Cortex-M based based
> microcontroller boards supported upstream are reference implementations.
> 
> Schedule these for removal after the next LTS kernel, so if any users
> remain that want to update their kernels, they can stay on that
> version for a few years before having to maintain the platform support
> out of tree.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig            |  8 ++++++--
>  arch/arm/mach-at91/Kconfig  |  4 +++-
>  arch/arm/mach-imx/Kconfig   |  4 +++-
>  arch/arm/mach-stm32/Kconfig | 14 ++++++++------
>  4 files changed, 20 insertions(+), 10 deletions(-)
> 

[snip]

>  config ARCH_MPS2
> -	bool "ARM MPS2 platform"
> +	bool "ARM MPS2 platform (DEPRECATED)"
>  	depends on ARM_SINGLE_ARMV7M
>  	select ARM_AMBA
>  	select CLKSRC_MPS2
> @@ -493,6 +495,8 @@ config ARCH_MPS2
>  	  Please, note that depends which Application Note is used memory map
>  	  for the platform may vary, so adjustment of RAM base might be needed.
>  
> +	  This platform is scheduled for removal in early 2027
> +
>  # Definitions to make life easier
>  config ARCH_ACORN
>  	bool

Acked-by: Vladimir Murzin <vladimir.murzin@arm.com> # MPS2


Thanks
Vladimir

