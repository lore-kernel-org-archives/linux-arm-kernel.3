Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC7CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TifYnif42ZBQ/k+jPQp5ejbLjX033oKvWYKYmVz+Mmw=; b=W8Cq0KlH1QyEbWhbXXo3NLzqwe
	J9moO4o59PnnHDHbc6zYopBFEqcvyxopYNyhQS/rNAnWm351Q8ZvbkufSKPeWCLdXHtd5d6MgKwkj
	Gdny2KqaN2sRtKQJedYaKJ/6eSh1uD9Vlx4CQFWKV8zgXEV78AvwUDkGIp311i/Q3pieiLYoJbroO
	dfTIJRNxaKCWFtmgtrPrHBqAClP0o+qIorLKFQmfc0wkJYtti+hulY3tQ2VPgxpRh7kmr9RfscjbZ
	Bn3mlyV8KG8KllsId8IYiw+n+BNZBq6eYhWvbG7rf6DPTx22uFTupke2Sr9F7kvo45y0Gaj/MLwTy
	4O9AW4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC12-00000003kxr-0bhQ;
	Thu, 02 Jul 2026 07:39:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0y-00000003kx5-3ZtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782977958; x=1814513958;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/hiYXX+Tl9Oi9Ll1odfLmRU1+IL7JIxTnj5Jgck2HxQ=;
  b=gDtkathtUtotk0gYXF9hjNYulENJbFTMOtJVSrk0ruVlegEJovFVeKGn
   8zBO7VqYcD3i4KFrc+L9ghCQ0jX48+qRKGIsjCRvhbe95menaaD1Ke1Mf
   OnfPh/mOsscPMW3WAyTJC6aq+9MYqA7qWQyoAjws7H9Qz0n8VEH2+w/kE
   29gifjI1pi+zW53Mhr7RQnADebWytr5QKU0zD1e1BJKRCL/f/20N5YtUg
   bMWzIdAZMVV0tyYHLHPduqq+qkqTr/+i5CCGe2Jcn8hY+Z4TXsQb8NupY
   sICduP1eLoaVDAu8EBu8Z5iATgzAwXQYKQw+ZoyIBnLg+Si+p0F0P4I/q
   g==;
X-CSE-ConnectionGUID: Kzlc3EJsT/a0PYNYbFcCFg==
X-CSE-MsgGUID: Q2pi1i4kRfO/I5PSg+70xQ==
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="60352475"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jul 2026 00:39:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 2 Jul 2026 00:39:14 -0700
Received: from [10.171.248.30] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 2 Jul 2026 00:39:06 -0700
Message-ID: <54e742dd-aced-40f0-b4be-df160c8cbe3d@microchip.com>
Date: Thu, 2 Jul 2026 09:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/19] ARM: mark Cortex-M3/M4/M7 based boards as
 deprecated
To: Arnd Bergmann <arnd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<soc@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin
	<alexander.sverdlin@siemens.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel
	<ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack
	<daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Gregory Clement <gregory.clement@bootlin.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, "Jeremy J. Peper"
	<jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Ralph
 Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Will Deacon
	<will@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-18-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260701212353.2196041-18-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_003916_960382_010482F8 
X-CRM114-Status: GOOD (  22.59  )
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

On 01/07/2026 at 23:23, Arnd Bergmann wrote:
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
>   arch/arm/Kconfig            |  8 ++++++--
>   arch/arm/mach-at91/Kconfig  |  4 +++-
>   arch/arm/mach-imx/Kconfig   |  4 +++-
>   arch/arm/mach-stm32/Kconfig | 14 ++++++++------
>   4 files changed, 20 insertions(+), 10 deletions(-)

[..]

> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index c5ef27e3cd8f..cb0e3ff8e0ca 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -15,13 +15,15 @@ menuconfig ARCH_AT91
> 
>   if ARCH_AT91
>   config SOC_SAMV7
> -       bool "SAM Cortex-M7 family" if ARM_SINGLE_ARMV7M
> +       bool "SAM Cortex-M7 family (DEPRECATED)" if ARM_SINGLE_ARMV7M
>          select COMMON_CLK_AT91
>          select PINCTRL_AT91
>          help
>            Select this if you are using an SoC from Microchip's SAME7, SAMS7 or SAMV7
>            families.
> 
> +         This platform is scheduled for removal in early 2027

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> +
>   config SOC_SAMA5D2
>          bool "SAMA5D2 family"
>          depends on ARCH_MULTI_V7

[..]

Thanks, regards,
   Nicolas

