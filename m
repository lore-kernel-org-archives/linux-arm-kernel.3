Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA6BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z89RtjLGWxpPZINVGL9RGjwfQnjB14DaWRU+giSqSOs=; b=cJqNuvOuicudL+1n8iZIyYf9Ea
	IL0xkx/JfoVk4wOn1C5pOOQ1R6v8gnlYYqgV7CW538f4RlfbFUKGO1+3k0chUA3KKMqj49/ZTQNdr
	W7orbTv2KacmbhiEdyoZ64WNNgYLZUuhvMhbqw1ezOgxQhip8Lv6MF9OasWVlS1Rg/VVmjB8NQZO9
	5GmelrbeYfgj1hM349Ces/Wc8xVfoFaobASrFw7KVk8nRk23VlaLhtcvaG+VnpDA2ctVF1bWIQJjp
	WVUSET9FasvTBCUuvR76n+F2m1zg2vHcJuhUOAY+2HFRvjdLTUWyETlI1MzhdmH1Y2Zh8aoDgQHW/
	HdhGLgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoqI-0000000DNKB-40lI;
	Mon, 20 Oct 2025 12:18:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoqG-0000000DNHm-2RiE;
	Mon, 20 Oct 2025 12:18:25 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1vAopx-000000003X8-401e;
	Mon, 20 Oct 2025 12:18:06 +0000
Date: Mon, 20 Oct 2025 13:17:57 +0100
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
Subject: Re: [PATCH 10/15] arm64: dts: mediatek: mt7981b: Add Ethernet and
 WiFi offload support
Message-ID: <aPYodR5N89vRUyQp@makrotopia.org>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-10-de259719b6f2@collabora.com>
 <aPEhiVdgkVLvF9Et@makrotopia.org>
 <8a637fc2-7768-4816-bb4f-3af2e32908e4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a637fc2-7768-4816-bb4f-3af2e32908e4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_051824_618681_A894A45B 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon, Oct 20, 2025 at 12:27:53PM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/10/25 18:47, Daniel Golle ha scritto:
> > On Thu, Oct 16, 2025 at 12:08:46PM +0200, Sjoerd Simons wrote:
> > > Add device tree nodes for the Ethernet subsystem on MT7981B SoC,
> > > including:
> > > - Ethernet MAC controller with dual GMAC support
> > > - Wireless Ethernet Dispatch (WED)
> > > - SGMII PHY controllers for high-speed Ethernet interfaces
> > > - Reserved memory regions for WiFi offload processor
> > > 
> > > Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 133 ++++++++++++++++++++++++++++++
> > >   1 file changed, 133 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > > index 13950fe6e8766..c85fa0ddf2da8 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> 
> ..snip..
> 
> > > +
> > > +			mdio_bus: mdio-bus {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				int_gbe_phy: ethernet-phy@0 {
> > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > +					reg = <0>;
> > > +					phy-mode = "gmii";
> > > +					phy-is-integrated;
> > > +					nvmem-cells = <&phy_calibration>;
> > > +					nvmem-cell-names = "phy-cal-data";
> > 
> > Please also define the two LEDs here with their corresponding (only)
> > pinctrl options for each of them, with 'status = "disabled";'. This
> > makes it easier for boards to make use of the Ethernet PHY leds by just
> > referencing the LED and setting the status to 'okay'.
> > 
> 
> Sorry Daniel, definitely no. The LEDs really are board specific.
> 
> Try to convince me otherwise, but for this one I really doubt that you can.

You are right, the LEDs themselves are board-specific and may not even
be present.

However, the LED controller is always present because it is part of the
PHY which is built-into the SoC. And the pinctrl property which I'd like
to see described on SoC-level is a property of the LED controller rather
than the LED itself. Sadly the device tree node doesn't make the
distinction between LED and LED controller, so I understand you your
argument as well.

