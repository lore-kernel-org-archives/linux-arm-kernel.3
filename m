Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BCECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1kY+fBa9dU4TqUw2YdISaAyQViHpP6uEOBBRMAaqh4=; b=rJkecuMcAWleZbZn5BR9Kl5aYI
	6CbnpZpne6yKQSROH1g9CMJlJsNAv/aqVh2WJ3bfMw22Cs3CC6NsGjzRDk5/RTm0JtFZwRIpfS+dJ
	yRlGbBaovCPgtSL2lv/QoxAo8lcMxnhIHbcT/LGtyWqWg5WDsmjDsmkPJBZ2J657ZSewqYACo+PkC
	l6LZbSxKlicBoX9JH+ytX+JYA8J5EE/qRC16lgJtE1LIINrKs0nPf0BSpWqQSxvqV5xC6ZYaMDyPK
	Hawodtu9FGKFRozmXEHiccZ4b31lzuC5ynAnrZqgJIAcEjBU16kxyVruLnn+WL5G0Av3USpxXQC1G
	12fJJZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNHH-0000000E1Ew-1mj6;
	Mon, 27 Oct 2025 13:28:51 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNGx-0000000E11O-07ax;
	Mon, 27 Oct 2025 13:28:33 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 12DDC6078A;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f1kY+fBa9dU4TqUw2YdISaAyQViHpP6uEOBBRMAaqh4=;
	b=kHzZfJeqi6kxY1PtuPPOrDzx6NyR9siEcJhx/gwE693U7eJnrjJlEVKjsh34FfX2R3lE2N
	BZtlTH6mXH02Qxvrm+4RR+nFpDrS6YRyAVui12l+TOsXz5dcnmb//lHFL4C6598Ol/b0Uv
	g8dBoFcfZ5MAJ70OZKhz1zfFTEjwS3k=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id D08E31226C0;
	Mon, 27 Oct 2025 13:28:25 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/6] Add Bananapi R4 Pro support
Date: Mon, 27 Oct 2025 14:28:10 +0100
Message-ID: <20251027132817.212534-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_062831_264606_BAB263FA 
X-CRM114-Status: GOOD (  10.57  )
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

From: Frank Wunderlich <frank-w@public-files.de>

BananaPi R4 Pro is a MT7988A based board which exists in 2 different
hardware versions:

- 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
- 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys

common parts:

- MediaTek MT7988A Quad-core Arm Corex-A73,1.8GHz processor
- 8GB eMMC flash
- 256MB SPI-NAND Flash
- Micro SD card slot
- 1x 10G SFP+ WAN
- 1x 10G SFP+ LAN
- 4x 2.5G RJ45 LAN (MxL86252C)
- 1x 1G RJ45 LAN (MT7988 internal switch)
- 2x miniPCIe slots with PCIe3.0 2lane interface for Wi-Fi NIC
- 2x M.2 M-KEY slots with PCIe3.0 1lane interface for NVME SSD
- 3x M.2 B-KEY slots with USB3.2 for 5G Module (PCIe shared with key-m)
- 1x USB3.2 slot
- 1x USB2.0 slot
- 1x USB TypeC Debug Console
- 2x13 PIN Header for expanding application

official product information:
https://docs.banana-pi.org/en/BPI-R4_Pro/BananaPi_BPI-R4_Pro

The PCIe is per default in key-m state and can be changed to key-b with
the pcie-overlays.

Frank Wunderlich (6):
  dt-bindings: pinctrl: mt7988: allow gpio-hogs
  dt-bindings: arm: mediatek: add BPI-R4 Pro board
  arm64: dts: mediatek: mt7988a: Add label for ssusb0
  arm64: dts: mt7988: Add devicetree for BananaPi R4 Pro
  arm64: dts: mediatek: mt7988a-bpi-r4-pro: add PCIe overlays
  arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays

 .../devicetree/bindings/arm/mediatek.yaml     |   6 +
 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |   5 +
 arch/arm64/boot/dts/mediatek/Makefile         |   8 +
 .../mt7988a-bananapi-bpi-r4-pro-4e.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-8x.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-cn15.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-cn18.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-emmc.dtso     |  33 ++
 .../mt7988a-bananapi-bpi-r4-pro-sd.dtso       |  31 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 559 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   2 +-
 11 files changed, 715 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi

-- 
2.43.0


