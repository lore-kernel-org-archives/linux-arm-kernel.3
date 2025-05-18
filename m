Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7055C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 23:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaXXZuk1frfcedeOEDAUivp9EQrzh8hsZwc4skzNAyM=; b=V7n8pDcD/Pnr5eslgIovcCpWrI
	rpJ7E327vorERyvW2sqP2O7UPTaE6jie74Jn6kRM7jWJHLfj+NkERuab/FCzjcsTmG+NcdjSLZHtq
	pQxcoC7m1OsApt7XmCbW9lNUdy0FjWAq4tXFyvqHRBlaXn8Rlo00oErgyk7qQuPP91AKZeXqRiSn8
	4opNMeExUtGz+R3JaLB3q+A7yOMxUxyjXk4lxCDrzAl2n2dEVEj/JdOYKeDNxnCo0AkRyzLUQturt
	QrnrZoE9uXNovMLD0pJQ02Ou0+K7fa9IM3+NY78YiXp7FmlSQglD8tJC+2nIRI6nfhAwB/Qo4M9y3
	5UxDPiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmzw-00000007fxR-3gt9;
	Sun, 18 May 2025 23:00:48 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmu8-00000007fRy-0Dz5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747608887; bh=jaXXZuk1frfcedeOEDAUivp9EQrzh8hsZwc4skzNAyM=;
 b=cgVmHOGJBjWZIPzdq0R1+y7f8tiyODhwsqanlGm90HZsYwzUHFfzFeGCgzGw8iRjAWhyLOT30
 UzMQS5CStKh9Jqpe8Lj3Gq3p+SATlMB8gIF3mt3K1ml5tR/1qV0mWhhk3H8knhE1bUJUbX1ZizT
 FFsyX0UxOyPhOecXYsdM68PX+4XZqJDqFOzsihe4T7UZNWdG8ApU+ipxBD4jpeJuQMY3m0Tm84P
 7QHB39HYh9ndcK58zBhIVGHAXEXiege/LnLvf82Vz5Mw5IeHARpjWu673hfgqQxJJ5/tcjB4g6r
 z8znVs64R1KrSO0MCKf4U/B8YssE/Y4wB4Bks2P4QW8A==
X-Forward-Email-ID: 682a6532db63046e3392f2c3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: rockchip: Add GPU node for RK3528
Date: Sun, 18 May 2025 22:54:12 +0000
Message-ID: <20250518225418.682182-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_155448_118826_374433BB 
X-CRM114-Status: UNSURE (   9.42  )
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

Add a GPU node and a opp-table for the Mali-450 MP2 in the RK3528 SoC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 791cb9b1e8f1..548ac6d4793f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -96,6 +96,36 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <875000 875000 1000000>;
+			opp-suspend;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <875000 875000 1000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <875000 875000 1000000>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <900000 900000 1000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <950000 950000 1000000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -433,6 +463,34 @@ power-domain@RK3528_PD_VPU {
 			};
 		};
 
+		gpu: gpu@ff700000 {
+			compatible = "rockchip,rk3528-mali", "arm,mali-450";
+			reg = <0x0 0xff700000 0x0 0x40000>;
+			assigned-clocks = <&cru ACLK_GPU_MALI>,
+					  <&scmi_clk SCMI_CLK_GPU>;
+			assigned-clock-rates = <297000000>, <300000000>;
+			clocks = <&cru ACLK_GPU_MALI>, <&scmi_clk SCMI_CLK_GPU>;
+			clock-names = "bus", "core";
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gp",
+					  "gpmmu",
+					  "pp",
+					  "pp0",
+					  "ppmmu0",
+					  "pp1",
+					  "ppmmu1";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&power RK3528_PD_GPU>;
+			resets = <&cru SRST_A_GPU>;
+			status = "disabled";
+		};
+
 		uart0: serial@ff9f0000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xff9f0000 0x0 0x100>;
-- 
2.49.0


