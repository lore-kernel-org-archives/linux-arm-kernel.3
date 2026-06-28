Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A58DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+B9JtCF3b44zgjoA/JNPmFdhSwRZyWq0QrNOzAwIrM=; b=FeyjELdA+o+1Bwb0Ku9r40Jzgf
	aCpOAImnCbR6B4zRGw4G0zxDyTOGqD2JMC/sfRAK/Kcndso5dQef3Bi9Ap5e6ZnCEcJ3hqWGZIRV+
	B4Zk4bEA6CTgaTIezTHtBpByTxoANb3dHSiVDSTezfrFZZAbtmkx8WgVO1tZa4Nal0NCXM3n40WNo
	g74QChf1cFHeMr2qHOCdssVC8iDowfWuPsZLklaU4LgOGsPSVebnaqLPpvq+1Y2Vk6AWR7zL51uIS
	jQpe+TsCwkRgMEz1nGHQMQ2PuTaGcYiJzThHtApbJApy7JblF65vZU9tjvXrZp/uUYLw3/zer53kL
	JA06VUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmf4-0000000D2VT-38IZ;
	Sun, 28 Jun 2026 10:22:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmej-0000000D2Gt-0wbH;
	Sun, 28 Jun 2026 10:22:31 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D171511B1;
	Sun, 28 Jun 2026 12:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642105;
	bh=rmzb6I1PLT+HJTKEe3lAchQ7zbZi6y0kruV/O8I80IE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MO+T6xu6FYRwraX1sJ9vj3nW4nrD9jvYIOYg68Je+p6p7+eqox6KtOGOc1T7vxLNt
	 tZIB2nJ1PT7jkcEAEB7H6f2SS7tFZS/k2/KEuylLqkfCK6KqlKpqQb8sUIn0bxR/iP
	 0OXGQF781wVdd57LaeqrgLeZMOGDy5DD940OHWQU=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:19 +0100
Subject: [PATCH v3 4/7] arm64: dts: freescale: Convert to new media
 orientation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-4-4ed92968aff8@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=2201;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=rmzb6I1PLT+HJTKEe3lAchQ7zbZi6y0kruV/O8I80IE=;
 b=XjNVGknrXW2vfoItYB5KuyS4E28BsWVeedPneiRcjuFp2incu9WBP2edqJ8Xl+vfKW8/XI/es
 DTBmC7vs2PsDbUozefpJOsez+NjERqyV7kNhaA4qfnZ1uFuNnfveKVM
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_032229_416043_34E15552 
X-CRM114-Status: GOOD (  11.01  )
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

Update the users throughout the freescale/NXP device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
index e5a2b3780215..7b44ae0f19b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 #include "imx8mp-pinfunc.h"
 
@@ -47,7 +48,7 @@ camera@10 {
 		VANA-supply = <&reg_cam>;
 		VDIG-supply = <&reg_cam>;
 		VDDL-supply = <&reg_cam>;
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..178cfad93483 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -8,6 +8,7 @@
 #include "dt-bindings/input/input.h"
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "dt-bindings/pwm/pwm.h"
 #include "dt-bindings/usb/pd.h"
 #include "imx8mq.dtsi"
@@ -1116,7 +1117,7 @@ camera_front: camera@20 {
 		vddd-supply = <&reg_vcam_1v2>;
 		vddio-supply = <&reg_csi_1v8>;
 		rotation = <90>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		port {
 			camera1_ep: endpoint {

-- 
2.52.0


