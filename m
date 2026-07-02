Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CFBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gzQoeRgMOQEy5QoesyLaayJt4jwJeSCbUvLYGvtHwRg=; b=Ies8FdPMcKIPrYxx6IIJ4tzPiv
	gSoA7MDD+2fZi5PuDs4KRtgM3x134aAcGsxJgQROjUOe+VQEGq+NVcdfRIcDK3Ow0McyKHXJeSB9C
	siyz1L37f7TrjWPoRiXuLtMQVcv1cuBEspYi/Ir04lyaUjp2rYl0NcgB6JLHo+wSt//KmyTGHGKLD
	UicYIJJlK2PFeJXWbrC3NlHaSE2ryh8qIklUciJK2kfYnjfvsjV7G+I85hMy11AJUQ7CDNsZAMSEy
	wuRBibKsOsxYH+dqs0hlXqKnYSV2kiulYj6rU8/wl7BS5XrXGZ1ksNx7KjpehY8YHjybODvRCjfk4
	Vqj/coiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDJ0-00000003wpG-27F3;
	Thu, 02 Jul 2026 09:01:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDIz-00000003woT-0g7w;
	Thu, 02 Jul 2026 09:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gzQoeRgMOQEy5QoesyLaayJt4jwJeSCbUvLYGvtHwRg=; b=Qb+VvXcdA1YNPUMbjBRljyU8jd
	UMBonQ2iAH97dpSM5N1fmgUl7gkJlCpLm7QSK7csFQHCv6ZhUHEdimau/DFYeE79E2ix0EG64Ba3A
	ELQU7BbBOxRJw7yW2+vzD5bYfXB30fwkVC5cxLWQn7jwWwX6t0C5G1a0Vphr5RV0X1lBxOjw1kvpM
	uo4Bo6h6OXIiiXC5RCLXapvnZ31qwQYQcbjp2AjnBudayTE1lVYwLAr1aRxYsfwODxXw4GfBsGUbR
	YsoWEJ5LQZwgv3+OsNjFoeZzwgjWg8eTsmr8zSHslgUIiQGMIccMgFPmyxdZddM9TidxKCjgyGNt/
	E+3OyBPg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfDIv-00000003aUr-272M;
	Thu, 02 Jul 2026 09:01:56 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66291GtB41817125, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782982876; bh=gzQoeRgMOQEy5QoesyLaayJt4jwJeSCbUvLYGvtHwRg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=XMA1+0XYxo7snCCC5JU5dhYvRBi24nPfiiAsGFVisf1Lo5Fzj2EBlGQtZBI03u+1g
	 c5XF5zAN4fCqWhUi4DVw/eYvMtDm6nq4ot8l0EltVyZ+lUf+Yj1/G3DyPvasHs0JKV
	 SLWUVsXABxQYKZcQRsrEdEYGvR1ElVH/ZTSgSfHTIw0QFMpouGxa5LXy35OS6z5kcS
	 bvAjaNye6rnS4SxO58kt3snOmb0/VktR/TVOmkzFcUV4ciFIv4MeUieGfXivIBP5X6
	 mJiCO7/X3IUPH8BVJ4NHgSRaPTM8hdgAY0R0BO2y/ltmsW6Yd22W3A51B0K5MR87ix
	 E+mVscO5sGiWA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66291GtB41817125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2026 17:01:16 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Jul 2026 17:01:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Jul 2026 17:01:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v5 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Thu, 2 Jul 2026 17:01:11 +0800
Message-ID: <20260702090115.2564318-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100154_243280_1C9EAEC1 
X-CRM114-Status: GOOD (  10.44  )
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
Changes in v5:

Patch 3 (driver):
- Add comment for @base_offset.
- Rename the local 'gpio_irq_chip' pointer to 'girq' to match common
GPIO IRQ naming.
- Drop the intermediate variable.

v4: https://lore.kernel.org/lkml/20260622092335.1166876-1-eleanor.lin@realtek.com/
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
 drivers/gpio/gpio-rtd1625.c                   | 610 ++++++++++++++++++
 5 files changed, 734 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.43.0


