Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60F2D12D66
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vYu6LjX8XT4IgKBK3O3pvK9BhTvhKVHAwMCcDLNsuE=; b=NGhvuynfBkAIzn8dQ0BHG0sCrS
	osmOwYDohoCoesRNEbbfnyCbPa0qiUIs/0fYecTN2V62YLzJnYD1jiJXAaYJLYPOlBxKoDC7WuTJs
	ZImmG1eqdCRBnn0LkEaBMBpWUhzI4KCata8TH6cf1C1aEnd6++EY9CvWZJ8gliBfS8vrmTZ0vakwq
	yMkwDaiJ13D16BYg+C0V/B/spPqx+2Jj5qyA/wL31CQyN/lEQ4c5cFbluQveLrESzyiSDRe0wLGrv
	OjdrGc4BZ39xyHpLB+KmRUO76FoIKt+d+aLIrWmAYeAXfa2AvYF0rZrDnuwbDbO+GuRuqgLt3Qusg
	hHFZjLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnOT-00000006c5K-2yev;
	Wed, 03 Dec 2025 13:59:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnOQ-00000006c1Y-4BO7;
	Wed, 03 Dec 2025 13:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764770380;
	bh=5RzIhfynSwf60ufTcSsowDIcBzDbf1yZS7wGFV2NLjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XCjhSghmG+sjwO7no+zMupcIuWrS6ev6eGEy2u94y4gS/ttibODVWFyyQioU7BKgY
	 09OYiA4nA6UsTvE8bbGg4zFqxsfeolNz9jJ+VlwND9o2CSC04RhRr3Xopr78PPl3mh
	 uqgl+aQioFvyWp32XF12XBOBEpjCNXb46ODyHm/uIDBNYkFgMQ6mGxHbPn87if2EJx
	 g6BIvmHv8nP11FoZcnlPKGBsaFSM6iWfLJBSRVnOh9ENxVjS3hihKgYYbqChW0nxCS
	 43Sjml2LtnODswWF4q606pkGTUO7xNOQ4qooS8+/0NfGxRz2F8Srq/rsFYY2c+UuFA
	 hyQg1i7MNvSkg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2298E17E10F6;
	Wed,  3 Dec 2025 14:59:40 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 14:59:29 +0100
Subject: [PATCH 4/4] arm64: dts: mediatek: add device-tree for Genio
 520-EVK board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-add-mediatek-genio-520-720-evk-v1-4-df794b2a30ae@collabora.com>
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
In-Reply-To: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764770377; l=3311;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5RzIhfynSwf60ufTcSsowDIcBzDbf1yZS7wGFV2NLjQ=;
 b=wPwMYUZq6iOSoCHWLmsZHVjtkg4yetPn3n4kbFw6/K/Euen42IqOv6aTmYy5MxJn+xXoJzooR
 RhsfnXX2z/FC3gEeA0WpyvNQz4IR2cyjIS8UeilUdQwB5Xmqowpkeh3
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_055943_199906_A7E03999 
X-CRM114-Status: GOOD (  13.98  )
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

Add device-tree for the basic hardware enablement of the Genio 520-EVK
board, based on MT8371 SoC.

MT8371 SoC is a variant of MT8189 SoC with the following differences:
  - Arm Cortex-A78 CPU core maximum frequency (2.2 Ghz for MT8371, 3 Ghz
  for MT8189).
  - Arm Mali G57 MC2 GPU core maximum frequency (880 Mhz for MT8371, 1.1
  Ghz for MT8189)
  - one ISP engine instead of two
MT8371 hardware register maps are identical to MT8189.

The Genio 520-EVK has following features:
  - MT8371 SoC
  - MT6365 PMIC
  - MT6319 Buck IC
  - MT6375 Charger IC
  - 8GB LPDDR5 RAM
  - 64GB eMMC 5.1
  - 128GB UFS
  - 20V DC Jack
  - USB Type-C Power Adapter
  - Micro SD card slot
  - Push Button x 4 (Power, Reset, Download and Home Key)
  - LED x 3 (System Power, Reset, DC-IN Power)
  - USB Type-C Connector (USB 3.2) x 2
  - USB Type-C Connector (USB 2.0) x 1
  - 3.5mm Earphone Jack x 1 (with Microphone Input)
  - 3.5mm Line Out Audio Jack x 1
  - Analog Microphone x 1
  - Digital Microphone x 2
  - Gigabit Ethernet with RJ45 connector
  - DP x 1 (Mode over USB Type-C)
  - LVDS port x 1
  - eDP port x 1
  - UART x2 with serial-to-usb converters and USB Type-C connectors
  - UART Port x 2 on Pin Header
  - M.2 Slot x 2
  - I2C Capacitive Touch Pad
  - 4-Lane DSI x 1
  - 4-Data Lane CSI x 2
  - I2S Pin header
  - 40-Pin 2.54mm Pin Header x 1
  - CAN Bus x 1 (RS232 Connector)

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile                 |  1 +
 arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e3b63085c0608b86dc8638c9d5e0b73441e9ed7b..e6356733a1c0ad5f3ccf9517f3e393ba5f114da8 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -106,6 +106,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-grinn-genio-510-sbc.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8371-genio-520-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts b/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..b259fc6c01a13bb84c1ed8b4433a799241a28a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+/dts-v1/;
+#include "mt8189.dtsi"
+#include "mt8391-genio-common.dtsi"
+
+/*
+ * MT8371 SoC is a variant of the MT8189 with only one ISP engine
+ * and lower maximum frequency on the big cores and on the Mali GPU.
+ */
+
+/ {
+	model = "MediaTek Genio 520 EVK";
+	compatible = "mediatek,mt8371-evk", "mediatek,mt8371",
+		     "mediatek,mt8189";
+};

-- 
2.52.0


