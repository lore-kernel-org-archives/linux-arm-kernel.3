Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199E0C624D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OKGtdySN4ADF+iTbgU5aXnNvD6a4rM1oYWK4YN0RUOw=; b=VnFxCGZP7ZtFSZ2atdI4YeLrXH
	/pKWiwgBki2VoWBoBGRHdxV/BCH302AvuGqnOmJS6HNckxKK/OmlmrVJDPV48E+sgN0+cajxFGNaH
	dgYzujX0ZqQevU4Xws/X/pu9JS8vn10h84F/Zv7l+ny8aNW7jrQEvfEE8gxadZnkXIt/9+c5Dlyoj
	LPzrZcGyosnQl/7Tu7YVMyLMtfzl7JaOClbt5sl0heT3P47HdCfPTs1wG9i5hrIeX5UzFGLQfafmm
	1XRpMhssnImCpSckfLxssrKV2MgUippvSrfv8urKww27tbsk7pxjHJht9maFv6Te4WKStiV7YBuDP
	cTMheuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IsU-0000000B7J9-0INa;
	Tue, 01 Sep 2026 07:25:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IsQ-0000000B7FX-2z3r;
	Tue, 01 Sep 2026 07:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OKGtdySN4ADF+iTbgU5aXnNvD6a4rM1oYWK4YN0RUOw=; b=al2XTssDMwV8x2Z591fjgFKooz
	6mk6Xyyuk43ZVQzCQ1DuhI7FKEGL4TxrHTKTK+jpVB66H2at8k0qw6Wrb1QKqRManPB7/nGeQ4yPr
	Haq8P9ChM5KjPolvw8v/RDWgd3BLe8kCPNtVqch6v6Ph366kWgHIXjan3VoUvNFiHciqMqyQg8xtQ
	3jc6OLNk8SWTIibs5m8OUBTbFezOizrFudi38NBMTrSy+i+JQYO8Tl4/UFwOvO2dCLE/4S2wH1IWo
	qXSdRYuep3BOjTmmYUv5uSZstuhCJLPOrj1Bl324Mkr//P5zEpp+JugCPdC7/K+R3A/OAhbjcwplp
	maImju9Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1Is5-0000000Agkw-23AA;
	Tue, 01 Sep 2026 07:25:34 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6817OmDP21484579, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788247489; bh=OKGtdySN4ADF+iTbgU5aXnNvD6a4rM1oYWK4YN0RUOw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=G2XPwzg9pOQb3s7RHlLTYjJAPNJs5Q60hBMPKYQSwIUB7Yazky51ogCfCNoaDt4my
	 gLI97zNVR+5qv2Lzw6nE4UVPXnAmykqitJRhUpuN/A9GRtU3TpWbfPZDHNE/Q5KyiA
	 JxhzbNQU0PSg+EBskEygDt4+ys4Fn55cg1wdWloLjMkSVUyw46dsbMN1V7eg4IsnQv
	 tyafxC6T/ROTaSXtdBA9dAIG9+8gyb/gU6bU0PBMNN3GG4pDDNgDAxvAAIIWsdEbok
	 6Vgg1ZbNMW9NGeLYUzafdjLxViIIlZi9IdWKGD8xyjDgR2egEpCgZcKMpV70wKCNM6
	 m/O50nxFxTtkQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6817OmDP21484579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 15:24:49 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 15:24:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Tue, 1 Sep 2026 15:24:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <cylee12@realtek.com>, <afaerber@suse.com>,
	<jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v14 00/11]  clk / reset: realtek: Add RTD1625 clock and reset support
Date: Tue, 1 Sep 2026 15:24:35 +0800
Message-ID: <20260901072446.2563145-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_082531_008957_8C02764E 
X-CRM114-Status: GOOD (  14.13  )
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

Hello,

This patch series adds the clock and reset controller support for Realtek's
RTD1625 SoC platform.

Because the reset controllers share the same register space with the
clock controllers on this platform, we utilize the Auxiliary Bus framework
to decouple them. The clock controllers act as the primary devices,
registering the reset controllers as auxiliary devices.

To make it easier for maintainers to review, the series has been organized
by subsystem:

1. Device Tree Bindings:
   - Add bindings for the Realtek RTD1625 Clock & Reset Controllers.

2. Reset Subsystem:
   - Introduce the basic Realtek reset infrastructure.
   - Add the RTD1625 platform reset drivers.

3. Clock Subsystem Infrastructure:
   - Introduce a common probe, and add support for basic clocks including
     PLLs, gate clocks, mux clocks, and MMC-tuned PLLs.

4. Clock Platform Drivers:
   - Add the clock controller drivers for RTD1625-CRT and RTD1625-ISO.
   - These drivers provide the clock sources and instantiate the
     corresponding auxiliary reset devices.

Best regards,
Yu-Chun Lin
---
Changes in v14:
General:
- Move Reviewed-by tags to the correct position.

Patch 4:
- Replace device_node_to_regmap() with devm_platform_ioremap_resource() and
devm_regmap_init_mmio().
- Drop rtk_clk_remove().

Patch 8:
- Replace <linux/math64.h> and <linux/minmax.h> with <linux/math.h> to
properly include DIV_ROUND_CLOSEST().

Patch 9 & 10:
- Drop the .remove callbacks.

v13: https://lore.kernel.org/lkml/20260812020009.3480538-1-eleanor.lin@realtek.com/
v12: https://lore.kernel.org/lkml/20260804163807.1285869-1-eleanor.lin@realtek.com/
v11: https://lore.kernel.org/lkml/20260728142806.1954638-1-eleanor.lin@realtek.com/
v10: https://lore.kernel.org/lkml/20260713155630.3054636-1-eleanor.lin@realtek.com/
v9: https://lore.kernel.org/lkml/20260624112940.3475605-1-eleanor.lin@realtek.com/
v8: https://lore.kernel.org/lkml/20260610080824.255063-1-eleanor.lin@realtek.com/
v7: https://lore.kernel.org/lkml/20260508111641.3192177-1-eleanor.lin@realtek.com/
v6: https://lore.kernel.org/lkml/20260402073957.2742459-1-eleanor.lin@realtek.com/
v5: https://lore.kernel.org/lkml/20260324025332.3416977-1-eleanor.lin@realtek.com/
v4: https://lore.kernel.org/lkml/20260313081100.596224-1-eleanor.lin@realtek.com/
v3: https://lore.kernel.org/lkml/20260122110857.12995-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260113112333.821-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20251229075313.27254-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (9):
  reset: Add Realtek basic reset support
  reset: realtek: Add RTD1625 reset controller driver
  clk: realtek: Introduce common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

Yu-Chun Lin (2):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  58 ++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  48 ++
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-pll-mmc.c             | 430 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 217 +++++
 drivers/clk/realtek/clk-pll.h                 |  60 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 802 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 141 +++
 drivers/clk/realtek/clk-rtk-common.c          |  82 ++
 drivers/clk/realtek/clk-rtk-common.h          |  37 +
 drivers/clk/realtek/freq_table.c              |  57 ++
 drivers/clk/realtek/freq_table.h              |  22 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |  19 +
 drivers/reset/realtek/Makefile                |   3 +
 drivers/reset/realtek/reset-rtd1625.c         | 262 ++++++
 drivers/reset/realtek/reset-rtk-common.c      |  73 ++
 drivers/reset/realtek/reset-rtk-common.h      |  29 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 165 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 29 files changed, 2954 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-pll.c
 create mode 100644 drivers/clk/realtek/clk-pll.h
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
 create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/reset-rtd1625.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.43.0


