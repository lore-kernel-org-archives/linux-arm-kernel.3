Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6DCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBI2aJbB7n590+KcwgaegrRfg5lM30jDW0OwGnQmBL8=; b=T9RiqxCRQ5QiNNUg1Plo27wavv
	8wAyy7KeHmfoYKnL6gKLC+zh4ktZdEsljIa/a0QP5ng9SxjydH5f3pgLpvlSFhKsTV+6rhIZUz4X3
	kv1cKPGbyDtmG1xc0EEmAHBpn400Qy02DRc33KOt3mOjsmkJ1ygSYWsaWzIAfEHWNhLFx4No1prsd
	jIC4KWXVhrSMl3VrCj4oJdjAwOkjB8QKsJZvkR5n6z7SPxfy7Xk3w7iGjh49U5E3o8L+5S5DBCXdi
	+DVsPiQZ3x6pOdPmmAFJ7jZgAR3oCSpb0a5IDCdz5Q5PTL9vEunUEBvQfk44qCTuPtH89j9M6aJAO
	8sges+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tuS-0000000CG3V-1TKc;
	Tue, 23 Sep 2025 03:41:44 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tuP-0000000CG2g-36Fx;
	Tue, 23 Sep 2025 03:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758598846; bh=RBI2aJbB7n590+KcwgaegrR
	fg5lM30jDW0OwGnQmBL8=; b=sRjl/jZpgu8H2CCD/bvJRFr84ayFxOWFDfefDY/9M3pPOybi5w
	lN8kDaTaV+lvXaJWoXtRLjvYQ72ke1vagpeRzkLmj9xzTdjaUUtLIcp6kNbjDTXNuUvfRjvQBGt
	Woc9cSOZGQZHgEaNee3rLueQ/MPOLBaxqT6muqnh0yj3vVswnT4V4BGRyE4Ws2+y357MwxLDDXc
	5zFTwjV430W2yYKhlLvSxm38QBj54ZvsJjZT1yH1zbZBRM+RcSMjtjl+He7bYMNL0vx57AC8lhu
	0O7vO1yhF2z5AGLZyIb+D6gLV+qf+KpGapgbQ6XnOJl9oKC0A7w8P/AWbWb8IuVnPSw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758598846; bh=RBI2aJbB7n590+KcwgaegrR
	fg5lM30jDW0OwGnQmBL8=; b=9iEveaNrpfx+7EskGD80aKFQggG9+eDi7M/DmfHYjY9si7U0fL
	1IgSpCtPfNEbyOVBCakFKmaRd5+VgsDV4/Ag==;
Date: Tue, 23 Sep 2025 10:40:37 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 00/10] RDA8810PL SD/MMC support
Message-ID: <2wwi3ktbcuyp7y7mqplndvawagae5hdhcx3hn375kycoqtows6@xcww2237rxpe>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_204141_934708_C4F0FB14 
X-CRM114-Status: GOOD (  21.77  )
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

On Mon, Sep 22, 2025 at 04:17:05PM +0200, Bartosz Golaszewski wrote:
> On Thu, Sep 18, 2025 at 8:49 PM Dang Huynh via B4 Relay
> <devnull+dang.huynh.mainlining.org@kernel.org> wrote:
> >
> > This patch series aims to add SDMMC driver and various drivers required
> > for SDMMC controller to function.
> >
> > This also fixed a bug where all the GPIO switched from INPUT to OUTPUT
> > after the GPIO driver probed or by reading the GPIO debugfs.
> >
> > This patch series is a split from [1] to ease the maintainers.
> >
> 
> This is still targeting at least 4 subsystems and isn't making the
> merging any easier. Are there any build-time dependencies here? If
> not, then split it further into small chunks targeting individual
> subsystems and the relevant ARM SoC tree.
The MMC driver depends on both the clock and the DMA driver.

> 
> Bartosz
> 
> > Tested on Orange Pi 2G-IOT using a Buildroot environment.
> >
> > [1]: https://lore.kernel.org/all/20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org/
> >
> > Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> > ---
> > Dang Huynh (10):
> >       dt-bindings: gpio: rda: Make interrupts optional
> >       dt-bindings: clock: Add RDA Micro RDA8810PL clock/reset controller
> >       dt-bindings: dma: Add RDA IFC DMA
> >       dt-bindings: mmc: Add RDA SDMMC controller
> >       gpio: rda: Make IRQ optional
> >       gpio: rda: Make direction register unreadable
> >       clk: Add Clock and Reset Driver for RDA Micro RDA8810PL SoC
> >       dmaengine: Add RDA IFC driver
> >       mmc: host: Add RDA Micro SD/MMC driver
> >       ARM: dts: unisoc: rda8810pl: Add SDMMC controllers
> >
> >  .../bindings/clock/rda,8810pl-apsyscon.yaml        |  43 ++
> >  Documentation/devicetree/bindings/dma/rda,ifc.yaml |  45 ++
> >  .../devicetree/bindings/gpio/gpio-rda.yaml         |   3 -
> >  Documentation/devicetree/bindings/mmc/rda,mmc.yaml |  92 +++
> >  MAINTAINERS                                        |  18 +
> >  .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  |  20 +
> >  .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts |  20 +
> >  arch/arm/boot/dts/unisoc/rda8810pl.dtsi            |  47 +-
> >  drivers/clk/Kconfig                                |   1 +
> >  drivers/clk/Makefile                               |   1 +
> >  drivers/clk/rda/Kconfig                            |  14 +
> >  drivers/clk/rda/Makefile                           |   2 +
> >  drivers/clk/rda/clk-rda8810.c                      | 769 +++++++++++++++++++
> >  drivers/dma/Kconfig                                |  10 +
> >  drivers/dma/Makefile                               |   1 +
> >  drivers/dma/rda-ifc.c                              | 450 +++++++++++
> >  drivers/gpio/gpio-rda.c                            |   4 +-
> >  drivers/mmc/host/Kconfig                           |  12 +
> >  drivers/mmc/host/Makefile                          |   1 +
> >  drivers/mmc/host/rda-mmc.c                         | 853 +++++++++++++++++++++
> >  include/dt-bindings/clock/rda,8810pl-apclk.h       |  70 ++
> >  include/dt-bindings/dma/rda-ifc.h                  |  28 +
> >  22 files changed, 2495 insertions(+), 9 deletions(-)
> > ---
> > base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> > change-id: 20250918-rda8810pl-mmc-3f33b83c313d
> >
> > Best regards,
> > --
> > Dang Huynh <dang.huynh@mainlining.org>
> >
> >

