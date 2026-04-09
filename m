Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8754CE98FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A2mqKUW1SyP566v1hAOfRogvg2iqOsrakCIZpNHok8Y=; b=nAQi/5smWVMnitVoUKwxHfBnnz
	XFYZ9Kgci5TUjiPM+x3wn/cxfUOzE0xufHZq3KDzOcAhnaDw4W87Hs2Cs0PXhcChD5WmRXnGxzJJz
	kJeH0OAFuv0I5KfSYDZHiUGScCC0cDLe9prUGM+k8Cb7xZvE3gGdzJS4tDBAnF782E78VQv9VBuWY
	LnmeET41UYsuoT+5318L+KiohonHFn+Gd86hdURZtY8Sj2nRhId3cdilrW7s5/4Y61naI8TQBtBm1
	7vNY4KU3k+o6rJpR2SY23R/TKzl5etxSiEiNJ7HvCErZUr9rLRlUIqSt3sBonw+6fADqmFaoA/dpc
	fLTy5GEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAK-0000000A6QT-1FSM;
	Thu, 09 Apr 2026 09:59:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAG-0000000A6Oq-2EpE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:59:10 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B46C51FBD0;
	Thu,  9 Apr 2026 11:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728746;
	bh=A2mqKUW1SyP566v1hAOfRogvg2iqOsrakCIZpNHok8Y=; h=From:To:Subject;
	b=sNlBByWS54nX5Q5f6PTY1jIzEHK5tYu9uG84nhF5FbF3e+RiJsGbDP/AIGlv8Al5D
	 AIJpyrba6/exz4KLjVu9S2VRpa4DKdmFB5yVNlfVKe8hnSs9oXRIzpihBSa4QLwMHd
	 6G4ABbfO2fY2obiD9jjHkFXGZ8+Gi8U4VbxWl5+AZ1YtvvufH8PgRdGcfwtEBmBygC
	 1dgwwNev+5N3sB/rPDfdMYx+GnJexMESOQY4B3YGgpTFpzy3MgaZMoPhhHbf4Q0UB1
	 Q+G6RAAi9iNp3OaOt8b9hODHS3GPLWeRzzGGyMkE5iVb4fEVpsrdajr2fnrG6jgMNC
	 D1oZlU4/8PzKQ==
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
Subject: [PATCH v1 0/7] Add verdin imx8m[mp] and imx95 zinnia board
Date: Thu,  9 Apr 2026 11:58:46 +0200
Message-ID: <20260409095855.61252-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025909_190536_DF9C33F3 
X-CRM114-Status: UNSURE (   7.13  )
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

Add Zinnia Carrier Board mated with Verdin iMX8M Plus, Verdin iMX8M Mini and
Verdin iMX95.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Some small fixes and cleanup are done on the SOM dtsi file, in preparation
for the Zinnia addition.

Shawn, Frank: bindings/arm/fsl.yaml still list Shawn as maintainer, maybe
confirm that this is wanted.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board

Francesco Dolcini (7):
  dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
  arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
  arm64: dts: freescale: imx8mm-verdin: Add Zinnia
  arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
  arm64: dts: freescale: imx8mp-verdin: Add Zinnia
  arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
  arm64: dts: freescale: imx95-verdin: Add Zinnia

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   6 +
 .../imx8mm-verdin-nonwifi-zinnia.dts          |  21 +
 .../freescale/imx8mm-verdin-wifi-zinnia.dts   |  21 +
 .../dts/freescale/imx8mm-verdin-zinnia.dtsi   | 383 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-verdin.dtsi     |  16 +-
 .../imx8mp-verdin-nonwifi-zinnia.dts          |  21 +
 .../freescale/imx8mp-verdin-wifi-zinnia.dts   |  21 +
 .../dts/freescale/imx8mp-verdin-zinnia.dtsi   | 422 +++++++++++++++++
 .../boot/dts/freescale/imx8mp-verdin.dtsi     |  14 +-
 .../freescale/imx95-verdin-nonwifi-zinnia.dts |  21 +
 .../freescale/imx95-verdin-wifi-zinnia.dts    |  21 +
 .../dts/freescale/imx95-verdin-zinnia.dtsi    | 429 ++++++++++++++++++
 .../boot/dts/freescale/imx95-verdin.dtsi      |  18 +-
 14 files changed, 1408 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi

-- 
2.47.3


