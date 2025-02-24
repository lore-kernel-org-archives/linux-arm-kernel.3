Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03964C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JpsYwX0PSKXYghIHkIW2gxP5cJad12CcWaq/I1+MKes=; b=0V4Zj//26H+uUyIuBNmHlgB05j
	xJ9yYXsXrWE0HycKMLlAzGL/MtMsi72SPQU53WhF+O7ML0rrqvvZSOBX/Xgm7nybdnTj+zYHMfUI9
	/FWMNQREtdkfF3WWr+xp8WbfE8VsnrS1QXkkpPDYTplxKNibQ51GyKSPJg34EXEtnBpZ5ClV8ofhc
	WaFq72O0SV0byi1Bx3eeGafL35zyN+bwe7jMomCRHoT2R7ObnVhFq6tpnle1zjtIe+Gl1JhQEhmea
	7lHpKbBEXdD2uijTDEtEILwKjsQua8idRZ4Zbqb4iqARsXC7nWIELMhQW6dGQ8Gfxb2HFI7bW6kLh
	XaQzJxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ2e-0000000E0Vu-24DS;
	Mon, 24 Feb 2025 14:02:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrS-0000000DyC5-1eLp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78ABE5C6DB1;
	Mon, 24 Feb 2025 13:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F3D8C4CED6;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405064;
	bh=VEEv6nk8vDex2BIMDGcyoeXhYWRBAy36ZB74OSyadLQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q9Yx9dn33NrvPGC7k8HNZ+NZo16C87m+oyDcFCf2eKUUbUrZqGwJzOfEdR2cvjIgP
	 nNMwy72OFTvgFghGIoJWuVylQjcthKHFPLzunbqRcDwGT4E2MOLTO+5x/ydiPGVF9E
	 d57jhB99L5IWWLqedGGTI3Pz3qkrgMrNGJGM2Jg5+CUQq+0+xSG1Y2aJzfYF2HAnkN
	 FMDNUJA+oJeZSarnx8F2JYb3t+IZjuBy8q/t+fyevv5ZnClpaWEkZL1NuoDRz9rpkR
	 GHqIrCtwuBcc6GbDAgjhMSic3vrPxEq40l5W91O2S4uWDxu42xYbOoc2qY0FPLcnl0
	 e+Sdyz91dN5Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2531C021A4;
	Mon, 24 Feb 2025 13:51:03 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 00/14] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Mon, 24 Feb 2025 14:50:50 +0100
Message-Id: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADp5vGcC/x3M0QpAMBSH8VdZ59pqTkheRdKyg39p1iaRvLvl8
 nfxfQ8liZBEnXooyomE3WeUhaJptX4RDZdNbLg2zJWGxwG7jQ4pbPbWs22Zy1ZMIzXlKkSZcf3
 HfnjfD16CHDdhAAAA
X-Change-ID: 20250224-initial_display-fa82218e06e5
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=2195;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=VEEv6nk8vDex2BIMDGcyoeXhYWRBAy36ZB74OSyadLQ=;
 b=fKWlALGDjjqxq4Z193T7Ci/ahYXLxryiGGIkZwxtx0yJxz7Sffnh3789/tCcMZcJS7qRSZ0SC
 OXfDAtd+vzFBxMyTIjw8WpoWUMc911QpWUXsBSVw5lsld0AipyD649U
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055106_521130_643765DB 
X-CRM114-Status: UNSURE (   8.94  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add inital support for 2 variants of the Moduline Display controller.
This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
features an imx8mp SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (14):
      dt-bindings: display: simple: add BOE AV101HDT-A10 panel
      dt-bindings: display: simple: Add BOE AV123Z7M-N17 panel
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      dt-bindings: vendor-prefixes: add GOcontroll
      dt-bindings: trivial-devices: add GOcontroll Moduline IO modules
      arm64: dts: imx8mp: Add pinctrl config definitions
      drm/panel: simple: add BOE AV101HDT-A10 panel
      drm/panel: simple: Add BOE AV123Z7M-N17 panel
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |   2 +
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  12 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  27 +
 ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts |  60 +++
 ...tx8p-ml81-moduline-display-106-av123z7m-n17.dts | 133 +++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dtsi     | 530 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 547 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  64 +++
 12 files changed, 1382 insertions(+)
---
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



