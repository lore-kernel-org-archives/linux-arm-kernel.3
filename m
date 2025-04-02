Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B6C3601C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYiBlLUi17J99GysofmncSy6u9LCGYnaeTErlWrllBg=; b=qDbi+5gWjsedA1il/d/qz0UnHW
	oyv8++yvdLn/zKU8vWQZ6ivs4ycbaUHuZaJYdYcah4+KALgYYCNvHdnirC1gA6R+1clPKn+j1OTSW
	n+RviLZ1ytOv/ud2xxWBFS3y4vdJaHVL0DU/xo5XN6+sYrd+Xjylojkg1zWVUqR7BOI/+TjuxB4W0
	37dL6wiyizebkRzl75/L9ERDSUrRdTc5MO8h4YzSA4TMPVlDEoSzJHTErq+GYTOXix5MkBWtXZsQp
	U9arJWVfdi5JZdUUnQyMDohs+g5xsg44a4zHhdfgyJRhFwl2M/oFAHAVdryXsd4hgz/iI8cX/kTF5
	3XzZ2UIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsFx-00000005KVH-3Qkj;
	Wed, 02 Apr 2025 07:11:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsC2-00000005JUL-3xEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D5D461162;
	Wed,  2 Apr 2025 07:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E191DC4CEDD;
	Wed,  2 Apr 2025 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=rtFp1kePr/uyknJSoRibqfpoN8jn1mXq+RKJ+wCBEh4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=M91EAaGTuqf6GQrNraGhYhXvBzTcHdZm6sR8AnX4VzWBnKqYo1xkMbf6iPzfwl8Os
	 fyi98a/smXX41QskDa1dw9FEqSaST1+OTQjhPVQ+p4b2F7TgO6eqXqgLQTc9RZibhQ
	 +NqTqLT/oeq8Ap9xZwj0AfN7N+5t6CRS5+E+kzSxp9+smodzjhUBaWTnnCd4+SSJ2y
	 AZTy9RNsMgy+4PQtwybJNB3Itrkm1aV1NJq30tb/N5z1IUNW2/gvo0hLzS7OIURFmn
	 gksDP+ksu40UG0xtEnJU4NSKkel8602vNnq0xYvRyD2a859uVa+KNYY/wgXeFFsPYE
	 hc/DQUMoVadkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF39EC28B20;
	Wed,  2 Apr 2025 07:07:21 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v4 0/9] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Wed, 02 Apr 2025 09:07:03 +0200
Message-Id: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfi7GcC/3XN0QqCMBTG8VeJXbfYznRaV71HRMx5pgfMxSZSi
 O/e9KbAuvx/cH5nYhEDYWSn3cQCjhTJ9ymy/Y7Z1vQNcqpTMxCQC4CMU08Dme5WU3x05sWdKQF
 kiUJjztLVI6Cj5yperqlbioMPr/XBKJf1vzVKLnhubVU5LVWeqXPjre+H4LvuYP2dLeAI34jeI
 pAQUM44I5UoZfETUR9EQbFFVEIyLI9opC60qTbIPM9v6nIJFj0BAAA=
X-Change-ID: 20250224-initial_display-fa82218e06e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=2992;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=rtFp1kePr/uyknJSoRibqfpoN8jn1mXq+RKJ+wCBEh4=;
 b=biq/XdGYu+FB/CE29/Q9jV5LelpAd8IQGS/O/UdSfIAEXkmpygdD3XPVYkW2zdebjOw61Yz0E
 6Dfszm/WBStD4cKyjgb2oflgaw7OtQX4HGghBB9mzww2KEWs527sxH6
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Changes in v4:
- Add imx mailing list to ka-ro tx8p maintainer entry
- Fix several small indentation and ordering issues in devicetrees
- Change the two display adapter boards to overlays
- Add the missing patch for the Makefile to actually be able to build
  the new devicetrees
- Link to v3: https://lore.kernel.org/r/20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com

Changes in v3:
- Set regulator-boot-on and always-on on LDO5 of the pmic, after 20 ish
  seconds it auto disabled this LDO causing weird behaviour like
  ethernet droping out, wifi not working anymore. This LDO can control
  the IO voltage level of certain pins, just let it keep the u-boot
  value.
- Fix the comment style in imx8mp-pinfunc.h
- Rebase on newest next tag
- Link to v2: https://lore.kernel.org/r/20250226-initial_display-v2-0-23fafa130817@gocontroll.com

Changes in v2:
- Dropped the trivial-devices patch
- Added a patch with bindings for the gocontroll,moduline-module-slot
- Added a patch to spidev.c to enable the spidev driver for the module
  slot
- Added a missing usb-c connector in the av101hdt-a10 variant dts
- Switched to the new bindings for the module slots in the base dts
- Fixed some commit typos
- Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com

---
Maud Spierings (9):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      arm64: dts: imx8mp: Add pinctrl config definitions
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
      arm64: dts: Add Moduline Display boards to Makefile

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 MAINTAINERS                                        |  13 +
 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 102 ++++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 ++++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 525 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
 8 files changed, 1367 insertions(+)
---
base-commit: 5a8989cc1b2d2b181d72ea291c82267ce51f517d
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



