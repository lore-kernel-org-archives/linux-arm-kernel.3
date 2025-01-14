Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdWxJHNHoSpVeR6PuyUgz2XHD/Omf9dZ/Mmo6DyElNY=; b=kkcDP945W6ewzBKxON6n9XZdKb
	2iTaprPetT9UmSIHwLF3XUdxcR0wx71iOgn7+5wTfdR2joZNr141w5+oTJuX9Nq5dN+AC2rCyg8Bf
	w59J1EhyZBDD3+D8GzMpc0/7RVu3kpKnsMXPS9Q31WPyYG+z3CNW9y0HInWOywSscnUUR7WJ+eJqz
	wYtppMrY0UePjTyJNEy949RzHp/TB8v8sYWIRDebjXfJO5V4qi6NooiGLFs6zkNDY32zQuCtGVq3y
	rR7Mr1q9y+LZ9pDGSpQdVaQouWoHrGrvTsFR/tGi+42HmTRTSE2jVY3KFzVpmMdheOhSwN5eV6m2a
	5jPkjXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbZa-00000007ipM-1ll2;
	Tue, 14 Jan 2025 07:42:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbVt-00000007iAF-3lvF;
	Tue, 14 Jan 2025 07:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736840340;
	bh=P2t7gjhqWFLlKXsoX9Y2INCA+LQgxBOWkUpFnei/LYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nb3bMJA+83a8eUnepJlXvcg+lDszD6biOyQrQsZ+9N6x6ps9jBeYSoDeaEVUiCB61
	 Gi3Rrjqi4NtW4ce0VPE5rIDJ1RBwXq+HiB/1yfeHjozWEy1CiLOjYu7M3X8GxfZ3wj
	 eDKQKIUWzy7Z4pc8YWgmkP0yaTakoZLlj+g0q5n9q8sfixcnnUF8c5QGbfSG7zkolN
	 9XHu6NP36esW5BXotvYiEEaYVCIDPdF4fV9oGK8tbpLuDC9u6DRUQ21OQq3BIsQA5d
	 AZ2KPAu6xUgYZ3cjwTZ/hIsiw1N1KLbjlpzMAJ8OoUSfGiplK6l3fSKKW8R99Lpkol
	 LJbHq+R5xrNow==
Received: from fedora.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C284B17E0E88;
	Tue, 14 Jan 2025 08:38:59 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Jan 2025 08:38:40 +0100
Subject: [PATCH 2/3] arm64: dts: mediatek: add support for MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-dts_mt8370-genio-510-v1-2-8517ee0fdbe8@collabora.com>
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
In-Reply-To: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736840337; l=3958;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=P2t7gjhqWFLlKXsoX9Y2INCA+LQgxBOWkUpFnei/LYQ=;
 b=vfDyJ1tSRkRUWwcsaMOSfbZSKopx/PTzw+dxxMfL6rXCq7U/P2/4aJlkBbJ3StWZlmManR5eH
 wE/hh/5+NBSAhhcUS/JTIr789Qa381VuYr9uxcuCPRmXv1DOAkEOTFR
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_233902_084112_DD946C24 
X-CRM114-Status: GOOD (  12.96  )
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

This commit add the support of the Mediatek MT8370 SoC.
It is a less powerful variant of MT8390 SoC and their
main differences are:
- Arm Cortex-A55 cores number (4 vs 6)
- Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
- Arm Mali-G57 GPU core number (2 vs 3)

Like MT8390, MT8370 hardware register maps are identical to MT8188.

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
2.47.1


