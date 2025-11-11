Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB7CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2qJKbX9yhTQfJApIzP5fAiLFo+T+Q01E1IdmAI8GEyw=; b=MxyGWUwqPVqFSJGu18XiJ+Ovy5
	TcUUpup8K4y+6zIdFZuwVvbY/zDMgdftWIhRcXdYP9w5s3IvRk/lxr7E+CL9xt/20yCBiNwjv+WZx
	To23dus+nKBdW2rebjQ9t1Z5LZ29XoLNivW23wMafCj4048ccqQ7aVmdxbSoFhLdAqmosEhQD7U/i
	c0ZytJNBlR26hoOp14kVId+Hvsf/NxfvguJLM3cftERylZa/A09I+dni4pw1rSJbukdAsVTcup1PX
	jjZyL6Hz/yOg1WiJvmTPyljoCrRpwUzCYc4Sq+4+MfMVbrl6ORzouAbdcztO+MuxGTnpbYOY5lBh5
	DsWP2n5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIq6u-00000007MzP-0fEo;
	Tue, 11 Nov 2025 15:16:44 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIq6m-00000007MxG-3Tly
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:16:39 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 1A9D11FAB4;
	Tue, 11 Nov 2025 16:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762874191;
	bh=2qJKbX9yhTQfJApIzP5fAiLFo+T+Q01E1IdmAI8GEyw=; h=From:To:Subject;
	b=hGOBYfLLDmyCTyHSpdgREjvwfXirFI1bt4Xl+anOm8WIDE0HMY5hBngM8zNUtP1n6
	 4h8tO7uB1EkyZlCO3XCm0+hd2aQLScYW6cMdzFyrFq6dyCKlw1n1PxcePFeHpM/a+0
	 lbvvct4WWqq1TWTONXbGsgPEmZwhSQTiIKcqfAn9an48S+YFH4C74YKdFNKGgtWNtc
	 FXyyhhrA4jVBryzMekgbkIKGb0TDVbL23AvNUU8gx4IFTyPLFN8/2aig45G4UB/6X8
	 SJ0dccH3MexLc/V7WSHrPZbZhbQHolpv9Pe6OBRvN4Fv+iI3WbWWaKWvVOdAc6PWdM
	 V2ulP8QyEk2bA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: freescale: add Toradex SMARC iMX95
Date: Tue, 11 Nov 2025 16:16:12 +0100
Message-ID: <20251111151618.70132-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_071637_756201_238AF61C 
X-CRM114-Status: UNSURE (   9.16  )
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

This series adds support for the Toradex SMARC iMX95 SoM and the
Toradex SMARC Development Board.

The module consists of an NXP i.MX95 family SoC, up to 16GB of LPDDR5
RAM and up to 128GB of storage, a USB 3.0 Host Hub and 2.0 OTG, two
Gigabit Ethernet PHYs, a 10 Gigabit Ethernet interface, an I2C EEPROM
and Temperature Sensor, an RX8130 RTC, a Quad/Dual lane CSI interface,
and some optional addons: TPM 2.0, DSI, LVDS, DisplayPort (through a
DSI-DP bridge), and Wi-Fi/BT module.

Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit

João Paulo Gonçalves (1):
  dt-bindings: arm: fsl: add Toradex SMARC iMX95

Max Krummenacher (1):
  arm64: dts: freescale: add Toradex SMARC iMX95

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../dts/freescale/imx95-toradex-smarc-dev.dts |  277 ++++
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 1155 +++++++++++++++++
 4 files changed, 1439 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi

-- 
2.47.3


