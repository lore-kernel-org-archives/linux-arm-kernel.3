Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29134CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq2tmAU6/muB92kh06lxIBctbJRbQ+GiO0XxALCSFSE=; b=SFK7omjeGvOaQ92qNPcK03SVsy
	boUxLBs1dSBMQQfrrwunKuT3K0Fbg0HfRaQCc6C2RAY2pmEocegWwFtSLiQX0srOGU8I6gLliv4As
	v3hYhj6Q0NPzAZVdQVcL0a58ev3aQv3onzF6BvpxXTKj2DTc6J4HRDtiAaYR5kHPTuTIX5BEZN7KC
	CZ/uHjdzzJ59a/qg3EDS/g1lh1zUR7fggds8dYXy/KXY65FjnnxydSWbYAgZsdJXpP58iUNHQvrFA
	GZqMbGWMngyzwcGRlLOEKX1DSvEmwMVdt5SZH475tV0ACr24hU5NvOn0C3JAlCwmvCoP4j9uY9V0V
	ol0vmBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZE-00000001Tzs-1Dmn;
	Fri, 19 Sep 2025 00:01:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZ8-00000001TwY-2tzf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:01:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1148B1762;
	Thu, 18 Sep 2025 17:01:22 -0700 (PDT)
Received: from minigeek.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 058443F673;
	Thu, 18 Sep 2025 17:01:27 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [RFC PATCH 5/5] arm64: dts: allwinner: a523: Mark dual-phased regulators
Date: Fri, 19 Sep 2025 01:00:20 +0100
Message-ID: <20250919000020.16969-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20250919000020.16969-1-andre.przywara@arm.com>
References: <20250919000020.16969-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_170130_850095_BCE6BBBD 
X-CRM114-Status: GOOD (  12.20  )
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

The X-Powers AXP323 PMIC on the boards with a SoC from the Allwinner
A523 family typically uses DCDC1 and DCDC2 in a dual-phase setup to
supply the "big" CPU cluster. For some reason this dual-phase
configuration is not the PMIC's reset default, but needs to be actively
programmed at runtime.

Add the newly introduced x-powers,polyphased property in the board DTs,
to mark this connection and let drivers program the dual-phase setup.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 ++++-
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 ++++-
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 ++++-
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 ++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 4ad91b6f01d34..a51446482927c 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -269,9 +269,12 @@ reg_dcdc1_323: dcdc1 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1160000>;
 				regulator-name = "vdd-cpub";
+				x-powers,polyphased = <&reg_dcdc2_323>;
 			};
 
-			/* DCDC2 is polyphased with DCDC1 */
+			reg_dcdc2_323: dcdc2 {
+				/* dual-phased with DCDC1 */
+			};
 
 			/* RISC-V management core supply */
 			reg_dcdc3_323: dcdc3 {
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 68c5765c2e919..848b5abb4203f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -285,9 +285,12 @@ reg_dcdc1_323: dcdc1 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1160000>;
 				regulator-name = "vdd-cpub";
+				x-powers,polyphased = <&reg_dcdc2_323>;
 			};
 
-			/* DCDC2 is polyphased with DCDC1 */
+			reg_dcdc2_323: dcdc2 {
+				/* dual-phased with DCDC1 */
+			};
 
 			reg_dcdc3_323: dcdc3 {
 				regulator-always-on;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 7b7ef54ec7684..ec69b409ac47f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -291,9 +291,12 @@ reg_dcdc1_323: dcdc1 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1160000>;
 				regulator-name = "vdd-cpub";
+				x-powers,polyphased = <&reg_dcdc2_323>;
 			};
 
-			/* DCDC2 is polyphased with DCDC1 */
+			reg_dcdc2_323: dcdc2 {
+				/* dual-phased with DCDC1 */
+			};
 
 			/* Some RISC-V management core related voltage */
 			reg_dcdc3_323: dcdc3 {
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index d07bb9193b438..e9e6d85fb84f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -322,9 +322,12 @@ reg_dcdc1_323: dcdc1 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1150000>;
 				regulator-name = "vdd-cpub";
+				x-powers,polyphased = <&reg_dcdc2_323>;
 			};
 
-			/* DCDC2 is polyphased with DCDC1 */
+			reg_dcdc2_323: dcdc2 {
+				/* dual-phased with DCDC1 */
+			};
 
 			/* Some RISC-V management core related voltage */
 			reg_dcdc3_323: dcdc3 {
-- 
2.46.4


