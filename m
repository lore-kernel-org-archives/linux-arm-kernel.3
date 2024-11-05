Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D557BD36138
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBHle+OmOKJ3GRYlaXusg7k6eCXaPNAxaIyVWZZMSto=; b=g0Z7N8QtBtNRaayS0QwfXl0X7W
	vMzUAro1U2wCnctuYsZmLXdJ/zvcCIRPA3cizHdRgdAoDmIKqPXVo0DuEui335fYXnRZrXo+C9Mkr
	YJ2xXXktMD+dXhp8eshmF+rmrJwFHOTHaqKPUPKjX6ilgQ44lvSqHLEHexMZo38OvHQ6q/7I69TRc
	bIMQet0Tt9obx8kWStevUaz7EQGUU5HnDyP4W0I031AfOxZw9LKnMYMRuurRziHR9my0TQ7MzQJWc
	362aL3VjnPGfC8ztEgMINFx7BPWqFEpYwAa68QI4fJiRzCiqev327G/2BLNQVwhk36gmQIXICs3YS
	ODfV7bXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8QC0-00000000iz0-1VtX;
	Tue, 05 Nov 2024 20:30:24 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8QAG-00000000idl-0pWW;
	Tue, 05 Nov 2024 20:28:38 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730838513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aBHle+OmOKJ3GRYlaXusg7k6eCXaPNAxaIyVWZZMSto=;
	b=baeAwYAByo6F6KHLbMhtp+gExlg0rVpoZqzBs+OCjm3SBE0U0PsJMixAmn16/sJ2pY6UFJ
	xpJAK4HAZRkmK4DUAjS5gPuhkz+dsABoYjuwLh6jtEo2rzVKUHc1J7ti7qDLgOK49T10kL
	C8JPSFyI0DW2+4DSiyzhgt+5L017gSDzDW0OKA8EDM3w7L7DSGQVSutGbgAqjmYnRVtvuE
	ZRcqG8+MWZ3UXpLyfF3n8/9Jzrpjt+q00M1PtZ/V4FNwPQ2mSDyppngYag49qbdU48rrSB
	CDPzml/J1OHCZdEcy/D06ehxXblZdvSp/GzrhiehKdCs/NwC4GAGjCtlJHjFrw==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH] arm64: dts: rockchip: Add OPP voltage ranges to RK3399 OP1 SoC dtsi
Date: Tue,  5 Nov 2024 21:28:22 +0100
Message-Id: <806d5e2a07ae0c81d9907bbe8bec4e3e1138b392.1730838347.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_122836_771303_CD7A728A 
X-CRM114-Status: UNSURE (   9.45  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in the
SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This may be
useful if there are any OP1-based boards whose associated voltage regulators
are unable to deliver the exact voltages; otherwise, it causes no functional
changes to the resulting OPP voltages at runtime.

These changes cannot cause stability issues or any kind of damage, because
it's perfectly safe to use the highest voltage from an OPP group for each OPP
in the same group.  The only possible negative effect of using higher voltages
is wasted energy in form of some additionally generated heat.

Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi | 52 ++++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
index b24bff511513..aa79219471d3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
@@ -12,125 +12,125 @@ cluster0_opp: opp-table-0 {
 
 		opp00 {
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <800000>;
+			opp-microvolt = <800000 800000 1150000>;
 			clock-latency-ns = <40000>;
 		};
 		opp01 {
 			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <825000>;
+			opp-microvolt = <825000 825000 1150000>;
 		};
 		opp02 {
 			opp-hz = /bits/ 64 <816000000>;
-			opp-microvolt = <850000>;
+			opp-microvolt = <850000 850000 1150000>;
 		};
 		opp03 {
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <900000 900000 1150000>;
 		};
 		opp04 {
 			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <975000>;
+			opp-microvolt = <975000 975000 1150000>;
 		};
 		opp05 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <1100000>;
+			opp-microvolt = <1100000 1100000 1150000>;
 		};
 		opp06 {
 			opp-hz = /bits/ 64 <1512000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1150000 1150000 1150000>;
 		};
 	};
 
 	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
 		opp00 {
 			opp-hz = /bits/ 64 <408000000>;
 			opp-microvolt = <800000>;
-			clock-latency-ns = <40000>;
+			clock-latency-ns = <40000 40000 1250000>;
 		};
 		opp01 {
 			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <800000>;
+			opp-microvolt = <800000 800000 1250000>;
 		};
 		opp02 {
 			opp-hz = /bits/ 64 <816000000>;
-			opp-microvolt = <825000>;
+			opp-microvolt = <825000 825000 1250000>;
 		};
 		opp03 {
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <850000>;
+			opp-microvolt = <850000 850000 1250000>;
 		};
 		opp04 {
 			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <900000 900000 1250000>;
 		};
 		opp05 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <975000>;
+			opp-microvolt = <975000 975000 1250000>;
 		};
 		opp06 {
 			opp-hz = /bits/ 64 <1608000000>;
-			opp-microvolt = <1050000>;
+			opp-microvolt = <1050000 1050000 1250000>;
 		};
 		opp07 {
 			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1150000 1150000 1250000>;
 		};
 		opp08 {
 			opp-hz = /bits/ 64 <2016000000>;
-			opp-microvolt = <1250000>;
+			opp-microvolt = <1250000 1250000 1250000>;
 		};
 	};
 
 	gpu_opp_table: opp-table-2 {
 		compatible = "operating-points-v2";
 
 		opp00 {
 			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <800000>;
+			opp-microvolt = <800000 800000 1075000>;
 		};
 		opp01 {
 			opp-hz = /bits/ 64 <297000000>;
-			opp-microvolt = <800000>;
+			opp-microvolt = <800000 800000 1075000>;
 		};
 		opp02 {
 			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <825000>;
+			opp-microvolt = <825000 825000 1075000>;
 		};
 		opp03 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <850000>;
+			opp-microvolt = <850000 850000 1075000>;
 		};
 		opp04 {
 			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <925000>;
+			opp-microvolt = <925000 925000 1075000>;
 		};
 		opp05 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <1075000>;
+			opp-microvolt = <1075000 1075000 1075000>;
 		};
 	};
 
 	dmc_opp_table: opp-table-3 {
 		compatible = "operating-points-v2";
 
 		opp00 {
 			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <900000 900000 925000>;
 		};
 		opp01 {
 			opp-hz = /bits/ 64 <666000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <900000 900000 925000>;
 		};
 		opp02 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <900000 900000 925000>;
 		};
 		opp03 {
 			opp-hz = /bits/ 64 <928000000>;
-			opp-microvolt = <925000>;
+			opp-microvolt = <925000 925000 925000>;
 		};
 	};
 };

