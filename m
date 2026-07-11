Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rj799asYESt2ZmvriKsA91s4jrkLenTh+VOfuk6Qwy8=; b=jspVAORjPxEeM4X1guTwT/o6UG
	i16j87TJqRv7Ftinmn7m+LCcEzm1/U4bO8gHSjiLlUf3rI392c3AY4Rtgtl+33WhjQnXJ6zWViQEU
	QAT9PQN192E7+xutxyNu525ROawLkL+Qncu9PPbgt1x6ECoY06yqOlphJks9Rcmibo9axrdwXmr7B
	bYnxfAVoOwjQKIo6XbsjxvLrSr1/6eEw4y23gRT80ARJsd6l9HsZFj0xH9OHYw78UTzfPvKhBK2yI
	8iHZdfEYepPOVhcczD/EbibzUVLtLSIge53q9EJanUxBWk7Ih1uauLKwfpgMtwTwtp/p79fbTB3mk
	T2A2q+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepn-00000006t4I-3aQn;
	Sat, 11 Jul 2026 21:02:03 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepe-00000006syU-2X77
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:01:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0EDA11955F;
	Sat, 11 Jul 2026 23:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803706; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Rj799asYESt2ZmvriKsA91s4jrkLenTh+VOfuk6Qwy8=;
	b=caKqo02Xhwa5z3geI79f/1mpYhZ8RaxILEV+m24lrur9xhFIWkYGbtXT4N2ZDOi2WEihi1
	/eT3e4HNKMxb8p5u19XO0y0YQ/JCH8axaTWfEB+b8PWbIXHY7FgcNNg9qsjT880iVGupwj
	b7riLwpThRoOXlpF2ZaXBU+ZjKV8obL/lqBtQsyiD8DNlZLdbu5u7z6ej3EDqBZ8v0wQGE
	bkL9PvjjFUow6Gs9DNVVVMCTm44vKenFMxgC8GId2NH2UsYrUaT1woqq4Rf06cH6MLXhii
	gRqZGMOQfLjA3rlRIuOhhlfpB/3kE6cHXjC9mBdkXl5vu/+SrrS+q0a6AgZ0Zw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/10] arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
Date: Sat, 11 Jul 2026 22:59:29 +0200
Message-ID: <20260711210131.236025-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140154_825904_9ADC6849 
X-CRM114-Status: UNSURE (   9.29  )
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

This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
STM32MP23xx SoC.

The SoM contains the following peripherals:
- STPMIC (power delivery)
- 4GiB LPDDR4 memory
- eMMC and SDIO WiFi module

The Breakout Board carrier board contains the following peripherals:
- USB-C peripheral port, power supply plug

The DHSBC carrier board contains the following peripherals:
- Two RGMII Ethernet ports
- MicroSD slot
- LVDS connector
- MIPI CSI2 connector
- USB-A Host port, USB-C power supply plug
- USB-C / DP port
- Expansion connector

Marek Vasut (10):
  dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM
    and Breakout Board and DHSBC
  dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
  arm64: dts: st: Fix SDMMC1 indent on stm32mp231
  arm64: dts: st: Fix SDMMC1 indent on stm32mp251
  arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
  arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp251
  arm64: dts: st: Add OMM node on stm32mp231
  arm64: dts: st: Add pinmux nodes for DH electronics
    STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
  arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx
    DHCOS SoM and Breakout Board and DHSBC
  MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address

 .../devicetree/bindings/arm/stm32/stm32.yaml  |  18 +
 .../bindings/gpio/gpio-pca95xx.yaml           |   3 +
 MAINTAINERS                                   |   3 +-
 arch/arm64/boot/dts/st/Makefile               |  10 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  86 ++-
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp23xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    |  51 ++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 564 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  32 +-
 ...mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso | 111 ++++
 .../boot/dts/st/stm32mp255c-dhcos-dhsbc.dts   | 189 ++++++
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp25xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    |  51 ++
 .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 442 ++++++++++++++
 16 files changed, 1601 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi

---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

-- 
2.53.0


