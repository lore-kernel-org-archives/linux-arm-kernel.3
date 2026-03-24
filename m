Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E902E9A74E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DvJK1euQ58BmCjF2JtjA/A0aPnvcmwVI/8gbFy25IXc=; b=XSFe8S+HnTaXI1fyvb0gtr1UMx
	AC/usDM15iCVk9jNj1MzOHI2lmrXhpETvjn/8JY2dE3MSqhpi745cMib+otK6xi5qEj5Aov5CEqg6
	O2r3Nkto+CNTwX6Y3Bond5O/ETLxvUggw5IXOUcAgm1OsADbyyqnyta8pUAw/ZNEPGaKz3lZYDm0j
	n6XaZq/u8Sarif5nNba9ceGK/eVfuJ1skzBAPrMOUsllF5vZ1QASse0F2mT1suF4uTt1rboPIiEVU
	9hYx7BCTHjBoTHCfoBUholnW/ymZ8TjbYe6R/G9P9CfDFj/IB1izz2dNX70d/bzbM8sJ7O4eHag5t
	ofvqAuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCa-000000016b2-0IAp;
	Tue, 24 Mar 2026 09:37:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCL-000000016Tx-2Wwg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:19 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id ECE28275B2;
	Tue, 24 Mar 2026 10:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345030;
	bh=DvJK1euQ58BmCjF2JtjA/A0aPnvcmwVI/8gbFy25IXc=; h=From:To:Subject;
	b=EWrRR1rQ64mXdW9b1OLWzxTwYbwEDo23+osRAkztOXHmPZUHTgL5qM4y6Q89JJib9
	 Ka1SGHHM1Ct09ehJ/0dIrs6ADh7ZhSdi1Iak5JuB57Jn+TxsogbbFApQ2z/RA6ERCm
	 4cT9u4kY6YiIkjraHtnx4mWMelNG7JvHOsVR8rSnEZ0zUD1saI4bY99sltVuIORkon
	 FZtf9io1D+ILqS3fKXMxKRbChm1px7xOBYOhNBeMKrKKhm97D2FVEuFiZRO7FCgr8C
	 rkFBv0HZG1JwIhgWf36zF5Qr/advNWbGThOd+3aF8W/SUcrspQnp/5U2koOX5I8c0K
	 z5sXvlOwdANxg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] arm64: dts: ti: verdin-am62[p]: Add Zinnia
Date: Tue, 24 Mar 2026 10:36:55 +0100
Message-ID: <20260324093705.26730-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023717_802947_BE5FCE62 
X-CRM114-Status: UNSURE (   7.95  )
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

Add Zinnia Carrier Board mated with Verdin AM62 and Verdin AM62P.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Some small fixes and cleanup are done on the SOM dtsi file, in preparation
for the Zinnia addition.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board

Francesco Dolcini (7):
  dt-bindings: arm: ti: Add verdin am62/am62p zinnia board
  arm64: dts: ti: k3-am62-verdin: Fix SPI_1 GPIO CS pinctrl label
  arm64: dts: ti: k3-am62-verdin: Split UART_2 pinctrl group
  arm64: dts: ti: k3-am62-verdin: Add Zinnia
  arm64: dts: ti: k3-am62p-verdin: Split UART_2 pinctrl group
  arm64: dts: ti: k3-am62p-verdin: Add SPI_1_CS as GPIO
  arm64: dts: ti: k3-am62p-verdin: Add Zinnia

 .../devicetree/bindings/arm/ti/k3.yaml        |   4 +
 arch/arm64/boot/dts/ti/Makefile               |   2 +
 .../boot/dts/ti/k3-am62-verdin-zinnia.dtsi    | 493 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi    |  22 +-
 .../dts/ti/k3-am625-verdin-nonwifi-zinnia.dts |  22 +
 .../dts/ti/k3-am625-verdin-wifi-zinnia.dts    |  22 +
 .../boot/dts/ti/k3-am62p-verdin-zinnia.dtsi   | 469 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   |  29 +-
 .../ti/k3-am62p5-verdin-nonwifi-zinnia.dts    |  22 +
 .../dts/ti/k3-am62p5-verdin-wifi-zinnia.dts   |  22 +
 10 files changed, 1098 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts

-- 
2.47.3


