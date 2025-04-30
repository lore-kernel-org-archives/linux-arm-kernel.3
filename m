Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94CEC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EMGjnsc+8iqXvQ2qqPAhoADqLsaNBDLsEh9Ky/rtpOA=; b=hoYJ95USNEfkS0xrWPWYlXdi8J
	LtxZnN9RqVFzwAHfiwewDDFi+5MeRS1YSmw3HZYL5UUJ8dRI/G10YkwuU6+ziinoWNXuWdaYC+s1c
	VcvBcnyDFR5nBs8S+IJM6ufR90Vkkrf+W+gOurnAidCnulUbwytC4wmI7pxyrR/GbEaXikJ74jZQ9
	Yn3uCGF76Fyp+H6ZOC0s9mUlrDoRT71nvgIr+j/WFtCpeMbhKhl92mZSzm4kP0JI3bqFcw8IthCsL
	uC5fJ4Y3MkvBKxumIgGTkdnhVCp9LJVcHHuNyxrzbQsna/iaHBKCWBiu+Yg+kG/JfsfqHnGF/PHxj
	ZnxKfdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA56X-0000000CbWl-47BH;
	Wed, 30 Apr 2025 10:55:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4g4-0000000CWiJ-36dP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:28:34 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E09891F9E3;
	Wed, 30 Apr 2025 12:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008911;
	bh=EMGjnsc+8iqXvQ2qqPAhoADqLsaNBDLsEh9Ky/rtpOA=; h=From:To:Subject;
	b=DFpCSoMGYXorLahnuRX+J/LmVryubrJ5uEzrpcoqHtlnQ0jApUFc1cu/gEEojY3dz
	 GomSTzlAWjaKItoEG+SNsRQ4I4aNxiXhDDo3G+L6L4jcrKeCQvPUbVnt5jGZA/15Sw
	 pi7k/n3Ls0+Alt6ZykILuj3TW5QpaIlo8IDsE1eZzNJfNvB9Bne+bjci/F5PE8BGmL
	 tEvxU+N1/diklj2GPEWqNP1IomV0HBa6hlS6zldbqNW+XmsHtGuI3lXaimJby4/+5W
	 DVwt61Qq94s/PNaSsubcRDi3CDQFS7ftvJRzfLru1ewa71859xkbsDmX4D8hQfZ5EA
	 r2o5Xh1bozyHw==
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
Subject: [PATCH v1 0/6] arm64: dts: ti: Add Toradex Verdin AM62P
Date: Wed, 30 Apr 2025 12:28:09 +0200
Message-Id: <20250430102815.149162-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032832_935734_C3E23212 
X-CRM114-Status: UNSURE (   8.69  )
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

This series adds support for the Toradex Verdin AM62 SoM which can be used on
different carrier boards (Verdin Development Board, Dahlia, Yavia, Mallow and
Ivy).

The module consists of an TI AM62P family SoC, a TPS65219 PMIC, a Gigabit
Ethernet PHY, up to 8GB of LPDDR4 RAM, an eMMC, a TLA2024 ADC, an I2C EEPROM,
an RX8130 RTC, plus an optional Bluetooth/Wi-Fi module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p

Francesco Dolcini (6):
  dt-bindings: arm: ti: Add Toradex Verdin AM62P
  arm64: dts: ti: add Toradex Verdin AM62P
  arm64: dts: ti: am62p-verdin: add dahlia
  arm64: dts: ti: am62p-verdin: add mallow
  arm64: dts: ti: am62p-verdin: add yavia
  arm64: dts: ti: am62p-verdin: add ivy

 .../devicetree/bindings/arm/ti/k3.yaml        |   24 +
 arch/arm64/boot/dts/ti/Makefile               |   10 +
 .../boot/dts/ti/k3-am62p-verdin-dahlia.dtsi   |  228 +++
 .../boot/dts/ti/k3-am62p-verdin-dev.dtsi      |  245 +++
 .../boot/dts/ti/k3-am62p-verdin-ivy.dtsi      |  629 ++++++++
 .../boot/dts/ti/k3-am62p-verdin-mallow.dtsi   |  213 +++
 .../boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi  |   15 +
 .../boot/dts/ti/k3-am62p-verdin-wifi.dtsi     |   31 +
 .../boot/dts/ti/k3-am62p-verdin-yavia.dtsi    |  219 +++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   | 1405 +++++++++++++++++
 .../ti/k3-am62p5-verdin-nonwifi-dahlia.dts    |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-dev.dts   |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts   |   22 +
 .../ti/k3-am62p5-verdin-nonwifi-mallow.dts    |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts |   22 +
 .../dts/ti/k3-am62p5-verdin-wifi-dahlia.dts   |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts |   22 +
 .../dts/ti/k3-am62p5-verdin-wifi-mallow.dts   |   22 +
 .../dts/ti/k3-am62p5-verdin-wifi-yavia.dts    |   22 +
 20 files changed, 3239 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts

-- 
2.39.5


