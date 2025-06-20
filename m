Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D66C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nXaPUwaP4X4bqhrUcjVXoOEgF8FmOOCVVPLorHoYLMg=; b=ahdLS7JzXFENFpWCNrikF98jbp
	0O8RZyFVhaSjMxkh6XzNqkT/4xAddNbxdm4NVKYEnSalQ7trj+9yjxB72XLGsJvvzDV9ZlBExrEw3
	CympAKb3Ju2+vrkNypa8lD3sdO4jhMZOf5nPtEZW4j0LO/a2NIFFuRbYxmoq4QF7CpeP7GeZJFobT
	nGDfaAD+GzZG5YsS1gY/f6gaX+hiM9s1LzKu1eP/i8WqkscNTOM0Jl9X9kPKi5GEhdA+3L17eCC1Y
	12vncNqIbVWd7r7JHdy60jbHydTyPQopwZMWMVQ64shPjUROJmDhjsSrG5xvXhyc21aP5fBA0l5H1
	MOGb+lTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiET-0000000GW5H-1ts3;
	Fri, 20 Jun 2025 20:21:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiBH-0000000GVnl-455Q;
	Fri, 20 Jun 2025 20:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=nXaPUwaP4X4bqhrUcjVXoOEgF8FmOOCVVPLorHoYLMg=; b=sZq7/oGMna47RCz6h0uSsfVCI2
	sbz1lldBjK2Ox81mnPCxOJMs2WAQrnmCqiQ5mAafeuaYFF3XuiXHVcxYwy6e0+guCeQ+vOCVJW/+o
	sZ1wDEY55WwYlsexSSO4bodpyjMwclt0MNz3+aXjh2B+OIC1qWhhHa9cH+q8eqeNlr/qMLDWbBSa1
	9mPC9BmqIVelbzJmGgJr7NckyunWwRdPTzDXMEg9zwIMQ8A47DwnyDGY8y2T4sPa0X8yrIdGv5rsR
	yv2gGSLtwFY1gsdZYI7MkdvUXdMAKN9CZkvh/px4wZPjlx7ZF/WQG9Ws0ZKyNKx3x5rq6/lf2CJ7r
	viCqNPSg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSiBF-0005OZ-Li; Fri, 20 Jun 2025 22:17:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	ziyao@disroot.org,
	amadeus@jmu.edu.cn,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: rockchip: convert rk3528 power-domains to dt-binding constants
Date: Fri, 20 Jun 2025 22:17:15 +0200
Message-ID: <20250620201715.1572609-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_131748_011490_373E7AE1 
X-CRM114-Status: GOOD (  12.99  )
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

Now that the binding head has been merged, convert the power-domain ids
back to these constants for easier handling.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes in v2:
- add conversion in newly added gpu node

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 9620a11bdc27..a47318ce4d36 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
+#include <dt-bindings/power/rockchip,rk3528-power.h>
 #include <dt-bindings/reset/rockchip,rk3528-cru.h>
 
 / {
@@ -480,8 +481,8 @@ power: power-controller {
 				#size-cells = <0>;
 
 				/* These power domains are grouped by VD_GPU */
-				power-domain@4 {
-					reg = <4>;
+				power-domain@RK3528_PD_GPU {
+					reg = <RK3528_PD_GPU>;
 					clocks = <&cru ACLK_GPU_MALI>,
 						 <&cru PCLK_GPU_ROOT>;
 					pm_qos = <&qos_gpu_m0>,
@@ -490,20 +491,20 @@ power-domain@4 {
 				};
 
 				/* These power domains are grouped by VD_LOGIC */
-				power-domain@5 {
-					reg = <5>;
+				power-domain@RK3528_PD_RKVDEC {
+					reg = <RK3528_PD_RKVDEC>;
 					pm_qos = <&qos_rkvdec>;
 					#power-domain-cells = <0>;
 					status = "disabled";
 				};
-				power-domain@6 {
-					reg = <6>;
+				power-domain@RK3528_PD_RKVENC {
+					reg = <RK3528_PD_RKVENC>;
 					pm_qos = <&qos_rkvenc>;
 					#power-domain-cells = <0>;
 					status = "disabled";
 				};
-				power-domain@7 {
-					reg = <7>;
+				power-domain@RK3528_PD_VO {
+					reg = <RK3528_PD_VO>;
 					pm_qos = <&qos_gmac0>,
 						 <&qos_hdcp>,
 						 <&qos_jpegdec>,
@@ -516,8 +517,8 @@ power-domain@7 {
 					#power-domain-cells = <0>;
 					status = "disabled";
 				};
-				power-domain@8 {
-					reg = <8>;
+				power-domain@RK3528_PD_VPU {
+					reg = <RK3528_PD_VPU>;
 					pm_qos = <&qos_emmc>,
 						 <&qos_fspi>,
 						 <&qos_gmac1>,
@@ -556,7 +557,7 @@ gpu: gpu@ff700000 {
 					  "pp1",
 					  "ppmmu1";
 			operating-points-v2 = <&gpu_opp_table>;
-			power-domains = <&power 4>;
+			power-domains = <&power RK3528_PD_GPU>;
 			resets = <&cru SRST_A_GPU>;
 			status = "disabled";
 		};
-- 
2.47.2


