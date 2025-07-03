Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E14AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVUcdyabin1Xsy1KBksxVemk6XUREcwoqSWebUTwwQc=; b=utWtpr1n4DdkLZfAU1H5Hp5bLE
	srXYjGQpf/sV6FL9ByjtmaEgsCfeTMuYwvMQQrpH4oLo4zrIznnSMBSU27ehqF1OkJbRFEfXSdcdg
	e+epkjbyTInV1Xc/z76VO5rrFp/rky4Lx6XKKA6+VLwRhIE7r8fwGky+RPPy6pCx9M1JHMXamcVwK
	MvhXUvNaIRSfRDau/Q76CvbMNrtfC1giwZxK+0Yb2015K274fawK8E+LZb9l76AAytdpXWFgNB1rN
	AY2ulFWcwaLq4UhRbzATvt5LRuyCtMYRQhmOyIvVIVhgFLgLO7xuAKwd0QBnyWOKuNlG6kT5LiYI1
	T3yvTUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMA0-0000000BsvI-03Tp;
	Thu, 03 Jul 2025 15:47:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKQW-0000000BYyK-3kqF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1751550996; x=1783086996;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y4ooV2WhBZfJ2d538OTlPKZEGsSC5494XT/RIfWXDLk=;
  b=GFNTBNZqwk1m5EiwLij7Lx8w4lcMV0IolQmGXpz90m3ZQSe37jnSHLxa
   YL8z9yKeHpd5p2OZP0kqzu8NIrHzH/cCeMKxA4FuWFPbBTf0LAoa+TYQf
   80SNfQKh4BXh+O0CqQZkJVrXe2RHFxOr6yY49erT+nhvts+fnobJqdzRB
   +De0K+HM7xRcuf/KloINVLiqpVnhMSGB+rtQiYKAeWkLO0TSCRTh5g6wC
   yxJmE5PQPuARp981etfVQIjC7qfTXyin2R8My/a2kuFEh3H2nMPiKXu2c
   kB0ZpwLYNBcs4WSkLC5gxSBWsNdm1LEtYs2XIi6nKfPsXFHZVp/RCm0kJ
   g==;
X-CSE-ConnectionGUID: bVLJ8fMtTTSJrF3ArC6WlA==
X-CSE-MsgGUID: UqmCzDwdQLKXTFtb/xi4uA==
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="43062061"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2025 06:56:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Jul 2025 06:55:53 -0700
Received: from [10.171.248.31] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 3 Jul 2025 06:55:47 -0700
Message-ID: <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
Date: Thu, 3 Jul 2025 15:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
To: Robert Marko <robert.marko@sartura.hr>, Arnd Bergmann <arnd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Russell King <linux@armlinux.org.uk>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Lee Jones
	<lee@kernel.org>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Machon <daniel.machon@microchip.com>, <luka.perkov@sartura.hr>, "Conor
 Dooley" <Conor.Dooley@microchip.com>, Lars Povlsen - M31675
	<Lars.Povlsen@microchip.com>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
 <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
 <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
Content-Language: en-US, fr
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_065637_164265_BB432D99 
X-CRM114-Status: GOOD (  19.96  )
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

Robert, Arnd,

On 03/07/2025 at 14:25, Robert Marko wrote:
> On Wed, Jul 2, 2025 at 9:57 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
>>> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
>>>
>>> However, this means that new Microchip platforms that share drivers need
>>> to constantly keep updating depends on various drivers.
>>>
>>> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
>>> could instead depend on.
>>
>> Thanks for updating the series to my suggestion!
>>
>>> @@ -174,6 +160,27 @@ config ARCH_MESON
>>>          This enables support for the arm64 based Amlogic SoCs
>>>          such as the s905, S905X/D, S912, A113X/D or S905X/D2
>>>
>>> +menuconfig ARCH_MICROCHIP
>>> +     bool "Microchip SoC support"
>>> +
>>> +if ARCH_MICROCHIP
>>> +
>>> +config ARCH_SPARX5
>>> +     bool "Microchip Sparx5 SoC family"
>>
>> This part is the one bit I'm not sure about: The user-visible
>> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
>> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
>> here, or more generally speaking any of the nested ARCH_*
>> symbols.

Well, having a look at arch/arm64/Kconfig.platforms, I like how NXP is 
organized.

SPARX5, LAN969x or other MPU platforms, even if they share some common 
IPs, are fairly different in terms of internal architecture or feature set.
So, to me, different ARCH_SPARX5, ARCH_LAN969X (as Robert proposed) or 
future ones make a lot sense.
It will help in selecting not only different device drivers but 
different PM architectures, cores or TrustZone implementation...

>> This version of your patch is going to be slightly annoying
>> to existing sparx5 users because updating an old .config
>> breaks when ARCH_MICROCHIP is not enabled.

Oh, yeah, indeed. Even if I find Robert's proposal ideal.

Alexandre, Lars, can you evaluate this level of annoyance?

>> The two options that I would prefer here are
>>
>> a) make ARCH_SPARX5 a hidden symbol in order to keep the
>>     series bisectable, remove it entirely once all references
>>     are moved over to ARCH_MICROCHIP
>>
>> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
>>     ARCH_SPARX5 but keep the menu unchanged.
> 
> Hi Arnd,
> Ok, I see the issue, and I would prefer to go with option b and do
> what I did for
> AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current configs.

Yep, but at the cost of multiple entries for Microchip arm64 SoCs at the 
"Platform selection" menu level. Nuvoton or Cavium have this already, so 
it's probably fine.

>> Let's see what the sparx5 and at91 maintainers think about
>> these options.
> 
> Sounds good, let's give them some time before I respin this series.

Thanks to both of you. Best regards,
   Nicolas

