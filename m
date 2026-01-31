Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA707D61037
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAG0HgIIV8HrKKcYDy42BPEDfPkG7BIIWSXD8PB+h2M=; b=ljlU9rJNwYNUcV2vQF9SPt0qRO
	5FTLxTPczrVL4myiNYGWpIxBqjRkze7d91oALbUXAfy0m6QOYK0yzbuucwjOWa5MI/1tXHZj++aEP
	ApRHkGD4QTwl5U1ll5UghjsJfM6OxdSgHbYsIGlD8ahV23pPS3zfsD9pkqdZaQxVzfcJknkWiDMU7
	3HcFPZVNef3Xw8NbkNtRy1KkrsfWAhP49B1ULc9SWBJE0ufnxxpj6ydWReYQMomJxPipvlYLgsiTz
	8u0jlhe/5O6kcvaDTuBhLcfoevwzJVPZG09ymt4xlqf9hY6mFlAa+xlFP4WW2lQ7ubu3tyzjGlENs
	WwFeeyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmF3l-00000002rqX-2khr;
	Sat, 31 Jan 2026 17:47:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmF3i-00000002rq1-49sq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 17:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1EAC40BD8
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 17:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED9AC4CEF1;
	Sat, 31 Jan 2026 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769881617;
	bh=XJXhKDKIdbjjqxopEmAWWGnKUg42p9kFs2Ta8M/uoKs=;
	h=From:To:Cc:Subject:Date:From;
	b=ERBXpdRnPBX/6AOoFv2uuS1g/k6bexCua0jdu7KM82bFqIUWxP3BP3ZtEnyZwFtUg
	 tK7zOUS4t1W/rWEodPg1iUK+Ws9RajyGMVaCSu4E4Rw/hzp2SKWUvTwrn4FHW2WBbh
	 p9yVJpwC79HRUI+qlpbOOA2rcnfZxZdzFKkMmGtu/IaK8j4G/RyT9UJd8tLtT+q5KC
	 7ma5UfBled1ikcbA9SW0u2B0AXZuguA2uI5JwI5Ox870SRqKjLPyy2S59MJ/LXoPVO
	 ZFyGbIIiqL7pktUlR5RkZ4hHdFb+1hzs//iiTv2zaP3p979RayFTkf6PIGaF2nQaXV
	 K/CWuZayigIow==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL v2] arm/arm64: dts: socfpga: updates for v6.20, version 2
Date: Sat, 31 Jan 2026 11:46:56 -0600
Message-ID: <20260131174656.30403-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_094659_090871_7A28C9A7 
X-CRM114-Status: GOOD (  13.99  )
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

Hi soc maintainers,

This is version 2 of the PR that had dt-bindings for dma and mtd patches[1]. This
version has those patches removed and I'm taking them through the respective
maintainer's tree.

Thanks,
Dinh
[1] https://lore.kernel.org/soc/7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20_v2

for you to fetch changes up to 42a8d7d72185247c0bbada1d2c44bef743ee6a5d:

  dt-bindings: intel: Add Agilex eMMC support (2026-01-30 09:50:07 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.20, version 2
- dt-bindings updates:
	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
	- Add intel,socfpga-agilex-emmc for the Agilex eMMC daughter board
	- Move entries in intel,socfpga.yaml into altera.yaml
	- Add syscon as a fallback for sys-mgr

- Add dma-cohrerent property for Agilex5 NAND and DMA
- Add support for the Agilex5 modular board
- Add IOMMUS property for ethernet nodes for Agilex5
- Use lowercase hex for dts files
- Add #address-cells and #size-cells for sram
- Fix dtbs_check warning for fpga-region
- Move dma controller node for Agilex5 under simple-bus
- Add support for the Agilex eMMC daughter board

----------------------------------------------------------------
Dinh Nguyen (4):
      dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
      dt-bindings: altera: document syscon as fallback for sys-mgr
      ARM: dts: socfpga: add #address-cells and #size-cells for sram node
      ARM: dts: socfpga: fix dtbs_check warning for fpga-region

Khairul Anuar Romli (2):
      arm64: dts: socfpga: agilex5: Add dma-coherent property
      arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node

Krzysztof Kozlowski (1):
      arm64: dts: altera: Use lowercase hex

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes

Ng Tze Yee (2):
      arm64: dts: socfpga: agilex: add emmc support
      dt-bindings: intel: Add Agilex eMMC support

Niravkumar L Rabara (2):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board
      arm64: dts: socfpga: agilex5: add support for modular board

 Documentation/devicetree/bindings/arm/altera.yaml  |  27 +++++
 .../devicetree/bindings/arm/intel,socfpga.yaml     |  40 -------
 .../bindings/soc/altera/altr,sys-mgr.yaml          |   6 +-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |   6 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   6 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   2 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   4 +-
 arch/arm64/boot/dts/intel/Makefile                 |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 130 ++++++++++++---------
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    | 109 +++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |   2 +-
 .../boot/dts/intel/socfpga_agilex_socdk_emmc.dts   | 105 +++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   4 +-
 14 files changed, 336 insertions(+), 109 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dts

