Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EBDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTwvWEfVrhXbFFG/byJLZw/VcTNCDWpDzWi+jfZpGiU=; b=I6po+8O2lHXEovs5eC5CAbf5md
	nR6JtIwyhIXUAHh07kztvxe5jX8FhAEiEprz2Jfup5X3jWe7k9Me+o5FpIGJLlpgioATqob7yfiwY
	eNPOuY3PevpWgHaZ6m/S60mgDlQ+nj0rcI6pE+UowXo0LehHRNp21an76v0UkOKHfIFP9ns+PnPn7
	nLkzQ7c1K/FRkAXKejtBpaC1h6XaJbvfeIuJpXBQXJtiI60jpVJCzPVL3EOmeSdNx9LjSKBwR9iiN
	cBQk2hg93pWd00S++uTK5NYgzfM4XmJxetqe/lAx0EPX0Cbcb7wPTJJyHIsUTSKll5AJpXPWeUg2o
	NzEsf0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmeq-0000000D2Lc-2kB6;
	Sun, 28 Jun 2026 10:22:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmei-0000000D2Gs-0QBS;
	Sun, 28 Jun 2026 10:22:30 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 356CBF04;
	Sun, 28 Jun 2026 12:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642103;
	bh=fWHAAravRExpIqyMQjrWn1mWsbnSQl+ReE0EcwVj3rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vn0V/Il1R1+S6b+m8rOqyV7xHBTlUY1i+3GZF6UAV/710KuwNI3CO2h8ZWRRgyrPm
	 ZlGg0QtKP2B3LJ6F5fr/+miske0LTUqvAG91/13aM31qTXbGGPdYUZGDbhPnbHjew4
	 lzccc5ewvfL3Id4fSpQe3Nr/O4gHj91URhMlzO6k=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:18 +0100
Subject: [PATCH v3 3/7] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-3-4ed92968aff8@ideasonboard.com>
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
In-Reply-To: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=11453;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=fWHAAravRExpIqyMQjrWn1mWsbnSQl+ReE0EcwVj3rA=;
 b=knh/n/tooMmco62r+PwbfKcmAvE3LipBUooXvIKtvnCRlD/wx+S7d/t71xelWm1PYr6HJyQJP
 7qmQwNwHSYtBlv81x022I1btDD5LgRDwgpM23/ChIXCFKXhfaNaaDqX
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_032228_443350_B50C589F 
X-CRM114-Status: UNSURE (   9.28  )
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

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the existing examples throughout the bindings documentation for
camera sensors.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml  | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml  | 3 ++-
 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml     | 3 ++-
 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml     | 3 ++-
 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 3 ++-
 12 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 1a57f2aa1982..b7bc6ba26e6e 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -86,6 +86,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -102,7 +103,7 @@ examples:
             vddio-supply = <&reg_camera_vddio>;
             reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
             shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
-            orientation = <0>;
+            orientation = <MEDIA_ORIENTATION_FRONT>;
             rotation = <0>;
 
             port {
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
index 6f2017c75125..b9c61395b24f 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
@@ -69,6 +69,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -84,7 +85,7 @@ examples:
             avdd-supply = <&ov08d10_vdda_2v8>;
             dvdd-supply = <&ov08d10_vddd_1v2>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
index d96199031b66..fcd617848ce3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
@@ -96,6 +96,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -114,7 +115,7 @@ examples:
             powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
             reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             port {
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
index ad07204057f9..6df62fd0c0c0 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
@@ -85,6 +85,7 @@ examples:
   - |
     #include <dt-bindings/clock/px30-cru.h>
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
     #include <dt-bindings/pinctrl/rockchip.h>
 
     i2c {
@@ -108,7 +109,7 @@ examples:
             dovdd-supply = <&vcc_2v8>;
 
             rotation = <90>;
-            orientation = <0>;
+            orientation = <MEDIA_ORIENTATION_FRONT>;
 
             port {
                 ucam_out: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
index 3368b3bd8ef2..5732657e1484 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
@@ -103,6 +103,7 @@ examples:
   - |
     #include <dt-bindings/clock/px30-cru.h>
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
     #include <dt-bindings/pinctrl/rockchip.h>
 
     i2c {
@@ -126,7 +127,7 @@ examples:
             dovdd-supply = <&vcc_2v8>;
 
             rotation = <90>;
-            orientation = <0>;
+            orientation = <MEDIA_ORIENTATION_FRONT>;
 
             port {
                 ucam_out: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
index 2b6143aff391..24787c9aa155 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
@@ -72,6 +72,7 @@ unevaluatedProperties: false
 examples:
   - |
       #include <dt-bindings/gpio/gpio.h>
+      #include <dt-bindings/media/video-interface-devices.h>
 
       i2c {
           #address-cells = <1>;
@@ -87,7 +88,7 @@ examples:
               powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
               reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
               rotation = <180>;
-              orientation = <2>;
+              orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
               port {
                   endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
index 20f48d5e9b2d..56fb5f18f07b 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
@@ -69,6 +69,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -84,7 +85,7 @@ examples:
             dvdd-supply = <&camera_vddd_1v2>;
             avdd-supply = <&camera_vdda_2v7>;
 
-            orientation = <1>;
+            orientation = <MEDIA_ORIENTATION_BACK>;
             rotation = <90>;
 
             nvmem = <&eeprom>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
index 6050d7e7dcfe..b4a88eaa7ef2 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -74,6 +74,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,camcc-sdm845.h>
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -98,7 +99,7 @@ examples:
             pinctrl-0 = <&cam_front_default>;
 
             rotation = <270>;
-            orientation = <0>;
+            orientation = <MEDIA_ORIENTATION_FRONT>;
 
             port {
                 cam_front_endpoint: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index 7c11e871dca6..69a37ff68db3 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
@@ -86,6 +86,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -98,7 +99,7 @@ examples:
             clocks = <&clock_cam>;
             dvdd-supply = <&vcc1v1_cam>;
             lens-focus = <&vcm>;
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             ovdd-supply = <&vcc1v8_cam>;
             reset-gpios = <&gpio_expander 14 GPIO_ACTIVE_LOW>;
             rotation = <180>;
diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index 060ac6829b66..db9f0c15576c 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -105,6 +105,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -123,7 +124,7 @@ examples:
             reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
             st,leds = <2>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             port {
diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
index c6673b8539db..48db22ca4a7e 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
@@ -107,6 +107,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -125,7 +126,7 @@ examples:
             reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
             st,leds = <6>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             port {
diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
index bc339a7374b2..4a66cb711372 100644
--- a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
@@ -173,6 +173,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -196,7 +197,7 @@ examples:
             vddgpio-0-supply = <&vsys_v4p2>;
             vddgpio-1-supply = <&vsys_v4p2>;
 
-            orientation = <0>;
+            orientation = <MEDIA_ORIENTATION_FRONT>;
             rotation = <0>;
 
             sensors {

-- 
2.52.0


