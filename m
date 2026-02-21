Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB923C61DE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oTdyL2map+OfX5HD10vM5/lMbnIQldsaW2QZN4pJqs=; b=gUcKgIi918goy/1oLUd4KqCk1O
	tVuATqjmMbeplCWRA6Rrs8eRRFASopawdu2vX9bUJJgvenzumqUDlMBECTO9jCNSVZlJOkJJJVB1y
	XbZIAoU5wMgZWlWtxh7gy95KjcyM765aTHAomt8LQikvVxAjUlYi725SWsJZE4MOnjIibiO+VeVmC
	TQNaUJ8mgcqgWNTfYq/my54k8BJSE9u2GnuDWt3wCWWLPBV3r3Kr1TqyvI9ShK6ofRjU3MGI7pVtw
	xy1NV+ClSpwUtTbOx8EfKpT9I5EqdNVd85BngJB3mjxvva7jWsTCzVEK0SmXMXkqHz6M2jNMw69c7
	t1SlbIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrVw-0000000GETw-2hK9;
	Sat, 21 Feb 2026 18:15:36 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrVu-0000000GET6-2bAc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771697731; bh=C79fk9buYX7yCvQACmE0txqbxH9EAZk4H/4Pud3Yxv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iCut6gKZCAxoT0OJ8i71jEgKfnnjG6uPjfyTVvAHwNiLcJakc4OkHt2fNaVj8R+yz
	 Vl+iIWoTfnfXNNm6p8n3MMCQ88kaXkYocAni+Zu9dT8KQPelszUVP0eHyLCh//Pr7M
	 na2ObQ80iHTC2V/5ptPBec6bG80k6n+dMsNPTJ5BcZdUSKqKYCprpgzmnETZZ0nz42
	 Y//7Q6AWP6z/vWwDOWogaHsahHm8mlHL8JKN1uNL0EPsbQ6KZ20EzACb4ruX5kJ1Y8
	 Gxh7vJp0hJg1j9DDPLG+vOakRfauXrLFngGiaZL5wWCS61b9mJWeCLMCZ+YeiPdQ31
	 8TndeZS0JV1Mw==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id 485931F5C0;
	Sat, 21 Feb 2026 10:15:30 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 21 Feb 2026 19:15:18 +0100
Subject: [PATCH v2 1/2] Revert "arm64: dts: imx8mq-librem5: Set the DVS
 voltages lower"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-l5-voltages-v2-1-dd8885bb9331@puri.sm>
References: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
In-Reply-To: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2771;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=C79fk9buYX7yCvQACmE0txqbxH9EAZk4H/4Pud3Yxv0=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmfY/QvYAlXeTzXnItGtg74YubqU9KDhiDujlr
 rybx2UymF2JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZn2PwAKCRDo8jXPO9vD
 /zeqD/9emei1CMfBkgjXYjY2Q0/v76nJPILYxZsNEn5gcA+55aGRX2dMzFuYzpJtN0WdyS9KRbB
 Ky9gosOAlSZ+DkT/iDMlTFEIW8nabbVk3jqWPodwwK9IQEn9NvJ3EJm2lBv0gYyArFjj8ldRxwS
 Cfzr8mXCRYmC22BjHe/reSO08WHG4HjoDTnIUVcuIgF9V3+/a/kNtjreDZTSjvfCSndP7TOUkLi
 5YF30sz1QmiSQCBA9hkEPAdkjmlJetuXUoKbuvBQ6U6psE4Xkl9DgvbJkqMtXT6wwO2ZwbzL7Wb
 5s1RILLkF/jeKZYwUTtYJdR061qKqptdki3FVRxL8mu/h6Ui2ADytRnm5wDRLVun3ladMihlziQ
 WoPEfP8Jvv6LZd2am6HfChQJJNfyPu1SeW9EyFeB02Ao/d7VI7MY+El6RTmH5WbozhaVwrhB6Cc
 pceDzqPx/Fq0+rWUYUDosVQiTOQ4FfNJrQ/hoCau47zBIb+3kJQy5ndEbO73ZHOH9rIuh9H0Aee
 dqc7MwplmCtitzFiBGxxESFsTaNYS61x1f4E9DkMJVqI2n45FyzGqQ3M4akKsJVYaJ/9HJX61fq
 LwRtjD0DqL+mFOPnNEuR+mFmSC8DO5OnfPUgrRRA52eWX7zZKX8AYRscsvUmfc8sGsnRgqc0WAe
 Nsp047insz8ojmg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_101534_819690_370DD064 
X-CRM114-Status: UNSURE (   9.44  )
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

Cc: <stable@vger.kernel.org>
Fixes: c24a9b698fb0 ("arm64: dts: imx8mq-librem5: Set the DVS voltages lower")
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


