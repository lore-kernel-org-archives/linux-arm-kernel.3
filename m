Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC659C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1FStIQ/qO5e4PanJchtaAj91Afc8QTH/+qqvNzl6qEk=; b=snlTL9HWFKT07h
	vLv1pJ/plu7t5rOmwlLEZe4mioJLVzMSooVoO0U6/rWDLEU2HTKC0+q6pxjMDGB93T+75LnW+4iAc
	kKVZnFS+X7KBa9mMZ5eI4a0fiCgV+V5tb6KChY0RX/JebKterzPwdviqtjB33nt3KHEA4pudgLrW0
	Kcq5Bejmw+uXvW99EIRqRP66GmiJ/2USfZJiDbbNRfr/4P6fehl5WmIE9CiMErsGAmBbXm2xyuGK+
	DtD4oruyL8vd59vc/akGpD8yIv60uz6nSK2GpHAE82t2Jf2wXgL2iDLxeYUW/7dAjJNlwSmnm6cnr
	IrwAn/nEpogMIg6zKEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmel-0000000D2Ik-3ncw;
	Sun, 28 Jun 2026 10:22:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmei-0000000D2Go-0JXK;
	Sun, 28 Jun 2026 10:22:29 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 394B134;
	Sun, 28 Jun 2026 12:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642098;
	bh=pSsloNoctZ8KZdtQMoBMTiphM6yVThkqQuPMFzEH2PI=;
	h=From:Subject:Date:To:Cc:From;
	b=p+0kMGCBDHSdrMRCTYhGwKrbD/lVOCLOVqbLnE/Z8+r4xy36LIXysHfmItF+k60Nu
	 grjX8hLayTsJT7xg1Tm+ykqzPWkvNDNSUz6SvkXezHR2t1L1Bl18OxNsCDb0DySnis
	 0aXBROKTASUubfqalaG1RQhwnEvUtpRe8sgYywvI=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 0/7] dt-bindings: Orientation defines
Date: Sun, 28 Jun 2026 11:22:15 +0100
Message-Id: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANf1QGoC/22NQQ6CMBBFr0JmbU0dsQVX3sOwaMsAE0Nr2oZoC
 He3Epcu30/e+yskikwJrtUKkRZOHHyB86ECNxk/kuC+MKBEJZVsxMOyHyczi1A8n00ugkBpBic
 Hq9qLhqI+Iw382rP3rvDEKYf43l8W/K6/IKr/wQWFFLU+6cZSi9rWN+7JpOBtMLE/ujBDt23bB
 4DwALO/AAAA
X-Change-ID: 20260608-kbingham-orientation-20afc0fb6957
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=3899;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=pSsloNoctZ8KZdtQMoBMTiphM6yVThkqQuPMFzEH2PI=;
 b=0aU7sZbphb8cHLIWND7oWOf664qmdxaVArY7DgYx+/th2NpgB+11g+VRfyLA43pZiNPFZd0I0
 xjGy3mD/gx+AtmBrOqJFLbLyrMn835bR+0ScSwTXbvUDKlwj/UYe6H6
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_032228_330435_6AEB9333 
X-CRM114-Status: GOOD (  10.97  )
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

Add a new dt-bindings/media/video-interface-devices.h header that
initially supports the Orientation types and convert existing users
throughout the code base.

v3 collects tags, and fixes the typo, but drops all hunks that do not
apply on the media-next tree so that these changes can be merged. Once
the core feature is accepted a second sweep will convert remaining (new)
additions of the orientation field.

v2:
 - Now expands from the original v1 "dt-bindings: media: Add macros for
   video interface devices" to update
   Documentation/devicetree/bindings/media/video-interface-devices.yaml
   and extend to actually change all users to the new types.
 - Link to v2: https://lore.kernel.org/r/20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com

v3:
 - Fix the arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi 
   MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
   - Though this patch is dropped from this series to post the main
     integration through the media tree.
 - Drop (temporarily) changes to:
    - arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
    - arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
    - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
    - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
 - Non applying changes will be re-posted after the core feature
   lands in linux-next, or after those changes appear in media-next.

---
Kieran Bingham (7):
      dt-bindings: media: Add macros for video interface devices
      media: dt-bindings: video-interface-devices: add video-interface-devices.h references
      dt-bindings: media: i2c: Utilise video-interface-devices enums
      arm64: dts: freescale: Convert to new media orientation definitions
      arm64: dts: qcom: Convert to new media orientation definitions
      arm64: dts: renesas: Convert to new media orientation definitions
      arm64: dts: rockchip: Convert to new media orientation definitions

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov08d10.yaml     |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov64a40.yaml     |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx111.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx355.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml        |  3 ++-
 .../devicetree/bindings/media/i2c/st,vd56g3.yaml        |  3 ++-
 .../devicetree/bindings/media/i2c/thine,thp7312.yaml    |  3 ++-
 .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso          |  3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       |  3 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts      |  3 ++-
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso |  3 ++-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi           |  3 ++-
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso   |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts   |  5 +++--
 include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++++
 25 files changed, 71 insertions(+), 30 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260608-kbingham-orientation-20afc0fb6957

Best regards,
-- 
--
Kieran


