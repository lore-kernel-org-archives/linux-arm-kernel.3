Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CFC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 23:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpEmr/e3ukCd0czHB3NsTxN/yKr60rTN8HisxDGMEl4=; b=MCNDh9/7Ayya3GCe6UBaoQaGEF
	zpJatw3nsGvQ9pOhmAWC2+SpAuFjTKwQxlC9JpE0uBEC6DRYX6jhuHdoYh1BJjwTsg2ISemn3LuK+
	AoMv8VNHI8rimW+EIExYvvVjiDb/Uw2Q9DRS4Gb7dT4CZbHq9ffaB5iNL8jg4T9bhexSyBZlRfg+a
	FgkPQv8Xtq5lrefthUp9fE3P4P8N1inIXjJ2/5VkdMEGYmEnzYlHWgoSGk/nNYYGJu5IqyZVQQJHT
	eu7XqOvjD/BCQiBdh4GRYgkFQucWgHnRSR3APCXuCFPQJTYPcQca9mLr0J1t1trgy7JRpS5UMKwip
	Mjl4AnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Qv9-00000000aMs-1Mh4;
	Sun, 20 Sep 2026 23:26:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Qv8-00000000aMm-03lv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 23:26:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E191600C8;
	Sun, 20 Sep 2026 23:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7401F000FF;
	Sun, 20 Sep 2026 23:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789946764;
	bh=VpEmr/e3ukCd0czHB3NsTxN/yKr60rTN8HisxDGMEl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EqV5NwmPD3ytRoFsnfM7vY/sXFX0byGf5f75kKNQoxx8WPsdyfr+Hq4EfvSGiTiGC
	 KPwPuSXl4zw+D6QpKXiUu/rJzKVHzbfOFhD+Fpj1v603tNXAwQ5BoQfcDN99JV1V3S
	 vh2OYmlI36y/zqYH3DfucLVYIyf6dymY3aEnR+b0O3emz1xoTAocu+Niez5Okdyk6i
	 43BSBC+haao6gw6DCIMlIQI2BImgtTzGP+gUptrP2K+oSceE8P7wHtksod5sLhqVhJ
	 9ssYb3M+44hq+IK7owZB8EGRaEIrPVuMDmm26gVgksUGbSurM4XjsyvfMhrijQErwm
	 m9XmmpgSqUo9w==
Date: Mon, 21 Sep 2026 00:26:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank.Li@oss.nxp.com, Eugen Hristev <ehristev@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Felix Gu <ustc.gu@gmail.com>, Stepan Ionichev
 <sozdayvek@gmail.com>, Shuvam Pandey <shuvampandey1@gmail.com>, Antoniu
 Miclaus <antoniu.miclaus@analog.com>, Frank Li <Frank.Li@nxp.com>, Piyush
 Patle <piyushpatle228@gmail.com>, "Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 (The Capable Hub)" <u.kleine-koenig@baylibre.com>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Giorgi Tchankvetadze
 <giorgitchankvetadze1997@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, "Rob Herring (Arm)" <robh@kernel.org>, Pei
 Xiao <xiaopei01@kylinos.cn>, Shi Hao <i.shihao.999@gmail.com>, Kees Cook
 <kees+treewide@kernel.org>, Michael Hennerich
 <michael.hennerich@analog.com>, "open list:MICROCHIP SAMA5D2-COMPATIBLE ADC
 DRIVER" <linux-iio@vger.kernel.org>, "moderated list:ARM/Microchip (AT91)
 SoC support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, imx@lists.linux.dev,
 vkoul@kernel.org
Subject: Re: [PATCH 1/1] iio: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <20260921002600.7c3d5630@jic23-hlaptop>
In-Reply-To: <aqzefLjkj6VrLR1b@ashevche-desk.local>
References: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
	<aqzefLjkj6VrLR1b@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 18 Sep 2026 09:47:24 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Sep 17, 2026 at 04:36:26PM -0400, Frank.Li@oss.nxp.com wrote:
> 
> > Replace direct dma_chan::device::dev access with the proper
> > dmaengine_get_dma_device() accessor in IIO DMA consumers.
> > 
> > chan->device->dev is not always the device used for DMA mapping.
> > Some DMA engines support per-channel IOMMU mappings, so different
> > channels may use different DMA devices.  dmaengine_get_dma_device()
> > returns the correct device for each channel.
> > 
> > This also prepares for making the DMA engine provider data structures
> > private. DMA consumers should not access DMA engine internals directly.  
> 
> ...
> 
> >  drivers/iio/adc/at91-sama5d2_adc.c                 |  9 ++++++---
> >  drivers/iio/adc/nxp-sar-adc.c                      |  2 +-
> >  drivers/iio/adc/stm32-adc.c                        | 10 ++++++----
> >  drivers/iio/adc/stm32-dfsdm-adc.c                  |  4 ++--
> >  drivers/iio/adc/ti_am335x_adc.c                    |  4 ++--
> >  drivers/iio/buffer/industrialio-buffer-dmaengine.c |  5 +++--  
> 
> Strictly speaking this is two patches, one per ADC folder and the other against
> IIO core. But this one is not a big one, so up to Jonathan.
Agreed that would be ideal but I don't care enough for a v2!
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Applied to the testing branch of iio.git (material for next merge window)
That will turn up in linux-next once tests are done and I remember to push.

Thanks,

Jonathan

> 


