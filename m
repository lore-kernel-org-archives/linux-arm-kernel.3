Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA1D109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RlAzh8T8X0ef9M9pZy6A2eE4kmAZH64axmE5NTkQeEQ=; b=CvtMTn0XB+rrT8whe6eFnUb12Y
	+7SKSWpyAhama0GdFUrVTABQ0/WwgQ9piwNctCGWOPSX24jqJTpSPcvqFQtc9uKybuKo7BnRpuIP1
	4aU9+70KPbFGjrJEOanFP116J3K0S96GadxCQPpM3BUO35BxUiGU9KqYOURyqOqGrFAbAj8OwjTKo
	69x8GVBJJNe3IbkdRIv5g0LUL2BNBk/tnX2qLwobfe2yXEyctN5NVUiXREyFdZoicALWQSgpa3emU
	4/w9dpVm37b5UM3ahJYCHcaI61gHakJxsGnzX0PW95v4ncAzW1bmX46N3YOhw7lidqAEqlGVotl58
	njZdHT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vey-0000000CQ5R-2Vbj;
	Fri, 20 Mar 2026 08:56:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vev-0000000CQ3y-3VWM;
	Fri, 20 Mar 2026 08:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773997003;
	bh=d5TuVyzZ4iCBi+cC9SKF08Ri6z4AIiK4Nzg0TIGS7ok=;
	h=From:To:Cc:Subject:Date:From;
	b=dYGIumSM+3ZOB6sSqjF4UvWYlWt6hVt4k8WP0qYJrWS9pxE8h4vCU/U/NMB7vI/8j
	 C0qcNRk2Rw1zUKh7EPpoug+N9kvUKdW59yMU6Wk5J69aaI6VO8XaAa73ok0fUWCjzZ
	 vxGCEh9nO1GUUlqZkfZI0tBujztC8zf2iY5uv3d6191Z/m6RXNK0Walk/v6+Van+Uw
	 WJenovldaZORJ0nMxXLD9+iZVLDTXVAMhvvVAItycA7pDbjiuabfT+OKPwGlSdGwMm
	 SQclTjSFC0m5J9WQlUrSsBsEvoaU5/H1+OghE0KjyQsjP/gY2TFrvB+KsRWlR5pNuE
	 XRC1vaDSOf4MA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 044CD17E0FA3;
	Fri, 20 Mar 2026 09:56:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
Date: Fri, 20 Mar 2026 09:56:38 +0100
Message-ID: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_015646_031374_1C0B8CA2 
X-CRM114-Status: GOOD (  11.15  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.1

for you to fetch changes up to 820ed0c1a13c5fafb36232538d793f99a0986ef3:

  arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count (2026-03-12 13:32:17 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates

This adds fixes and improvements for already supported devices.

In particular:
 - The gpio-ranges pin could was fixed in MT6795, MT7981B, and
   MT7986A SoCs, as the very last GPIO was unusable; Even though
   anyway unused, this fixes the hardware description.
 - Model string fixes for Bananapi BPI-R4 Pro 4E/8X: now the
   correct model is shown.
 - The MT6359 PMIC gets disambiguation for two default regulator
   names, mainly fixing issues seen on U-Boot, but also making
   the regulators visually distinguishable in a summary...!
 - Aliases for eMMC/SD controllers added in MT8365 EVK board,
   MT8395 Radxa NIO-12L and Genio 1200 for consistency
 - Fixes to the MediaTek AUDSYS devicetree binding

....and honorable mention goes to:
 - MT8195 Cherry Chromebooks get their WiFi on PCI Express and
   Bluetooth on USB described with the proper power supplies now
   tied to the correct devices (USB VBUS and PCIE3v3): this is
   now described almost perfectly, or at least links the right
   resources in the right places.
   This is also done as a preparation for when the M.2 E-Key
   connector binding will be upstreamed.
 - MT8195 Cherry Dojo gets its M.2 M-Key slot correctly described
   with the new pcie-m2-m-connector binding.

----------------------------------------------------------------
Akari Tsuyukusa (3):
      arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
      arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
      arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8195-cherry: Disable xhci1 completely
      arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power supplies
      arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot

David Lechner (1):
      arm64: dts: mediatek: mt6359: give regulators unique names

Frank Wunderlich (1):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model string

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8395-genio-common: add mmc aliases
      arm64: dts: mediatek: mt8395-radxa-nio-12l: add mmc aliases
      arm64: dts: mediatek: mt8365-evk: add mmc aliases
      dt-bindings: arm: mediatek: audsys: fix formatting issues

Luca Leonardo Scorcia (1):
      arm64: dts: mt8167: Reorder nodes according to mmio address

Nícolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8365: Describe infracfg-nao as a pure syscon

 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml | 63 ++++++++++++++++++++++-----------------------
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                            |  4 +--
 arch/arm64/boot/dts/mediatek/mt6795.dtsi                            |  2 +-
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi                           |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                           |  2 +-
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts     |  2 +-
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts     |  2 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi                            | 68 ++++++++++++++++++++++++-------------------------
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts              | 38 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                     | 58 ++++++++++++++++++++++++++---------------
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                         |  4 ++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi                            |  5 ++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi               |  4 ++-
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts               |  4 ++-
 14 files changed, 158 insertions(+), 100 deletions(-)


