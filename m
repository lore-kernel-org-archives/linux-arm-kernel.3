Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA2BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D+z30alhS76nZd0w299HMMOzkEm7le32nOnAtHN1bFM=; b=GGoqEhEYSq+n+L
	+p0LUQR8Dygha3/P54JPvHcWooAbB1AOEsH4QsuDf92cTjZ0rTp0AOSXyTCltiG8o4j9lLYEW5Rss
	j5mXWSKAp3ZNu9GvdDrCXGOdLOkn/tV3Z9McQ/KDRgqxxhEFsC14QR+mhvrh9DrPHGD4rpufjxCqx
	2omckb82yjv7NMEl806a0Ip+Okv58alJ5gi5O1OZFYCAmGJSt7PEhB85HTrebJdP7zoIzxUFGsJua
	Kp/kWufmJMCLWHbQ7bS/+WwZUg6ex+D11Pa4dabYk+4ZFVJMTx91ham67a3+MhcBlC+D/U1e0pNlW
	xDIMowXxYAgDGcHqACnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktt-0000000EU0U-1dg9;
	Wed, 05 Nov 2025 21:18:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktq-0000000ETy0-0Vxy;
	Wed, 05 Nov 2025 21:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377515;
	bh=/ng5O2dKBBjx/PoMHfml7fIWlsGEdTjPoLQQq68Vk1w=;
	h=From:Subject:Date:To:Cc:From;
	b=FYYWj5ErKAQWBH2zuGZaHzNU61uViaX++wuDgl6qi3m3uq/JVL8lRCK2QpXOCeVXQ
	 cK6bH0vpEageL4dR1k+JzkdBvT3UDR3JFEKn+jOJ+c+YwUlXUL8nDJEUHqzZ0r+mRA
	 oB3wh+vHFKV76nODd5F3Ycl+IOrvH+whHccdpoEReZww8gZWhwCqanfyL6UxsEAODV
	 rkM2Kxf+JQAbXgTHiJjAE8L2l00CXVt9ql3g8xaZmkaivTwHEk+yolMSL+dbsZ27vg
	 OhJ+uySIkR+3pqqAgKBENCEXgrY9ThTbJGfaPWzJwryQDqYT6RrZ4FqOKyzNEaq180
	 AnSWhk/d0T2gA==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFEF017E04D6;
	Wed,  5 Nov 2025 22:18:34 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 8C1DE10F352D9; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Subject: [PATCH v3 00/13] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Date: Wed, 05 Nov 2025 22:17:55 +0100
Message-Id: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO/C2kC/x3MSwqAMAwA0atI1gba+gG9irjQGjUIqaSignh3i
 8u3mHkgkjJFaLMHlE6OHCShyDPw6yALIU/J4IyrrLE1hp3k0gODEAodV9ANSzP6ZvB2dJWHVO5
 KM9//tevf9wNgNip4ZQAAAA==
X-Change-ID: 20251016-openwrt-one-network-40bc9ac1b25c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131838_337910_159F337D 
X-CRM114-Status: GOOD (  12.81  )
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

Significant changes in V3:
  * Drop patches that were picked up
  * Re-order patches so changes that don't require dt binding changes
    come first (Requested by Angelo)
  * Specify drive power directly rather then using MTK_DRIVE_...
  * Simply mediatek,net binding changes to avoid accidental changes to
    other compatibles then mediatek,mt7981-eth
Significant changes in V2:
  * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
  * Only introduce labels in mt7981b.dtsi when required
  * Switch Airoha EN8811H phy irq to level rather then edge triggered
  * Move uart0 pinctrl from board dts to soc dtsi
  * Only overwrite constraints with non-default values in MT7981 bindings
  * Make SPI NOR nvmem cell labels more meaningfull
  * Seperate fixing and disable-by-default for the mt7981 in seperate
    patches

This series add various peripherals to the Openwrt One, to make it
actually useful an access point:

* Pcie express (tested with nvme storage)
* Wired network interfaces
* Wireless network interfaces (2.4g, 5ghz wifi)
* Status leds
* SPI NOR for factory data

Unsurprisingly the series is a mix of dt binding updates, extensions of
the mt7981b and the openwrt one dtb. All driver support required is
already available.

Sadly during testing i've found various quirks requiring kernel
arguments. Documenting those here both as note to self and making it
easier for others to test :)

* fw_devlink=permissive: the nvmem fixed-layout doesn't create a layout
  device, so doesn't trigger fw_devlink
* clk_ignore_unused: Needed when building CONFIG_NET_MEDIATEK_SOC as a
  module. If the ethernet related clocks (gp1/gp2) get disabled the
  mac ends up in a weird state causing it not to function correctly.
* pcie_aspm: ASPM is forced to enabled in 6.18-rc1, unfortunately
  enabling ASPM L1.1 ends up triggering unrecoverable AERs.

Patches are against the mediatek trees for-next branch

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
Sjoerd Simons (13):
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable SPI NOR
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable software leds
      dt-bindings: mfd: syscon: Add mt7981-topmisc
      dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
      dt-bindings: phy: mediatek,tphy: Add support for MT7981
      arm64: dts: mediatek: mt7981b: Add PCIe and USB support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
      dt-bindings: net: mediatek,net: Correct bindings for MT7981
      arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
      arm64: dts: mediatek: mt7981b: Disable wifi by default
      arm64: dts: mediatek: mt7981b: Add wifi memory region
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi

 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/net/mediatek,net.yaml      |   6 +-
 .../bindings/pci/mediatek-pcie-gen3.yaml           |   1 +
 .../devicetree/bindings/phy/mediatek,tphy.yaml     |   1 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 263 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          | 226 +++++++++++++++++-
 6 files changed, 492 insertions(+), 6 deletions(-)
---
base-commit: d7d7ac9af8cb72e3e3816ae9da3d9ee1bdfa4f9b
change-id: 20251016-openwrt-one-network-40bc9ac1b25c

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>


