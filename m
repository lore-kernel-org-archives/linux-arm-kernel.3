Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E013ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qO0GWoIRh8F0xtKOYhGrXaPAFwOqsj1xEzEGezHv8U=; b=OXMjjqtf6VvnAGGodacanx69X0
	4euVafZVLaiRpeaZIZgPPMn6cvzTwGEWwYRvhLAhh7F3JLZTfynTRAl9TKxYjxh96D87s1WczZBcr
	hYuMpg776OlOdwbVURZC7Z/v7xgg1fdIg8oSYVu+B+ktwRD/qTChFjRb//aKRzxPWt1vosBDdMxgY
	vjgBXermYKSSp2ypE6ddDGSLNj1ifpwPg9HLTrDagayeXYGU5JfYtkTR7m+Hotfe6DPL0pP2ePs6X
	Q5+gBWEAf5SP0oD+m4pCcm2LwKlOKSOXZ3P3jygc0r6jQrqts0VGHvEjiQoZPManQya9SsfmrZTer
	6Kt3zVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QzM-00000005RdJ-25y3;
	Thu, 16 Oct 2025 16:38:04 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QzK-00000005RcQ-0cbS;
	Thu, 16 Oct 2025 16:38:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1v9Qz1-000000002mr-31Oo;
	Thu, 16 Oct 2025 16:37:43 +0000
Date: Thu, 16 Oct 2025 17:37:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sjoerd Simons <sjoerd@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 02/15] arm64: dts: mediatek: mt7981b-openwrt-one:
 Configure UART0 pinmux
Message-ID: <aPEfUBl6fMe6QYdY@makrotopia.org>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-2-de259719b6f2@collabora.com>
 <aPDnT4tuSzNDzyAE@makrotopia.org>
 <5f430ff9-d701-426a-bf93-5290e6912eb4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f430ff9-d701-426a-bf93-5290e6912eb4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_093802_185902_F791AFF4 
X-CRM114-Status: GOOD (  23.03  )
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

On Thu, Oct 16, 2025 at 04:29:14PM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/10/25 14:38, Daniel Golle ha scritto:
> > On Thu, Oct 16, 2025 at 12:08:38PM +0200, Sjoerd Simons wrote:
> > > Add explicit pinctrl configuration for UART0 on the OpenWrt One board,
> > > 
> > > Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> > > index 968b91f55bb27..f836059d7f475 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> > > @@ -22,6 +22,17 @@ memory@40000000 {
> > >   	};
> > >   };
> > > +&pio {
> > > +	uart0_pins: uart0-pins {
> > > +		mux {
> > > +			function = "uart";
> > > +			groups = "uart0";
> > > +		};
> > > +	};
> > > +};
> > > +
> > >   &uart0 {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&uart0_pins>;
> > >   	status = "okay";
> > >   };
> > 
> > As there is only a single possible pinctrl configuration for uart0,
> > both the pinmux definition as well as the pinctrl properties should go
> > into mt7981b.dtsi rather than in the board's dts.
> 
> If there's really one single possible pin configuration for the UART0 pins,
> as in, those pins *do not* have a GPIO mode, then yes I agree.
> 
> If those pins can be as well configured as GPIOs, this goes to board DTS.

I respectfully disagree and will explain below.

All pinmux pins on the MediaTek platform also allow being configured as
GPIOs. However, if you configure those as GPIOs the consequence is that
you cannot use UART0 any more at all. So using UART0 at all always
implies using exactly those pins, there is no alternative to that.

Hence every board with every possible uses of pins 32 and 33 (there is
only RX and TX for UART0, RTS/CTS flow-control is not possible) can be
represented without needing to configure the pinctrl for uart0 on the
board level. There isn't going to be any variation on the board-level
when it comes to uart0. Either it is enabled (status = "okay";), and
that will always imply using the 'uart0' group in mode 'uart', or, in
case any of the two pins of uart0 is used for something else that means
uart0 cannot be enabled. Simple as that.

Hence there is no need to duplicate that pinctrl settings on each and
every board, as controlling the 'status' property on the board-level
already gives 100% freedom.

(Sidenote: As even the BootROM already uses those two pins as UART for
debug output, it is very unlikely that anyone would actually use them
for anything else in production. Apart from being used as GPIOs you can
also use pins 32 and 33 as an I2C target for external debug access to the
registers of either the sgmii0_phy, sgmii1_phy or u3_phy. However, that
doesn't matter in terms of the debate above, as the crucial point there
is that using uart0 always implies using group 'uart0' in 'uart' mode.)

