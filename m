Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40874C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=opjT5/t2075ZwXKLhLNRf46iRkyFA1PSM/HbIUktT94=; b=ORfc3NKwl6589v
	mUWkHxEOD/gMWSc6/14Rlc1+LqmW7J3GUQcdyhDSe8xwlyYJ62SURGDpzL+g+qr/2Nu9Bp9HAQ0MM
	q3CPICm96Go2vpebhJDS9r4dSNhQqZ/ZzLdSsbjpO2DADFyPsf6/Gsy8HGR+BRRHptyYrKWLnAahN
	sKtYmPHQVz24JlutyIjfvwslmF4/xD6GqeOmX/oepW96qvV8ksKyIW1exxx19awUFY9V0MSE4308g
	zz9ENR6PliBYwN5ZZ6ca76raHrdLLzE34TFRvylF/BJC6gAp9axg7YOTJe8nQTTa4qCQXksYAwkOJ
	E4yDPIu2+xYIymyPJS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDDH-00000005Bqm-0B7R;
	Fri, 10 Jul 2026 15:32:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDD8-00000005BlC-2raj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:32:22 +0000
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F21A4C2C64A;
	Fri, 10 Jul 2026 15:32:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D84CC60342;
	Fri, 10 Jul 2026 15:32:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB3C011BD0EF7;
	Fri, 10 Jul 2026 17:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=opjT5/t2075ZwXKLhLNRf46iRkyFA1PSM/HbIUktT94=;
	b=So9Q79YhoDHT/FGDeFSSz3t4dbs5QiCYvboGne3BFeM233eBO4h5D92DoMoNc57Mbr41OQ
	9yw9kSjV+hEEz7vp86+bNRHok/osHrUOQDeOS/AvnURhfz+ETg1SVlOhfJ7+SM1dX/8mTg
	zr56j5czUW5Fa3PskU3skwb3RhgGflmv0fTQMRrlijpZNkrQxJLxYkH8HRmmDxQdcDwgzv
	aRRAvSLtNmSNbdVkpRwtV8FOMSJXpEEOOmj/0BGdpVc1Aku5WHBR0uo6YFA84i7kDDIX8f
	4ygK3NCgsmvUbEsvo/65brZKVyV03qr1g8ZmtPtqZ9CNjjoSfIQtlCyr1/m2XQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/5] Import optee node from u-boot device trees
Date: Fri, 10 Jul 2026 17:31:33 +0200
Message-Id: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUQUWoC/x3MQQqAIBBA0avIrBvQoKSuEi00p5qFGWoRSHdPW
 r7F/wUSRaYEoygQ6ebE4ahQjYBlN8dGyK4aWtn2UiuJ3uSd6cLLhpDR5YTszxAz9sPaKbvIQTs
 NNT8jrfz862l+3w+Q4xJIagAAAA==
X-Change-ID: 20260710-mathieu-uboot-dts-import-69f51bc097d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=3294;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=GvF+goMJzkF/uRrgajuo8a2aYORnv/sPr+Q/viHrWb8=;
 b=6FNuUzGqgL00oYjpCi6BVoz145dDiOaDz5uzPPuGqQNHNyEUiD+kRXgMLs7vzR5ZwO86WxY8j
 nHWsJLbnupUCAaPtOHaJiaKJgq4r7J0GvK9kSFtko/5gHJz4AvqLwqu
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_083218_920665_53344D20 
X-CRM114-Status: GOOD (  10.73  )
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

In a recent discussion on the U-Boot mailing list [1], it was found out
that several platforms were adding the OP-TEE device tree-node thanks to
some U-Boot specific dtsi. This was deemed as a bad solution, as this
should instead be added in the DTS files hosted in Linux sources,
particularly for platforms already using the "upstream" (Linux) device
tree.

Most i.MX8 and i.MX9 platforms are already using OF_UPSTREAM
configuration in U-Boot. Some are not, but are fairly new, so we can
expect them to use the Linux device tree once their support is a bit
more stable. So they will benefit from these changes once upstream
device trees are refreshed in U-Boot.

STM32MP157 platforms are using OF_UPSTREAM, with similar consequences.

The two other platforms are using an U-Boot specific device tree, yet
adding these nodes on the kernel side will help to reduce the
differences.

The zynqmp platform was ignored, as a similar change was previously
reverted [2]. I also ignored a few platforms without direct match
between U-Boot and Linux dts files.

Also add the OP-TEE node on the imx93 FRDM platform device tree: while
this is not part of U-Boot code today, it is the change that triggered
the U-Boot discussion.

[1]: https://lore.kernel.org/all/20260706145906.GW749385@bill-the-cat/
[2]: https://lore.kernel.org/all/20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com/

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (5):
      arm64: dts: freescale: Import optee node from u-boot device trees
      arm: dts: st: Import optee node from u-boot device trees
      arm64: dts: hisilicon: hi3798cv200-poplar: Import optee node from u-boot device tree
      arm64: dts: nuvoton: npcm845-evb: Import optee node from u-boot device tree
      arm64: dts: freescale: imx93-frdm: Add OP-TEE device tree node

 arch/arm/boot/dts/st/stm32mp157a-dk1.dts                | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts                | 12 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts       |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts      |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts  |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts      |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts         |  7 +++++++
 .../arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts  |  7 +++++++
 .../arm64/boot/dts/freescale/imx93-var-som-symphony.dts |  7 +++++++
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts    |  7 +++++++
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  7 +++++++
 16 files changed, 127 insertions(+)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-mathieu-uboot-dts-import-69f51bc097d7

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


