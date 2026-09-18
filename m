Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D21C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdUiFm+GCpbKCTMvMwqKzb58UX4O9xUj2dhYUfKXvFg=; b=4DYsLdcnVvOGwKgTbkI3ghLELO
	DVBoGrwdKyvkTK+PgpHBDCVNbaFE/FDlzeBbbV4AqPvqk/D0VqpZDG3p7d3d/+IPpwfZj4gy0RVp3
	Ua4vWewLUnIn15ePc/QAQ5OloO7/DdFR7LkNlrifoM/yeD+D02Wuog2k9HFjMfumqDVTY7OUbgnkb
	OCWNKxH8soft0R5C7S/rXbu+aIqwfNgRsjrcbE92O4lUAu4KGC4VYFBZ/ojzZYUsbBwSfr1yZC+5F
	aerl2FCv5RTgJsBMivhx3wlHODsQuv0Gdvc1lJHE0ki6IEXTDsyy/4WvxvKynG/HfCSvCZalgNQaR
	b+UXeZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W59-0000000E7uE-0ft3;
	Fri, 18 Sep 2026 10:44:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4x-0000000E7j0-0Yux;
	Fri, 18 Sep 2026 10:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OdUiFm+GCpbKCTMvMwqKzb58UX4O9xUj2dhYUfKXvFg=; b=a0jRUTQD4SFSstnXoMPLpTCSLT
	NxVICMxnHV+gEUPGDARflSNzRcPBJLqw4vjy5CQtvR0eYGkCdTMd+8WK8fC5+LPLbg+cevyf3yI65
	sL4I4YzsLpPwGht+YJ/7PqtmspBov1hT9VQ/iUIJs5c0EofcJkTWg7bVXt8UTMJIXtbdg2A9n1L+v
	CZPQooZExIN0hWxnNUd15TNzc2MKv1MJwhyb7dSFuC0gIuiodP7+BLjRS4vh3yPWWFIpW+E+TMP8E
	lmtZVL6H/DKhZ0ndbmMj91A66dvB8ObMIU7plPGMu80H2GY8hYkFoVNViBAj5qPpLiXwa1n3DjFwp
	Bcva9ilg==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7W4u-00000009woq-1bV9;
	Fri, 18 Sep 2026 10:44:25 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AABE24D85;
	Fri, 18 Sep 2026 12:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728161;
	bh=JsLs0rmqu7T5B6WRc65pS0x+tFeJdvC8zGgVnTQ5qvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uiHWxvRCYZqUmXlw5ZcJaFHaDf+hUya6JYR+c06jy5Fh1Xqtuf3p43iRhT5ujErQy
	 U1NPURrwKte37Pjo0GZgqDyYPXZmHS1ItsbetoLbgAREtA5nZC33m5VvGEF3nNwFYe
	 kSY2Y2k4O6tTfbzWnQ0zyEEvsPiMTrySAjVzbX34=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:44:15 +0100
Subject: [PATCH v6 3/6] arm64: dts: renesas: Convert to new media
 orientation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v6-3-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=3939;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=XDi4hx7NWPxhoMOeoVSwhxG05epRot/I7J5vXUg/6Pw=;
 b=cP3OvuunAXZXZZfg0wJUFIYb1FzwqcCQTd7//iNNRYu55LdhSpCto9Ui0SciwH/jT/pR1Gq8g
 F4kXEDxqErMDMp0hqYA4pS5JWVJgb+1zOLahMHh0Ot8Tc/SaFuzcfWr
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_114424_533636_372591A0 
X-CRM114-Status: GOOD (  10.72  )
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the renesas device trees to use the new
definitions.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 3 ++-
 .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 3 ++-
 .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 3 ++-
 .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
index 3acaf714cf24..b816382bba0a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 &{/} {
 	clk_cam_j1: clk-cam-j1 {
@@ -44,7 +45,7 @@ cam@10 {
 		VDIG-supply = <&reg_cam_j1>;
 		VDDL-supply = <&reg_cam_j1>;
 
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
index a19bc0840392..4019b80a88b7 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 &{/} {
 	clk_cam_j1: clk-cam-j1 {
@@ -46,7 +47,7 @@ cam@1a {
 		vdda-supply = <&reg_cam_j1>;
 		vddd-supply = <&reg_cam_j1>;
 
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
index 512810b861aa..fea1ef4a1178 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 &{/} {
 	clk_cam_j2: clk-cam-j2 {
@@ -44,7 +45,7 @@ cam@10 {
 		VDIG-supply = <&reg_cam_j2>;
 		VDDL-supply = <&reg_cam_j2>;
 
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
index a31524b59834..177201a8a6d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 &{/} {
 	clk_cam_j2: clk-cam-j2 {
@@ -46,7 +47,7 @@ cam@1a {
 		vdda-supply = <&reg_cam_j2>;
 		vddd-supply = <&reg_cam_j2>;
 
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {

-- 
2.52.0


