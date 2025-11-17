Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A9CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rx6TyPg/Ri0gk36crVaT4XnJR2eZ8w7/cMUnmQ/NjY0=; b=HjMn20TmDDk5i1j0X8ccrX+Bmk
	ZmhOkFr3JndnWUKfvTUcvLZ1MRohbnNBBdjNiSOKpDVVhb1AuoKH5kaqaRjwsPjHoCxlHMie8soE9
	cEqceEVmM4vPHyB9/lRkYvnHgQcSaNNCfSahb5uizaL6LO3tl9ed43etmQ4Li4pwDj9P1gTjEK95E
	3Pek4EZ88UVL5JrSZ/8L5NeIuzLst8/kLr77OTQK0NlWnn8KL1USe7aHjo686kPROqyIMP6l+heGd
	9g3DPElN3B3ZgbCqZzH4oELhdemIXzMcCcdwDKqFYVS4s78sC63Rivzkyg6JyJJdlAm2XQhq8x1y/
	dZvI2gZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyji-0000000G8C2-15ip;
	Mon, 17 Nov 2025 12:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyjf-0000000G8Bh-1YMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21BB6401FB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 12:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D249C4CEF1;
	Mon, 17 Nov 2025 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763384014;
	bh=vTlFSXL5C/aWINfpBdSRXsDpIpVWuHNUtGuY/3CzWKU=;
	h=From:To:Cc:Subject:Date:From;
	b=JIdNq+it2Pszavsm9zuM33PUXh0wvJGvGE0DHncYhfcZF4ZzBP9k8ljOZzW4mkNbQ
	 d7F4MOtZMm4TWxmHUwiRxTeqgaeIH1i1zK2GrENy26MSeOZWCSGcKmzzfypO4V37cu
	 WIWN/SSKXfoIRu4Ip8WB9YbstRQ29yff1V4hIwU6qwuDni2C+2LcoFsroqzRXGJMyh
	 iEyMwPXkTbka6MGKPbOv3Q6AOlX3XEusW85KwqZTrnjmrev66qAPx05n9Cbrzd9Fqy
	 3VmNP7nvWut7gWESclJdI+Jd6Yzyqk4WozHWfgqq8OVFarSXJ3tji2TU67x7j14yiB
	 wOE9wjh+dfApA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.19
Date: Mon, 17 Nov 2025 06:53:31 -0600
Message-ID: <20251117125331.381114-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_045335_467459_1C9DB299 
X-CRM114-Status: GOOD (  17.09  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.19

for you to fetch changes up to 38eff72f2d3a83475d70ac3a1280b5051d1e46b0:

  arm64: dts: socfpga: agilex5: update qspi partitions for 013b board (2025-11-17 05:37:59 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.19
- Add 4-bit SPI bus width(n5x, stratix10, agilex and agilex5)
- Agilex5 updates:
	- Add GMAC0 for NAND daughter card
	- Add SMMU support
	- Add VGIC maintenance interrupt
	- Add L2 and L3 cache
	- Add support for the 013b board
	- Add I3C support
- Add support for the Enclustra Mercury+ SA1 SoM based on Cyclone5
- Add support for Agilex3 board(a variant of the Agilex5 board)
- dt-bindings update:
	- Document iommu in cdns,hp-nfc, snps,dw-axi-dmac and Agilex5
	- Document Enclustra Mercury SA1 and AA1 boards
	- Document Agilex5 013b board
	- Document Agilex3 board
- Fix dtbs_check warnings:
	- stratix10-swvp
	- Agilex(NAND and Clock manager)
	- Move sdmmc-ecc to base DTSI file(Stratix10)

----------------------------------------------------------------
Adrian Ng Ho Yin (3):
      arm64: dts: socfpga: agilex5: Add L2 and L3 cache
      arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG nodes
      arm64: dts: intel: agilex5: Add Altera compatible for I3C controllers

Boon Khai Ng (1):
      arm64: dts: agilex5: Add GMAC0 node for NAND daughter card

Dinh Nguyen (5):
      arm64: dts: socfpga: move sdmmc-ecc to the base DTSI file
      arm64: dts: socfpga: stratix10-swvp: fix dtbs_check warnings swvp
      arm64: dts: socfpga: agilex: fix dtbs_check warning for clock manager
      arm64: dts: socfpga: agilex: fix dtbs_check warning for NAND
      arm64: dts: socfpga: agilex5: fix CHECK_DTBS warning for NAND

Fong, Yan Kei (4):
      arm64: dts: socfpga: n5x: Add 4-bit SPI bus width
      arm64: dts: socfpga: stratix10: Add 4-bit SPI bus width
      arm64: dts: socfpga: agilex: Add 4-bit SPI bus width
      arm64: dts: socfpga: agilex5: Add 4-bit SPI bus width

Khairul Anuar Romli (5):
      dt-bindings: mtd: cdns,hp-nfc: Add iommu property
      dt-bindings: dma: snps,dw-axi-dmac: Add iommu property
      arm64: dts: socfpga: agilex5: Add SMMU nodes
      dt-bindings: firmware: svc: Add IOMMU support for Agilex5
      arm64: dts: socfpga: Add Agilex5 SVC node with memory region

Lothar Rubusch (11):
      ARM: dts: socfpga: add Enclustra boot-mode dtsi
      ARM: dts: socfpga: add Enclustra base-board dtsi
      ARM: dts: socfpga: add Enclustra Mercury SA1
      dt-bindings: altera: add Enclustra Mercury SA1
      ARM: dts: socfpga: add Enclustra Mercury+ SA2
      dt-bindings: altera: add binding for Mercury+ SA2
      ARM: dts: socfpga: add Mercury AA1 variants
      dt-bindings: altera: add Mercury AA1 variants
      ARM: dts: socfpga: removal of generic PE1 dts
      dt-bindings: altera: removal of generic PE1 dts
      ARM: dts: socfpga: add Enclustra SoM dts files

Niravkumar L Rabara (6):
      arm64: dts: socfpga: agilex5: add VGIC maintenance interrupt
      dt-bindings: intel: Add Agilex5 SoCFPGA 013b board
      arm64: dts: socfpga: agilex5: add support for 013b board
      dt-bindings: intel: Add Agilex3 SoCFPGA board
      arm64: dts: socfpga: add Agilex3 board
      arm64: dts: socfpga: agilex5: update qspi partitions for 013b board

 Documentation/devicetree/bindings/arm/altera.yaml  |  24 +++-
 .../devicetree/bindings/arm/intel,socfpga.yaml     |   7 +
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  |   3 +
 .../bindings/firmware/intel,stratix10-svc.yaml     |  15 +++
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml       |   3 +
 arch/arm/boot/dts/intel/socfpga/Makefile           |  25 +++-
 .../intel/socfpga/socfpga_arria10_mercury_aa1.dtsi | 143 ++++++++++++++++----
 .../socfpga_arria10_mercury_aa1_pe1_emmc.dts       |  16 +++
 .../socfpga_arria10_mercury_aa1_pe1_qspi.dts       |  16 +++
 .../socfpga_arria10_mercury_aa1_pe1_sdmmc.dts      |  16 +++
 .../socfpga_arria10_mercury_aa1_pe3_emmc.dts       |  16 +++
 .../socfpga_arria10_mercury_aa1_pe3_qspi.dts       |  16 +++
 .../socfpga_arria10_mercury_aa1_pe3_sdmmc.dts      |  16 +++
 .../socfpga_arria10_mercury_aa1_st1_emmc.dts       |  16 +++
 .../socfpga_arria10_mercury_aa1_st1_qspi.dts       |  16 +++
 .../socfpga_arria10_mercury_aa1_st1_sdmmc.dts      |  16 +++
 .../intel/socfpga/socfpga_arria10_mercury_pe1.dts  |  55 --------
 .../socfpga/socfpga_cyclone5_mercury_sa1.dtsi      | 143 ++++++++++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe1_emmc.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa1_pe1_qspi.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts     |  16 +++
 .../socfpga_cyclone5_mercury_sa1_pe3_emmc.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa1_pe3_qspi.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts     |  16 +++
 .../socfpga_cyclone5_mercury_sa1_st1_emmc.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa1_st1_qspi.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts     |  16 +++
 .../socfpga/socfpga_cyclone5_mercury_sa2.dtsi      | 146 +++++++++++++++++++++
 .../socfpga_cyclone5_mercury_sa2_pe1_qspi.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts     |  16 +++
 .../socfpga_cyclone5_mercury_sa2_pe3_qspi.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts     |  16 +++
 .../socfpga_cyclone5_mercury_sa2_st1_qspi.dts      |  16 +++
 .../socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts     |  16 +++
 .../socfpga_enclustra_mercury_bootmode_emmc.dtsi   |  12 ++
 .../socfpga_enclustra_mercury_bootmode_qspi.dtsi   |   8 ++
 .../socfpga_enclustra_mercury_bootmode_sdmmc.dtsi  |   8 ++
 .../socfpga/socfpga_enclustra_mercury_pe1.dtsi     |  33 +++++
 .../socfpga/socfpga_enclustra_mercury_pe3.dtsi     |  55 ++++++++
 .../socfpga/socfpga_enclustra_mercury_st1.dtsi     |  15 +++
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   9 ++
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  15 +--
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |  13 --
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |   3 -
 arch/arm64/boot/dts/intel/Makefile                 |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |   1 +
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts | 132 +++++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 115 +++++++++++++++-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |   2 +
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  | 126 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |  18 +++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |   2 +
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |   2 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   2 +
 54 files changed, 1410 insertions(+), 111 deletions(-)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
 delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts

