Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB0C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi9BUf3pdKKyMt0VRjhegUThiBTcOkYoWzmQrly/90g=; b=X15zbNsnZESw1iM238gQlvzYPV
	+Bl8MWUfisFXiiKrhNNmF50mqA2V1qmH6sPZRqbe1t6tOZOK9RWPwbGqc8BgK481YboSaVuvKMqgm
	Wt6jDheTZoHt1Zlb8BF8T8KirldZuZ6vX+I3XDgHG/lsA+Upea5kqMnu9jGTSwEZdDYDUMusSNeEq
	nIWQispHNW83iyj676nasyPEsIhvVk6Amrw6v4WtOVKB2BPQx2njr7CMKflksQU+0L+7wOJizWyHD
	Yyon+ll3eSTJqbeClqBf1YWbMMdiTADTbHaLfCZAMOkRlemPlhPIz4cwaq6ZQIhFLkOVEJmdBdvJP
	6TW1j4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzPg-000000060km-3VpI;
	Thu, 06 Feb 2025 10:47:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzJ6-00000005ziy-0EnW;
	Thu, 06 Feb 2025 10:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bi9BUf3pdKKyMt0VRjhegUThiBTcOkYoWzmQrly/90g=; b=Xh56aTDP8zHfXdXl0nLJkP1wdC
	YuvcEc1HaKa5azADd5h0ibthtqaZb8C5x495XPt5vI6Zfe1g12AMUhnBurITDe73p3VCaUfIsEuP9
	Gb1SVsgFoaW0nNbmIMdivkezaVpiTz2NggCdVSBaGNpaIDdTsMQoCsRA8u5OGOuvp3Iem2aiHMoLG
	imNc11Z2uh2SGznL2LjWoVUX7LAXUl+L3Qgo+/ZJLeClQmO5aq8lk6BinHRFHQjUUXf8VC4h7fzcu
	M0kuOs7KM9HRpnGGgbezuJFfZsaV1i6KatvmZkfCEayNQdm/37/DVFF+nOEqqo4YCzvkX4Jyegn3j
	m1lZiDTg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzJ2-0000000GuVa-3d2P;
	Thu, 06 Feb 2025 10:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738838419;
	bh=ZyICc/mqZ+XVKDTrqCzrM8zOi9VXfm+MUmIjVQg1srk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pOnSxLcKxU/pB/I/8a3thNQPK8aiR/syY3YJsVh/l/ibb24w+XmC8v7z2e/Qx1fhj
	 sDXnCaucpksNuQAjZvOT1CNIiiHQxRQ1hxiVBPIVEFFVwPv1j8beYVxfXAod+iyCmo
	 sbbicje6wB6sFxuMU7FEDlEWxLw6r0ZbrjZGrkLbyAOLx0H93+5uP/0d1bm/33qtvB
	 a3q4i2LKnAWwJmLbf1bFnfPuEqHqSqfaGOx12wUpLrOEPLseTKeo2eB3xeMqfmCZ8N
	 j3oxsAzureHkQuL/sCK0x+b3MXYyLUs3sm+zDSvTyrD/MnSi+p9e9RtePkz8rJ+HmZ
	 7DBq1HHsrTrlQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB33E17E1090;
	Thu,  6 Feb 2025 11:40:18 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 06 Feb 2025 11:38:09 +0100
Subject: [PATCH v3 2/4] arm64: dts: mediatek: add support for MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dts_mt8370-genio-510-v3-2-5ca5c3257a4c@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738838416; l=4210;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ZyICc/mqZ+XVKDTrqCzrM8zOi9VXfm+MUmIjVQg1srk=;
 b=7wwXJe+DI7Lif4ON4ocgNXgwqPuyGM2pT1YL9jg9NX+Pwq5Wnlsa0CLX7Vluc3pIFlbmwnwUJ
 zFsIH34ODWEAiOHlf4UmfKEU3SOvvF2WGA/JeVfrFrWZY9obzhhz/JJ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_104025_203332_45FAFABB 
X-CRM114-Status: GOOD (  13.14  )
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

Add the support of the Mediatek MT8370 SoC, a less powerful variant of
MT8390 SoC.
Their main differences are:
- Arm Cortex-A55 cores number (4 vs 6)
- Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
- Arm Mali-G57 GPU core number (2 vs 3)

Like MT8390, MT8370 hardware register maps are identical to MT8188.

Note:
The devicetree for MT8370 SoC does not currently contain the needed
overrides to support the Mali GPU integrated into this SoC. This is
scheduled to be done with a later change.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi |  8 ++--
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 64 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 338120930b819645662465fa7b3c6be6491764ff..5d78f51c6183c15018986df2c76e6fdc1f9f43b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -492,7 +492,7 @@ cpu_little0_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little0_cooling_map0: map0 {
 					trip = <&cpu_little0_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -530,7 +530,7 @@ cpu_little1_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little1_cooling_map0: map0 {
 					trip = <&cpu_little1_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -568,7 +568,7 @@ cpu_little2_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little2_cooling_map0: map0 {
 					trip = <&cpu_little2_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -606,7 +606,7 @@ cpu_little3_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little3_cooling_map0: map0 {
 					trip = <&cpu_little3_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cf1a3759451ff899ce9e63e5a00f192fb483f6e5
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+
+/dts-v1/;
+#include "mt8188.dtsi"
+
+/ {
+	compatible = "mediatek,mt8370";
+
+	cpus {
+		/delete-node/ cpu@400;
+		/delete-node/ cpu@500;
+
+		cpu-map {
+			cluster0 {
+				/delete-node/ core4;
+				/delete-node/ core5;
+			};
+		};
+	};
+};
+
+&cpu6 {
+	clock-frequency = <2200000000>;
+};
+
+&cpu7 {
+	clock-frequency = <2200000000>;
+};
+
+&cpu_little0_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_little1_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_little2_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_little3_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&ppi_cluster0 {
+	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+};

-- 
2.48.1


