Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF48C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOiPnX2so0/ccPq/k3kaXwFBOlJE5cfORV52b2fKDoc=; b=KANBuPvsKzfn9Ic4JYR8yZVWDK
	17aGQ5Z276TNNm0MZJSB81qRJgj1wM9FeU482C11y1rlA4FWxF3TRcfUr/jDhWWRkFhxjbAn5NM4c
	/2eSFvjJgt8oF4LSpyNUloMkYwKieXvzbv8Vm0dQX9Um8hR/V+/MeI96cGJiFizjn+VTH30BjnSMB
	u6LsI4eyrcvSzC1eZ4le5wQBQng4jDED93If7XjPLLI08kA76m/0uM3ZLDvEUt/C/FfRp2D5doOxT
	GZ2XWk5HgrurluADhU6b9mj6z7RvkfBHLYSr2OTRlJhocRA+mymQoyWl+zMfBFhZN2DX9bpPEza/R
	/f6v9ntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexvR-00000002Xys-000w;
	Wed, 01 Jul 2026 16:36:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexvO-00000002Xtp-0FGm;
	Wed, 01 Jul 2026 16:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782923792;
	bh=WWFVikUE4fqMVkwhLGoBQ92sxuWrFOHuL4JcCoQZxDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WzemZ6qSWFoAKiCZ+SVLsasm61F9RIlS18nl9lag5nmnHMgAlBkknxHd5+k49lU04
	 uYSoJZHvvlutzDF1qxP1FJXnz40mQSkv+1fqFKWXjWFkaODF2KUO0BFFanrSsLyW5v
	 9Efk4ly56tam/dC6M3/ucyfqoFqLSB32CTcFuLE0YjsDwu6BM3GCrGQtxhg/J3LepJ
	 LqEwWYAOXY9dA5/9asMkKjF1xtpLozWEA6D4U50pJOncO8RlDbz8BZMQkcN5h80cY0
	 OJ+1WddtK9YKS+LVVFbjsnwIhDKzjvU0037Ru5jtLIR1EwSVYLATfKCbE87JNksg7c
	 VcMvDgSqI0U3w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6460817E0FAA;
	Wed,  1 Jul 2026 18:36:31 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 18:35:22 +0200
Subject: [PATCH v2 4/4] arm64: dts: mediatek: add Genio 520-EVK board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add-mediatek-genio-520-720-evk-v2-4-19d5da4ef984@collabora.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782923787; l=3368;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=WWFVikUE4fqMVkwhLGoBQ92sxuWrFOHuL4JcCoQZxDU=;
 b=AyZzlOWkRJMa3HLbp/8OXexXv5ih45d8V9nPT8p/3r7A5DKaxzuxi+sobpjaoWofjAc5drCyk
 KPxeZYCwMfVBKcABpnAbx48Rwy5D6NoXkkwFz0KsgpIdeMJUtofqBGH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_093634_265909_8781D36D 
X-CRM114-Status: GOOD (  14.32  )
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

Add devicetree for the basic hardware enablement of the Genio 520-EVK
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
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../boot/dts/mediatek/mt8371-genio-520-evk.dts     | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 5c75ea1ef09a..e6a8109ffbaa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -168,6 +168,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-grinn-genio-510-sbc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8371-genio-520-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts b/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts
new file mode 100644
index 000000000000..b4fd343bc08a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+/dts-v1/;
+
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
+
+&cpu6 {
+	cpu-supply = <&mt6319_sid6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6319_sid6_vbuck1>;
+};
+
+&mt6319_sid6 {
+	status = "okay";
+};

-- 
2.54.0


