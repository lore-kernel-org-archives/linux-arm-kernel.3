Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B04C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EbWJqb/4DQjpXk7DGdlXqTWFl1RcFeqMA81OaV2jIo=; b=xuou9ZTLsInzB9KtVtlrAEbpqx
	56PWvTwwcL+Cl7qy/GB12+t2R1Xs8zUBBxb1mqJrvBmlgIJp7fPMy3DYKk77PRPLaJYQ/68yUE9Kc
	OCWGPCw89LYnMgtnK/Q0svyiv3rwus8pSczZL30Rc7RlF/ncl5FU8eyPddb3tR6z+75VNDIA9WFse
	1gMVuh/0V5PYfLh62wBZz1rKeFqKvHqVbJNU90u7Jia1JMiRnBZxFY2RFyOqFufGN4YmnZP6gRsHn
	z5dFkEI1nGxvDMJRkOba4/DhVO2e5k6ypUow5GyDfbolzdunYwntS1rRfY23nRVmlwSLcrwOaKq/v
	LZk3ky9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiOs-0000000G04K-3Pfj;
	Wed, 06 Aug 2025 17:58:06 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiHM-0000000FzFC-0emd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:50:21 +0000
DKIM-Signature: a=rsa-sha256; bh=5EbWJqb/4DQjpXk7DGdlXqTWFl1RcFeqMA81OaV2jIo=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754501633; v=1; x=1754933633;
 b=BACPZPJEum2eh/RUaHF9aC9eREO6BSmTetkPH28gaiwtw1FenJ4q09Fv9iZg/K2cKXZoYDbI
 MtyhXzJqW+AladUj+zPVkQi6PXv5n4rW5FYQ09/BQYjfUsy2rvFb1J8sUSguamwsIoM+IrtHqYj
 c+8pBsGEaJWP2bSM/zr0lZtQDOfQMYFGA2HW2UQ/iE+ADu559t3PTZZJ+Lp6vDyZekjMSbLXQfp
 ke4DMTWp5r0glj7/Gd91u5Z7ckSm8wV1pKuB9uxa/jx+YAWEmxVl2h+RW2dpQRxGnIw5bxjpupc
 nooIOSbwJVQgr35MFUwdOaUdlFWiO6Jq6F9dlXy44Zc7A==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id f43a9c5f; Wed, 06 Aug 2025 19:33:53 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Wed, 06 Aug 2025 19:33:24 +0200
Subject: [PATCH RFC 5/5] arm64: dts: marvell: pxa1908: Add power controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250806-pxa1908-genpd-v1-5-16409309fc72@dujemihanovic.xyz>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
In-Reply-To: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=r71dXU2Xc5Ubgu7RiIpKZnrZBJi4GnFBtADrF7xkhxA=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmTJ/6pnXBOdlbNHyWGuEoz91lLbK4zHM7cOL1uSf4nG
 fkOG5u1HaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCR6WyMDHdZLaVifnivnSG1
 Y4NwJoudZe2Sx4dN18zQ5mu7Nm2KlAEjw8vnsS4aSRuYcpM+bAmpf/j/ufXxZCOdj9IK+R92sZW
 3swMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_105020_336976_DD3F94E1 
X-CRM114-Status: GOOD (  11.19  )
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

Add a node for the newly implemented power domain controller. Also add
the first two power domain consumers: IOMMU (fixes probing) and
framebuffer.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |  1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       | 36 +++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..2f175ae48c6a2371c407b3a6ffd3cdd577f44e56 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,6 +23,7 @@ chosen {
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			power-domains = <&pd PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
 			stride = <(480 * 4)>;
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..630e99f2c309dca0872d824a098ac93b6e55c3a4 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/marvell,pxa1908.h>
+#include <dt-bindings/power/marvell,pxa1908-power.h>
 
 / {
 	model = "Marvell Armada PXA1908";
@@ -79,6 +80,7 @@ smmu: iommu@c0010000 {
 			#iommu-cells = <1>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd PXA1908_POWER_DOMAIN_VPU>;
 			status = "disabled";
 		};
 
@@ -291,9 +293,41 @@ sdh2: mmc@81000 {
 			};
 
 			apmu: clock-controller@82800 {
-				compatible = "marvell,pxa1908-apmu";
+				compatible = "marvell,pxa1908-apmu", "simple-mfd", "syscon";
 				reg = <0x82800 0x400>;
 				#clock-cells = <1>;
+
+				pd: power-controller {
+					compatible = "marvell,pxa1908-power-controller";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@PXA1908_POWER_DOMAIN_VPU {
+						reg = <PXA1908_POWER_DOMAIN_VPU>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@PXA1908_POWER_DOMAIN_GPU {
+						reg = <PXA1908_POWER_DOMAIN_GPU>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@PXA1908_POWER_DOMAIN_GPU2D {
+						reg = <PXA1908_POWER_DOMAIN_GPU2D>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@PXA1908_POWER_DOMAIN_DSI {
+						reg = <PXA1908_POWER_DOMAIN_DSI>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@PXA1908_POWER_DOMAIN_ISP {
+						reg = <PXA1908_POWER_DOMAIN_ISP>;
+						#power-domain-cells = <0>;
+					};
+				};
 			};
 		};
 	};

-- 
2.50.1


