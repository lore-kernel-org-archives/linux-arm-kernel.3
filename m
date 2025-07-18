Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F36C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D80+ckrXhVfMfGB3H6vPJ0rw389r3lzBZpCPBBXQPcM=; b=kFEPbDgOjhhh1bCeoa7gsxKpAA
	RF/NTT6V3Io+irFLoEy2k89t738NFy3RQLlMIMBULmG2JaEnTL32ZibIgXlLPnI+LcWgzV2ot/HeC
	5WaaB8pyXQ2xJWruVAYOZ/nETXQJWznIpFL6ZJMXrNKUYKikFX0MpV9EMzfIlW2nOKOiYWciUI7tT
	OrG3UHTNeAk6A3B0Fj/UQrM0I6nncNRdduuO/y1aSS1c+e92FMgktLhqXtoLt6jIxFsKt7t9y2TZm
	Sb6CrGL2EQTO4ojzU+t2evmGotmrNHAmF/xWEudMQoJ7SWGeqHWG7AxbGxIEvnjiImUK73MvwWbbN
	IeMB8Cbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucet2-0000000Bo2w-1Cfh;
	Fri, 18 Jul 2025 06:48:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucej1-0000000Bmm3-3W1x;
	Fri, 18 Jul 2025 06:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 231FC44E76;
	Fri, 18 Jul 2025 06:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6296C4CEF5;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752820662;
	bh=Vg/Qxml+vCOWtwi27g4HsyyOYy1gOhqTGm45155VutI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RKi/tRqnJbZLGLSOWIEaui7ZZ4H5r7Z6HkMGueXQOKAn1EMtAKt+AXCQ0tn5c3duV
	 fmGfub+iVN9LqkTwXCfvaj7JaQTwprkvyZyaUPtSuKPUy4URG0634UdKbV8f14YxMM
	 vuNph1+sf2bKI246Q9nMVT4XDrxZsuOqg5LYrR8QMZGF5UdYi1ttduvfodrI4rfvFe
	 ef3D611H6MAJ6UKKr1vbSphdVAobgoV4BOjhpqieMBmSVObPCpiJtjSxpTNMcrHhr8
	 7Cznuaj53YsTbVDhRONyWNtsdhcw9ATUiNEWL2PwNaLgSucXRqdnUjtyAlt4YzLax2
	 nr3PowNkt9KgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F27C83F17;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Jul 2025 14:37:43 +0800
Subject: [PATCH 3/3] arm64: dts: amlogic: c3: Add tempsensor controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-c3-thermal-v1-3-674f9a991690@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
In-Reply-To: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752820661; l=1117;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=vWhNDYyE9xSECm6+/EYb548/qKTRV6MGziQpMJtR/5A=;
 b=GfoyeV+CAv/f/E7OEN1Tz3QApTOrFtWdFN5Z5fCvJjhDvbhe1bPYlFP48Z45K0KrxlaDpsS2P
 Ibg/ocitfAYCay1tzVjxBphiYRlbiSXlUKkB0nSscl7y3h139ZVkMri
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_233743_927902_C94B039F 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the Tempsensor controller node for C3 SoC family.

Signed-off-by: Liming Xue <liming.xue@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..c853390eca6c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -727,6 +727,17 @@ clkc_pll: clock-controller@8000 {
 					      "fix";
 			};
 
+			temperature-sensor@20000 {
+				compatible = "amlogic,c3-cpu-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				assigned-clocks = <&clkc_periphs CLKID_TS>;
+				assigned-clock-rates = <500000>;
+				amlogic,ao-secure = <&sec_ao>;
+				#thermal-sensor-cells = <0>;
+			};
+
 			eth_phy: mdio-multiplexer@28000 {
 				compatible = "amlogic,g12a-mdio-mux";
 				reg = <0x0 0x28000 0x0 0xa4>;

-- 
2.37.1



