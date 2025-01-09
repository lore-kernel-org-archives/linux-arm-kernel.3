Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A59E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3pvK+8L996FhW2eKjS9ijBQOkaCAS/fu+JHavhqupE=; b=eTrNrKQ96eMzaqP4Z06+3Qk+U2
	CBHEXIu86q0yi5pnJdRd9XTMeD5Ad8OayJllDP9OsL1nTCg8klWzKPXC3/EGu9TrsHsF34h2yJgdR
	RW8MJUfPl0yliSKv3408QEReYpPFa9Wa88H2fw4/j+h/+ehSDf37SK4v5hsXrP9RLg+dmVBAkZYOj
	fc5RzFWzcC2VpcL2RiZ+tsKENPZSVSILCXORM2oKL0HjC3dHaifWR0hGsL9FOt3NnXCvYpjNfH0PX
	3qyzOfjXmsyqqnuJ1x5WHm1YqRomV7nBXiPDKfegsZeSfYv0oBMVcyo00NYKqlyH/yrtJc6Ze7JmS
	oL2IEGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0Qi-0000000DOxq-0g03;
	Thu, 09 Jan 2025 21:51:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0PU-0000000DOqe-2ip7;
	Thu, 09 Jan 2025 21:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L3pvK+8L996FhW2eKjS9ijBQOkaCAS/fu+JHavhqupE=; b=ttM23zT/k4Bm/stp2dyHauQPi6
	jiG8ADBBPJ0fIv7LlD1vZBq4w1bkrLs7b9VUXaRvpygTyh8JKETRM2fhFlIlA+xGR6zjvOiGbdh5i
	Df91Km0//vB++X2TGVK0he1l4yUqtjCWP/G4MwYFWBrhLSoo7VeiuTnWkRqdqFwY61L1T9YGNyIJk
	cqMEp/DJC4smwNXAfFgsGfAfOFXzjIkxfxgfU4DXgwpE5Ck/7MHCka5i5PQHy4sFetkLolxOCKH9r
	iiPj3yJ5Gwt1A+/YO8KBZ1wyvwegy8tsHFZxe6jQ5XGYhdtGcZXsJQN30UeICVTZWQ5umf1/scmZz
	85Bizk4g==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW0PQ-0005NF-VA; Thu, 09 Jan 2025 22:49:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jimmy Hon <honyuenkwun@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Ondrej Jirman <megi@xff.cz>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v8 0/4] Orange Pi 5 Max
Date: Thu, 09 Jan 2025 22:49:44 +0100
Message-ID: <5348858.6fTUFtlzNn@diego>
In-Reply-To: <173643343615.3320269.13009413932712361979.robh@kernel.org>
References: <20250109051619.1825-1-honyuenkwun@gmail.com>
 <173643343615.3320269.13009413932712361979.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_134948_719531_BEFA37E0 
X-CRM114-Status: GOOD (  29.69  )
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

Am Donnerstag, 9. Januar 2025, 15:40:33 CET schrieb Rob Herring (Arm):
> 
> On Wed, 08 Jan 2025 23:16:14 -0600, Jimmy Hon wrote:
> > Add device-tree for Orange Pi 5 Max
> > 
> > Orange Pi now has 3 SBCs using the RK3588 SOC. Refactor the common parts
> > of the 5 Plus DTS so it can be shared with the 5 Max and the 5 Ultra.
> > The 5 Max and 5 Ultra have a similar credit-card sized board layout and
> > will also share a DTSI between them.
> > 
> > 5 Plus: HDMI0, HDMI1, HDMI RX, M.2 E-key, USB-C
> > 5 Max: HDMI0, HDMI1, WiFi/BT using SDIO/UART
> > 5 Ultra: HDMI1, HDMI RX, WiFi/BT using SDIO/UART
> > 
> > Changes in v8:
> > - Rebase with updated 5 Plus USB 3 patch
> > 
> > Changes in v7:
> > - Add signed-off to first commit
> > - Expand first commit description
> > 
> > Changes in v6:
> > - Remove clock-names from incorrect merge conflict
> > 
> > Changes in v5:
> > - Include Orange Pi 5 Plus USB 3.0 change in baseline before refactor
> > - Defer Orange Pi 5 Ultra to a later series
> > - Defer Orange Pi 5 Plus HDMI1 to a later series
> > 
> > Changes in v4:
> > - Orange Pi 5 Ultra was released and does not use VP0 to HDMI0
> > - Move HDMI0 from common to the board level
> > - Make DTSI to be shared by the credit card sized 5 Max and 5 Ultra
> > - Updates for the newly submitted HDMI1 support
> > - Add Ack for dt-binding
> > 
> > Changes in v3:
> > - Refactor to share common include with Orange Pi 5 Plus
> > 
> > Changes in v2:
> > - squashed commits together for initial board file
> > 
> > Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/
> > 
> > Jimmy Hon (4):
> >   arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
> >   dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
> >   arm64: dts: rockchip: Add Orange Pi 5 Max board
> >   arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
> > 
> >  .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../rockchip/rk3588-orangepi-5-compact.dtsi   | 151 ++++
> >  .../dts/rockchip/rk3588-orangepi-5-max.dts    | 101 +++
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 855 ++----------------
> >  .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 805 +++++++++++++++++
> >  6 files changed, 1127 insertions(+), 792 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
> > 
> > 
> > base-commit: 2859e1ac3110f2d428a794bda26ea0d90b2254c6
> > prerequisite-patch-id: 4672b745f4308a7be527749279edb71625d120e6
> > prerequisite-patch-id: 2743fb64eba2a29eaf993ebc8a5d6ee445b69dfa
> > --
> > 2.47.1
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250109051619.1825-1-honyuenkwun@gmail.com:

All of them are not caused by the OrangePi5

> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
only has a txt binding

> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: /serial@fdd50000/mcu: failed to match any schema with compatible: ['qnap,ts433-mcu']
binding is in the mfd tree

> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/phy@2b050000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/phy@2b060000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/phy@2b050000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/phy@2b060000: failed to match any schema with compatible: ['rockchip,rk3576-naneng-combphy']
binding is in the phy tree

> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /spi@fe610000/fram@0: failed to match any schema with compatible: ['fujitsu,mb85rs128ty']
binding is in the mtd tree




