Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86884EDF04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhXdclisZldz/8hc7S0vRX9vNEprTfI4c73aw/csD7U=; b=x49gKXdLO4bE6cfuP9OIn1MyWc
	baNbKOmYEjbkVvPTMfUbfVVFZ1nshc8VWErD02W3cNWwVht4284+wM73BoMvvp2gftpdp1AkN4xYZ
	YsR6B7LgeZKoeaoumDo2vo26fv5E6fm62LpV4K9wGcEGcCbOV9f2QtTwgACNjPyDA2SDZVtWbQyfg
	KenaoW5QzY6hyAHgPEaidnWCYTUkTm/sh9eSGmlQT4gurrioV7KA64kWYjkr00PUfsmC9KsBWoB1b
	7oBKt3SUvoY4iyp/EOqtTdC1QVZL82KJAIhc+V4AC+VI2UHI2/mnp+z0YtuqTr55YuX+wk1mI+2Xp
	q24pAiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQeC-00000001hGw-44cr;
	Thu, 12 Feb 2026 06:57:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQeA-00000001hGa-2qDT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 06:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8426744528;
	Thu, 12 Feb 2026 06:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B14C19424;
	Thu, 12 Feb 2026 06:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770879472;
	bh=TC4eT9vxiJeyFGCLPEWq5zI0trLgVLJ88LrdbbGyqFE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SHA2H4LGm2F4PFoDwpVUf8egI2XeSE59XvMXXiFZObN/kPYhjb2a6KxqMKsDYcDTa
	 DnzaIxuOH/79N630Muea1AePBhc174GPKn06qfo19ItyrVA5G2ugecoK2RiFjUABcc
	 05kTMY6aKXhoVF2nVWtbTPru4EQK+S+bXKCrH0jn6JF5Bm0FDAyRdZ5Ct/HGbO7cFo
	 B6yQY/BJ9Lc3uNE2L7/AI6+Ul1WBwHmJVURcRxBO935qz6gyTrZ9NCGnuM4eg+up4X
	 HxmCNbD57orEtW+5H4aW69CJvOAd/ztirYZ7TtzVhBAn8iLcx/rXs6vylEZbj92PF2
	 gDE23Rt9CvVKQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 689AEF40068;
	Thu, 12 Feb 2026 01:57:50 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 12 Feb 2026 01:57:50 -0500
X-ME-Sender: <xms:7nmNaS9MYDJG58U1RO4QSYPFO2jutu1K_REc9O7OE2dyiXTTy9YpEQ>
    <xme:7nmNadh9VdCSyF8p5VmytvT3FWJSNN7By9TyMjvSg-CkPUa7sQLnAcDSn6ZIKNZ5P
    6JTvqEqdjR3lDq20tIzVl8sB25FuB2w8i-LOlZl5ntgPDqmz3-j8to>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdegjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    ihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepthhonhihsegrth
    homhhiuggvrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhm
    rghilhdrtghomhdprhgtphhtthhopehjmhhkrhiihihsiihtsehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohep
    sghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsii
    gvfihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-ME-Proxy: <xmx:7nmNaXtS7qpTXHbv1NpxLGFXciifOEPLDnCV2OQZ8yC6DCDNNs2H2Q>
    <xmx:7nmNaS6ukGL5S6VXbN2s-GQ32_2QoHwHAnDsScZnFxcL51RgAyRRgw>
    <xmx:7nmNaST86bzoOaY8oewwG7S1Seh6XaUty9COozNXZZ3ArrXjRCYjoA>
    <xmx:7nmNadvUSM5dgGwUyc6IsL5anL-9RuhVjd7snlXle5KL_NuPdjlz5Q>
    <xmx:7nmNac8Ckc3dIPfqFdD5WKQlibMILvCutuJ35LX54qZwcrt_M4zryh-F>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 397B6700065; Thu, 12 Feb 2026 01:57:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AEuu_v-AJ7hw
Date: Thu, 12 Feb 2026 07:57:28 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Hans de Goede" <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <brgl@kernel.org>
Message-Id: <356b1997-ef0b-44f6-beeb-65f3cbed8681@app.fastmail.com>
In-Reply-To: <aY0oY-1rbLL3ract@google.com>
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
 <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
 <aYz2_pE53G67vv0v@google.com> <aY0oY-1rbLL3ract@google.com>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of GPIOs on
 Nokia 770
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_225754_783864_55071A55 
X-CRM114-Status: GOOD (  14.88  )
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

On Thu, Feb 12, 2026, at 02:12, Dmitry Torokhov wrote:
> On Wed, Feb 11, 2026 at 01:40:44PM -0800, Dmitry Torokhov wrote:
>> On Wed, Feb 11, 2026 at 05:31:52PM +0100, Arnd Bergmann wrote:
>> > 
>> > Do you know if there is a good way to do this without using static
>> > platform devices?
>> 
>> I wonder if something like below will help reducing boilerplate...
>
> And then we can change the gpio16xx like this (on top of Bartosz
> changes):

> @@ -49,27 +49,27 @@ static struct omap_gpio_reg_offs omap16xx_mpuio_regs = {
>  	.irqctrl	= OMAP_MPUIO_GPIO_INT_EDGE,
>  };
> 
> -static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
> +static const struct omap_gpio_platform_data omap16xx_mpu_gpio_config 
> __initconst = {
>  	.is_mpuio		= true,
>  	.bank_width		= 16,
>  	.bank_stride		= 1,
>  	.regs                   = &omap16xx_mpuio_regs,
>  };
> 
> -const struct software_node omap16xx_mpu_gpio_swnode = { };
> +static const struct software_node omap16xx_mpu_gpio_swnode;
> 
> -static struct platform_device omap16xx_mpu_gpio = {
> -	.name           = "omap_gpio",
> -	.id             = 0,
> -	.dev            = {
> -		.platform_data = &omap16xx_mpu_gpio_config,
> -	},
> -	.num_resources = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
> -	.resource = omap16xx_mpu_gpio_resources,
> +static const struct platform_device_info omap16xx_mpu_gpio_info __initconst = {
> +	.name = "omap_gpio",
> +	.id = 0,
> +	.data = &omap16xx_mpu_gpio_config,
> +	.size_data = sizeof(omap16xx_mpu_gpio_config),
> +	.res = omap16xx_mpu_gpio_resources,
> +	.num_res = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
> +	.swnode = &omap16xx_mpu_gpio_swnode,
>  };

Yes, that looks really nice!

     Arnd

