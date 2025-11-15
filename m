Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9DBCEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 20:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o//945Y34DU15Vr3c/ebMBObXd0fbahmAbC+ZB6QTVU=; b=sPCyv5tcSvbV8B
	0zGC8QPiho5eLkGWgODre0sXkNmIxi3qWy+rKtfO1hAUFNOel6E0obtav0EYyQOZ0f4hQ4zyRlMh4
	INq4CXZEaD1exfpfy3pZv6jTBxXv0dWyGD0SSKe4G9tSdfVMESIQuTVMQATB8huC6Q01j9QP5Q+Kh
	9AUw+GbjAZ5Egpapf8gORG/udH6MYh0xPGxrWD4fqjfRLhqWTrfkmqlwOYkbgHChCBmPrsk0i/JOy
	B/TXKaV5ZRTWgDZA8TcL8YBMxphb83Kt8Yeci6JVYNtUKjZqX5w9ZkjCcuCuYjLdf7PfClHOAyRjI
	KeJoKPeI36Cs4ifiTEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNM9-0000000E5II-0qoF;
	Sat, 15 Nov 2025 20:58:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNLw-0000000E56h-2s6C;
	Sat, 15 Nov 2025 20:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763240312;
	bh=/iQHhrZOTfas5Ng9jqV3uTT5Sw+mmFyQVwbLKAoWb3c=;
	h=From:Subject:Date:To:Cc:From;
	b=XqMwBYIDLf6+s2bjI5cw4xZXAA43I54eBTEN6y49LVrVMMVxPFgsWmNkJPaZ5wbTn
	 Bch23EHYym8+6H9jm9E23kayAOh1seAVXJDDQYZT9Tkc7E0Pye8vRVRwGthmGpORN6
	 BsI8L+MkZuqABEa4F31wxfRaC1w38ly2fuHoiGp15qr6bVnRgeXochW7QDvQOhP+Tg
	 UenLuvMp7JX9hVNh02bB3p3WK40XkFNye/8B5ps139YbZVQpz36n8tuLcHJSp1MtWQ
	 N4zhmo4ihRlPV5vUoYzGw119t2meW0uPrJaevl6wKTGEro9IaTf4StU31vZUd0vogX
	 6kvIWdcANggAQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84AF017E127F;
	Sat, 15 Nov 2025 21:58:32 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 0C769110527D7; Sat, 15 Nov 2025 21:58:32 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Subject: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Date: Sat, 15 Nov 2025 21:58:03 +0100
Message-Id: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzpGGkC/x3MMQqAMAxA0atIZgNtqYJeRRy0Rg1CKqmoIN7d4
 viG/x9IpEwJ2uIBpZMTR8nwZQFhHWQh5CkbnHGVNbbGuJNcemAUQqHjirqhN2NohmBHVwXI5a4
 08/1fu/59P+WhNVBlAAAA
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
X-CRM114-CacheID: sfid-20251115_125836_882367_546FF6F4 
X-CRM114-Status: GOOD (  11.70  )
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

Significant changes in V4:
  * Drop patches that were picked up
  * Improve mediatek,net dt bindings:
    - Move back to V2 version (widening global constraint, constraining
      per compatible)
    - Ensure all compatibles are constraint in the amount of WEDs (2 for
      everything apart from mt7981). Specifically adding constraints for
      mediatek,mt7622-eth and ralink,rt5350-eth
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
Sjoerd Simons (11):
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
 .../devicetree/bindings/net/mediatek,net.yaml      |  26 ++-
 .../bindings/pci/mediatek-pcie-gen3.yaml           |   1 +
 .../devicetree/bindings/phy/mediatek,tphy.yaml     |   1 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 125 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          | 222 ++++++++++++++++++++-
 6 files changed, 371 insertions(+), 5 deletions(-)
---
base-commit: 67ed5843a67b7ba63d79f2ba3fd21bee151d3138
change-id: 20251016-openwrt-one-network-40bc9ac1b25c

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>


