Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981D0C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E4jlgljNt40Vu2CmEv7FaT2u7xedRKcXuIPlI99mDNo=; b=UTLd2CBF3wpsHp0T+KkCwiw65G
	TNHzH21DfGqA0iVvXLs2d2NHcYQxoM5KZHWW4UAoPjZkIWc+Uwcf/fQh0jGnNXX1JDThVnzaYpXO9
	gVww75Eak9fZNUjhJ0IPoEoBmi4t31TxuGhw0i9rbrVQgkR9NCpjALsboNTgTE38L0Yu86uWJtIjz
	AVToZtJwOH/3AIdZ3/Xj64YKKBDIBwI3QOkyil4NFeGM4ZzMBduyPDnVo4I9aItPsOkFxSoNz0Qn2
	IIvk/iZZlYpUiDjEsyKyBRIggrNMhzY1qP9eJuZDFf4AgJVUeHWKHdYXr8i/uN9olo+amvfGxhJbY
	E6YrQjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFbM-0000000CBUB-2EiJ;
	Thu, 20 Mar 2025 13:06:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWa-0000000CAYd-1AzI;
	Thu, 20 Mar 2025 13:01:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912baafc58so630147f8f.1;
        Thu, 20 Mar 2025 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475686; x=1743080486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4jlgljNt40Vu2CmEv7FaT2u7xedRKcXuIPlI99mDNo=;
        b=mC2LePZSYOx9qhJOwj+O8/Te3QqZ6+m9ysU2v5Qzv+TbZ2mrzbVO673f/WfvK8Qwo2
         kTwNUCjewOnuWIunQJzmiY9ovbiV5m1pN8ACuIuMY3uvyZW8GkUurRxEoRnPjxOQHu3/
         FFGMxWI4KQfwhKLP095vatcGtuI1xJbrnwP9KqHwUAkJshw4SisHlbC7eeslfXhldxos
         L9ITOzzymAnN6/GKcyLQrFTXjWwXpmkRn/k7fE2FheiNnRV3kPlrfLo9I1wPmbCpF+HA
         A9K+lqCIjrJr8GD1m6/wxyJiUPTB8xYkDb+GzJetQRYcHafQMvzXOpQTZuiANdpoe6jg
         UDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475686; x=1743080486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4jlgljNt40Vu2CmEv7FaT2u7xedRKcXuIPlI99mDNo=;
        b=jY9IA3Etq8DxfaaBJWP4HIL0oINs2boNCq1hNc9w2bsR4d1e0OkUZjoS4JVwKQsxRH
         4YcIeTwtQ45BZ/Yk9AwBLfzeVygwizkNuwz4qQWI4tdd3/TzqP0vO45V0QLJb4A6Z07w
         ixdoV6/Qmz43bQ96HtpC1n9Ji73523Tei/KsCIMfXJtmqu32XkdHMojyYyrhSElKNAhE
         iC4ZLt8y8MWNatF6T3pTZT6ieR5bsVQL+FAonQmRK1xmbU+EsUXttLQrXLrUiG+o8OYX
         WArHP6EdmYfqZcV38oG4pwJmJoDpBOKg6lt3Cjr7fYju2pzsS/pHo7f2U1l5dV7Usb5/
         FuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMHHlw71RWSoVA2QffCj594ol2PHg2XQBHWjye2+7n8xrQ03JGheTtnoORMwxHbf5w8J0h0j32Wj459WnUcP7v@lists.infradead.org, AJvYcCVjl5l4EmbEtCbZiaY5U8tpzNxDz28RGJzhIhgpejmZryp7kDnj4dIZVGI0WBs2qVwVAH0CtTLcy72a@lists.infradead.org, AJvYcCXJSAwiBLJlnGe7bjdVBeHNeG4iUvWOY3BAxIKnQbftunl8DOBwZBF9wZPtWc3HGA07myv5eACDfVHncEsGHKE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx6wrao0QgLtEyM8E9ud112Cur7Za2uhzBH+zYYk3Bxeu7ciA9
	VetAeesimlgM4sPaso36vHk3QuBZYpAGOiIJ25VpnZCTsCWrL1OV
X-Gm-Gg: ASbGncvj5wTxAmiZ/iswKnTfslj0XN+DtMYXQJDh1NCr3QrO8xPp2goLvPRMg2TfOws
	YwPc+vFD7vWFeCy915iz1avilB7oR0MjqkyFglhMhwTw6JycjRD7ZGqEuEGGPpBZrqXCgabaR8+
	YE2T/wzZLwan8iBx050YrMO9keur4n/+A2Rebg+G9hV8eBXgy/K8WWo8AQkWmc1APn3GSePULsM
	wqTpfXpYEP1L5r8qVOhnIGpGpPqg/iL0GIf4B9dHYbd4z+ORZkw2TBMC0mhQpA50gynrXYfaZUP
	M/OpZPufyjgDsXOA208+osL3rorUEk9EOR2yAZ+rIG5qswtd6wpV7BUggsJ7byySJKL3wOsc//d
	MnWE3EOrfGud6zw==
X-Google-Smtp-Source: AGHT+IGqvxRe9sNnKeQqg/T2zeY+NXunY9lY/OA3ABv2ihxgYNSNA4zfa6VlIvxCoHVeEJdasraRWg==
X-Received: by 2002:a5d:47c9:0:b0:391:13ef:1af5 with SMTP id ffacd0b85a97d-399795e6d96mr3565437f8f.48.1742475685246;
        Thu, 20 Mar 2025 06:01:25 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH v2 00/11] airoha: en7581: clk cleanup + USB support
Date: Thu, 20 Mar 2025 14:00:23 +0100
Message-ID: <20250320130054.4804-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060128_386282_ADAED627 
X-CRM114-Status: GOOD (  19.02  )
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

The xHCI USB is based on the Mediatek implementation but the PHY
handling although conceptually similar, is indded different compared
to Mediatek due to SSR checks and different port power up.

The SSR driver expose an API to poll the current status of the Serdes
port and the USB PHY driver validates it. Refer to the specific commit
for additional info.

Consider that there is currently an inconsistency as AN7581 and
EN7581 refer to the same thing. This is due to the fact that
the SoC born under EcoNet but then was acquired by Airoha.

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (11):
  clk: en7523: convert driver to regmap API
  clk: en7523: generalize register clocks function
  dt-bindings: clock: en7523: add Documentation for Airoha AN7581 SCU
    SSR
  soc: airoha: add support for configuring SCU SSR Serdes port
  clk: en7523: define and register SoC SCU SSR driver for EN7581
  soc: airoha: scu-ssr: expose API to read current Serdes Port mode
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY
  usb: host: add ARCH_AIROHA in XHCI MTK dependency
  arm64: dts: airoha: en7581: add USB nodes

 .../bindings/clock/airoha,en7523-scu.yaml     |  101 +-
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   83 ++
 MAINTAINERS                                   |   21 +-
 arch/arm64/boot/dts/airoha/en7581.dtsi        |   49 +
 drivers/clk/clk-en7523.c                      |  340 +++--
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    5 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-airoha-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-airoha-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-airoha-usb.c           |  571 ++++++++
 drivers/soc/Kconfig                           |    1 +
 drivers/soc/Makefile                          |    1 +
 drivers/soc/airoha/Kconfig                    |   18 +
 drivers/soc/airoha/Makefile                   |    3 +
 drivers/soc/airoha/airoha-scu-ssr.c           |  271 ++++
 drivers/usb/host/Kconfig                      |    2 +-
 .../dt-bindings/phy/airoha,an7581-usb-phy.h   |   11 +
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 include/linux/clk/clk-en7523.h                |   10 +
 include/linux/soc/airoha/airoha-scu-ssr.h     |   34 +
 22 files changed, 3202 insertions(+), 152 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-airoha-pcie.c
 create mode 100644 drivers/phy/airoha/phy-airoha-usb.c
 create mode 100644 drivers/soc/airoha/Kconfig
 create mode 100644 drivers/soc/airoha/Makefile
 create mode 100644 drivers/soc/airoha/airoha-scu-ssr.c
 create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
 create mode 100644 include/linux/clk/clk-en7523.h
 create mode 100644 include/linux/soc/airoha/airoha-scu-ssr.h

-- 
2.48.1


