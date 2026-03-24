Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB27F532CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9OhQiLh1R6+NRB49v0AOl3q0cdNM4hRK2A1PbUeHFY=; b=4DhwQka80lhpXSujoN/Xd2AJgT
	xRRrg4AP0jTdxfVEKIb39tGfRofin4xXP8xa8aLCD3nCrUDZmi6/iamYGKVlIKc0RkoNKlcExL8no
	2RG9G3XgkGQWkLzeGkOoZs2R97RCcQJLIvcU/IkklqDaT47+BxUsOcvyPhEPAjnkeGwRh4aX6ZT3a
	ShonTlIyRi4F1+0he0qG8rF6sABmI5AXQlVr4QA6/IW2JftFSZQNgyfSxmf7JopL3V8HvGpu5Fykv
	mSTTL2dTGaBCGgTi9ekGdwbc7I0NRQj8UsnUYxEkgUythqgqJ1dW+rq3l2e9/PpyLot9GxUTuTGKQ
	gdzItAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwt-00000000QgL-06ka;
	Tue, 24 Mar 2026 02:56:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwk-00000000QZk-1xyH;
	Tue, 24 Mar 2026 02:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g9OhQiLh1R6+NRB49v0AOl3q0cdNM4hRK2A1PbUeHFY=; b=VE1Komgm3juhE2hbyFU8kBaKR6
	ZPHOo0oCECJWU79/HxDnSpqhx8bOUAGGKeZATfp8277FTT1PdQoyP9BcQj7sOtTn2yZBWeZWYNsyi
	RG3YNqAmPAnQbzBF2skQYrpj5DVWUm75SRy7AqJWf8JI/mQA94ZouG5dSuFOSV7soHP3XzuSIjbXI
	MtFOuRvTOOIm7sBv/k39CzpVf3YTpJ9EBa1pP7E6unzJ0IkbOwk+aep0fy9O0TfPNGE28TzAPY4Do
	GnLX1Zy+Q3jCGjIXVRMZyGU9XXIaX7dRz3zq4LpyNoOvBxKrQjM63chFdiRW4SBw6z/3KrwOLRsVG
	YCq5gRVw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwL-000000035PC-3NhP;
	Tue, 24 Mar 2026 02:56:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62O2rWXd9278447, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774320812; bh=g9OhQiLh1R6+NRB49v0AOl3q0cdNM4hRK2A1PbUeHFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=nV+JEtBKLgq8na2tRiqrA01tRqbNfHg2nSy5TUnYLMOEhl0nIVmlYHq4CDhq2Epux
	 OXB6VzAhimZQUcmM0rsLtabUW5do7sHM9vdD/GCArTCUiEBnttRkcLtTv1aUCHQEZM
	 o4glSxqIthWoH1jHOSwLVi5jcxIBiMHHATGvMPuKg7bf85YTtHYqGBk8W5HFMa7Xg5
	 7iJLOI2ILn52DTihaP4j2MOcMgV7z4OkaKdVC86Fh/0+ST52sh/4F6MRtdZ10aSuyL
	 zVQk3FHA2cTliCXdlV6tlv6JYJHaEXgDQe192GVeSkaUGboJfVIndH7XIxYzILPBuv
	 KK8OC/hj04x8w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62O2rWXd9278447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 10:53:32 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:32 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 10:53:32 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v5 00/10] clk: realtek: Add RTD1625 clock support
Date: Tue, 24 Mar 2026 10:53:21 +0800
Message-ID: <20260324025332.3416977-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_025628_889239_4BF90F62 
X-CRM114-Status: GOOD (  12.64  )
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

This patch series adds clock support for Realtek's RTD1625 platform
The series includes:
1. Device Tree: Add clock controller nodes.
2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
clocks, and MMC-tuned PLLs.
3. Platform drivers: two clock controller drivers for RTD1625-CRT and
RTD1625-ISO.

Best regards,
Yu-Chun Lin
---
Changes in v5:
patch 1:
- Removed hardware bit position encoding from the reset binding and redesgined
reset IDs as sequential values.

patch 2:
- Reordered device nodes alphabetically.

patch 3:
- Created drivers/reset/realtek/ directory and include/linux/reset/realtek.h.
- Extracted the common reset helpers:
 - Moved the source code to drivers/reset/realtek/common.c and
 - the header to include/linux/reset/realtek.h
- Renamed rtk_reset_bank to rtk_reset_desc.
- Added 'bits' member to rtk_reset_desc structure.
- Removed rtk_reset_get_id() and rtk_reset_get_bank() helper.
- Introduced rtk_reset_get_desc().

patch 4:
- Synchronized with reset controller changes.

patches 9-10:
- Added #include <dt-bindings/reset/realtek,rtd1625.h> in drivers.
- Replaced rtk_reset_bank arrays with rtk_reset_desc descriptors.
- Implemented complete mapping tables for all reset IDs.

v4: https://lore.kernel.org/lkml/20260313081100.596224-1-eleanor.lin@realtek.com/
v3: https://lore.kernel.org/lkml/20260122110857.12995-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260113112333.821-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20251229075313.27254-1-eleanor.lin@realtek.com/

Yu-Chun Lin (10):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625
  reset: Add Realtek basic reset support
  clk: realtek: Introduce a common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  52 +
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  30 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  45 +
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 399 ++++++++
 drivers/clk/realtek/clk-pll.c                 | 156 +++
 drivers/clk/realtek/clk-pll.h                 |  68 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  66 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  46 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 912 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 186 ++++
 drivers/clk/realtek/common.c                  |  59 ++
 drivers/clk/realtek/common.h                  |  43 +
 drivers/clk/realtek/freq_table.c              |  35 +
 drivers/clk/realtek/freq_table.h              |  23 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |   3 +
 drivers/reset/realtek/Makefile                |   2 +
 drivers/reset/realtek/common.c                |  91 ++
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 186 ++++
 include/linux/reset/realtek.h                 |  25 +
 28 files changed, 2735 insertions(+)
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
 create mode 100644 drivers/clk/realtek/common.c
 create mode 100644 drivers/clk/realtek/common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/common.c
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h
 create mode 100644 include/linux/reset/realtek.h

-- 
2.34.1


