Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC19F3D610
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqzjPqhoGKjpu+dPVydjeYXcVIUYUCEUdVobIcE3DOI=; b=yLeWeIeBn8R2N8cPKNEHULXLfJ
	zZiM2NW7kePNvDIZVozD8+L+mCDoI69xmO5wuYjw2A6xxII8vlCdf5FhnZd30n7Pw+wLYiE4lHAJO
	X9TTC3zC5hNq9V1rOBozeJ/kDpFX3gAh2zs5OQ0/OCMvpoQx/6MmLJlS0Go3APPvhrSNyHUkHYt4n
	aRGgifPSw6QIE46jN2gugS6I2PjO4J7gQdoeNJSLjUTLbCSLDBHVpq3vWQv+di5+BAhka0399FhXm
	LkjK/+vLVgX5oV2XotjwqQlWFPZBSBqZqgdfV+KDGSF3i4JxQTER90d5yER9przCdSz9sPNcYuu4G
	nx7UOnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rnG-0000000A34s-1yOm;
	Sun, 29 Mar 2026 15:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn9-0000000A32W-2SJM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0902E60054;
	Sun, 29 Mar 2026 15:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58812C116C6;
	Sun, 29 Mar 2026 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797066;
	bh=uLUM4o+KLJe4YQmeHIHCsOs0ynRLdm3hUXmN7rvPPFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KpHv66hLSfg9e8z12WOw30PjF1clNYOndpyZVfBQ7NcAgwDuAHJ1cZywIEFtq2Nap
	 CdiOQ+J3tIPUJP9SyQdeY8IlxfDuvnEzbY2H5I/7NMsf39BGfMaWODgAR1+bLtq/nm
	 6K9C/SgiZ+ZyunoZdytc2IXgkJvNQxjl+QqWxtwtB1GEfYPHcMp6rI2eV8Jsm5E1nz
	 3NSMcLICzlX7C4IT88GqxbnT6geVA03u2fi0N21szbL4Ii3KKeuAnlsj5ezeJFVL8H
	 2/Hgj+GRttUNJx7PxR2/8y+LylFNPaeyFrUVlyHDDiV78FpC8mIDbWD5GuIbIZ9rR+
	 OcdtAVImgjSSg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:43 +0200
Message-ID: <20260329151045.1443133-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-dt

for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:

  arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v7.1-rc1

Various fixes and new additions across a number of devices. GPIO and PCI
are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
it to boot via network and mass storage.

----------------------------------------------------------------
Diogo Ivo (1):
      arm64: tegra: smaug: Enable SPI-NOR flash

Jon Hunter (1):
      arm64: tegra: Fix RTC aliases

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 GPIO controllers

Thierry Reding (6):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      Merge branch for-7.1/dt-bindings into for-7.1/pci
      arm64: tegra: Fix snps,blen properties
      arm64: tegra: Drop redundant clock and reset names for TSEC
      arm64: tegra: Add PCI controllers on Tegra264
      arm64: tegra: Add Jetson AGX Thor Developer Kit support

 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 -
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   6 +-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  12 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 336 +++++++++++++++++++--
 10 files changed, 500 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi

