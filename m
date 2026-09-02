Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F793C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TaW7OlLvdAso7FjT/g6CTSjBBSyjti7MbS4f2Vr7Pqk=; b=qk6/Y3QscHGjAR2rkWYKSzE6xN
	6x6kbw9LTdB0mtGbAkkClK+tF754ZrPiVv9l6K9vl8HjJDSc/1cmhiZJG2f1GbctJE+glsbJXDdyh
	/M6b++7ZnAYKoDw/qKAi07SzbuXIlZG2pL1x0omZY9b8zOPXWoME3nHtAD25THySLo1APpxCDUlgG
	iJZdKoKXllCuR0JxSNUpNr+lnbu5cM7PjJt6lofSKMurMNzw9joKV8pKhGDJatNJrxQfhoeO+5SE2
	5WxZhPZDtOhYby+xHb3bjUW4gFTKkQFObYWP7DZBT/U+gxEUxAu2LpT/IGQ54gmJctvDUunCSpRLN
	k7ZoRhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fz8-0000000E1kB-0unG;
	Wed, 02 Sep 2026 08:06:18 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fz4-0000000E1g5-1xgs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=TaW7OlLvdAso7FjT/g6CTSjBBSyjti7MbS4f2Vr7Pqk=; b=W/9uXJzj1odwnp0zUC1vEjEupV
	CnCwwoaOQTJaky9lGJsDJN9YP9juIwUeKTz8W/XXTUaYwIRFRpmc0fbNzKMb7+i/Bz2vJK5iItnMM
	YTBFfTkkMBXUTwRu+WhOA2Ed5m7wdS87mj4N6mlJ3tDZd30kmapsfRtlWVFaO1+ps7ZDLz9buhJDL
	oFD5+V49glrUWrGOd+zxoiGqhIRMiPU2OUPxE4oPv9/LYAC2ztb/F6H3JcCcMpwfIGm7mETYC0fji
	ewBjIx84XrPhBC8I+uRy6qn3H16Gp925++e+6ZPuvZZ8f5RSWDiWBOoQkRS5cH1pSC4RdqV3ZCUhl
	DKO0vaqA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1fyx-000KR5-0J;
	Wed, 02 Sep 2026 10:06:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1fyw-0006It-1l;
	Wed, 02 Sep 2026 10:06:06 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 1/2] ARM: dts: imx7-tqma7: correctly specify PMIC voltage constraints
Date: Wed,  2 Sep 2026 10:05:37 +0200
Message-ID: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010614_588986_F9E95333 
X-CRM114-Status: GOOD (  12.19  )
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

regulator-(min|max)-microvolt refer to the supported voltages according
to board design, not the possible range of the regulators themselves.
Update the configuration for the TQMa7x's PMIC and also add a comment
regarding the PMIC's VCC_SD switching feature.

Fixes: a80a1af6ec8a ("ARM: dts: tq imx7 common board support")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 40 +++++++++++++----------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index e1f740edfb763..7f49c80fef4c6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -46,8 +46,8 @@ pfuze3000: pmic@8 {
 
 		regulators {
 			sw1a_reg: sw1a {
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1225000>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <6250>;
@@ -55,34 +55,33 @@ sw1a_reg: sw1a {
 
 			/* use sw1c_reg to align with pfuze100/pfuze200 */
 			sw1c_reg: sw1b {
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1475000>;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <6250>;
 			};
 
 			sw2_reg: sw2 {
-				regulator-min-microvolt = <1500000>;
-				regulator-max-microvolt = <1850000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
 
 			sw3a_reg: sw3 {
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <1650000>;
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
 
 			swbst_reg: swbst {
-				regulator-min-microvolt = <5000000>;
-				regulator-max-microvolt = <5150000>;
+				/* Not connected and left unconfigured */
 			};
 
 			snvs_reg: vsnvs {
-				regulator-min-microvolt = <1000000>;
+				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-boot-on;
 				regulator-always-on;
@@ -95,18 +94,25 @@ vref_reg: vrefddr {
 
 			vgen1_reg: vldo1 {
 				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};
 
 			vgen2_reg: vldo2 {
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1550000>;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 			};
 
 			vgen3_reg: vccsd {
-				regulator-min-microvolt = <2850000>;
+				/*
+				 * Specified values refer to 3.3V operation; voltage for 1.8V
+				 * operation is derived from this.
+				 *
+				 * The base board should usually mux GPIO1_IO08 to SD1_VSELECT for
+				 * automatic switching of SD card IO voltage.
+				 */
+				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
@@ -118,13 +124,13 @@ vgen4_reg: v33 {
 			};
 
 			vgen5_reg: vldo3 {
-				regulator-min-microvolt = <1800000>;
+				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vgen6_reg: vldo4 {
-				regulator-min-microvolt = <1800000>;
+				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


