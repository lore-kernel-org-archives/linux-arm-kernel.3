Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DCEC71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRpP7JH3lK5YkVcnlGLVVYD2mSbnYbSRg4lGXhpPa9g=; b=BT/ZyFI1fWpvNPUmRKCxLapxu0
	TIeJjM69KNm6xbIjn4JJPL+VOIxkOBCW/Or38TQNP8Rv8NyqsHI0nWL13kC5FENj1LfVJKTaoR0mM
	ZLgZzk9l9PTTIAHSaoOO0WBrMRnYPSg7gvW9L2fvzcdK4MHwD9Jdp4zbNzsqgTdWExYpbY4mBJVAb
	kyo1z+HyC6+sDLRqnoXwNjJs5gcpOKJ7nVpmSlVs5gCjimY/5DLtMv5uv9dS/xlQ4Ed3JSSqWK57b
	cWAwCyyL5G2sRPoLmFqoHjWhzfy1fTwd94jI1SHQYpHwzDFkwiqH/WattDWAYDWbz7LUymHuZwooe
	91QeAyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSut9-0000000HKXQ-156Y;
	Sat, 21 Jun 2025 09:51:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSuft-0000000HJAF-2lEb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 09:38:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 606904A577;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDB39C4AF10;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=KB4LuF0toI0neAdNh4EV8pcyXYzpvMqRrmP459bqGxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MpwQXp+223uVnK4MgKIngLW6p26Bc9PUNHo6rrjt2ekTvyvy/1UcaKUBlRwNYTrKX
	 9UxQ/W2InFVej3doKAmo/VZrRbkgYRsDYTRU/CwuwP6Xc5phUkBHmBftF9kQaZZOVf
	 mlBo3XemROaNplsE7cJyEthdXMN3EN7DPCaSl1CBFptRMo/Of0ZCUKLSffX1Gu+qpa
	 2hZ7K/5piBjGMIO2V1N/WOVGi+A+Q0TTN08JFqNf+59AJ2eQgUGlqdK7oGvvj+97cA
	 VIAP+x51vKgZIMP5vL1vOwM0Oe85unCkhH/Sn4/E5WqBHS1STKVLeiLJpJhdfN+OnX
	 i5cpwmtFWZkoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3B7C7EE2A;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:28 +0200
Subject: [PATCH RESEND v4 4/5] media: dt-bindings: sony,imx214: Deprecate
 property clock-frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-4-12178e5eb989@apitzsch.eu>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=2872;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=HJC1tGsh7JZtHUNjSz48zBwAelpJhWLL5Nb7XTVVqiA=;
 b=J8EU4IdcAG4onT31yDSEoiIXjkPqA/PycZhIzygaVz8zBToAOpEObbBtR55aLJsCDiWBTo3Ya
 gXxa0ZtqaxqBDHhQJLYbBiOeXEEKh/8oaC5GectTIJXM9uCDnhMAEuX
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_023813_772669_92BB0F0F 
X-CRM114-Status: UNSURE (   8.02  )
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
2.50.0



