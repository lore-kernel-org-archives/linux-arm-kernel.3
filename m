Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F2DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NwD4Nh6jVsTYRhYeDtluByQtXRpd4fuJ0RlrPGu+G7Y=; b=ZuKsSkzffjGCg5fpLVTaMD7mHr
	mZe1bZ5OxDPxy3VEcRWmMMeI0Hg6udMPRkvF1as4LPouAv+rtsDh97OmgaAW/+0lda4XYJerSPDQH
	JkwCDqkyEQVQA2brVe3mN3SAYk8vvB8RxVHmZhOy5K1HZbRbhTbqSZ+0QZwzOF0etOAl7w146Nyof
	Xp0era3wtGfwRDvrSIf4mmXSrD+2K3nhYf5tBW/bDlqTP8lCiXPz8D9ABIVbWdybkSnDpDZsLnkp2
	UANAS85ofiufUEz+54ZjedilWhAi4mEhQ9ZDdaqiqeDfuIQJ2dLA8cI2yl7p/Q7AtHzqFcouOWfUv
	+GJFMoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkL-00000006Cjh-2m5L;
	Fri, 03 Jul 2026 06:51:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkJ-00000006CjM-2a5v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c1268f71572so196483266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061489; x=1783666289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NwD4Nh6jVsTYRhYeDtluByQtXRpd4fuJ0RlrPGu+G7Y=;
        b=b0qXOHs+fPHEyP1CPZ4//j0R9iLuB3q4k9WS13uNgXRXfYksTl0PGvnS1Ju43kR3H9
         OwgQeZEDW5R4Iqh11YbewBEaU5VB1sMzDhLq3+uGWGmWz9gwQtcVOg27CKlDOy7Ym0jF
         EDnw/vV7AxQJTQrwMPUejBkhg58YWqZ8f+W5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061489; x=1783666289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwD4Nh6jVsTYRhYeDtluByQtXRpd4fuJ0RlrPGu+G7Y=;
        b=cbHmIvwP7MTt7gFD19QxlxvpTCyh/IgO9UrZKQYl+Uo7g2FBpU1dCe6OgX1coXgZD1
         q+5tTFH8hySLplLANJOLKztQUAt58Z/vF0xA2MUZvLfAxq2mUJzDKxexkrVmD3iHvsaB
         EQtb/s6bwmg7qoyYFeLdsW5ucXfClZwzdGBYVBiPutqGRiaDj0yj+AOf96qH0R+XUR/G
         JvtvywzjqrbqvYiO+Pxd2e4UmlpArH6qt+CHAq1eXUEvLFgjkPvV5g+GryKtaBu2YeE1
         fXo+M4Hv+umg/MSrM3WvQ/Sr3Xqjdkb5Xg9ZwmBZxkuZoaLSvoP1X9QB7UiEqDMJDExi
         jQUA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh1mDumHKsAsEIpHiYETBD5hv0+p+E9gbRYomTmphA4BAbihjzI8rs+zCgWsGwdwx1A4nm2OVbIMlih3d/1/HI@lists.infradead.org
X-Gm-Message-State: AOJu0YxydcNAnPcVx3+hwoVyNcOvAx69b0AgcUfWqqtBAsFIHqCgwMXE
	ZF5hK2wHi+QhFmM79A3Zi4pLKvJh+g0pNeyG8xR4enYHail6O0J1xwbtclKp3bWMSVI=
X-Gm-Gg: AfdE7cm/GcjAEr0XX/FqqlUMTOuPnzhpEaB308utnSlUfkvCAgRpAituwPFJKXgKo/i
	qvA8zuQAgun5Z7NJwzOcejY0vZtyM0UFk5cickSv+vC4M4ETOff0jQn2AOztmoDt7CT5WxQ3QWh
	cPIK7kmgxNyPSz7K6HqnBcww7Y3biOXA+aYnRuepwRZwBkm8F+WZy369FED9L8g8vIDYFAzp1jG
	/rXeXTanXuOZhp56gNpYu4vg7bHhuA+XaE3ie2bMqgotK6Aq1X88rABhJlZPmNAdf0SLlSHjRfy
	rVvQGjFCrQ2G6/ZmZn8OPXN+eNxhTqek2tdHim+OC8cqtlcazQZvzb3tem/CJqoxDGBsW3Ix/az
	EdmHBcL8NH4iw/R042FYk7zX6UHSusSFF5eaKpRAmZu3+YcXHkXkPWIJllVKUVuEYVjGXwYVaEy
	QIElrK2tN7QdnOO2t50IcT6wT+foorM/uTgSZD7iRxlNRzDTbuGHVQiofi6BPlJC8bBgusUfagH
	MBbNvQ+iAA=
X-Received: by 2002:a17:907:c518:b0:c12:b0b7:def with SMTP id a640c23a62f3a-c12c9d6bae4mr133100966b.14.1783061489011;
        Thu, 02 Jul 2026 23:51:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  3 Jul 2026 08:48:50 +0200
Message-ID: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235131_692079_D4C568C4 
X-CRM114-Status: GOOD (  15.37  )
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

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan to patch 10/16 "arm64: dts: st: add
  sai1 pins for stm32mp25"
- Switch CONFIG_I2C_STM32F7 and CONFIG_SPI_STM32 to modules in
  arch/arm64/configs/defconfig.

Changes in v6:
- Update arch/arm64/configs/defconfig to match the current upstream defconfig
  after merge window changes (no functional changes).

Changes in v5:
- Add patch 2/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
- Add patch 3/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
- Increase slew-rate to <1> of ltdc pins to support the 27 MHz pixel clock
  and prevent timing violations.
- Change SDMMC2_CK pin bias from pull-up to bias-disable to avoid signal
  integrity issues on the clock line
- Fix touchscreen resolution to 480x854
- Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi from stm32mp257-engicam-microgea.dtsi

Changes in v3:
- Add power-domains property in the SDMMC2 node.
- Drop patch "arm64: defconfig: cleanup the defconfig"

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"
- Add resets property to dts CAN node. Suggested by Sashiko.
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

Dario Binacchi (16):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: enable configs for Engicam  MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  17 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 9 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
branch: stm32mp257d-microgea

