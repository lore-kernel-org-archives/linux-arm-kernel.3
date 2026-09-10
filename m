Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549C3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HmQEgp98q8O8JhuWPmG9fTi4h3McQ6KmVcusD4VmijQ=; b=bapWVOZqUM6Jxhin/ikYQvC6oX
	S9poGJvXl8LrNyZ8Yq2KMjfbE8hA0Vh8d2bJVRLjfKUWFF9qGw9mnaaCxUEZdkSBDR3HK8k+blyki
	3tORznssK3yTqnjUU07CfY+IjXoPF5x3xPgZuu3HqVIiDL5pD6aPcnZjLpjNVDX3IZ81ODqgFnsrQ
	1mJL4XWRVlDCqShcHud7cVKBiS96sasCDnZnfu6/WxJmHHausA5qBzdNYokGW28YTBZxInXXk8ROe
	gypZniU/TAAvULL/HTfpw6B08l75wyDhvEUMFd+Q3YMRxR8LBoqlDvoSdHTwLz438cIjHsly9NIlV
	YyFwZ+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bpY-0000000E19F-2JI5;
	Thu, 10 Sep 2026 10:16:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bpV-0000000E17E-2GWF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:16:31 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 58AD41F95E;
	Thu, 10 Sep 2026 12:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789035384;
	bh=HmQEgp98q8O8JhuWPmG9fTi4h3McQ6KmVcusD4VmijQ=; h=From:To:Subject;
	b=mUe2+h5xiYk7qOe4WNAjvXyKugNWCTLoooYVFua0xFMhkonmKhNYpvdwriuL2ORiH
	 cHNFccY0u+SkTZoNWus7oluQIrt8BJUo0A4yFED4zQgEYdK65TOHQ7EEfxe2eIMH8X
	 qIXQOoBcUsR57u7S6fApwTc0ivixdHl1IgSHF6QoXENoHxvgX0sqSm00Q2ETUcVHVB
	 wMs+iNuPFeIOr0dnjO0k3ipMbuTUSFC5RqJVXZC4i/XKmperIBJP9lTeMe0ThhDaiH
	 1nSFgBTjMiWBoh7YlbGJIwlSS24X8pUdOfRo3RuegA0w8+hVTDyebywLVLg91/PhWs
	 8JclziDVGJaNw==
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
Subject: [PATCH v1 0/7] arm64: dts: freescale: Add Toradex Lino and OSM iMX91/iMX93
Date: Thu, 10 Sep 2026 12:16:06 +0200
Message-ID: <20260910101616.139270-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_031630_485624_678E2C4D 
X-CRM114-Status: UNSURE (   9.17  )
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
 .../freescale/imx93-imx91-lino-common.dtsi    | 545 ++++++++++++++++++
 .../imx93-imx91-lino-verdin-common.dtsi       | 175 ++++++
 ...imx93-imx91-lino-verdin-dahlia-common.dtsi | 198 +++++++
 .../imx93-imx91-lino-verdin-dev-common.dtsi   | 216 +++++++
 .../imx93-imx91-toradex-osm-common.dtsi       | 533 +++++++++++++++++
 .../imx93-imx91-toradex-osm-dev-common.dtsi   | 324 +++++++++++
 .../freescale/imx93-lino-verdin-dahlia.dts    |  24 +
 .../dts/freescale/imx93-lino-verdin-dev.dts   |  24 +
 arch/arm64/boot/dts/freescale/imx93-lino.dtsi | 359 ++++++++++++
 .../dts/freescale/imx93-toradex-osm-dev.dts   |  22 +
 .../boot/dts/freescale/imx93-toradex-osm.dtsi | 357 ++++++++++++
 18 files changed, 3493 insertions(+)
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


