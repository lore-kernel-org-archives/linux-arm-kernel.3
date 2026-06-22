Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CF7CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v9oY5AW6XlPO/ybdItXeUT9so7n8GVoEcj/SAny4ynQ=; b=bgcg+rO3jGOYgRfv89gL+G3Tdk
	WzAFO0mwI+VqMkiPX01PSEmrFKHS0QjL+S+yoHOH4h4H39wO2Y2bD4VXC0ZWrYzUwgerMz96FA9d3
	Ge7d+1wrz/p5VTKO1Ixnc8Wn+K4jjXeDy6gK82lsFaIvGOHS9latnrtf/hNGKh6fYMVrE+JLKuWhf
	dyCMr/sUjKBjf0sJLAG8kpLwBvYwcJ8Yst5LSgyOz13frO4dwnsvF+UcblFReAhuWYh1QqCWb+unw
	LRulJPFX1tWBD2/YER6/8zI8C9J9Wq64a1gFKj58OB6EJAvgDfkA+pP+L1BWStAp/AZe4hd+Swzsb
	AF8m9JUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb30-00000004lL5-03Fv;
	Mon, 22 Jun 2026 09:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb2t-00000004lIB-0rKy;
	Mon, 22 Jun 2026 09:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=v9oY5AW6XlPO/ybdItXeUT9so7n8GVoEcj/SAny4ynQ=; b=ig8xVHPOd0+VRuNpTTpV+n6MOs
	pUB24Al8lDLvtnqXFZ2uX0an2KgqWmiINaNL2BYltlgjcl9b+J2BqCwCn8ELUvQGQ6o6BYuouHb2j
	UIvJL7CTzrgNXGw4SmEEMsldxICnS1qK8NyEQh+I+HpCGTcChupOGk452hnZQ2ZN4LDAOP8oqJMCl
	Z+oiddpGilv2V4vylujmFFYkwiVowV2ieaoU03afAZZT1U0By+TBqResbg4F/VgEhwERYiDgYmjt+
	IOwnB+iQZr8sHRJkDVjdxPXJKY8KrxbuZtxuNbJErMNAw8iyz9R2b/Au2rqNhiX1ic1jd4jpi1GDR
	w5rsiegQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbb2o-0000000HHPG-0A1u;
	Mon, 22 Jun 2026 09:34:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65M9NacgE2430966, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782120216; bh=v9oY5AW6XlPO/ybdItXeUT9so7n8GVoEcj/SAny4ynQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=RSX8kepe6vWf3+/ZuOAKsU0NLhflzTlQNdchZDTiflmk8XDzgJMRbr6SRg8znzAI9
	 LfxykmBUueBpw0PpMYr+OV6OmsuLzrWGZ0aFvhFIJz1lrGzkZGzHIQwMSyNbng47W+
	 PhmMBv1mgUMH0CmDTV1vbDTjzORHhIQ8rjkeWWkSdeg9iNi6vKJnTLSwW+3xRk7mFY
	 VxDNbGyxPsGORyhspGR3lfJE2717Coq+pAOYi063Pro+mc8E28R10uRfEtPWnJSz79
	 dMAW1VRLoUHkoxxNT+bR/zgqNESjmNp2nHwf9PDUQl0Dx/BDMhMQemoGsUyAahUAXC
	 LkgrOW5gz4oBA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65M9NacgE2430966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jun 2026 17:23:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:36 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Jun 2026 17:23:36 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v4 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Mon, 22 Jun 2026 17:23:31 +0800
Message-ID: <20260622092335.1166876-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_103419_251571_0123A8B6 
X-CRM114-Status: GOOD (  12.19  )
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

This series adds GPIO support for the Realtek DHC RTD1625 SoC.

Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
the RTD1625 features a per-pin register architecture where each GPIO line
is managed by its own dedicated 32-bit control register. This distinct
hardware design requires a new, separate driver.

Best Regards,
Yu-Chun Lin
---
Patches 1-3 (fix, dt-bindings, and driver) are targeted for the GPIO tree.
Patch 4 (dts) will be taken via the Realtek SoC tree later. It is included
here for context.

Changes in v4:
- Reverted to the v2 approach (without gpio-regmap integration).
As a result, dropped patches 2, 3, and 4 from the v3 series.

Changes in Patch 3 (driver) since v2:
- IRQ handling fixes:
  - Added enum rtd1625_irq_index with named constants.
  - Documented the hardware quirk.
- Code cleanup and coding style improvements.
- Included the <linux/cleanup.h> header.
- Updated the copyright year.
- Retained Linus Walleij's Reviewed-by tag from v1, as the recent updates are
cleanups and fixes rather than major feature changes.
(Linus, please let me know if you have any concerns regarding this).

v3: https://lore.kernel.org/lkml/20260512033317.1602537-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260408025243.1155482-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20260331113835.3510341-1-eleanor.lin@realtek.com/

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Yu-Chun Lin (2):
  gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
  arm64: dts: realtek: Add GPIO support for RTD1625

 .../bindings/gpio/realtek,rtd1625-gpio.yaml   |  71 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  39 ++
 drivers/gpio/Kconfig                          |  14 +-
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rtd1625.c                   | 611 ++++++++++++++++++
 5 files changed, 735 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.43.0


