Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9E9C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bn1dZXSQxo3TxF9c+QnQNZubE0Jo2jc+fNGwUMxBLbE=; b=jXG9KoCUU9EE0CFdSeyST3/gyT
	jdnmAmAXzdA2xEqwZDAP650xOq6fv9zNirnd8+Z7QrZtpvASLT7lR/esSPQwHy64NFSLej5ADzSTq
	mlghPxOwNV6DjHuiV6gUV5gCf9WNi/edXm2nqkqsMF1olSf/zJ0Wy9hUEnRKybbysFBQTTkpSZt2u
	9scCBf0bll04ID7VPPG7hvDKIAKLZAQXpmt/c/g0rVM9DxUKegfswV6gM4g+6LNz6h3ta6zbv04ev
	r5AtSHdRQY+IPV3cCtsisoxU23SEuV8v2OmTJeIOvlzdlZ6GTiXmvLWTyz//XhVn3imWiIxBbg2KP
	mlAWEPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dP2-0000000AD5f-18oj;
	Thu, 24 Sep 2026 06:57:56 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dOy-0000000AD3T-1uy4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:57:55 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D93361FD0E;
	Thu, 24 Sep 2026 08:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233066;
	bh=bn1dZXSQxo3TxF9c+QnQNZubE0Jo2jc+fNGwUMxBLbE=; h=From:To:Subject;
	b=PApm8qyd8MxaKY6+SeOgpxPyK3BSRyuzKzFnyOjDVU++4T0x/P4j9b2pGPAh1idj/
	 nu9PlpjD1cjWw4IKWZZKjQRMsHIgOtilCuU8TLD2X+CWbtf4vGP+I7pBiMxt7yzOsa
	 Kh0cqDB3RUdvoZS1SSkqNwg9Hqc9Be2XxINdBEzHAXOWsxs02asfiL5GVPK1GJ9nix
	 P7yM1maqKZAyV1owEUCG74XLOYcDIdQJnSYB7Y3O8F7qHIFaoAw/5ctCBXqZ3KCoyC
	 CjJu8qMF5+wn5p5OAOicmUOeajcxlIsOoUEH9yMMsEnkYi4h6tORY8QYrs0npgUCjD
	 jOYuuRu5nx2LQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/7] arm64: dts: freescale: Add Toradex Lino and OSM iMX91/iMX93
Date: Thu, 24 Sep 2026 08:57:26 +0200
Message-ID: <20260924065735.17678-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_235753_546462_112B5123 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Device Tree support for the Toradex Lino and OSM SoM families,
based on the NXP i.MX91 and i.MX93 SoCs.

Both families are available with either i.MX91 or i.MX93 on the same
PCB. Since the two SoCs are pin compatible, common Device Tree files
are used to share the hardware description between the two variants.

For the Lino family, add support for the Lino-Verdin Adapter, which
allows Lino modules to be used with Verdin-compatible carrier boards.
This series supports the Verdin Development Board and Dahlia carrier
board.

For the OSM family, add support for the OSM Development Board.

v3:
 - rebased onto commit bf184a29ad1b ("Merge branches 'imx/drivers', 'imx/dt', 'imx/dt64', 'imx/ele', 'imx/fixes' and 'imx/soc' into for-next")
v2: https://lore.kernel.org/all/20260911091952.96233-1-francesco@dolcini.it/
 - add acked-by
 - removed #.*cells properties that are already set in the soc dtsi
v1: https://lore.kernel.org/all/20260910101616.139270-1-francesco@dolcini.it/

Francesco Dolcini (7):
  dt-bindings: arm: fsl: Add Lino iMX91/iMX93
  dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
  arm64: dts: freescale: Add Lino iMX93
  arm64: dts: freescale: imx93-lino: Add dahlia
  arm64: dts: freescale: Add Lino iMX91
  arm64: dts: freescale: Add Toradex OSM iMX93
  arm64: dts: freescale: Add Toradex OSM iMX91

 .../devicetree/bindings/arm/fsl.yaml          |  30 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 .../freescale/imx91-lino-verdin-dahlia.dts    |  24 +
 .../dts/freescale/imx91-lino-verdin-dev.dts   |  24 +
 arch/arm64/boot/dts/freescale/imx91-lino.dtsi | 305 ++++++++++
 .../dts/freescale/imx91-toradex-osm-dev.dts   |  22 +
 .../boot/dts/freescale/imx91-toradex-osm.dtsi | 303 ++++++++++
 .../freescale/imx93-imx91-lino-common.dtsi    | 536 ++++++++++++++++++
 .../imx93-imx91-lino-verdin-common.dtsi       | 175 ++++++
 ...imx93-imx91-lino-verdin-dahlia-common.dtsi | 198 +++++++
 .../imx93-imx91-lino-verdin-dev-common.dtsi   | 216 +++++++
 .../imx93-imx91-toradex-osm-common.dtsi       | 526 +++++++++++++++++
 .../imx93-imx91-toradex-osm-dev-common.dtsi   | 324 +++++++++++
 .../freescale/imx93-lino-verdin-dahlia.dts    |  24 +
 .../dts/freescale/imx93-lino-verdin-dev.dts   |  24 +
 arch/arm64/boot/dts/freescale/imx93-lino.dtsi | 359 ++++++++++++
 .../dts/freescale/imx93-toradex-osm-dev.dts   |  22 +
 .../boot/dts/freescale/imx93-toradex-osm.dtsi | 357 ++++++++++++
 18 files changed, 3477 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi

-- 
2.47.3


