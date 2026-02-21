Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F27DC61DE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMFY6NAU3Uz+7ZAb7EsE/BSp19LwK2+4t9NBH96jXsk=; b=GXrPzkwGMbuY89dPHuK5H/J2rx
	HlP1OBzsrQgdG4LgBl8onRutXhEnET6LrofMXZ/OgkvQ2Dj0Xwo5OaRyVWXyaIR7uOGMCbP7bIA25
	t6FUEvp/QxFh6LcRkJXpIpP3X8aLXifxnQ2iXaIJHGOj5UzfG0GhPlQD9j56nQ804IOZfbxxYHKEJ
	QgteJDVHzAjZxWFPCddU+wVlEZ3VrSjc6IvTn8WYrLwQPZTpyi0Jba39ylHw3aTWOvPY5iEsBxi+A
	KxdZwAE+IeZiGZg69BqcdR/4eBhH8w2iSCLqmIKUFl17VdXuVn9+bOBcUfkrnZFKBUAo81fO8Q4vc
	EFZC0lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtlhL-0000000G1d1-2DIv;
	Sat, 21 Feb 2026 12:02:59 +0000
Received: from ms.puri.sm ([2a01:4f9:c012:9260::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtlhH-0000000G1bs-37sa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 12:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771675370; bh=9SbPaetK5d72539TKn7IKw4NUnBLPltxlU7lgz7MMeU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a5KiYJRzdXj3LULGd4zZt7F61KF3lFuTAjq8KSuUiG7OGxqSpoWXlATPDQC5G7APz
	 VmdLbsEEOOdll9rHyytrQZF2exQZs2RzOu3hi4UYel2mMwPXIVzfIhu/bHL13YMw2y
	 4aj5tXBvWUhpKxOcT35cUZzIWbzTIf0D+Fg3Upy8EGBKUxem8DkDK3UU9to13B1mjN
	 nEotdXYUTZFxMztuIxSTt5ZCiJRPRkyftl74X0IIBdd7qVplDY6Iy1tv5qWYht5Y7v
	 +DV+TdKos/9UErshAJDXHD85lWqwx2/aHwFY/ZvxOG1VK+ZGsQyhS1/qg0SUtrKDuR
	 86gQpwYGauU1A==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id F34981F6B7;
	Sat, 21 Feb 2026 04:02:49 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 21 Feb 2026 13:02:10 +0100
Subject: [PATCH 1/2] Revert "arm64: dts: imx8mq-librem5: Set the DVS
 voltages lower"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-l5-voltages-v1-1-daa8aeedc86c@puri.sm>
References: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
In-Reply-To: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2661;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=9SbPaetK5d72539TKn7IKw4NUnBLPltxlU7lgz7MMeU=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmZ7nqezd4u9Rpz3KUnua9Sbyn21RCE8R6QZu2
 g3DUohOP9CJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZme5wAKCRDo8jXPO9vD
 /7nvD/9Cw/2BKcSrlkdhbkMK3ZszKTTTh3oBAHyrVfTc+82chIDSLO1Yi925A439Jg74l3jthTe
 Y9KJDTRXZwT2gRitSfNSqEG8wam9aqaopk8aoIveENJCVGtQstlHxZMZi92LHIcnL/hukmvAEqC
 mOXtTJO9hfgf3l16eX4faZmVX+FRFMFqdn4DP+C/Fm4AFKWaIbjggORZUSDzdmip9BjKQdWqVFT
 0kO2jl+ENbouSVwrl95Sw2PqutXtRlgzCpmQaYNjl4uhAo3NhaXtE6Ln9VFYHoA1jLWTNSN4dwQ
 pc9oADEW5Hkk3Cq8p4/aRPhhwc3L+9YcvJOfll51SIsopTsd31tABKfJK2ohuw0IM4skzPmWvNl
 6Zc69/wiTGsKq3Pa4GF0hsVkkutL7oSu//HNxt/ziNH+Y960qm6caVK3P8GLLNikQncpf306q5A
 nCQKVkGAOw0hQ/kReMCwcvXlpd0E2rwVtUVJmzF2HMtuXDzsxUytCGbfQlobYIVjZRgEGbiqQkU
 oV5lMP5W9WI3aMFAlcz88Ba8M3JWq9FOMkexdhgvtYFthXxsy3RIF2dTBer99MPpDZSdKwgwi03
 Hkg3NN4BNNcS0n3ejOCrw7wtqPW28rX0QxfnBMH+MEv/Wd7ATOWXU8/m6VAYpAu5RBmO1RWtarl
 0q+FqCsL/SXgH7w==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_040255_943430_7C8E12FC 
X-CRM114-Status: UNSURE (   9.17  )
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

This reverts commit c24a9b698fb02cd0723fa8375abab07f94b97b10.

It's been found that there's a significant per-unit variance in accepted
supply voltages and the current set still makes some units unstable.

Revert back to nominal values.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 22 ++++++----------------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
index 077c5cd2586f..4533a84fb0b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
@@ -7,7 +7,7 @@
 
 &a53_opp_table {
 	opp-1000000000 {
-		opp-microvolt = <950000>;
+		opp-microvolt = <1000000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index eee390c27210..7818d84f25a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -880,8 +880,8 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
 				regulator-ramp-delay = <1250>;
-				rohm,dvs-run-voltage = <880000>;
-				rohm,dvs-idle-voltage = <820000>;
+				rohm,dvs-run-voltage = <900000>;
+				rohm,dvs-idle-voltage = <850000>;
 				rohm,dvs-suspend-voltage = <810000>;
 				regulator-always-on;
 			};
@@ -892,8 +892,8 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
 				regulator-ramp-delay = <1250>;
-				rohm,dvs-run-voltage = <950000>;
-				rohm,dvs-idle-voltage = <850000>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
 				regulator-always-on;
 			};
 
@@ -902,14 +902,14 @@ buck3_reg: BUCK3 {
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
-				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-run-voltage = <900000>;
 			};
 
 			buck4_reg: BUCK4 {
 				regulator-name = "buck4";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
-				rohm,dvs-run-voltage = <930000>;
+				rohm,dvs-run-voltage = <1000000>;
 			};
 
 			buck5_reg: BUCK5 {
@@ -1448,13 +1448,3 @@ &wdog1 {
 	fsl,ext-reset-output;
 	status = "okay";
 };
-
-&a53_opp_table {
-	opp-1000000000 {
-		opp-microvolt = <850000>;
-	};
-
-	opp-1500000000 {
-		opp-microvolt = <950000>;
-	};
-};

-- 
2.53.0


