Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA29E6F07E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 03:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k33vTDitf06aKiwfNJDdOoAA6cwqjjJzaXvt5dYrR+I=; b=kdk6tFu9/z9GGYO9a57WgipwoD
	eLA9xvJqKf8Pplgql5m4qBVldeZCBqexzIqTKyIbhPal1MACHPzkAhR8Zd00S1dkO+w12ruWwtB99
	j9Ul5mdLpCyNV9mtgnPgOsKT+DMr0GuGGKtD2SZhAmZs5h2UXR5hFqCWoqAYHta5Xsu8mERQRfMzZ
	W9PzXd1/MUtJI8JEV6a0+tukgttOnLUFU7UD/4D7Y+6dQdD+Gkx0KkTEcOFJCqzOVpiH89UQl10w9
	3uhmyB95QuCEIliiT2TuqBBYbAJPy3gNQSKMt27l3gD2w90asAgcFrdaka1NRQNO7XV1bmO21330f
	c70uKARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74ZJ-00000008vrQ-2Y1L;
	Sat, 02 Nov 2024 03:12:53 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t74Vz-00000008vSv-3UWv;
	Sat, 02 Nov 2024 03:09:29 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730516957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k33vTDitf06aKiwfNJDdOoAA6cwqjjJzaXvt5dYrR+I=;
	b=acDK5Lt93Pm2eToay6pQv0CX3Gn3gQagepQd+XDmGCqJOTGy76/7E4lu11S+0yHkuRRMdO
	6C+TBxot+ps8HWtLCfSAqaAhzXhxITcGiOtWZRJjjmGYjXdkGC8byvGtSKtKHH5DgHtI/u
	i7WJiqXaqSbCb86WWTZ8H1ssGB7l6aL8YRf8aejjGrplsAIAPLK4tESkjnlRR9gOh+6IHF
	5UTTwcgwWfcfutiZN/NPzEiG93tqjB9N2WWVYRqPCSYQQonPgm0htkfePbBzUuapFNWeW+
	MfXENjKfwh3d5OBLGnvTSq6818Kkevuca2ZNDFmdgkzgZQJqxu66EiDTBoxMyA==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org
Subject: [PATCH v2 1/3] arm64: dts: rockchip: Update CPU OPP voltages in RK356x SoC dtsi
Date: Sat,  2 Nov 2024 04:08:59 +0100
Message-Id: <f816cd24b62742dd05a1b7c6fe162bb581c9b3bf.1730516702.git.dsimic@manjaro.org>
In-Reply-To: <cover.1730516702.git.dsimic@manjaro.org>
References: <cover.1730516702.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_200928_195264_6CC3BE25 
X-CRM114-Status: GOOD (  11.20  )
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

Update the lower/upper voltage limits and the exact voltages for the Rockchip
RK356x CPU OPPs, using the most conservative values (i.e. the highest per-OPP
voltages) found in the vendor kernel source. [1]

Using the most conservative per-OPP voltages ensures reliable CPU operation
regardless of the actual CPU binning, with the downside of possibly using
a bit more power for the CPU cores than absolutely needed.

Additionally, fill in the missing "clock-latency-ns" CPU OPP properties, using
the values found in the vendor kernel source. [1]

[1] https://raw.githubusercontent.com/rockchip-linux/kernel/f8b9431ee38ed561650be7092ab93f564598daa9/arch/arm64/boot/dts/rockchip/rk3568.dtsi

Related-to: eb665b1c06bc ("arm64: dts: rockchip: Update GPU OPP voltages in RK356x SoC dtsi")
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 0946310e8c12..5c54898f6ed1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -273,6 +273,7 @@ &cpu0_opp_table {
 	opp-1992000000 {
 		opp-hz = /bits/ 64 <1992000000>;
 		opp-microvolt = <1150000 1150000 1150000>;
+		clock-latency-ns = <40000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 0ee0ada6f0ab..534593f2ed0b 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -134,39 +134,45 @@ cpu0_opp_table: opp-table-0 {
 
 		opp-408000000 {
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1150000>;
+			opp-microvolt = <850000 850000 1150000>;
 			clock-latency-ns = <40000>;
 		};
 
 		opp-600000000 {
 			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <900000 900000 1150000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
 		};
 
 		opp-816000000 {
 			opp-hz = /bits/ 64 <816000000>;
-			opp-microvolt = <900000 900000 1150000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
 			opp-suspend;
 		};
 
 		opp-1104000000 {
 			opp-hz = /bits/ 64 <1104000000>;
 			opp-microvolt = <900000 900000 1150000>;
+			clock-latency-ns = <40000>;
 		};
 
 		opp-1416000000 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <900000 900000 1150000>;
+			opp-microvolt = <1025000 1025000 1150000>;
+			clock-latency-ns = <40000>;
 		};
 
 		opp-1608000000 {
 			opp-hz = /bits/ 64 <1608000000>;
-			opp-microvolt = <975000 975000 1150000>;
+			opp-microvolt = <1100000 1100000 1150000>;
+			clock-latency-ns = <40000>;
 		};
 
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <1050000 1050000 1150000>;
+			opp-microvolt = <1150000 1150000 1150000>;
+			clock-latency-ns = <40000>;
 		};
 	};
 

