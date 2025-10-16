Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F25CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Urd9qhF6seVUcdiBkaLvjXXenlNJdk5d3l0wHPzwZhk=; b=ntDkraEgR2Q0HU
	bgVxYyFwYfuD6tL7u+urkVEaRMjogK4VEo/HfBRBUkCVER92MMXwqii+ig5sxSfFmh3zpzc6fvggg
	Kle8Dpct+zHVqwH6fuUvU16e4JcDm4leSohZF4rUC6pi8wmfehkthZqZo9sr3npemvVTnRG4VmU43
	ugCc0Q5c7Y9f/Ktz1NNIBH2oSHBOW7lLVqeYMNT+f92scpcZm0CosnJ1B8wI23wXW/hyOLb8Dvk/t
	Gp08XRJ6QgZblAYSHGNOX4I0kCO0aR0ATW21gVVoozlMWZd4UJZWrhx+PsHlFdLFVrvJ90G/Muq7j
	0GjxHMOLwj+Cw451Tnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kv6-00000004LAD-2Zq1;
	Thu, 16 Oct 2025 10:09:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kuo-00000004Ks0-42xF;
	Thu, 16 Oct 2025 10:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760609334;
	bh=Dcshxnk+HHcxt2JmE3zv3oNCpRgnSrlJo9TAu9xvBkk=;
	h=From:Subject:Date:To:Cc:From;
	b=h6+kTrqJJ10AjrmI1ibLweGmZL6wrs4HbdElHedN+s5t4nz42RHrJWLTc2GcPrtA4
	 OsVvaKEcvqtPAB7HfF7XMtGsfZeuS1TR7Qe8jW3k33ToKQkPsp7PkCu2kAGLBOqL7C
	 FIUQJPIv+f8rlXhod9BenfBX6QQkG2mEZBxGNCaGg6UKRSGkoqRk6YuHsXafKbrPnj
	 nTzmYveT72H81UPHOYeIuviupl3EExjY5ZGFzL12AIFpUpAKyi42TUkyXX+um7pzC4
	 bLp9EDZzdLYW/+R61jOmZPzAjSo89Si/7ujs3DHx2URr6/jpvpgJJkEtnAdsIIKcA6
	 5Y6KGcq77Ys7Q==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE3A417E1271;
	Thu, 16 Oct 2025 12:08:53 +0200 (CEST)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 8322F10C9C780; Thu, 16 Oct 2025 12:08:53 +0200 (CEST)
From: Sjoerd Simons <sjoerd@collabora.com>
Subject: [PATCH 00/15] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Date: Thu, 16 Oct 2025 12:08:36 +0200
Message-Id: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXE8GgC/x3MMQqAMAxA0atIZgNtUUGvIg5aowYhlVSsIN7d4
 viG/x+IpEwRuuIBpYsjB8mwZQF+G2Ul5DkbnHG1NbbBcJAkPTEIodCZgu5Ymcm3o7eTqz3k8lB
 a+P6v/fC+HxWOhSBlAAAA
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
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_030859_191790_6BA8392A 
X-CRM114-Status: GOOD (  11.90  )
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
Sjoerd Simons (15):
      arm64: dts: mediatek: mt7981b: Add labels to commonly referenced nodes
      arm64: dts: mediatek: mt7981b-openwrt-one: Configure UART0 pinmux
      arm64: dts: mediatek: mt7981b: Add reserved memory for TF-A
      dt-bindings: mfd: syscon: Add mt7981-topmisc
      dt-bindings: pci: mediatek-pcie-gen3: Add MT7981 PCIe compatible
      dt-bindings: phy: mediatek,tphy: Add support for MT7981
      arm64: dts: mediatek: mt7981b: Add PCIe and USB support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
      dt-bindings: net: mediatek,net: Correct bindings for MT7981
      arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable SPI NOR
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
      arm64: dts: mediatek: mt7981b: Add wifi memory region
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable leds

 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/net/mediatek,net.yaml      |  16 +-
 .../bindings/pci/mediatek-pcie-gen3.yaml           |   1 +
 .../devicetree/bindings/phy/mediatek,tphy.yaml     |   1 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 276 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          | 258 ++++++++++++++++++-
 6 files changed, 538 insertions(+), 15 deletions(-)
---
base-commit: de8df7a4c881bd0df691458680ab1e22d63d60f4
change-id: 20251016-openwrt-one-network-40bc9ac1b25c

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>


