Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny3PyiATFyMvaMcYMkXzs+xmpv/toVDHOfOSlXhaYLU=; b=oOK9S3a/ZPvHHPOO6WPc/PWbZk
	1lLyFrXICM4UGz2lU/t0WAHPRDb42F0GPdzOjkIaJdsASIdM7NBZqHK9wi+vl6Fvn55MTBoV7YMzA
	tE7BAxuJUCAEmvSkc5u6UadFtF3Gh+3kjzEwV9ooHrTfjki755MjiL0Aydcgj4zqAJxrZXRUrxrmw
	AQg+f4ai2/TBToYKpxD/Vre7fr3SzaTF6WOtV3ehkpfNcDxc/5Fnobh+Tnjpi4bWHlt2y7ppolrtG
	LVw14ElSfZijy3lWuO4qmq1w9xSkxgy4YP8+TVn7TGXVHHSAhzwjmIktvtUMxJ9P8x5f+MBghcv3d
	YaRdh6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmfA-0000000D2ar-1Qwc;
	Sun, 28 Jun 2026 10:22:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmel-0000000D2IB-2Myq;
	Sun, 28 Jun 2026 10:22:32 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A16512B1;
	Sun, 28 Jun 2026 12:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642106;
	bh=SH2PxzetFIfTMtnm8/DDqnBF2ZYswH4fzWv2yn9eIi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f5OLp6CX+4acILhohgtAWHsWPGYFnQJwrMvB0iQpFvUjgF6BWS7cvFROUFpTNfDfL
	 /wBV60J0zmdAF12xMgtk+iVTY4rDiXKkF9MvHE/m/PekqfthUROVKWoCchKu0t+kfb
	 uWhbEO+xZxjZp1fwwbrSWxsx7HCmAcEB0t9mr/oA=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:20 +0100
Subject: [PATCH v3 5/7] arm64: dts: qcom: Convert to new media orientation
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-5-4ed92968aff8@ideasonboard.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=2592;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=SH2PxzetFIfTMtnm8/DDqnBF2ZYswH4fzWv2yn9eIi4=;
 b=81bTzDldki2Ss5I7IxcrErzjZBDaTUB86sDD0DSBy6+MSGXbNQ6493zYlXD3jUxGz4o3V+BkC
 Pr7Ugkswxg/D2A2r9VWB/N323/PalNosWgzTG/kEXp668XzooUAvKKG
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_032231_763076_8F099793 
X-CRM114-Status: GOOD (  12.00  )
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

Update the users throughout the qualcomm device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v3:
 - remove arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi until base
   dependencies land.

When the core definitions land in linux-next, I'll re-send the changes
dropped from this patch.
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..d79be22108c8 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -701,7 +702,7 @@ camera@10 {
 		pinctrl-0 = <&cam_mclk3_default>;
 		pinctrl-names = "default";
 
-		orientation = <0>; /* Front facing */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		rotation = <270>;
 
 		port {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..e49bd48f3fe6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -682,7 +683,7 @@ camera@10 {
 
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
-		orientation = <0>;	/* Front facing */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		avdd-supply = <&vreg_l6q>;
 		dvdd-supply = <&vreg_l2q>;

-- 
2.52.0


