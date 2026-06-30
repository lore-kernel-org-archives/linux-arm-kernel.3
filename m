Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0973C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=; b=yeEJQk/T6F1eCfvGAhPszHOIqU
	ZyCtyZrZfBT/fPUyeT2Bsmn82iyI5pCWAukhFoTgtyXB23thKLvmoNNglE7ieNuzuMToc4+ozXVJK
	zw0omrivGq3qNLKovi9hgrPuozcUrRTyHokh8dFPiEdBNPhNF38a5LNP6RWjQuzCL8stkrpa6Psmg
	IC+Tuu4yPDj2lYrFD5rG4Lm9kpszzvVAkmZaDEq7SHDYtJPfTJiRx20dzkFFFpK+Zf5EdDikbo365
	gskI8e5d2SOQOfaFrI3fVA6kzgtKrnL6oWA4jiyuBVz9Om4UOfKEiX82z5jPJwwYQHW9uCGyYVFbB
	s8LaaH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkC-0000000GPnb-0kbu;
	Tue, 30 Jun 2026 09:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk3-0000000GPcn-20q7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=; b=pH2e5N+hFbNieZuYqRT1882sYy
	Pxq06XdAWthoVeDd5epGwr6oqjLJ/quyUFpxJ03c6Vlxh1+/lFothj3NIORg00/QZW4J0rXuablpb
	Uxl5AWqKEcLalF+tJt5iiSFEY0HvSFYrgC+CxR5xRUhekG1KQVU9hCnNcNR3Lqg5ssTnaphqFB9Z/
	d2v4LcaNHZ5ITwkHGpjo/tBpXpmNMKKc3s0cAnaOiewTKeMr12D+CbOMCcx8bTcuHGo3/qIA438pS
	2JHH+otye1IolgvYtIexlQMDordUBVq1Yx8dptnTn9PxdAu0/PyIkteL7a5dPa9UZU7EUZfbDrWaQ
	enaiCMSA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUjp-00000001hvA-0A9p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-473dc4cf238so1172133f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811597; x=1783416397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=;
        b=hGk4KkEdqAGDU0hGM4s5NfOLQNbRRYnidHzuaxdcGX3xJhkdmr871hn/AwCy6hpOHf
         2YeAPfK0ka3sfgp6X9rPM+oncDPZgXumT8xD/2Z+9mZPSt2xDpkwcj5IYUgds4QT7ffT
         PqFcFMly3RlJCRgV+nY+CPObCVPu5ZNJo6aXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811597; x=1783416397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=;
        b=r/Hb76D6NFtIkJ4MpLjVKZGQH11Gjrdrm5rlp10QkSc5sD+52gQ7S4zmWmjALc21xu
         drLje4WzdWStepE38qzrKif1F7cNqhtu4J/zdNsQ8tdpGczE5QTyQnRB/JdM6fME63ae
         10Jwmy3VVwI0z/Qy2tBdKG56op9bzcfKmzBKOv/6Zipkjrq35ystig1U4c1aczReLRfV
         229BW/DMlMmp0y4puh6WgzbQQtzI1+SEAVk5Qi3B+nUh/QA1MUNRX0ZUFkR9Y8slau9P
         s5PZH3yD8H2Z55axzsorTwGOqR/tFb2X67xHe/aa7trejgKQ4mZI6IgVUO0TOTdjsR9m
         LqVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrVrmHOXyIlV2UXNSBnu67kbXOR1aBF3wm7bCbo7ecRMRfxfZyElGg8iIMy461MVImPlAfgPlCM4cXEoyzTeEi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4KibclJ/KPYPhty3uyiw2be6Jy58Uac20XX3jWNlMyz9dRgU
	2ufF05aqLosU1PFs9daJRWwSMnAWXYfSrO3miFzMujiMNaPbyS++38yjILzABO5Btc8=
X-Gm-Gg: AfdE7ckUtRHfkJgewd2Cx0GqGDj8atyUPA7Aru2AqswvQLarAefcFZdRq3aCVV+0OZ9
	d7DsoKmlAAFZFbk6/0YtOR/PEOIrur7h7t/O72ROURvUEzyBwxMwDNCGYRi9JthQzZZbzuEU2U9
	l+U2CqxukTADrNQ3ldgw8TfQ9F9yUKo4KtrNZfvvvzMWPFBroURnv5lPiCnFDQjIpoipx1mX7Z6
	YPYH1EyUdIdPmDhRqHLWzkCr4n3xG0CH+wV2bujsII4dbR+P7CgP5IG+eJMJAzfYsFbtrEpgdJz
	HYN9Zmx1hl9iQgo9dBX8KOXZ6Sf0YiNzCKGRVibXunOraBZz3QWmhmHwnKu9Otz0jIMUAyzSEO6
	plAk0ZBRCfifXt91MpMpfjK3XHhynnE5un7F86QUdIJL0/C1pkAti4j4NY3uXvNgQjyhG/yR5UW
	1ctmNL8cANEC0vITPB9+wwzg9JCUzXD9pNd38xQ1ZNfwuRKkrKQ7Wlay/KsKYC6x/j35es0Ause
	iJXY/I3ujoe4bfemeUCvtN2GE6rvZU6waj7gsB98I+SlQ0qcjQxPZq2F8/fbrJfG/dK9/aax8Co
	pCTBMJJ62mSiEQ==
X-Received: by 2002:a05:6000:298e:10b0:470:13e1:9904 with SMTP id ffacd0b85a97d-47550ac1013mr2447885f8f.14.1782811597042;
        Tue, 30 Jun 2026 02:26:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v6 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Tue, 30 Jun 2026 11:24:29 +0200
Message-ID: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102651_061307_E8E6BEA8 
X-CRM114-Status: GOOD (  15.30  )
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

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
branch: stm32mp257d-microgea

