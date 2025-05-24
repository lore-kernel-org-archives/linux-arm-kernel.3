Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A134C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42+ncrXhKG5usJxV8nAQfyGRmyXDH6RqubD2+llybfQ=; b=jxH8hZ1R2XZTJGLx35U8v2Wr6s
	P6/F0WiXZjFp3jKiYx3XUSxfiFilX7WFqhB/iUi0CyZDKae2XSsgWEyFiInzyzo3iKsJxpbpfqYEx
	PtHC/IFCC14sg/pxN/+sE0bxXIsc/Cy4Tl1cCuQ2LVi7w2HHKZzvDEwGuhD+RE7sep3yl8Kl9R+RE
	x0x0ZLVdmCtzLPlNRQ97W/SeniaPimrUHLUNQH57krNZD/FMQJCWL2k/8uI51OYjyJTbeBX5fvr7r
	qsYV9A7eWyYoiR4uZISZn3d16fIILZ9VoA381/VxTnI3LrtNZrhSvfkr06Xb2AQk8WT8QatR8sajh
	xFsZPkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIl4J-00000005fNx-2Aip;
	Sat, 24 May 2025 09:21:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIkxo-00000005eTC-2ZD9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 09:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E7854ABDF;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10422C4CEF8;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078083;
	bh=zjBvC5CJ3JyRl8kS1POe18jEYgJfRwvLs62DrdIw4XE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P2Z8KIQ9KDmZXURWKKZCk0+UXkopEJmlqto7szTYGQWrOEEXXyGHVR6w8QRV6LtxB
	 HK1XEAQxKpOHJDjz7GAljooKEhrge2p0GAf6qQr3K5pZbmBwjaT02PWM/x01VIquS0
	 r/6SGBEyYi//jwAcXTJ3XRKzn4VB1xXOIANt85IF8QjuoRypQ4qEMxNsB60ECw5Xam
	 GdulpMUOTFPmm6eX/geKq+viWjVIFUOkkrivXDcJuSjfHl790YtQXAaWQlh7z67/K+
	 DzR834Ra8JWAlx0dUUNTF8tUuzJgBwdA/a1wcHdRNYc3AfaDK/kb8QzNTNi7P1UT7H
	 pudCnyySsoxjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B23C54E71;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 24 May 2025 11:14:39 +0200
Subject: [PATCH v4 4/5] media: dt-bindings: sony,imx214: Deprecate property
 clock-frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-imx214_ccs_pll-v4-4-f7dc22e5255b@apitzsch.eu>
References: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
In-Reply-To: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=2872;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=F6yHkm4LhqrCYdpvUOaQ0i1w2snFtRkG+SUP7b8g7gU=;
 b=HcxRiRRhTnhm1uDcdNQDfHoVvTpOaHPGC4RbVyLUEEh+4L4qwEGPqPVPGRwWUOpVAlcJ4TGTQ
 TDtKEnmaMNXBr3DgzgWb2/S1WHZJYJjCdLmChr/6TOL1xDQ6VppUzth
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_021444_703591_EF9DE946 
X-CRM114-Status: UNSURE (   7.97  )
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
Reply-To: git@apitzsch.eu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: André Apitzsch <git@apitzsch.eu>

Deprecate the clock-frequency property in favor of assigned-clock-rates.

While at it, re-order properties according to coding style and fix the
link-frequency in the example.  See commit acc294519f17 ("media: i2c:
imx214: Fix link frequency validation").

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../devicetree/bindings/media/i2c/sony,imx214.yaml | 29 ++++++++++++----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 0162eec8ca993a7614d29908f89fa9fe6d4b545d..aea99ebf8e9ed15f8066841228d9fdecc822b553 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -33,20 +33,21 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   enable-gpios:
     description: GPIO descriptor for the enable pin.
     maxItems: 1
 
-  vdddo-supply:
-    description: Chip digital IO regulator (1.8V).
-
   vdda-supply:
     description: Chip analog regulator (2.7V).
 
   vddd-supply:
     description: Chip digital core regulator (1.12V).
 
+  vdddo-supply:
+    description: Chip digital IO regulator (1.8V).
+
   flash-leds: true
   lens-focus: true
 
@@ -84,11 +85,10 @@ required:
   - compatible
   - reg
   - clocks
-  - clock-frequency
   - enable-gpios
-  - vdddo-supply
   - vdda-supply
   - vddd-supply
+  - vdddo-supply
   - port
 
 unevaluatedProperties: false
@@ -104,22 +104,25 @@ examples:
         camera-sensor@1a {
             compatible = "sony,imx214";
             reg = <0x1a>;
-            vdddo-supply = <&pm8994_lvs1>;
-            vddd-supply = <&camera_vddd_1v12>;
+
+            clocks = <&camera_clk>;
+            assigned-clocks = <&camera_clk>;
+            assigned-clock-rates = <24000000>;
+
+            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+
             vdda-supply = <&pm8994_l17>;
+            vddd-supply = <&camera_vddd_1v12>;
+            vdddo-supply = <&pm8994_lvs1>;
+
             lens-focus = <&ad5820>;
-            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
-            clocks = <&camera_clk>;
-            clock-frequency = <24000000>;
 
             port {
                 imx214_ep: endpoint {
                     data-lanes = <1 2 3 4>;
-                    link-frequencies = /bits/ 64 <480000000>;
+                    link-frequencies = /bits/ 64 <600000000>;
                     remote-endpoint = <&csiphy0_ep>;
                 };
             };
         };
     };
-
-...

-- 
2.49.0



