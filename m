Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897DDC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GrKwQSnBM5TlJwrXeIy0ESWxGzkPY7jGMX9Hplkjm+I=; b=W4phaMekgu+yN50JTrH89VI4Ne
	5eZ9Zy7V2FcnKHQegVwpiRDb8dR7Ark36LBJmNvszASgQxD7DXHJB4dIBuH/GfYenZAJWfGScjWFL
	Tlhwf5V+s+SiwhFgDodFe6rkFdUrF2nF4LC/bfeVCoJANp1HwN/fiDXyEZrt/e9u5sidr1iQMsJIa
	6WuN4mq3Hr3xWlK424KxaP1BOnQtRuJfQv+n7z05qPQoKu4S2op37KsBamKTW8hW5US+zlAiq3Ymj
	q7mRAIcmXlF6o5zMo4j4ZnaeKGu7C+oDGElrrQKqwzrBUkkiSKBFgku6dpxoxSRg0uJTYawT633QY
	LimhENJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78dW-0000000B1tF-3yOo;
	Thu, 17 Sep 2026 09:42:34 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78dT-0000000B1rZ-0qLG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:42:33 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id AD9B11F8D0;
	Thu, 17 Sep 2026 11:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789638144;
	bh=GrKwQSnBM5TlJwrXeIy0ESWxGzkPY7jGMX9Hplkjm+I=; h=From:To:Subject;
	b=EEE1jeZrGpYBbkm7jBaZiYUVn3vsNzRXoUuZhAf67BVk3zc5f9yRT5a8E/Y2PUF/c
	 he/WR0tgGu6vRr6nutCipM6oltnj0DBJGkCJrWiyKJUdCPNDLZJmBc0nUaT5PKhJwi
	 gVDukL/i1IFT7q1lcdTTs++m54HtxP9w9geGUHGYbYzhpJaEGnPaisMIoSID4DU1Dm
	 KiKLuDXtbTJkPWU4duiRl/tO+bgAQrr7aYqW8nAp1SrmH4V/1duZ5+GVwfTkpuBfqX
	 Vm5Kw+9dztp+nvB6kk0H3WiOybZcPIX12ZTfUIzKANJ7wlOBKb2OtWQ63m6RmdfseZ
	 JJvaEhK/jFNZg==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 11:42:13 +0200
Message-ID: <20260917094217.59508-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_024232_132471_9368A5DD 
X-CRM114-Status: UNSURE (   7.90  )
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

Antoine Gouby (2):
  dt-bindings: arm: fsl: Add Toradex OSM iMX95
  arm64: dts: freescale: Add Toradex OSM iMX95

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../dts/freescale/imx95-toradex-osm-dev.dts   |  404 +++++++
 .../boot/dts/freescale/imx95-toradex-osm.dtsi | 1036 +++++++++++++++++
 4 files changed, 1447 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi

-- 
2.47.3


