Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2726D715EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zggDupViRZ/alm96P2Fl7j1ONhSLRxeO3zephYNyG0U=; b=4coixzvxfhrD4HebStkg9Dz3ME
	6g69RBI1gawdCNrD+yEbFS96MJONF9c/NiVNTiz7+EHQJTsZjMMsC2Eqx9111iNapz5SEj7HF4bCg
	dGm5KyNZtOinRHPSxRDGa6NhAzAUE+LE2zOercrNQqux7KPTIn7/C+CQoGEWs+nsoksZlTsUcHbuj
	Kj33+xAJPgRVAjGhVBff5CmYJO2+L2YisU8y7n5A1iMACcIYjkjWyyoFkpOURKdOSrxfGw4EIcb5j
	LDVE8tCnwRUjUpxaHBXnb0u8F2HxGM4+MIo3nkFnqS2KvVKrAr3GVk986paR1Y06QJvMsH1CVgvjg
	kl+98l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjjox-0000000AUcG-46vR;
	Sat, 24 Jan 2026 20:01:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjjov-0000000AUbL-0m59
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 20:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87A2743620
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 20:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217EDC116D0;
	Sat, 24 Jan 2026 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769284879;
	bh=vWAkqFd+8+4rfuGqKrFOjnRspyOydTrshpi/s8xSGmM=;
	h=From:To:Cc:Subject:Date:From;
	b=aJAer8s3PItguE9Inc1JCT1Z1N56jmGASBdSeh9A1mU/Fw1Wzqfi5kYHeM7cJ5rxV
	 o/huK/2IRYpHsTAI4ibxO0qBX4JxdfVL0mpokL3Fy1MdPNSYFAqokCGY4lLwe4ApDd
	 MUer7tu6MqGm0nIrnzc86ihu2i/O/KMES9+sCZzar7Z7TP1bzStRBZp+Pn20BtcK7E
	 Qy/CPy92cYXK6UbdktOpE1Sck9yXKR8+lpI9WON4rJcPETEGK+QWmyPXLeMJmGk4Bn
	 YyOd37Et8ya1UW7lDXPjIFNq2Qp+W7F7jpMTYkw+R7en9yKKjE0aIJUnmTJatrcZ3s
	 23a8/DMN7Wr0Q==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.20
Date: Sat, 24 Jan 2026 14:01:18 -0600
Message-ID: <20260124200118.2789128-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_120121_259089_A5D06973 
X-CRM114-Status: GOOD (  12.22  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20

for you to fetch changes up to 1a457681c075e1bd894df753087cb4268ce9f9e9:

  arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node (2026-01-02 07:52:44 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.20
- dt-bindings updates:
	- Add dma-coherent for cdns,hp-nfc and snps,dw-axi-dmac
	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
	- Move entries in intel,socfpga.yaml into altera.yaml
	- Add syscon as a fallback for sys-mgr

- Add dma-cohrerent property for Agilex5 NAND and DMA
- Add support for the Agilex5 modular board
- Add IOMMUS property for ethernet nodes for Agilex5
- Use lowercase hex for dts files
- Add #address-cells and #size-cells for sram
- Fix dtbs_check warning for fpga-region
- Move dma controller node for Agilex5 under simple-bus

----------------------------------------------------------------
Dinh Nguyen (4):
      dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
      dt-bindings: altera: document syscon as fallback for sys-mgr
      ARM: dts: socfpga: add #address-cells and #size-cells for sram node
      ARM: dts: socfpga: fix dtbs_check warning for fpga-region

Khairul Anuar Romli (4):
      dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
      dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent property
      arm64: dts: socfpga: agilex5: Add dma-coherent property
      arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node

Krzysztof Kozlowski (1):
      arm64: dts: altera: Use lowercase hex

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes

Niravkumar L Rabara (2):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board
      arm64: dts: socfpga: agilex5: add support for modular board

 Documentation/devicetree/bindings/arm/altera.yaml  |  26 +++++
 .../devicetree/bindings/arm/intel,socfpga.yaml     |  40 -------
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  |   2 +
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml       |   2 +
 .../bindings/soc/altera/altr,sys-mgr.yaml          |   6 +-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |   6 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   6 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   2 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   4 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 130 ++++++++++++---------
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    | 109 +++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |   2 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   4 +-
 15 files changed, 233 insertions(+), 109 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts

