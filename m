Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1627C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TglIfDwPGyRfaATJY2yDyHgn1QGJxxbyN+J6xNtFb+A=; b=LjJEhQ2KrDa97f/T3kPmbO6WIj
	eSS1uVxGRUkw3X5ZkFZ57BfF8nFd52S/MkPEAncBxsaaJjG5hbwklkP5bP2jHM1Xj9SizLray90qE
	AP2c1/egd0WrpeG8zBZFSOWGCZPSj+ST81uBU1ga7TGlzg9VeFNrgqbL2NheqgfoByfLgRNT0KL3x
	+b8OrkqOperIBDkx6MKk59on01bd28cw9bd3/DTbU+vYw0V42HYq9vyXiZVwk1CHNAfKA5hv32TCX
	vaTNjyzVygxa/BsSNUBDYTNY/fVGCRr/h02DhJRVYVozm3mxDyo05bxvtg5D0mrBo9A9s2vqeveDm
	oJ/tH0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAFU-0000000ELOT-3swk;
	Fri, 11 Jul 2025 09:40:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Fd-0000000EAlm-3Z3x;
	Fri, 11 Jul 2025 08:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223020;
	bh=j0KwSRWAMzpxi0sUamLXH8TO5qMWBSAVIq0YPSx3YtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lhf2SKMdZhYdSdZUOwxYzkzFJ0FDModoZdPuIOBCQOzN4NznsCDvq7M/EewNcQnJd
	 CYMHHQBTofK5CY0UW81jo2XNcGejlW9Mt/R+lnvrzZH1nVLaDPqPe4mk0NPmsEOD4x
	 YBapT2/IoM7GODRfxaLBC7Q1mVP55UAqKWH5ogMlev/5+1oeH9YiasEAeW3QDB4Y35
	 wgC/qwE3OnrX4wRYelzb8C27DpeRkdFdn/Acc2xKMe8XJFH40204HNq2iqVKG/OK/3
	 zMvZk39f9122LIOvorBq7pB5uNgkL0DOLvo7b1JTb8EK/oFkLxZreyuLF8/698eLRW
	 mTwy0gVlJDERA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9E9B17E0FD4;
	Fri, 11 Jul 2025 10:36:59 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/4] MediaTek ARM64 DTS updates for v6.17
Date: Fri, 11 Jul 2025 10:36:47 +0200
Message-ID: <20250711083656.33538-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013702_076040_2FE19228 
X-CRM114-Status: GOOD (  12.72  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.17

for you to fetch changes up to a9b906f15995e18b700a7e7791865ecf2f1cee65:

  arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support (2025-07-07 11:37:56 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.17

This adds new machines and improves support for already supported
MediaTek SoCs.

In particular:
 - New machine: MT8186 Steelix Squirtle Chromebook
 - Steelix-Voltorb's two dts are merged in one

...and improvements for already supported SoCs and machines:
 - Added reserved memory for AFE DMA for MT8173/83/86/92,
   aligning audio related memory allocation between all of
   the Chromebook SoCs
 - Added second source components for Steelix, and marked the
   multiple trackpads for Asurada as such
 - MediaTek Genio 1200: Enabled support for the Audio DSP and sound
 - MediaTek Genio 510/700/1200: Added support for the PMIC Keys
 - MediaTek MT7988: Added Cache Coherent Interconnect for CPU DVFS
 - MT7988A-BananaPi-R4: Enabled CCI, added GPIO LEDs
 - Airoha EN7581: Added ethernet nodes to Evaluation Board

----------------------------------------------------------------
Chen-Yu Tsai (9):
      arm64: dts: mediatek: mt8173: Reserve memory for audio frontend
      arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
      arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio frontend
      arm64: dts: mediatek: mt8192-asurada: Reserve memory for audio frontend
      dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
      dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
      arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
      arm64: dts: mediatek: mt8186: Merge Voltorb device trees
      arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks

Frank Wunderlich (5):
      dt-bindings: interconnect: add mt7988-cci compatible
      arm64: dts: mediatek: mt7988: add cci node
      arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
      arm64: dts: mediatek: mt7988a-bpi-r4: drop unused pins
      arm64: dts: mediatek: mt7988a-bpi-r4: add gpio leds

Laura Nao (1):
      arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as fail-needs-probe

Lorenzo Bianconi (1):
      arm64: dts: airoha: en7581: Add ethernet nodes to EN7581 SoC evaluation board

Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8395-genio-1200-evk: Enable Audio DSP and sound card
      arm64: dts: mediatek: mt8390-genio-common: Add Home MT6359 PMIC key support
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support

 Documentation/devicetree/bindings/arm/mediatek.yaml                                     |   7 +--
 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml                        |  11 +++--
 arch/arm64/boot/dts/airoha/en7581-evb.dts                                               |   8 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi                                                  |  49 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/Makefile                                                   |   4 +-
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi                               | 113 +++++++++----------------------------------
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                                               |  33 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                                                |   9 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                                          |  11 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts                                | 107 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi                                |   9 +++-
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts                     |   2 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts                    |   2 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts                       |  13 -----
 .../dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts}   |   5 +-
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                                        |  18 ++++---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts                             |   7 +++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                                        |  17 ++++++-
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi                                   |   4 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                                  |  61 ++++++++++++++++++++++-
 20 files changed, 366 insertions(+), 124 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)


