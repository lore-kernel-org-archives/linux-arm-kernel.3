Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A24C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKZsM1LgPDy263Zc4aml4RHEro36r65UPykJJpWdhug=; b=kNe0enKj3qVV0lNYxMYj8M4qZ6
	yR8hJaBg7epcsd6pzi/nG/KlWTYVvs59JYjes/ZsgyhaVZV1YEAIe8VEVQHbhS4OjdG6RCdP5Ymu7
	EmMsGyTrJORyh6e1mCorrLlrSKCnWovnlHf9FV/MUCK8ijD69m3xsj2p0k05KIVAnPEIQLNhv3HCz
	iA0JKbJjmn3I7GVqBZecqGYGiePjRv+1dgQgxyH8hl+hIOocfDLU2NMvZ97uuFxEM7Eq7zta9ltJE
	rWKVdENo8Xdt7hE81WZwiDdbT2Gx+/ROXL+oHtPklas3Kqg2e6Eza/CwLi+hLaRQtR6JqIUgZ1hiP
	S8e8PhtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzN0-000000060U0-3Bbd;
	Thu, 06 Feb 2025 10:44:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzJ0-00000005zgk-26AT;
	Thu, 06 Feb 2025 10:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738838421;
	bh=LQOUIX6HdQnRnOPoe0uVoofMsF7S9fY7God7Km42TGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VcGnhpAa68iT2xO0x2A0WZpvgXvc6slqrhTXTZ+e1zAxPbupZMkfqan5DCLKBBIoc
	 +pKUMwqDYUyO//2vT0ZQKjiYC81SSDbTwKs82WnYpPsO6EFd2CsQucy91jK4CpDJNM
	 do5Uq0kzgqSt6XvSIRjyhuYEe3hzUuD7pKUkV1rqXvvGO9GT2cBIFAt7EZBILdQgWF
	 TfArJR7iZiqsBrC9EbSqTFrNN4GIq2n3swc2tV9phE7MP226JsUjRA7ZhiBKsocfQW
	 Q2B9y7qNqhgEn2bXFRMB5tCbD28xD2Na665XwW8LmI+A/Q+6gZbFu1Exw1VxQst0zz
	 L4pf+4amZ8MCw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A7C517E1411;
	Thu,  6 Feb 2025 11:40:20 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 06 Feb 2025 11:38:11 +0100
Subject: [PATCH v3 4/4] arm64: dts: mediatek: add device-tree for Genio 510
 EVK board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dts_mt8370-genio-510-v3-4-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738838416; l=2960;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=LQOUIX6HdQnRnOPoe0uVoofMsF7S9fY7God7Km42TGA=;
 b=XGjvZzZ1rqutZ3GyoJzTfVxRV97G2M9ogN3/GqkGQl6nhiGaV8iIlsl2TIYz+PFzFgjeG0/yX
 P3nhlOxP9YfCt9n2czh2M0E23vOrMTvncj782kuQbhG23AnTI+r4so/
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_024022_689891_2688851A 
X-CRM114-Status: GOOD (  12.30  )
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

Add a basic device-tree (mt8370-genio-510-evk.dts) in order to be able
to boot the Genio 510 EVK board, based on MediaTek MT8370 SoC. As being
very close to the Genio 700 EVK board, the dts includes
mt8390-genio-common.dtsi file to use common definitions.

The Genio 510 EVK has following features:
- MT8370 SoC
- MT6365 PMIC
- MT6319 Buck IC
- 4GB LPDDR4X
- 64GB eMMC 5.1
- 12V DC Jack
- Micro SD card slot
- Push Button x 4 (Power, Reset, Download and Home Key)
- LED x 4 (Power, Reset, System on and Charging Status)
- USB Device Port x 1 (Micro USB Connector)
- USB Host Port x 1 (Type-C USB Connector)
- 3.5mm Earphone Jack x 1 (with Microphone Input)
- 3.5mm Line Out Audio Jack x 1
- Analog Microphone x 1
- Digital Microphone x 2
- Gigabit Ethernet with RJ45 connector
- HDMI 2.0 TX port with Type A HDMI connector
- eDP port
- 3x UART with serial-to-usb converters and micro USB connectors
- M.2 Slot x 2
- I2C Capacitive Touch Pad
- 4-Lane DSI x 2
- 4-Data Lane CSI x 2
- I2S Pin header
- 40-Pin 2.54mm Pin Header x 1

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile                 |  1 +
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index b763b73788a45af0a4ea773d308734fa128272f8..ae1147eca9a915f117487101e2ad4acead97adfe 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -95,6 +95,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts b/arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..71a8cbed1df6a1d976e7dc8ccafac3c21b04614b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+/dts-v1/;
+
+#include "mt8370.dtsi"
+#include "mt8390-genio-common.dtsi"
+
+/ {
+	model = "MediaTek Genio-510 EVK";
+	compatible = "mediatek,mt8370-evk", "mediatek,mt8370", "mediatek,mt8188";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0x1 0x00000000>;
+	};
+};

-- 
2.48.1


