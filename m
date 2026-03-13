Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EE9106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qxz6eXlzXLwGLlhwC0OYVhfrTlN43C6pxFZi0wsu3M4=; b=5FDu7akGiGSqsCovodn/OVWFPl
	U70oqzYOLLyFQ4B7I1VpRQ3despbSmtp1X+vDptkI1PUC6D1so+ygtP7IyHgHytljSINAJU8xdDy7
	9gsPwlNr1k0/YiYLKsYoAiZV5abD7a5vHJul25pFeeFwcqzsyVCfBFkIPuLNTEtNHLi+fV2KcGVxW
	kGH+pKbt0bB8SpdGwx9Evh1ELp5LVHIxRatWBVgh6v5bajvW2jqVJr4VG/74pszr5AB7uSB+2jvBz
	OGvJQX4/SE+VnrweBmJOYFsEYWO2DX2z2UXhdQsP+jm2xhQbACpsWCCNIOWIRB0w6yaRJoHXqmaNa
	/T49Wcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeU-0000000HC5p-2U4r;
	Fri, 13 Mar 2026 08:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeN-0000000HBxo-0c6l;
	Fri, 13 Mar 2026 08:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Qxz6eXlzXLwGLlhwC0OYVhfrTlN43C6pxFZi0wsu3M4=; b=k9P8AWJMb20VpTdBbnABkRfTe1
	uGoEaCXQzSe8nkRfUkXm2vkjyiFMiH1bBcVfWVkGQsgNopjXOctTBh/HvHo5ENwO70iPrniT96dmk
	xsmj6kpW6CW+gX3g0kp4g3Zi/5i9EMgEnbSWm7Zu7DLadZwoKs4HyVHJKqIRqm6wBqctPIhRV4bM3
	/yuazSlLnIGNR+pIMMz9RB8Goik7vCJLEsz0b6Uirs4GcUdxaLHegpgMY/Zfe50mB2p8AvcgQEBpt
	XtGcBaw2FYbKguHLG+rLUMWjeYYKXpqhoM/HMz1GuvDmZtIxHTFkcOViRPPLVnY9qt6YrtiLRioXp
	QDQdDx+w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeG-00000002pFw-0LFZ;
	Fri, 13 Mar 2026 08:13:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B1Y20053081, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389461; bh=Qxz6eXlzXLwGLlhwC0OYVhfrTlN43C6pxFZi0wsu3M4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=AKESyFYEGH2podvDHEUSjWN70rnWrK4bIk0xcdfuaH/Dr4WicsRGm8U8i+dlgnbWk
	 Ji4TMuEAuMFf85vAW7mL+6pUyCthjr2LxPYOyJhY93CF609MQZIS/3RIUw0qjCbcty
	 wRAtlxgul1y2242cMerNpz1d3fJipKUE0U2gou7V6RHtB+RP1oFxADWeL7S+0Oh1iV
	 38TpqUTVqa8NN1ErH3jr4rKBnMyLUHPVPD9h6vcAfZNNeW3JWi/rLlMEg49yidERZq
	 u6ICVt8V9nkmJChwVgxrWXt3SjJtBZo09FmlRvgeHYsz65Qv2eu3CyaBsfoNoBvKxE
	 itDtR+oSOs/uQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B1Y20053081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:00 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:00 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 00/10] clk: realtek: Add RTD1625 Clock Support
Date: Fri, 13 Mar 2026 16:10:50 +0800
Message-ID: <20260313081100.596224-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_081333_032763_BDB1F7A2 
X-CRM114-Status: GOOD (  12.03  )
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
Changes in v4:
In patch 1:
- Add include/dt-bindings/reset/realtek,rtd1625.h to the bindings.
- Drop Krzysztof Kozlowski's Reviewed-by tag due to the new changes.
Patch 2:
- Add a new patch to introduce the clock device nodes in dts.
In patch 3:
- Added forward declaration for struct regmap in reset.c
- Moved struct rtk_reset_data definition into reset.c as it's only used there
- Removed rtk_reset_reset() due to unnecessary implementation
- Removed unnecessary parameter from rtk_reset_get_id()

v3: https://lore.kernel.org/lkml/20260122110857.12995-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260113112333.821-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20251229075313.27254-1-eleanor.lin@realtek.com/

Yu-Chun Lin (10):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625
  clk: realtek: Add basic reset support
  clk: realtek: Introduce a common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  52 ++
 MAINTAINERS                                   |  18 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  30 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  45 +
 drivers/clk/realtek/Makefile                  |  14 +
 drivers/clk/realtek/clk-pll-mmc.c             | 399 +++++++++
 drivers/clk/realtek/clk-pll.c                 | 156 ++++
 drivers/clk/realtek/clk-pll.h                 |  68 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  66 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  46 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 788 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 153 ++++
 drivers/clk/realtek/common.c                  |  64 ++
 drivers/clk/realtek/common.h                  |  43 +
 drivers/clk/realtek/freq_table.c              |  35 +
 drivers/clk/realtek/freq_table.h              |  23 +
 drivers/clk/realtek/reset.c                   | 104 +++
 drivers/clk/realtek/reset.h                   |  28 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 195 +++++
 24 files changed, 2601 insertions(+)
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
 create mode 100644 drivers/clk/realtek/reset.c
 create mode 100644 drivers/clk/realtek/reset.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.34.1


