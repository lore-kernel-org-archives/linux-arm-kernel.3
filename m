Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B64CC6B26
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0K592jWE0NdZ3ZzozAFNSSmOxJ7uZz4M0cOg0o0oYTo=; b=kF8VbIPY+4MAA350UyWMB7b8F+
	U14QIOnUSoK3TTUTwSQTLlzOxP9hZ6yONMUSb//38qjDZ77IaEz4U7owDZ6NneWUzGsnaLq5aVwg5
	qjOD6H3MjyLO8J4z2yBDg8blBaNAd8/yHV5L7SO75O0IZ5h8kq/yYpNk7UuNH/sMvp4kAlUlv+x2C
	yI17cov9eFFqLfr9Vy60PmMmmumr/YLm6+r1OWiXEYmBaMwxXLcSRIxWoPJyTW1ma1Dzw0WQ2o9jZ
	PaERV8thdiMAQsqfTpOhJACse61p3ZOkfmK91SNjIdbdzAIrTetENnI4+oWG/x6BXGKMx9vSTF5tX
	hHhLO/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9O-0000000H9G7-0Jaw;
	Thu, 02 Apr 2026 08:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9L-0000000H9E5-35Fa;
	Thu, 02 Apr 2026 08:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0K592jWE0NdZ3ZzozAFNSSmOxJ7uZz4M0cOg0o0oYTo=; b=cYgys2RO3TcKxon9P4fBnueiZR
	JMGBCvfZT/ukGkYovsgVmCZjUiLLE+hdSkvvzUKdtjIBS+TUEYCGQpqN/hT2CuRpSi+GIcw3+9XVG
	DBLacYSeTN9xKiqVFedK7rjEOp3eCPAbOsZnxS0PspCYOJxSRIUmmFHjx4w9HPw+o+egX9ETY5ANM
	ipikI9Y/Gz/VLDe8KRsUVIfTMGduHlC/1+Ulj/7JNX1VCE1B8JdjL1vRXJqplicYBHNwTTiFsFNx0
	S1hLTj2vfflOXmnJ6llCT93i7ZsNHKH4+S6tTa6kUAsiI//X2TXb0vgurPqeLF1Wz+RCT34PLnvTQ
	tTVA+F4g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D8Q-00000001zMI-0h7A;
	Thu, 02 Apr 2026 08:10:42 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6327dwl072694950, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775115598; bh=0K592jWE0NdZ3ZzozAFNSSmOxJ7uZz4M0cOg0o0oYTo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=T2pgDWdgy+2/DkemmqXcIe5iBtymiI8H6G88yxgVzuCnlZFk6lWznX2an1uMC7XvU
	 VRB2NPi00WQRMMfPyjkt4MG3Py49q5sLFtvtblFNZhGB0cwb+WAQ9HL4DgVgGmOUOs
	 uw9bVZz+IUQgJruL/drqfgTMAZo8ScReIWa2VADe1jbVMlGzVpqDqdq+TDzzkeG2G/
	 dZMhMtkS39DJmpNquDFXPCANbmwyu2uzI77XSGyQqFAZUdIrfJ0ANWF2Nld6u01A8G
	 52hTVCbOfsPNJ17Qh4hmz7uhAWT9N/pC+EexaIYR9SgzVlcD56QgmFcei8namW8ETn
	 2c1KhpN0I8NbQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6327dwl072694950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 15:39:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:39:57 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Apr 2026 15:39:57 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v6 00/10] clk: realtek: Add RTD1625 clock support
Date: Thu, 2 Apr 2026 15:39:47 +0800
Message-ID: <20260402073957.2742459-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_091040_156320_E9405F35 
X-CRM114-Status: GOOD (  17.34  )
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

This patch series adds clock support for Realtek's RTD1625 platform.
The series includes:
1. Device Tree: Add clock controller nodes.
2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
clocks, and MMC-tuned PLLs.
3. Platform drivers: two clock controller drivers for RTD1625-CRT and
RTD1625-ISO.

Best regards,
Yu-Chun Lin
---
Changes in v6:
General:
- Add the headers used in c file to follow the "Include What You Use" principle.
- Move dts patch to patch 10.

Patch 1:
- Add 'clocks' property.
- Add reviewed-by tag from Krzysztof.
- Add Cheng-Yu Lee as maintainer in the binding file.
- Add 'clocks' property.
- Add include/dt-bindings/reset/realtek,rtd1625.h to the MAINTAINERS file.

Patch 2:
- Remove the global header include/linux/reset/realtek.h and use a local common.h
instead.
- Extract regmap and of_node directly from the parent device.
- Remove struct rtk_reset_initdata. Now, when the caller uses
rtk_reset_controller_add(), directly passes struct rtk_reset_data.

Patch 3:
- Replace direct reset controller initialization with auxiliary device creation.
- Add aux_name parameter to rtk_clk_probe() to register the reset auxiliary device.
- Simplify rtk_clk_desc because reset data is handled entirely by the auxiliary reset driver.
- In Kconfig, change "depends on RESET_CONTROLLER" to "select RESET_CONTROLLER"
- Remove unused includes headers and added <linux/auxiliary_bus.h>.

Patch 6 and 7:
- Move to_clk_pll() from clk-pll.h to clk-pll.c to limit its scope.

Patch 7:
- Change offset type from int to unsigned int.

Patch 8 and 9:
- Move struct rtk_reset_desc arrays from the clock driver to the dedicated reset driver.
- Implement and register a dedicated reset auxiliary driver.

Patch 10:
- Add 'clocks' property.

Cheng-Yu Lee (6):
  reset: Add Realtek basic reset support
  clk: realtek: Introduce a common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks

Yu-Chun Lin (4):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  58 ++
 MAINTAINERS                                   |  20 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  44 +
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 410 +++++++++
 drivers/clk/realtek/clk-pll.c                 | 164 ++++
 drivers/clk/realtek/clk-pll.h                 |  55 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  69 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  48 ++
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 779 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 144 ++++
 drivers/clk/realtek/common.c                  |  67 ++
 drivers/clk/realtek/common.h                  |  37 +
 drivers/clk/realtek/freq_table.c              |  36 +
 drivers/clk/realtek/freq_table.h              |  21 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |   5 +
 drivers/reset/realtek/Makefile                |   2 +
 drivers/reset/realtek/common.c                |  85 ++
 drivers/reset/realtek/common.h                |  29 +
 drivers/reset/realtek/reset-rtd1625-crt.c     | 186 +++++
 drivers/reset/realtek/reset-rtd1625-iso.c     |  96 +++
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 30 files changed, 2848 insertions(+)
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
 create mode 100644 drivers/reset/realtek/common.h
 create mode 100644 drivers/reset/realtek/reset-rtd1625-crt.c
 create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.34.1


