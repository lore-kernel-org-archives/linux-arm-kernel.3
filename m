Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF6AEA4E22
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kANfip711vpiQBCFAIvvNl9ciTTZ0r6aVv54HQCstiI=; b=EM489qciBmZz/YdASL3ZyhedBV
	rprPBJa5g2bECQnNjF4EdFYQFM9H/cArgB2B9+6Tjrw04AUIbMYWxEORd+qyUO+04oYsmuUNENOHr
	wxTSX3E2EBz1D9pWxNlkFespXOTaE+iwJxiiT5iPOsI/FOpIsKNG+3In+g3eTlI7AJV1L2KpT7biE
	aE7fflUjHloJB9128BwaTKGkq5bxEJLTNf9i+1upSYf2MAEjI4RACtk40iT9oO+YB+WdXiip5MpWJ
	D7UhJ6J6T2aMigaVwVP92Jby5i0R/FwZOY0r60Itct+cS7qlYUlbF1A79V6NSGyRDf4fWzz1nblPN
	p4FSllhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BS-0000000DMWE-2K9m;
	Mon, 02 Mar 2026 15:27:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BR-0000000DMVA-05gr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kANfip711vpiQBCFAIvvNl9ciTTZ0r6aVv54HQCstiI=; b=nJgJOdsxOViXtZehOfmxo24MQf
	IKf8DjrLk72P1pwJrQrYL8rZw4oBjqs5pJcTQdC1WEhZ1JXKYolBmFCuVVjBvWCiNJnPUqk5G5F6l
	gST4Px460FFRaQNOR6qtAtO6en+IITGoDnjnkpm0H39eHenD0Jw4FjzI0uhq4pG6cr8sqfq+CIRPc
	en/T1HSeKOwSImeuWlSu76SDeLOt/O1TPKl/X3TvFRvuPiXjNrdc6mkowd56g4HeOUivWxfcoG+No
	VsFDg0BL0EatJOixIzo40cTJvtQQLi8EhThgupM3oVFEl/XQviwcUh6NNByqQ7Juk6X/GBHopj1De
	TZLBe7Zg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BO-00000000RPJ-00f3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E55F4448E;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E86C2BCB1;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465258;
	bh=BkdGVxBjkFgDtxop+akQ0p2oSsG6DQYEaX74MCiqCWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WWhlvzvuUZ0UgddDD2pZBOqxOURA6GrBn6uAITw94P/t8FR/PLO7De/F8ntbcp9KV
	 iLzEEuVKxFqRpaYkz0X/5Z93rsS15JaEAF0IM1q/xfeqoVDjn0gdAc+iN03vzKzfbx
	 26YjEtvA1k+jvZLTd4DYVhjG7N4mAtoas5EqTZijTiXhiJAsxipixoo/FIgtvSFu+o
	 KVkFY+7tk6nt9iUbPiAsmcYZAqvXUeKgnFtIA+WFW/ToMb3prpBuMY7WXWKlxu+QzC
	 ugmfSfAFvBrZcXmVxNMCjl+0LVFrRby0OFEo5coI0sD0qoQh2YcVNqGUYQgSSqIywJ
	 Vx+Ze4F5E3rWA==
Received: by wens.tw (Postfix, from userid 1000)
	id 4CF485FF08; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Mon,  2 Mar 2026 23:27:22 +0800
Message-ID: <20260302152724.3197587-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_152742_210371_62228A29 
X-CRM114-Status: GOOD (  12.89  )
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

The Avaota A1 board features 4 RGB LEDs in a string connected to the
SoC's LED controller.

Enable the LED controller and add device nodes for them. The timings
were copied from the downstream vendor DTS. The design does not specify
what these LEDs are for, nor are there any markings on the board for
them, so just use them as indicators.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 054d0357c139..7c24121de88f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -6,6 +6,7 @@
 #include "sun55i-a523.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Avaota A1";
@@ -99,6 +100,46 @@ &gpu {
 	status = "okay";
 };
 
+&ledc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ledc_ph_pin>;
+	allwinner,pixel-format = "grb";
+	allwinner,t0l-ns = <800>;
+	allwinner,t0h-ns = <300>;
+	allwinner,t1l-ns = <320>;
+	allwinner,t1h-ns = <800>;
+	allwinner,treset-ns = <84>;
+	status = "okay";
+
+	multi-led@0 {
+		reg = <0x0>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <0>;
+	};
+
+	multi-led@1 {
+		reg = <0x1>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+	};
+
+	multi-led@2 {
+		reg = <0x2>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <2>;
+	};
+
+	multi-led@3 {
+		reg = <0x3>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <3>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.47.3


