Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F2CDE011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yz6mNir3NTN21VV+4ab12DZHLHU9MruIpzjaugWEwP0=; b=t1pKCF5tCY/JwY
	FbJCHXQ1rzqhwcRBc7sSxA/+ILuB1qdqyWKeB/FDdtV4xudc7w6NYbxP9gz/9YXTPZ7O+X5IJDkfA
	J427FVCKlmSLX8jrzqaLl4bI2xYEaGjw8ygEU6HgznJPvK+sBn4gQ/uZwfp4yrJ+wSHe9Rsn5RnEV
	sPWkq0k/c8MrM2ylb8M2dx2gDS0zWKAwtB+UsTTpvuOhJNxEYem3b6QH+NVykHLeWihR1rTGoKmsI
	su0hIeTzTjkU4Lnj5NwhpZ6vtOXJjaXks9a/RZa2mPvE9795ohBgQmTrPnOJiGWGMfZ9UvJMPzZ43
	ajC0ovfJPNP5gv5fs83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Ls-0000000BHMH-1UYM;
	Fri, 26 Jun 2026 12:08:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Lp-0000000BHKi-0kkV;
	Fri, 26 Jun 2026 12:08:06 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7A0DE2C;
	Fri, 26 Jun 2026 14:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782475640;
	bh=TY+1ymCIy0OL3hNWFQ2bJgQFUJArnwOKKwXeXghWFkg=;
	h=From:Subject:Date:To:Cc:From;
	b=ohNctst3EMLEWPJDcYOvDTpN4WWOwqlp+76uVbE2bm6A2xgsAbqwF4EwjrQxlrh2j
	 zwpFt5ZFrIrYTC+nfkp17JfIE8+lGCsS2mQVms/Y7xsQ4BP8HXTNfHgt1tlhpdPK1R
	 y5NMU0risbye5JFHZvUxPX1gt2hobdBrz8YNi3Dw=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/8] dt-bindings: Orientation defines
Date: Fri, 26 Jun 2026 13:07:52 +0100
Message-Id: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhrPmoC/x3MTQqAIBBA4avErBMGIfu5SrQwG3OILDQikO7e0
 PItvlcgU2LKMFQFEt2c+YgSuq7ABRtXUrxIg0Zt0GCntpnjGuyuDnHxspcApdF6h342fdOC0DO
 R5+ffjtP7fhp1xghmAAAA
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475679; l=3406;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=TY+1ymCIy0OL3hNWFQ2bJgQFUJArnwOKKwXeXghWFkg=;
 b=GChpd7SRw8H3NOWttl2n42YKdV+fRjG4b2xqrTjq2JpcgAvXgegIEh82R4+H3z+BsVxd9R7+2
 665tA5KbM5ICMI7mhUpFIwKceo94j6XQjGzudqSHRdNXXmXWGeJ8HFS
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_050805_400800_D5FCEF21 
X-CRM114-Status: UNSURE (   7.00  )
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

Add a new dt-bindings/media/video-interface-devices.h header that
initially supports the Orientation types and convert existing users
throughout the code base.

v2:
 - Now expands from the original v1 "dt-bindings: media: Add macros for
   video interface devices" to update
   Documentation/devicetree/bindings/media/video-interface-devices.yaml
   and extend to actually change all users to the new types.

---
Kieran Bingham (8):
      dt-bindings: media: Add macros for video interface devices
      media: dt-bindings: video-interface-devices: add video-interface-devices.h references
      dt-bindings: media: i2c: Utilise video-interface-devices enums
      ARM: tegra: Convert to new media orientation definitions
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
 .../dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi  |  3 ++-
 .../dts/nvidia/tegra30-asus-transformer-common.dtsi     |  3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts            |  4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi             |  3 ++-
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso          |  3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       |  3 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts      |  3 ++-
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi      |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso |  3 ++-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi           |  3 ++-
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso   |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts   |  5 +++--
 .../rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso  |  3 ++-
 .../rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso  |  3 ++-
 include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++++
 32 files changed, 86 insertions(+), 37 deletions(-)
---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260608-kbingham-orientation-20afc0fb6957

Best regards,
-- 
--
Kieran


