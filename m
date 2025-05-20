Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F65C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=72RAk1vbHImwOZfMxJXtUWwsftjJO9P1wTMbTuoJ4rQ=; b=YnrFp7s3zdiRnqoHWvf6fvOHPF
	GyEc5l5q3ozQZil3J+PNvf6Ex2H+dgXYv4wvSZJp/msDxWIQBP7aeNuK+MBk85XNndZwnYammPOFe
	GlQB9XAs/PghPkHuHuczExex2prwcIEwkDkLlnPoklY0liPUSaZHOp52pKu7nUoo10ExBZ658+dpz
	Np7jj3kTIhqWI0ZiDyb5A/VdCf2tNfWYpfxMexga4P4GdslkfXZc029CuNpyZXMKPCJRmS39ZvUX3
	TKjf8JFVF3SDVzi9xOt8ltYqB6DtsIXLj+Z8aR/RJJFPzLkKHN0h3753wX53gQt/Fof44O03S2eR6
	2fgYNCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLSO-0000000CiNW-0EfM;
	Tue, 20 May 2025 11:48:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLO6-0000000Ch5f-0fac;
	Tue, 20 May 2025 11:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747741440;
	bh=NvPfBC95cpbMqHq/ZrYCPGXtxnr17MynHiOainBiTNU=;
	h=From:To:Cc:Subject:Date:From;
	b=jkxhWHN5DwKKgttNYOkJj9NOfHV2KtPzj/f4MdbTcBFtfN92s5uU+E8I+o4Rgk+Z2
	 /tvsDe0HZXvvg6743JdQny3hW5CB1fjzhvjY9DflofRllOPCAKVJp0+2Aciid6Qgki
	 X0CzQfVSDu7WyGhwcVfugG3aSQjcynEQnfP6zbkGqr5BdB10Lk2OjaZKR93Kb9fKG/
	 E0uES9Zc0BaDGIGQzCKneLfrHkzqShOASWeAIgO24egAOGNs+wcRD965iPNcV92e9e
	 iWP0KW3WO9oCxzSGF5aPCN+0OiZBE7GtsEROmPTq6fvV36LxHILYU9VJhbb5mOuqq9
	 duAvD6Yz++bVg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39A8817E00AD;
	Tue, 20 May 2025 13:44:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
Date: Tue, 20 May 2025 13:43:51 +0200
Message-ID: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_044402_350800_90D7881E 
X-CRM114-Status: GOOD (  10.51  )
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

The following changes since commit 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:

  arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16-2

for you to fetch changes up to 99af08feb7fad3df79bda1628e4ee8b6eb1f6a32:

  Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0" (2025-05-20 13:25:02 +0200)

----------------------------------------------------------------
Additional MediaTek ARM64 DTS updates for v6.16

This addresses devicetree binding warnings happening on	the
MDP3 nodes in mt8188 dts, reverts the commit adding the SCP
firmware-name as strongly suggested by Arnd, and also adds
some more late commits.

In particular:
 - MT6359 PMIC
   - Renamed PMIC RTC node to fix dtbs_check warning
 - MT7988(A)
   - Support for SPI controllers was added to SoC and BPI-R4
   - Support for XSPHY, USB and	PCIe2 was added	as well
   - Fan and cooling maps were added to	BPI-R4 machine
   - Added BananaPi R4 2G5 machine variant
 - MT8365
   - Added touchscreen support to MT8365 Genio EVK
 - MT8188
   - Addressed dtbs_check warnings for MDP3 nodes
 - MT8390 (Genio)
   - Reverted SCP firmware-name	addition

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      arm64: dts: mediatek: mt8188: Address binding warnings for MDP3 nodes
      Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0"

Frank Wunderlich (9):
      dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
      arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
      arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
      arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
      arm64: dts: mediatek: mt7988: add spi controllers
      arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
      arm64: dts: mediatek: mt7988: add phy calibration efuse subnodes
      arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
      arm64: dts: mediatek: mt7988a-bpi-r4: configure spi-nodes

Julien Massot (2):
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      arm64: dts: mt6359: Rename RTC node to match binding expectations

Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add gpio-ranges property for gpio controller
      arm64: dts: airoha: en7581: Add PCIe nodes to EN7581 SoC evaluation board

Louis-Alexis Eyraud (1):
      arm64: dts: mt8365-evk: Add goodix touchscreen support

 Documentation/devicetree/bindings/arm/mediatek.yaml         |   4 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts                   |  30 ++
 arch/arm64/boot/dts/airoha/en7581.dtsi                      | 105 ++++++
 arch/arm64/boot/dts/mediatek/Makefile                       |   2 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                    |   2 +-
 .../arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts |  11 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts    | 400 +----------------------
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi   | 450 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                   | 115 +++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                    |  86 +++--
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                 |  40 +++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi       |   1 -
 12 files changed, 804 insertions(+), 442 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi


