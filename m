Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04694C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bwn1as3lp4Dax1P4Pcou6BkVSDkL3qGXWHplzwNJ4qE=; b=fPVaNLM4WQAs++G1zUhuf4sm59
	iKgbuQRE2n9Ho+TVlrXwFHlxoivQFmfFAAsKSLanuDb0THl0HuKKGzM1wXn0H8+gjXYQ8K8iVwg55
	FUC60kj4FqH8IQLyE8ye3LEI8IDnWeQZ+CHYaCBhtUOPxsphZCB1oxxx+RDmtG3O3Xa+CWFajRy53
	ptbdfb+RlUakqWon/rw3zZzZJKiJWgY/2k8YtEf4v81aEIFtHtKi+qcoQG4zN839Bo0z/3dRL3Gpg
	cC8YR3nEW3Vi6VT8jl0FavoGs94GHy7GU2x9K9qltDFM/2PQHXr0Nzy0V0v06h0fG2bpPuU6qFBKY
	n7Y/Yuhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3G-00000002h1F-1DZe;
	Tue, 04 Aug 2026 19:43:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3C-00000002gzY-4B0C;
	Tue, 04 Aug 2026 19:43:49 +0000
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36F9623B9;
	Tue,  4 Aug 2026 21:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872554;
	bh=v0dduH6JQ1W9zPHEBtvR8Ekznfgkp2oWmwk5ncveW/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vLDomOJ/oYpbUILzSyY5dJlXZCePqT8A7J3XRs/uQeVQYExjbWKAy1Mn7rStCzx7/
	 BufSl3G6+SSXS5nUjoQMFNFcCv7yrjN6tl7kH9NLBatrxHZZ239GV2Tk0nYgPaOwjK
	 KpQettboqpvX+yFCEBqL+gXZWovJErbu9FoQTINY=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:29 +0100
Subject: [PATCH v4 2/7] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-2-336998dd63b4@ideasonboard.com>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
In-Reply-To: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
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
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 David Heidelberg <david@ixit.cz>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=12236;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=v0dduH6JQ1W9zPHEBtvR8Ekznfgkp2oWmwk5ncveW/Y=;
 b=uD23fqRFFGn2rmcibqmfy5mN+qvJKW4l2/gjNxzcNQrHwxXgP4npo0/i4QskUQqrkRgEuNbMG
 qeM7fhtgOz2BeqkY8xMcNiORRHZfCY+6/DApaTs1Ip8510SdWuRxrgP
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_124347_339582_1B69E0EE 
X-CRM114-Status: UNSURE (   9.88  )
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
Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
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
index 1a57f2aa198228dff784aad25c2c0e39b6c32a9a..b7bc6ba26e6ea37e75b17d02b73d68e7b6772d2d 100644
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
index 6f2017c7512566d47fc04fbd4c672cb9633ca990..b9c61395b24faf8d4938d4bcd218fc27e385c386 100644
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
index d96199031b66c5c162a034824f195e277f2a1795..fcd617848ce316f40d084f55686c636c6a0e7c51 100644
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
index ad07204057f979ade534d29c99c3aff7372bd332..6df62fd0c0c0dd84928261f375b3d45cd7323b04 100644
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
index 3368b3bd8ef2f0b648b239a8ec7d948d4d795bd6..5732657e1484eae4e0ae33e2df976db150c87ad0 100644
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
index 2b6143aff39139c6cb1f6dc514cddd6dd5d3a0cf..24787c9aa1557bdabe7ce86df3346e80d3dd7221 100644
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
index 20f48d5e9b2d8cc32712f697629ded2452c83e62..56fb5f18f07bf7af04bcec32f68721c7b04b35a2 100644
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
index d9cdfda699bfeea68767b5ed36be7a0280348ec8..6699c238ee0e6c54c01b5fe0401478b5c620f418 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -81,6 +81,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,camcc-sdm845.h>
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -105,7 +106,7 @@ examples:
             pinctrl-0 = <&cam_front_default>;
 
             rotation = <270>;
-            orientation = <0>;
+            orientation = <MEDIA_ORIENTATION_FRONT>;
 
             port {
                 cam_front_endpoint: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index 7c11e871dca67b2c1d1bcc40344f684fb47a3d06..69a37ff68db3be6b30642b149bcbf7a47629b0b5 100644
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
index 58b1f9e85a9d1c137b770b0795c88ccc56c62a0a..dfd87beba065c587a4ff1ab249badd10e459f0e5 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -106,6 +106,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -124,7 +125,7 @@ examples:
             reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
             st,leds = <2>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             port {
diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
index c6673b8539dbcf16d035025e676f7f7250a5643a..48db22ca4a7e641198bf3ed7f5a991322dd90e75 100644
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
index bc339a7374b224b9340d2dd3392f9a373f594876..4a66cb71137209298bfd088c51e2ceac3c9d3133 100644
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
2.53.0


