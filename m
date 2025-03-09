Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93613C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3IZp5z7nS232anPaIUnFqLxoHjUC4RU66ewstLpUgIU=; b=YhaeDbg51g+Z/4+FNm1qxvecpD
	ruN8jMpVmniwvtJ+ivvQX3Q8KNQFUkadsmL83zH9pRGdlHUrNWgot9Uw78ltXTeB5SlX6DwFcMRHw
	dt/A6F/nnCktedBQlRxuaVFibFNt3+eie5uzlOfMmTTUtGgYDhltseEq0lkD4Fe1C4+BUyPwqm8Av
	H0vop9Uu/8pPhMHk23FrAWlf4bgksijCPXdmFEsji7asExQcgZ3gN4poyMMWIo6UNlOYb0IP6kYXq
	6v2INooY0rqKVfqKBiJUXTsMZwTAfgYY8b5HlxQGSyBut7tr971BvZ0UiRVT9Lpol6JkZfK1c6w7k
	vrBLhDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGlU-00000000amx-2mfY;
	Sun, 09 Mar 2025 13:32:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGjr-00000000aQ8-26AN;
	Sun, 09 Mar 2025 13:30:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3213628f8f.0;
        Sun, 09 Mar 2025 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527038; x=1742131838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IZp5z7nS232anPaIUnFqLxoHjUC4RU66ewstLpUgIU=;
        b=gdzzBkz3eWkSUHlf+3o8o4Es3FC3s73Doy8Mewi64X0zn4zXtcH5vc1jNQzKXvVOGT
         2/kyDBX9viONm1CgenmoIM0i+iU9OZc82PO+xc08ze9h9U5x/6s5m0xcDqEtoDJt6Y3l
         B8PwTEV2N97FMUY3/rGSdPKQqxnYG3Dole9wP2cLoVrlarIuyYGQS/Uhd8oF2BflF9cC
         bwnpEpllZqaEPcMi1J/e7OUPL8blIini2BgULj/nn+ey5D2SptaXQ526+7Sb9/0vNOq0
         Yxcj4wg/CwvHWX1IROZJdXRHUISZCvzojtdI7PvNYuaGvSeCTXKa5e10LHkHRzbGt4Zg
         vtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527038; x=1742131838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IZp5z7nS232anPaIUnFqLxoHjUC4RU66ewstLpUgIU=;
        b=oZ+kJ1Wv39SeEtBE9epE3SOS9UIcJdXeLWeJ5HwSsCQmuOYNK7b+S3SQgCYsqAZjl+
         /xmzBONVpvJE1dyuYpHk2gjgKY8903W17fpgFJy33AzhtbnU/8PdLj7/tjOwf7Ui2Uv1
         +Qbm86qOFzvB1ukRYNwxHz7rfkmLkn9jd2fpV/sHIw1etW9ItYJcgdoPJW68MtnYT6Ty
         5xtxaesnEvR4Xc7kjIGICzYiRPgg0yZfSbuYvWpbIWCJqYZuAFTzVfv/od8AdAx1+W1o
         LGy8tuYelxkODXJQSHQLuPgFL0BEAIFnZgS5Ol2Zr1I2zuZU24lf3DXIWEPZye1fazC1
         Em5w==
X-Forwarded-Encrypted: i=1; AJvYcCV99W6gErpkYTNZn7mCr0fqYkLK+XJCorXJFiSKaQT0yoYjaDh7HtI0qZGf8LJx9oFjHWVT7RMt+mYY18q4gfU=@lists.infradead.org, AJvYcCVvQ2hc5hq6psCVhkYgoTnd94HlbyArPaulWBZb16hGWDg/oRfi555LjqUQMZ55xsst/RLYzvVERUsa@lists.infradead.org, AJvYcCX9I9Eh5asEuS5oyHZXPEh0DnyhIlS//bYCjNykaMoLU1MCcZ0hE0H1LtHBqDNT/3C00MnnN4LLiW3rbYj80ODo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3IBBBjgfIR43mgXLr8Xgdsori+Nq6KROvVV1oqCk0fB7gfYMP
	BhMU719ty0cfYwJWrjRiTnfpZMDG6R86r2869ZpoInxN2a+h9H6b
X-Gm-Gg: ASbGncumVpezYU74CeFwXv5VG/SaNzHpDCXTXk/v56JOyVNS5nIBMCDJgkL2UzmLy7x
	aXx8k2QyjsOyVb41qapAYmsnw8U+ngE/Raa/kGgFBn82KNFMc8DpmLusi8NAWQDqUbl6l8F/gv4
	8WhwCKNE7UppcVxyptngmmVzkQMN+8G1cgUYgFRfxatdYtE2zQDM1bzt9wou5g03OApiU1Ck9ZN
	IJ3Ji3u8GdSXDGc0keXPFTMTAE83JEnpzBx/6s5XC68YbAiA/PVME7S3zv2y+jLmAuUnKmKNgOE
	KBDiu3oiRFdb5btouYzn7Ae9Fwd95LXCqS7Gzdn04TZg2oHqsMFdKihXRD1OlMvSNBIWhIuMR2N
	PeJVMEVeCUHfmhw==
X-Google-Smtp-Source: AGHT+IEg/pmtwT7lVJCZK8BpVYZB76uZfLQXRI3/kWO/yuj5TZlAaT7OiGF/3WHcicI73lmrX/qPnw==
X-Received: by 2002:adf:cb01:0:b0:38f:3245:21fc with SMTP id ffacd0b85a97d-39132db1fdamr6602070f8f.50.1741527038019;
        Sun, 09 Mar 2025 06:30:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 00/13] airoha: en7581: clk cleanup + USB support
Date: Sun,  9 Mar 2025 14:29:31 +0100
Message-ID: <20250309132959.19045-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063043_538288_406F383D 
X-CRM114-Status: GOOD (  19.04  )
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

This series implement all the changes required to correctly handle
USB support for the Airoha EN7581 SoC.

The first few patch are cleanup for the clock driver and the
introduction of the SCU SSR SoC driver.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

To correctly handle this, the SCU is changed to a simple-mfd
implemenetation and the clock controller updated to follow this new
node structure. Both implementation are supported to handle old
binding.

The xHCI USB is based on the Mediatek implementation but the PHY
handling although conceptually similar, is indded different compared
to Mediatek due to SSR checks and different port power up.

The SSR driver expose an API to poll the current status of the Serdes
port and the USB PHY driver validates it. Refer to the specific commit
for additional info.

Consider that there is currently an inconsistency as AN7581 and
EN7581 refer to the same thing. This is due to the fact that
the SoC born under EcoNet but then was acquired by Airoha.

Christian Marangi (13):
  clk: en7523: convert driver to regmap API
  clk: en7523: generalize register clocks function
  dt-bindings: soc: airoha: add SCU SSR Serdes port binding
  dt-bindings: soc: airoha: add Documentation for Airoha AN7581 SCU SSR
  dt-bindings: mfd: add Documentation for Airoha EN7581 SCU
  dt-bindings: clock: airoha: make reg optional for Airoha EN7581
  clk: en7523: support getting regmap from parent node for EN7581
  soc: airoha: add support for configuring SCU SSR Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: airoha: Add support for Airoha AN7581 USB PHY
  usb: host: add ARCH_AIROHA in XHCI MTK dependency
  arm64: dts: airoha: en7581: convert SCU clock node to MFD
    implementation
  arm64: dts: airoha: en7581: add USB and SCU SSR nodes

 .../bindings/clock/airoha,en7523-scu.yaml     |  13 +-
 .../mfd/airoha,en7581-scu-sysctl.yaml         |  68 +++
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 106 ++++
 .../soc/airoha/airoha,an7581-scu-ssr.yaml     | 106 ++++
 MAINTAINERS                                   |  15 +
 arch/arm64/boot/dts/airoha/en7581.dtsi        |  74 ++-
 drivers/clk/clk-en7523.c                      | 258 ++++----
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  13 +
 drivers/phy/airoha/Makefile                   |   3 +
 drivers/phy/airoha/phy-airoha-usb.c           | 554 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/airoha/Kconfig                    |  18 +
 drivers/soc/airoha/Makefile                   |   3 +
 drivers/soc/airoha/airoha-scu-ssr.c           | 195 ++++++
 drivers/usb/host/Kconfig                      |   2 +-
 include/dt-bindings/soc/airoha,scu-ssr.h      |  24 +
 include/linux/soc/airoha/airoha-scu-ssr.h     |  17 +
 include/linux/soc/soc/airoha-scu-ssr.h        |  17 +
 21 files changed, 1355 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-usb.c
 create mode 100644 drivers/soc/airoha/Kconfig
 create mode 100644 drivers/soc/airoha/Makefile
 create mode 100644 drivers/soc/airoha/airoha-scu-ssr.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
 create mode 100644 include/linux/soc/airoha/airoha-scu-ssr.h
 create mode 100644 include/linux/soc/soc/airoha-scu-ssr.h

-- 
2.48.1


