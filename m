Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCA4CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wx0QdjxydDmrBFDNOoQQ5/uIBMbJD/oNitoYkWZcuC0=; b=4ND9ttWZH9/3dAFMCP/0E5q3qT
	FQUD55IMKEHGIWc0Yiia7iasZ2haGv3QM4xJGdncDx9BdH7pS4g4NwdIMDBe+jx7y49ybmJT+DTvt
	uBiGyYQl2dWAVDUfyrmyRUKo4yP2v/q5sExg3Zs5zbKgB3A82aAvv3tPwB6Hor2NSP9RLQizD0rUX
	8hW+28xa0lB0ArikBZtMb+Y2Tb4oaqD3A/IzWZniECsKiod32Iq2E6WnAO9klO3435d2/LOhNHgxm
	bjh7QPwRqE1JoRX4m3yfqxM+uJG57QQX4LHH0dRs2tnDgcVEDy8bRNP2n5aoBqn/n/HBQtztsL5jL
	dNfUZhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycO9-000000094et-2cIW;
	Tue, 16 Sep 2025 20:34:57 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycO7-000000094dR-1lXW;
	Tue, 16 Sep 2025 20:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1758054802; bh=wx0QdjxydDmrBFDNOoQQ5/u
	IBMbJD/oNitoYkWZcuC0=; b=QYC890JqZyfvPL4vqX1iuAz85TSGvZNs5qAS35MYC+22MBvW7W
	iskQ/WenBh0sSTeuVw2g4lZHoYPoiv2GGsiFUWUKFSkU2zjwAoKIfhh6KCfgHkaD/kzS8GS68rS
	5QxPQHc77pqj7NtCJnL98hSHNC/QK6suWUKMCY1iS34BYG6fYsZQ/3dpcvNdRz6I2AV2MVmHjwu
	YuaU6JaX/xZbIKJ6+kGLuBOfuRai4gyokobGwnVBSAZFlMDcIGJhjDWqDCzz5y0qkraPWvzgro4
	KM9+tBTzW+WGrtu1sDguiqrnfvt9vS5JK5S2VnGn8CNEa8jaBdqwZu+SFboo2ClciJw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1758054802; bh=wx0QdjxydDmrBFDNOoQQ5/u
	IBMbJD/oNitoYkWZcuC0=; b=5LVDcZRoMcSN9ktKl9Pg4tEUVZHPmNTbYq67qVDbHUTddPsvdm
	Jrh1Ji00j9vzj2yndXJA43uiUpoeW80faoDg==;
From: Dang Huynh <dang.huynh@mainlining.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/25] RDA8810PL Clock, RTC and MMC driver
Date: Tue, 16 Sep 2025 20:33:16 +0000
Message-ID: <14470724.O9o76ZdvQC@melttower>
In-Reply-To: <2025091620264900a32db6@mail.local>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <2025091620264900a32db6@mail.local>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_133455_598451_0B9D1037 
X-CRM114-Status: GOOD (  22.19  )
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

On Tuesday, September 16, 2025 8:26:49=E2=80=AFPM Coordinated Universal Tim=
e Alexandre=20
Belloni wrote:
> Hello,
>=20
> On 17/09/2025 03:07:17+0700, Dang Huynh wrote:
> > This patch series aims to add support for Clock/Reset, Real-Time Clock =
and
> > SDMMC on the RDA Micro RDA8810PL platform.
>=20
> What are the dependencies between the various drivers? Ho< do you expect
> the patches to be merged?
The MMC driver depends on the clock controller (for getting APB2 rates) and=
=20
IFC for transferring data.
>=20
> If the RTC patches are independent, please send them separately.
They're independent. Noted.
>=20
> > It also adds Intelligent Flow Controller (IOW, a DMA controller) which =
is
> > important for working with this MMC IP.
> >=20
> > Tested on the Orange Pi 2G-IOT.
> >=20
> > Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> > ---
> >=20
> > Dang Huynh (25):
> >       ARM: dts: unisoc: rda8810pl: Add label to GPIO nodes
> >       drivers: gpio: rda: Make IRQ optional
> >       dt-bindings: gpio: rda: Make interrupts optional
> >       rtc: Add timestamp for the end of 2127
> >       dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
> >       rtc: Add driver for RDA Micro SoC
> >       ARM: dts: unisoc: rda8810pl: Enable Real-Time Clock
> >       ARM: dts: unisoc: rda8810pl: Enable ARM PMU
> >       dt-bindings: clock: Add RDA Micro RDA8810PL clock/reset controller
> >       drivers: clk: Add Clock and Reset Driver for RDA Micro RDA8810PL =
SoC
> >       dts: unisoc: rda8810pl: Enable clock/reset driver
> >       dts: unisoc: rda8810pl: Add OPP for CPU and define L2 cache
> >       dts: unisoc: orangepi: Disable UART with no users
> >       dt-bindings: power: reset: Add RDA Micro Modem Reset
> >       power: reset: Add basic power reset driver for RDA8810PL
> >       dts: unisoc: rda8810pl: Enable modem reset
> >       drivers: gpio: rda: Make direction register unreadable
> >       dt-bindings: dma: Add RDA IFC DMA
> >       dmaengine: Add RDA IFC driver
> >       dts: unisoc: rda8810pl: Enable IFC
> >       dt-bindings: mmc: Add RDA SDMMC controller
> >       mmc: host: Add RDA Micro SD/MMC driver
> >       dts: unisoc: rda8810pl: Add SDMMC controllers
> >       dts: unisoc: orangepi-2g: Enable SD Card
> >       dts: unisoc: orangepi-i96: Enable SD Card
> > =20
> >  .../bindings/clock/rda,8810pl-apsyscon.yaml        |  44 ++
> >  Documentation/devicetree/bindings/dma/rda,ifc.yaml |  42 +
> >  .../devicetree/bindings/gpio/gpio-rda.yaml         |   3 -
> >  Documentation/devicetree/bindings/mmc/rda,mmc.yaml |  91 +++
> >  .../bindings/power/reset/rda,md-reset.yaml         |  36 +
> >  .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    |  30 +
> >  MAINTAINERS                                        |  30 +
> >  .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  |  24 +-
> >  .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts |  24 +-
> >  arch/arm/boot/dts/unisoc/rda8810pl.dtsi            | 115 ++-
> >  drivers/clk/Kconfig                                |   1 +
> >  drivers/clk/Makefile                               |   1 +
> >  drivers/clk/rda/Kconfig                            |  14 +
> >  drivers/clk/rda/Makefile                           |   2 +
> >  drivers/clk/rda/clk-rda8810.c                      | 770
> >  +++++++++++++++++++ drivers/dma/Kconfig                               =
 |
> >   10 +
> >  drivers/dma/Makefile                               |   1 +
> >  drivers/dma/rda-ifc.c                              | 450 +++++++++++
> >  drivers/gpio/gpio-rda.c                            |   4 +-
> >  drivers/mmc/host/Kconfig                           |  12 +
> >  drivers/mmc/host/Makefile                          |   1 +
> >  drivers/mmc/host/rda-mmc.c                         | 853
> >  +++++++++++++++++++++ drivers/power/reset/Kconfig                     =
 =20
> >  |   9 +
> >  drivers/power/reset/Makefile                       |   1 +
> >  drivers/power/reset/rda-reboot.c                   |  58 ++
> >  drivers/rtc/Kconfig                                |  11 +
> >  drivers/rtc/Makefile                               |   1 +
> >  drivers/rtc/rtc-rda.c                              | 356 +++++++++
> >  include/dt-bindings/clock/rda,8810pl-apclk.h       |  79 ++
> >  include/dt-bindings/dma/rda-ifc.h                  |  28 +
> >  include/linux/rtc.h                                |   1 +
> >  31 files changed, 3079 insertions(+), 23 deletions(-)
> >=20
> > ---
> > base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> > change-id: 20250916-rda8810pl-drivers-9a5271452635
> >=20
> > Best regards,

Best regards,
Dang


