Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E93C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xg5YiNvc+9iDAWqaWtg2ClRCsBlk2Sx5Fu/cDc87liA=; b=rw52t2cNTKHKi7+XCYa5Jvskmy
	L6uhCyGEHV9Uk8CMf75jPyIbxWb8eyXcOtt0Grb1tSQVmxFBU3TO5CO1XjzJEzn3IImshbmPiU188
	JHFQBQVRgOCx0f0YRwGaoyua6V9FgC78HGqpzwqPZ6qdnmYaww1rUQbJBLPC6VJtXTC2T5EJESt3e
	Q8ko0HqzORLO8ZniXQyJOrIiJudLtma9PyvoJ0yurF604Z4crKE/cKuG+05eBpvGTp6/Sfl38VZ7O
	XGjxOzf2IIc6icXJBW0EhRvg3gxIIZTGJv81d7vrfk9rqpp9dBorW7q/2Zy9+Oc+dFaeBEyid+2IK
	VrBU2/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPw-0000000FqMK-2GNh;
	Sun, 02 Aug 2026 16:52:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPv-0000000FqMD-2t2g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:52:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B79B42DD0;
	Sun,  2 Aug 2026 16:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD25D1F00A3D;
	Sun,  2 Aug 2026 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689523;
	bh=xg5YiNvc+9iDAWqaWtg2ClRCsBlk2Sx5Fu/cDc87liA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JxTYIh/D+Wt/Iil606xlmNdKS3bPm+U1rutxpG5M2KYdsVrFV2lwihRzeB9cF1sFq
	 ur1ye8IQFlKDw3VwawI/TB41IXbzPmpT2OR2BfDvDYknRLMXJTcf3SzkWsFtErCUvo
	 f6iXiEFUuexY1SAVDViDJNEBUQpIjXpvEgw2EE2y4dDxkQyhqzVPdZYlNiiUaFCt8L
	 tQPgtTsVFJxooYGQC3/AQ1IW3gbTJvRnvJeHU8oADV03fVm/tTWg635CDEe9dVYExp
	 c3rEREWv1pYeJsleavNkMpjYYXj60NO2HjwqmrKjv4V+nWiOwhcx9gWvqcX3gQoG8+
	 Jdvpi0wvWwtvw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:47 +0200
Message-ID: <20260802165148.1259649-4-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802165148.1259649-1-thierry.reding@kernel.org>
References: <20260802165148.1259649-1-thierry.reding@kernel.org>
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

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-arm64-dt

for you to fetch changes up to 2aedc7afffc61449ddd44bf2a4b3195729cb46ac:

  arm64: tegra: Correct Tegra234 p3740 interrupt flags (2026-07-31 17:55:32 +0200)

Note that this is based on v7.2-rc5 to resolve a conflict in the base
Tegra264 device tree include.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v7.3-rc1

This contains a new device tree for the Lenove ThinkEdge SE70 Edge
Client device as well as a number of fixes and cleanups for Tegra234 and
Tegra194. Tegra264 sees a number of additions to enable more features.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Enable GPCDMA in Tegra264 and add iommu-map

Ashish Mhetre (2):
      dt-bindings: iommu: Fix interrupt type in example
      arm64: tegra: Fix CMDQV interrupt type on Tegra264

Geert Uytterhoeven (1):
      arm64: tegra: Drop CPU masks from GICv3 PPI interrupts

Jiqi Li (2):
      dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
      arm64: tegra: Add Lenovo ThinkEdge SE70 device tree

Krzysztof Kozlowski (3):
      arm64: tegra: Correct Tegra194 p2972 interrupt flags
      arm64: tegra: Correct Tegra234 p3737 interrupt flags
      arm64: tegra: Correct Tegra234 p3740 interrupt flags

Mikko Perttunen (1):
      arm64: tegra: Add Host1x and VIC on Tegra264

Prathamesh Shete (1):
      arm64: tegra: Add pinctrl nodes for Tegra264

Sumit Gupta (1):
      arm64: tegra: Populate CPU and L2 cache nodes on Tegra264

Suneel Garapati (1):
      arm64: tegra: Add GTE nodes for Tegra264

Thierry Reding (3):
      dt-bindings: gpu: host1x: Fix email address
      Merge branch 'for-7.3/dt-bindings' into for-7.3/arm64/dt
      arm64: tegra: Properly sort devices on Tegra264

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml |   2 +-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |   2 +-
 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 .../dts/nvidia/tegra194-lenovo-thinkedge-se70.dts  | 111 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   2 +-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |   2 +-
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |   2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  10 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 577 ++++++++++++++++++---
 14 files changed, 632 insertions(+), 92 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

