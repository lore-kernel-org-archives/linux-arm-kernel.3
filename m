Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3963DCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 21:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0tqOO6Ey8WoBe2Yp/hCytGo0ORoFcd+v8Gfopa8G1bA=; b=FBX5FbTAuieENzlXSc+JY5tQvH
	s/dpLrUU/Kp/NyzNFBkXS7eXzTFI3x+vqcyQ1AJwsliOSZTkKTrDKrd/W1i4HHb19+KGIn88uA/X+
	bKNw8xycwPJ38uT7sGBF1iMewa90iDyrYutjHNp/Xk0tNo6oDV+om0S1FllVjXjFyMwVJwr3Z0LUH
	8Rg7XYls0uD46rhzbjYdlg5d75xQq+HBvn89QQP/uxtcl1Le1lpiGHSZ3CuKWYYbV+7pNvJQ5nptO
	k5MSiP04lBC1Pk7yqs+nj8MxC//se2t6FcfYRpX5/wRf3xUPJcikSPkPVcnQO38hI+R9V14h+IMc0
	Wk0XmMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRQ3-000000094nR-2VQc;
	Sat, 30 May 2026 21:40:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRQ0-000000094n3-3bED
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 21:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5085443E0F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 21:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516A11F00893;
	Sat, 30 May 2026 21:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780177231;
	bh=0tqOO6Ey8WoBe2Yp/hCytGo0ORoFcd+v8Gfopa8G1bA=;
	h=From:To:Cc:Subject:Date;
	b=nOwCQWhnIJSoGVStvsqVrDYAB8sSH0GiS5FnlXzTo/3ZQWd8lRQpkaP3agYzsKO/g
	 bQuNmpR2hSUaWW6fETnSLi6UDC4btu/e67OVbYJLab2tilvKxtSqH6BJDy8eQOKHrc
	 ONbss7T8ZfbRCeKLVzdPpD5Qj80hQXyKdMjR85D/OohwhWIXOOiJ/AS84tPIw0ggHi
	 Ift/5HpK58wQIwS41kfjAu2wzgi020gSGGUuwGoFxH2hHYt8f+aaY9OEa51EEtW3oQ
	 EJ4DxZaK+LZQa38uEKlT1uBzDXtY5JYqqAKv0RPUvTyv/aVE0IITua4eIeITej64vB
	 CGrSnB0GZuPTQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.2
Date: Sat, 30 May 2026 16:40:27 -0500
Message-ID: <20260530214027.161945-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_144032_922773_9D6FA57B 
X-CRM114-Status: GOOD (  10.69  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.2

for you to fetch changes up to 7557d67a6057362a65ad03a03cbefe7f03523003:

  ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size (2026-05-14 06:56:55 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.2
- dt-bindings updates:
	- Document compatible for Agilex5 socdk debug daughter card
	- Document compatible for Agilex7-M devkit

- Add support for Agilex7-M devkit
- Remove reg property in the PMU on 32-bit SoCFPGA
- Set i3c alias on Agilex3 and Agilex5
- Update data-width of DMA controller on Agilex5
- Set phy-mode to rgmii on Agilex5
- Increase the JFFS2 rootfs partition on the Arria10 NAND SoCDK

----------------------------------------------------------------
Adrian Ng Ho Yin (4):
      arm64: dts: socfpga: agilex5: set alias for i3c controllers
      arm64: dts: socfpga: agilex3: set alias for i3c controller
      arm64: dts: socfpga: agilex5: update data-width for dmac
      dt-bindings: altera: add compatible for agilex5 socdk debug daughter card

Dinh Nguyen (3):
      dt-bindings: arm: altera: document the Agilex7-M devkit
      arm64: dts: socfpga: agilex7m: Add SoCFPGA Agilex7-M devkit
      ARM: dts: socfpga: remove the reg property in the pmu

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Fix phy-mode to rgmii as HW provides clock delay

Niravkumar L Rabara (1):
      ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size

 Documentation/devicetree/bindings/arm/altera.yaml  |   7 ++
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |   4 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   4 +-
 .../intel/socfpga/socfpga_arria10_socdk_nand.dts   |   4 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |   4 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |   4 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |   4 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |   4 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |   4 +-
 .../boot/dts/intel/socfpga_agilex7m_socdk.dts      | 103 +++++++++++++++++++++
 12 files changed, 131 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts

