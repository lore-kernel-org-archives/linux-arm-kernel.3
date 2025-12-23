Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29800E6F08D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Snngp7GzaBJEFDdNxjz4Dc8LEgCDuSLNzGDDugfwd5M=; b=ALXeJIwroyPsfX
	oYy10HnUrtXAwFktGH1oEnLfVu4kOZZwBz8qvDZW+vIULPHkwZg+PF1F29se/wWeNZR1qs9ff2YlW
	yonAgJy2uro9+BZpOfK3D5IYocXuPKNfKwbHJnUjIYr9FsQ3SfsqaOv02iBsominIEFh90cwfybn2
	Ul4aMtiwLiCuJNsvjC3bk+LYuxIFrkgcG6FpI039gJQI9UPUzLys8nhCztPog41ml+40bkGc1V8Bq
	dJMT2GS0ezNPtarZWKwzg/OKthlnxGbm+jXfQX48KYl2nTAo1EKNw4N9wVDmZV2Mq8wz4XUCrTGaz
	Zme//n1aoK+7JvsHrPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1eh-0000000FTfF-2bTh;
	Tue, 23 Dec 2025 12:38:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1eV-0000000FTUB-1gKo;
	Tue, 23 Dec 2025 12:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766493488;
	bh=MH9fsXSV4/vV6yKbXRdvMNE0YpZl2llUQZEnqF7AiOk=;
	h=From:Subject:Date:To:Cc:From;
	b=csgi6IyzSpYebZafa8FL7wsKRbM22ngs+jJ7BpB+XrUjwmC4SFUnLzerEgK+BwpBb
	 1foEC3ridBpWgKVySzNKpRHRh9EbMkOEO5rxhendeaYaVr88Gqc45ULnrvVzt84xkj
	 UOBbeEWDCiPwpOuTKc6VBA2Npm2tEHYDq/0iWb2GzeRrhFlqi2xRvT/UKlUp3zBgEa
	 tkzDHcvGVirvHkvaPaCrNeG7dxFSH/fP5Jiv/m7H3sKrg0FRXYSyzxp4siwvOCOV7A
	 Hwv4/FgWjWWOnbNenW2/rhJ65pLGzM/1uIEOHAxHjx1iNCNiR/xbVXHe2ihq3nCrQQ
	 7AxoU5fIb3/WA==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531:0:f337:3245:2545:b505])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 987B417E0C2E;
	Tue, 23 Dec 2025 13:38:08 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 4202E117A066D; Tue, 23 Dec 2025 13:38:08 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Subject: [PATCH v5 0/8] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Date: Tue, 23 Dec 2025 13:37:50 +0100
Message-Id: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+NSmkC/x3MMQqAMAxA0atIZgNtsYJeRRy0Rg1CKqmoIN7d4
 viG/x9IpEwJ2uIBpZMTR8nwZQFhHWQh5CkbnHHeGltj3EkuPTAKodBxRd2wMmNohmBH5wPkcle
 a+f6vXf++H//+2pFlAAAA
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
X-CRM114-CacheID: sfid-20251223_043811_602569_B8C018BE 
X-CRM114-Status: GOOD (  10.64  )
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

Significant changes in V5:
  * Rebase against linux v6.19-rc2, dropping merged patches
  * Drop note about disable pci_aspm in cover letter, not required anymore
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

Patches are against linux v6.19-rc2

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
Sjoerd Simons (8):
      dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
      arm64: dts: mediatek: mt7981b: Add PCIe and USB support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
      arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
      arm64: dts: mediatek: mt7981b: Disable wifi by default
      arm64: dts: mediatek: mt7981b: Add wifi memory region
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi

 .../bindings/pci/mediatek-pcie-gen3.yaml           |   1 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 125 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          | 222 ++++++++++++++++++++-
 3 files changed, 346 insertions(+), 2 deletions(-)
---
base-commit: b927546677c876e26eba308550207c2ddf812a43
change-id: 20251016-openwrt-one-network-40bc9ac1b25c

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>


