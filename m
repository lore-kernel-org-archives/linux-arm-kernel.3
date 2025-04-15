Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41EFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFNxUhjsFqqlSoQEcn3u74JkQD5N3KHli2AXY0ay7yM=; b=bhji5ca18vTZ0Qke06plYdh/6D
	Fm58oAQphavjM/G5rNPZsHSM9FoSvYb4QGWmfLbj2eApGcVt8n2q6pIIAvtx2/605PKMIALXILB1h
	ah6D2J62gD3Ftnoq0twYAlfL2VEsydm3fd+xaUbjUK+VzBQ0Lgrrjsmeb3iveo6T8jLiuGYCcQ+40
	98bHvCLDkw+cVzyawbFswS8UrhHK8zMBbMMkJK55+sOdfL9A7D6XEMcP/TTqSCmY9O0JidbIgKfGV
	3VRQ0/U5nA1pugGhWmmeQ0kLT8/H7hA1sqVPFjAFVLqGb+bvrztsHJdNe8cLs9HiI6iJRdC5WPeJ0
	QOEjGrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aDW-00000004ilv-3ej0;
	Tue, 15 Apr 2025 06:56:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aBh-00000004iKw-20WE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36CEF5C420D;
	Tue, 15 Apr 2025 06:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF65CC4CEDD;
	Tue, 15 Apr 2025 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744700067;
	bh=ZyC2hkC9Ht4qQWt/VvEKwAzQDl0pAFCgYnqLErD8apQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cle4uCiF4scKoG0Bx9KXxtoOEw3EAPvgSu5obbZaIlLi9OVOEgUnhqQsWfPXjEJFd
	 AF2mycoc2l32hdQf3R5mWOst/rnmKhngKif2lxMV9Hk8ZKay79ujxwdvIQCx3O1Cuf
	 lj7IEmF7TqkUU6RMoqmPTRBDB79DXIJxImUDMt+yAx/sRH+uV5avz0Q3SckI5MfPaX
	 8H5z/MXr/VA+MmibNmsxbZwfmLK6b22j9IPBx4UVbpjmk4eRHla0ZoAZf2TEClYMgE
	 eABkxiTkYHcWfSGE2WIuE7HFY+SRTh6LAUMKF8uJ5q4BQsPxOEexDo4hRoGkmDXCb8
	 rjpJpXkcbTzWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A30C369AB;
	Tue, 15 Apr 2025 06:54:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v5 0/8] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Tue, 15 Apr 2025 08:54:23 +0200
Message-Id: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ8C/mcC/3XNTWrDMBCG4asErasijX487qr3KCGMFSkZcK0gG
 dMQfPcq2aTgdPl+MM/cRI2FYxUfu5soceHKeWrh3nYinGk6RcnH1gIUOAVgJU88M42HI9fLSFe
 ZCAE0RuWjE+3qUmLin4f4tW995jrncn08WPR9/d9atFTShTAMyWvjrPk85ZCnueRxfA/5W9zBB
 f4ifotAQ8AkSqSNQt29RMwTMdBtEdMQG7GPpH3naXiJ2CdiFWwR25A+YY9okNDbDbKu6y8O4EU
 +ggEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744700066; l=3470;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=ZyC2hkC9Ht4qQWt/VvEKwAzQDl0pAFCgYnqLErD8apQ=;
 b=/cCknBmS7IHAW/W0tT3DTIYQ3RloiHET5WEc3XVSrK212o+IhPSlWol7XuSPxaZvU0JbE4U+n
 OTzkgVGpCPYBdHyAAU4j4m3+TpdZfQnwElsdlJVVq/BVDqC7Ef5eCmK
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_235429_630972_0B076009 
X-CRM114-Status: GOOD (  17.45  )
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
Changes in v5:
- Merge the makefile patch into the two dtso patches
- Fix references to the root node in the dtso patches
- Enable the USB bus going to the adapter board in the mainboard dts
- Fix some formatting issues in the mainboard dts
- Fix some formatting issues in the COM dts
- Change a clock as suggested in the COM dts
- Fix the maintainers entries, remove devicetree list and imx list
- Rebase on latest linux-next
- Link to v4: https://lore.kernel.org/r/20250402-initial_display-v4-0-9f898838a864@gocontroll.com

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
Maud Spierings (8):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      arm64: dts: imx8mp: Add pinctrl config definitions
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 MAINTAINERS                                        |  12 +
 arch/arm64/boot/dts/freescale/Makefile             |   8 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  94 ++++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 ++++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 525 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
 8 files changed, 1360 insertions(+)
---
base-commit: fb44e19e78df2950877a9f7b4f24b58db790d293
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



