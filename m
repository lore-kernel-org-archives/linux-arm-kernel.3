Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8489CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re45dUlJQfPOR4/3Kurx0NHEF1BvXeHFFZDS6UyvBZE=; b=4qxSJEQOQoMjcs5K4BhWSuXJUR
	h0Vg9dIMhaOaY+0wgDZIpHVDoTvyJyuMa6Z/c2e3TuNJ2VpqUxCMpR8PxIFcKYvqqMOOL1bXxT3Ya
	77gj9BqEDr6R6ot9pdW9/AL3/fXyK0srCmmK9Tw/4Rl3nHQ8zyVfUgrFWka/ucFgxa5/oplUxQ0T1
	MhoIramdAMYrcz17jxFH0eZtwQNe3aIyLHpN1W/7mFkKrolCEW0LH/XtTtONa46QgNr94c6uotzId
	NFgWdd/LG8itr8QanoKwSiq/SHzne4dBar8H0nQC7o3fao1PBSrBOluUXAUPZxuxnLssR5mep6mJh
	EZjsNz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvOm-00000006Kcs-2xM0;
	Wed, 30 Sep 2026 14:35:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvOl-00000006Kca-1Za5;
	Wed, 30 Sep 2026 14:35:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B963540686;
	Wed, 30 Sep 2026 14:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39D71F000FF;
	Wed, 30 Sep 2026 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790778906;
	bh=re45dUlJQfPOR4/3Kurx0NHEF1BvXeHFFZDS6UyvBZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ayeyl7A3+eZTyEqdncvSs/p3gLnpq6+Zl/vIDv6hJbAB4f40QxnZUt5o5KSizGZ4r
	 9yWKKS1S2dsV7TPQZIPcfYdqocepZMCqLrS+//d1KVIO7zfNM1HX6i8fPsG4MS85r4
	 mGL51D6XWVMJvZN9F+hUvmvjav/3Th0AgYPCclsgyNm5EWX4t1RL9ZFisS4WdYSPf3
	 JCn4ZBpRYvZsdAxKenz3NDN2kOTfnfDdAeBzhf51kP7jDXCV29HxvAsI9aKSx4Uasp
	 CT0MiECdxL46D+0X9+jiVDYHmOuPXNnwfKmF7mSsCe9v/ypy5ajlhT7L6J8c6hW3qI
	 +8h6D3pR2sn1A==
Date: Wed, 30 Sep 2026 22:15:04 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/20] arm64: add Synaptics SL261X SoCs and RDK boards
Message-ID: <ar0ZaC2q0wjUEKD6@xhacker>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929-smoked-laurel-087d5a3523a3@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-smoked-laurel-087d5a3523a3@spud>
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

On Tue, Sep 29, 2026 at 08:38:52PM +0100, Conor Dooley wrote:
> On Tue, Sep 29, 2026 at 02:13:57PM +0800, Jisheng Zhang wrote:
> > Add initial support for the Synaptics SL261X SoCs and corresponding
> > RDK boards.
> > 
> > The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
> > SL2615, SL2617, and SL2619.
> > 
> > Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
> > this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
> > be submitted after this series is merged.
> 
> This series is filled with wildcard compatibles, which we don't permit
> typically. The only case for SoCs that I've seen them accepted is when
> the devices covered are actually just different binnings of the same
> device. I took a look at the docs for this device, but it wasn't clear
> to me if these are actually binnings or if there are different
> integrations here. If they're binnings, I'd rather you used 0 as the
> final digit, rather than x, since that matches the synaptics
> documentation for the family. If they're not binnings, there's no
> guarantee that they share the same errata etc, and must have different
> compatibles.

Based on these kind hints, I will use sl2610 instead of sl261x.

Thanks a lot
> 
> Cheers,
> Conor.
> 
> > 
> > 
> > Jisheng Zhang (20):
> >   dt-bindings: serial: snps-dw-apb-uart: Add Synaptics sl261x uart
> >   dt-bindings: i2c: dw: Add Synaptics sl261x i2c
> >   spi: dt-bindings: snps,dw-apb-ssi: Add Synaptics sl261x spi
> >   dt-bindings: i3c: dw: support up to two reset lines
> >   i3c: dw: switch to array-based exclusive reset control
> >   dt-bindings: i3c: Add Synaptics sl261x i3c
> >   arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
> >   dt-bindings: reset: add Synaptics SL261X SoCs
> >   reset: add Synaptics SL261x reset support
> >   pinctrl: berlin: use u16 instead of u8 for the offset
> >   pinctrl: berlin: enable module build support
> >   pinctrl: berlin: add optional pinconf support
> >   dt-bindings: pinctrl: berlin: Support Synaptics SL261X SoCs
> >   pinctrl: berlin: support Synaptics SL261X SoCs
> >   dt-bindings: clock: add Synaptics SL261X clock
> >   clk: berlin: add Synaptics SL261X SoC clocks and plls
> >   dt-bindings: mfd: Add Synaptics SL261x global block binding
> >   regulator: dt-bindings: sy8827n: support standard properties
> >   dt-bindings: arm: berlin: Add Synaptics SL261X SoC and RDK board
> >   arm64: dts: synaptics: Add Synaptics SL261X SoC and RDK board
> > 
> >  .../bindings/arm/marvell,berlin.yaml          |  20 +
> >  .../bindings/clock/syna,sl261x-clk.yaml       |  92 +++
> >  .../bindings/i2c/snps,designware-i2c.yaml     |   1 +
> >  .../bindings/i3c/snps,dw-i3c-master.yaml      |   6 +-
> >  .../bindings/mfd/syna,sl261x-gbl.yaml         | 208 +++++
> >  .../pinctrl/marvell,berlin2-soc-pinctrl.yaml  |  10 +-
> >  .../bindings/regulator/silergy,sy8827n.yaml   |   5 +-
> >  .../bindings/reset/syna,sl261x-reset.yaml     |  40 +
> >  .../bindings/serial/snps-dw-apb-uart.yaml     |  12 +-
> >  .../bindings/spi/snps,dw-apb-ssi.yaml         |   1 +
> >  arch/arm64/Kconfig.platforms                  |   4 +-
> >  arch/arm64/boot/dts/synaptics/Makefile        |   5 +
> >  arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
> >  arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 490 ++++++++++++
> >  arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
> >  arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
> >  arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
> >  arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
> >  arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
> >  arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
> >  arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
> >  arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 ++
> >  .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
> >  drivers/clk/Kconfig                           |   1 +
> >  drivers/clk/berlin/Kconfig                    |  25 +
> >  drivers/clk/berlin/Makefile                   |   4 +
> >  drivers/clk/berlin/sl-clk.c                   | 279 +++++++
> >  drivers/clk/berlin/sl-clk.h                   |  31 +
> >  drivers/clk/berlin/sl-sysmgr-clk.c            | 250 ++++++
> >  drivers/clk/berlin/sl-sysmgr-clk.h            |  44 ++
> >  drivers/clk/berlin/sl261x-clks.c              | 385 +++++++++
> >  drivers/clk/berlin/sl261x-pll.c               | 145 ++++
> >  drivers/clk/berlin/sl261x-pll.h               |  14 +
> >  drivers/i3c/master/dw-i3c-master.c            |  24 +-
> >  drivers/i3c/master/dw-i3c-master.h            |   2 +-
> >  drivers/pinctrl/berlin/Kconfig                |   7 +
> >  drivers/pinctrl/berlin/Makefile               |   1 +
> >  drivers/pinctrl/berlin/berlin.c               | 259 +++++-
> >  drivers/pinctrl/berlin/berlin.h               |  17 +-
> >  drivers/pinctrl/berlin/pinctrl-sl261x.c       | 745 ++++++++++++++++++
> >  drivers/reset/Kconfig                         |   6 +
> >  drivers/reset/Makefile                        |   1 +
> >  drivers/reset/reset-sl261x.c                  | 224 ++++++
> >  include/dt-bindings/clock/syna,sl261x.h       | 131 +++
> >  include/dt-bindings/reset/syna,sl261x-reset.h |  80 ++
> >  45 files changed, 3899 insertions(+), 33 deletions(-)
> >  create mode 100755 Documentation/devicetree/bindings/clock/syna,sl261x-clk.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mfd/syna,sl261x-gbl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/reset/syna,sl261x-reset.yaml
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
> >  create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> >  create mode 100644 drivers/clk/berlin/Kconfig
> >  create mode 100644 drivers/clk/berlin/sl-clk.c
> >  create mode 100644 drivers/clk/berlin/sl-clk.h
> >  create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
> >  create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
> >  create mode 100644 drivers/clk/berlin/sl261x-clks.c
> >  create mode 100644 drivers/clk/berlin/sl261x-pll.c
> >  create mode 100644 drivers/clk/berlin/sl261x-pll.h
> >  create mode 100644 drivers/pinctrl/berlin/pinctrl-sl261x.c
> >  create mode 100644 drivers/reset/reset-sl261x.c
> >  create mode 100644 include/dt-bindings/clock/syna,sl261x.h
> >  create mode 100644 include/dt-bindings/reset/syna,sl261x-reset.h
> > 
> > -- 
> > 2.53.0
> > 



