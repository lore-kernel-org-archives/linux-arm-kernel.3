Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B60EC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1JPH9AKZzJchBn7pDlPot8tRe7bTeB76GJZrx18aD4=; b=c8ynJXwyH3NkVY5iyZwK4Roqtm
	TZrusGNs+GqfTzrv601CdufEyLONsd1RtuPDULPqw7Dcsnn91ib662pEF02ird5bbZpjY18wW0Jsm
	0+4/rtVDnBKKobBFw9rrVHtxSi+fKMpDj2vwfse0LiFubU5jzpatBNnQzHOYNKMRIs8Po1LV3St2+
	8W+ArIs7+lBgXQJzr9qPjTgDK+b00dnZN7QWrstu4Kqgf6zREXVc39mVHj4O+7/yxBD6bwBhG+ePG
	1c89UQ88VCPXwn5micIcaW/CO74hpI935wKtwJFPJwXDJPxHM3cqdLDbDUr2FGVvbI3CL4QGaWVFm
	jg33yeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMCJ-00000009sTh-2yhN;
	Thu, 30 Jul 2026 08:32:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMCH-00000009sSG-1Mqe;
	Thu, 30 Jul 2026 08:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785400372;
	bh=zwE0qptctD4Vx8UNaJjRHbNvZ7ftCwYmm5ExAmdvNVw=;
	h=From:To:Cc:Subject:Date:From;
	b=H0cba5VKUrs7eXqNSH0twaGS4pg2YkxSc0lARup7d2xePB2QTFrFaJmbunMYWBX8T
	 Eo2XNUQdYlagiHtOqgNNCuKPAGkhN5OIUqrqFYKV9/LaPaNoOH02PHjFUCwAW1l4Nk
	 H5DQneFCuWDedkMlhYhakEO1/NZld5aZ065BQyqtHNKoXIcTlZnnCCaZrBUrhFfbH4
	 ulT1pqhNAxqdM8EmIIGKIsRsIzzNMVcQmACF573oGPd6WJAVQyHiDiKeNhXL+lQhXd
	 Ud+02GS4ktGf6flAeP0jXiNpCm6PfcZi4nFdfdufi/kaQs3Zc/nudlmHgsvzoTk2hN
	 roR2ow/pIvCJQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DAF417E063E;
	Thu, 30 Jul 2026 10:32:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.3
Date: Thu, 30 Jul 2026 10:32:44 +0200
Message-ID: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_013257_518509_8BBE3AD1 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.3

for you to fetch changes up to 3dc552c1bab6e83bb45af0a49f3a900845a24495:

  arm64: dts: mediatek: mt6359: use proper compatible for rtc (2026-07-21 15:16:45 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates

This adds a couple of fixes and improvements for multiple
MediaTek SoCs.

In particular:
- Indentation/whitespace fixes for some devicetrees
- Documentation improvements for MediaTek Mute-X
- dtbs-check warnings fixes
  - MT8390 Tungsten boards: removal of unnecessary cells
  - MT6795 SoC: removal of deprecated property in UART DMA
- MT6359 PMIC's RTC now uses the correct compatible string
- MT8183/86/88/92/95 SoCs gain support for the UART DMA IPs
- MT8186 gets a new CCI OPP table to resolve lockups
- MT8188/83 Chromebooks now got the correct SPI NOR supply
- MT8192 Asurada drops support for the (unused) MMC1 port
- MediaTek Genio 510/700/1200 EVKs and Radxa NIO-12L now get
  their PMIC power input tree completed with assignment of
  the correct supplies

----------------------------------------------------------------
AngeloGioacchino Del Regno (8):
      arm64: dts: mediatek: tungsten-smarc: Remove unnecessary cells
      arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
      arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller
      dt-bindings: soc: mediatek: mutex: Improve title and description

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion

Krzysztof Kozlowski (1):
      arm64: dts: mediatek: Correct indentation and whitespace

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8390-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt6359: use proper compatible for rtc

Mark Tseng (1):
      arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping

 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml |  17 ++++++-----
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                           |   2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi                           |   4 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi              |   6 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts         |   4 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                     |   2 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                           |  22 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                           | 112 ++++++++++++++++++++++++++++++++++++++++---------------------------
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                    |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                           |  33 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts        |   4 +++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                           |  17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                           |  37 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi              |  19 +++++++++++-
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi            |   4 ---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi              |  17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts              |  17 +++++++++++
 17 files changed, 252 insertions(+), 66 deletions(-)


