Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83BBC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfaXW7wU2Gx3b0iIq5PWlfZLjeuExHQmCFOsha4SOmk=; b=z30/8ZfOxIuiGJ
	eZAQWvsLS8mwUYk+h57iiY4T1BGWe9J+yqx/u7TX6DHibLU/evkZwXHdoqj7vKCDNn/xkODVIxuaa
	xP/u3DYtdCk5UVZweORWsD+0wygAdk0/9mCgXF7hwOQewEUHy80mM7hnulpObeNuBEoIqaioU7hqs
	YT2BBjdtuvNeZclYRBlBqr05fUz1AAdhKtuLBPUhgN6Tev9SL84EwNaQIiUUwdbiykCByWr4eY3gk
	T3zhFW+m2v43+6aQxibuyxUwdIYVO5Nog1ThXGn6rZiu1fYQ8O40aflLLiGVkhyYAr2uqmvR2bnK1
	zdzRzOxDDTnP6XVdmMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTV-0000000E2mh-1qHs;
	Fri, 18 Sep 2026 10:05:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTS-0000000E2lB-0YIf;
	Fri, 18 Sep 2026 10:05:44 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41905236;
	Fri, 18 Sep 2026 12:03:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789725832;
	bh=0tWYUZiixVnvD59lVl7V1A+pe3zDJA5LsRCVuPk+vBk=;
	h=From:Subject:Date:To:Cc:From;
	b=qkVxBqHjmma1aIBSh/W1KRZfWIsingY4v8DrXgBkCLxfeDkvIXIRKAMdzwe4tqOS2
	 l/u0x+ENIc7JM6rz1rL2W8mwVxpeh4AsZFojwy6XgP5wELKuIjczO6gLoTubTcuwln
	 Jcyc6qhvMNe5BmxFjBUhsXgXacpClDHIJT2AbAbE=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v5 0/6] dt-bindings: Orientation defines
Date: Fri, 18 Sep 2026 11:05:21 +0100
Message-Id: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEMrWoC/3XNTQ6DIBCG4asY1qWhiPx01Xs0XYCgThrBgCFtj
 Hcvmibd2OU7yffMgpKL4BK6VguKLkOC4Es0pwq1g/a9w2BLI0ooJ5xI/DTg+0GPOJSdn/VcBpg
 S3bWkM1w1ApXpFF0Hr529P0oPkOYQ3/uXTLfrF6T8GMwUE8zERUjjFBWG3cA6nYI3QUd7bsOIN
 jeznyUJ+2OxYtU1V0pay+tDa13XD13jikMLAQAA
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
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 David Heidelberg <david@ixit.cz>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789725933; l=4234;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=0tWYUZiixVnvD59lVl7V1A+pe3zDJA5LsRCVuPk+vBk=;
 b=/NCC6ht+TiMEJOrDiWTCe63UziN/m3CKwxyK+5kXXDl3uVCHE+GHRtth7vbpOTtyf+MEK+Ev7
 SNIhs1ck1JdCbMp2wVWxirResfZ7Sus0HogXDLaHlv5r0qlwL+BcX0t
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_030542_640069_2D2EA30D 
X-CRM114-Status: GOOD (  11.99  )
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

-v4:
 - Rebased media-committers/next (v7.2-rc1)
 - Reintroduced updates to:
   - arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
   - arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
   - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
   - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
 - Squash header introduction and bindings updates
 - Link to v4: https://lore.kernel.org/r/20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com

-v5:
 - Definitions now accepted in linux-media, rebased to get conversions in.
 - Converts new himax,hm1246 binding

---
Kieran Bingham (6):
      arm64: dts: freescale: Convert to new media orientation definitions
      arm64: dts: qcom: Convert to new media orientation definitions
      arm64: dts: renesas: Convert to new media orientation definitions
      arm64: dts: rockchip: Convert to new media orientation definitions
      ARM: tegra: Convert to new media orientation definitions
      dt-bindings: media: i2c: himax,hm1246: Use video-interface-devices

 Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml        | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi     | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi        | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                         | 4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                          | 3 ++-
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso    | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                    | 3 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts                   | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts           | 3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi                   | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso     | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso     | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso     | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso     | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5 +++--
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3 ++-
 19 files changed, 40 insertions(+), 20 deletions(-)
---
base-commit: aedd77ea8168f00687c1248cdf115071e869cf93
change-id: 20260608-kbingham-orientation-20afc0fb6957

Best regards,
-- 
--
Kieran


