Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BBCC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnTw1ry++C6kkEUqeK5mZKwrgCH94f2NvHop25VWd5I=; b=N0BC0zViEGFNtkKyEuruRzFOF6
	eK6UU6POaMmNTJnFvNumh3TgFBdyYGAdFrTgm00CDeskzey/6NU2x6D4p0yZ4TBcIV3e3nIWbJHeB
	Isa5NALxNAOvgYDJaQ1TWHiUQFW5hUGgwJTbIF/xp3FPlyA1n+fMgsvEt3ClUWXZtjNm5ysnz6Lat
	0qxIlxAC9xBWEnLxvI99BhhwgnpqOiRwEWstiDq0orwKaXyNKE1sv3k3mjUoXCjXY9Xl4XswvDuWs
	Q+HQFCoQGh6tCcbPtLqYi0VYFAzZeUCdMjv6Zw/SOGDeDysPwCU+3vucgNiaoY/7OaDDH1CNGN9AV
	LSSX2Hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79E9-0000000B5UJ-2ARb;
	Thu, 17 Sep 2026 10:20:25 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79E5-0000000B5St-0kbE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:20:22 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id CD76E22814;
	Thu, 17 Sep 2026 12:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640419;
	bh=jnTw1ry++C6kkEUqeK5mZKwrgCH94f2NvHop25VWd5I=; h=From:To:Subject;
	b=gqF3j6uKvuytPqHp60/HVrumoniVz8lSmy0zlnm19In44ZM0soW6vIxIh/Can/h1t
	 OxjmEQzoeW34HAFOmso4ggxaqqCBUFDPI9AVW74TtHo4OPM//lTD0GrBS3jXBPV7Bg
	 tbKKPYaQHngSn1eJ93wKsWITqpQ/1pOgcRQYdjEqduOc7teD5mcv9aHgFLVPoEhE7e
	 vpwaioyyIvNlR7bAeKPbTf1jrIRVaYy43YngkRI+mUQTOb/qSkN1IrYYHoQgIQMK4T
	 WV/QiDcHWhQbEf30lEKc6VmaK+tllYfK+HFYjkyey9SZI44pVtWse+8dJA2mlsZd4E
	 17W7Z5LBSsxog==
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
Subject: [PATCH v2 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 12:20:07 +0200
Message-ID: <20260917102011.69071-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_032021_383225_E9A7A5EA 
X-CRM114-Status: UNSURE (   8.12  )
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

This patch series adds support for the Toradex OSM iMX95 SoM and its OSM
Development Board.

The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
from SGET, based on the NXP i.MX95 SoC and available in Size L
(45x45 mm).

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/osm-development-board

v2: removed unused pinctrl_pcie_wake from PCIe nodes
v1: https://lore.kernel.org/all/20260917094217.59508-1-francesco@dolcini.it/

Antoine Gouby (2):
  dt-bindings: arm: fsl: Add Toradex OSM iMX95
  arm64: dts: freescale: Add Toradex OSM iMX95

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../dts/freescale/imx95-toradex-osm-dev.dts   |  404 +++++++
 .../boot/dts/freescale/imx95-toradex-osm.dtsi | 1032 +++++++++++++++++
 4 files changed, 1443 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi

-- 
2.47.3


