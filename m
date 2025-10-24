Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84971CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5z29d9Nasu98bW6N8tJSBPookct1TNtx6qJSNSczmPc=; b=sFMWJkHcJuhPIi8h+tZKsbvDYb
	LZNHXjuJJzYDjcgzlo7UNXbcJm5rg+CXUiJQ0JLwK69ncXY2LSv0xdOkeh2+IzkAU12NHP1BGjRVs
	59rthkXozxIN0xSI2lLktsG3Bx2Bn2nGZYVK2qAm5HqNARV4RY2/mxmMDI0ci2dLVPTOZtTwrwV7O
	3PPQskjvVKAGsPxmfdfeHD6KChsUT70USdEBj4Lu2v6FbNblYXEV/nWeVP3wTPIwqw2aDTTgqDG3s
	h9VQIpL5yQTqZYbbbcpm7GSS40tBcR4UkaoDH6GCPbI0MzywFN0Op/a/QUuYNo64S3k4HaFp6wJ7S
	pgCnG4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ6u-00000009iGK-2ggI;
	Fri, 24 Oct 2025 14:49:44 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ6m-00000009iDQ-2MEl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:49:39 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7B3E225C72;
	Fri, 24 Oct 2025 16:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1761317370;
	bh=5z29d9Nasu98bW6N8tJSBPookct1TNtx6qJSNSczmPc=; h=From:To:Subject;
	b=lGbv1+pSdbYu7m8C+Cp47kBpc4GA3KZQOiGNhIlEp6qHmFEuo6tZ3C8hePphMhMtV
	 dh42HjCbyynOjErSxlQmEL9V2fzncoo8qe/ORUN5/OAu7i02VaXeftZtpyieBd9BAX
	 HqjrhFIlbjOEkNyApSXnXf7OENu+TOuK7mO7UHuyJNuU8QFztHWNcb6/ObQip2+XY8
	 DB/ZMhqr0vn7a4aWltzR0qJMGedHU5082MMBT5b0/jlkkmH5tIA/kXazZFmJC9OUnD
	 OL2pXksmXi+LGz8JTz/hg+RWyDQMAgeBtky/En+mJudMenksQUiFs8nYoVRW1nkzqh
	 weCbWVtywEaXg==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: add Toradex SMARC iMX95
Date: Fri, 24 Oct 2025 16:49:19 +0200
Message-Id: <20251024144921.77714-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074937_650271_9EEB6AC7 
X-CRM114-Status: UNSURE (   7.80  )
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
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 1153 +++++++++++++++++
 4 files changed, 1437 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi

-- 
2.39.5


