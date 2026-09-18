Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41C5C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ekTM1P5YRyr4Ur/7C/VzK/woIUQbSytjW/zwi9aKj9Y=; b=XxczfYaeeSLf0b
	o2Qr0ZIXokOB0Oo/Keve6rMkGrHQsYsz3sKn7Ih5cm2l8VoHzgShWtcA30B7Uv3GEDqaET3xheSHL
	a6NPZq4IHirMOiWZ9kiIbiJc4kuSWWzole6e/P5q3UDfIfzdB5SVemdxzsdp1R0JAFuPqJ9W4vp2q
	qQbfs/iCQnwTCfFQTnAnYOLzUGBvWU8ZsDtu/N68glKIWQx7dyH7U82qnPCrFtx6DQUZTjQ0GY/Si
	A9T4cdwChEDlBuBWfntw5c3KuK4NNE9ryWkFJUWoqp7ZpS00kKATJvQwe63w4zS582h8HIeXoCcaZ
	npbAoQD7cHaJysqPjY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4w-0000000E7id-0miq;
	Fri, 18 Sep 2026 10:44:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4t-0000000E7gL-3mcK;
	Fri, 18 Sep 2026 10:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ekTM1P5YRyr4Ur/7C/VzK/woIUQbSytjW/zwi9aKj9Y=; b=gK5bO4d7xktlAT2qf4/rxy18YO
	HBSl7gkVxJBitGkV/yiCtJ4YHxAmEbBEUJz54nmlvGfP5nCbpxfNctt5/TsA81ii6NwU7ooJcYSfk
	lEEHz2VbOESfD8mMU9hrpdxm1Xr2Gx8yzBqoH1Ep+8JFkcpnMGihGrlFXbCYI7qi5Ja3jbl4YOogD
	JJr0BWvYQy5UkuzRkS7R7is7NbPxdXqUOT+CG+uPSowJ7eeJzyxSgJNgKRyMJqx+E5WUJBkYx+ffx
	uEV/YwDDSxcq4y+gAvZ38osthnjF0U7UZ6cQCDXdWVBrTwQDTM+T26aMzn122d77ItyIUZAUVOzz6
	HTAU93FQ==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7W4r-00000009wo2-05eP;
	Fri, 18 Sep 2026 10:44:22 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114004D3A;
	Fri, 18 Sep 2026 12:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728156;
	bh=ILvl/y5sag2JhhGEy9CngiSkng7+/GuEan+czF6epJE=;
	h=From:Subject:Date:To:Cc:From;
	b=iAVGcdDjAmFpEsC9Td2frqmEvWpKTMW3EQaCb57qiLWT4gLDoCiNu0+TZM7NqQQHI
	 TzjeRyqjdYCFjbloJLdlVGFwt+tWvmao2xLzdNtxerqd8uetQMiAHpy4NWHucZ6N+K
	 OFiO0qaI2HrDAvx0Kzs3LWbKePWhuVp7pJHHKI8Y=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v6 0/6] dt-bindings: Orientation defines
Date: Fri, 18 Sep 2026 11:44:12 +0100
Message-Id: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwVrWoC/3XP3wqDIBgF8FcJr+cwNf/sau8xdqFpJSMdGrIRv
 fssBt3U5fng/A7fDJKNziZwq2YQbXbJBV8Cu1SgHZTvLXSmZIARZoghAV/a+X5QIwyl5yc1lQL
 ESHUt6jSTDQel+o62c5+NfTxLHlyaQvxuKxmv1z+I2TGYMUSQ8poLbSXmmt6dsSoFr4OK5tqGE
 axuprslED2xaLEIYVIKYxg5tZrdkvXJo7kplq1VTSjBTApxYC3L8gN/cymVVwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=4409;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=ILvl/y5sag2JhhGEy9CngiSkng7+/GuEan+czF6epJE=;
 b=3/FgQrQgkYY9+ZjpzZq1dETbFJvszDKs87yfCdXr2I0lYwhXFsJToiHbUXijlDMrTaFlD+xlf
 s5fOZcP1vEtBidRUHLxo4Vz0vOlwKNShbAwoZ8nArFmRvis50UNKWa4
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_114421_202153_B5140AAC 
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
 - Link to v5: https://lore.kernel.org/r/20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com

-v6:
 - Keep himax,hm1246 example as MEDIA_ORIENTATION_EXTERNAL

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


