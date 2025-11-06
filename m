Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A6ACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps9vapSiAzSq7ACg34jfzO+hmVnf1lnwCkq+2yxADxI=; b=dtMseLZcrLZwjuSZqzX5+AwLZ4
	XftUx6W+Nh+ve8rBpVCb3ElOgyxKwAV8EvCqYCYGIzR9B3Vzo8uyreemtp5cUHAXYxN03tYM7h2Bu
	9Nac04frH+c8mrYj8NM1+lyxrUIczOH3wYlQEmJdWa94rNSdHrZjo8HBTVQryDgGaTBn7hrBL1enF
	XkWpcVlLv8nAoynfBM+/Ka+p2aBT1GuRdEANEbVGZVAmtIJW9ec2WU+QNER+AVENI8YQOGmHygDjR
	RNhuUFbQ+8N9MSX9bof5v89lOIeQr0zMVnv+l16b2wyJ7cVolekEb72Rl4pIYldlo7hkg3/VMewYZ
	nkpx3Dww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvlT-0000000F5YP-3FdD;
	Thu, 06 Nov 2025 08:54:43 +0000
Received: from uho.ysoft.cz ([81.19.3.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvlQ-0000000F5Xf-02x3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1762419278;
	bh=ps9vapSiAzSq7ACg34jfzO+hmVnf1lnwCkq+2yxADxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RCCrVAXsfNWWNFeUTsJakZslb2RIyjlHueShOvolNDa1nC9IMyK4QQEj4a9M8JifO
	 tAT74X+npT5u1WlYz/CqthNGAVkYYvBlm7i2zbuyrQURGfWNwJ6wHYi1DZktN6zGs/
	 nN0lfgeFbXMV/MdnPWbVNDphXaBjydKscAfNkxw4=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 11537A0534;
	Thu,  6 Nov 2025 09:54:38 +0100 (CET)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2 2/2] ARM: dts: imx6dl-yapp4: Model the RGB LED as a single multi-led part
Date: Thu,  6 Nov 2025 09:54:29 +0100
Message-ID: <20251106085429.2067699-2-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106085429.2067699-1-michal.vokac@ysoft.com>
References: <20251106085429.2067699-1-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_005440_676464_1E117C08 
X-CRM114-Status: UNSURE (   9.59  )
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

Describe the RGB LED indicator according to the reality - it is a single
part containing all the three R,G and B LEDs in one package.
With this description the chan-name property becomes useless, remove it.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
changes in v2: Removed reference to internal issue tracker from commit message.

 .../boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi | 44 ++++++++++---------
 .../dts/nxp/imx/imx6dl-yapp43-common.dtsi     | 44 ++++++++++---------
 2 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index 8bc6376d0dc1..4a5736526927 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -279,28 +279,32 @@ leds: led-controller@30 {
 		#size-cells = <0>;
 		status = "disabled";
 
-		led@0 {
-			chan-name = "R";
-			led-cur = /bits/ 8 <0x20>;
-			max-cur = /bits/ 8 <0x60>;
-			reg = <0>;
-			color = <LED_COLOR_ID_RED>;
-		};
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+
+			led@0 {
+				led-cur = /bits/ 8 <0x20>;
+				max-cur = /bits/ 8 <0x60>;
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
 
-		led@1 {
-			chan-name = "G";
-			led-cur = /bits/ 8 <0x20>;
-			max-cur = /bits/ 8 <0x60>;
-			reg = <1>;
-			color = <LED_COLOR_ID_GREEN>;
-		};
+			led@1 {
+				led-cur = /bits/ 8 <0x20>;
+				max-cur = /bits/ 8 <0x60>;
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
 
-		led@2 {
-			chan-name = "B";
-			led-cur = /bits/ 8 <0x20>;
-			max-cur = /bits/ 8 <0x60>;
-			reg = <2>;
-			color = <LED_COLOR_ID_BLUE>;
+			led@2 {
+				led-cur = /bits/ 8 <0x20>;
+				max-cur = /bits/ 8 <0x60>;
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
index 6f9bd163ffbe..6e49e1ccf6fc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
@@ -278,28 +278,32 @@ leds: led-controller@30 {
 		#size-cells = <0>;
 		status = "disabled";
 
-		led@0 {
-			chan-name = "R";
-			led-cur = /bits/ 8 <0x6e>;
-			max-cur = /bits/ 8 <0xc8>;
-			reg = <0>;
-			color = <LED_COLOR_ID_RED>;
-		};
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+
+			led@0 {
+				led-cur = /bits/ 8 <0x6e>;
+				max-cur = /bits/ 8 <0xc8>;
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
 
-		led@1 {
-			chan-name = "G";
-			led-cur = /bits/ 8 <0xbe>;
-			max-cur = /bits/ 8 <0xc8>;
-			reg = <1>;
-			color = <LED_COLOR_ID_GREEN>;
-		};
+			led@1 {
+				led-cur = /bits/ 8 <0xbe>;
+				max-cur = /bits/ 8 <0xc8>;
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
 
-		led@2 {
-			chan-name = "B";
-			led-cur = /bits/ 8 <0xbe>;
-			max-cur = /bits/ 8 <0xc8>;
-			reg = <2>;
-			color = <LED_COLOR_ID_BLUE>;
+			led@2 {
+				led-cur = /bits/ 8 <0xbe>;
+				max-cur = /bits/ 8 <0xc8>;
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
 		};
 	};
 
-- 
2.43.0


