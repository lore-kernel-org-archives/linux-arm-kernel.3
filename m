Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7FF3D5FB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGcUzpB0Rn5uqHI0lZyRSpMC3dR8cgSa9RnzaAiXmFc=; b=blVwyTBiAofqB3bllrKHtbehYJ
	IwcsGInDfittrTG/Dhl1iqJrVHXfLfGjpssp6VNdwTl+T25G0WwIxzX4czmM8ZyC3Jk0uve6SP+ip
	4JPzQXNfjySSnHYRsU74JJ5dm4CL6L71gGuvjano7wh1KCG/qdfxDSG3miBdbjfMIkkzK8X04FTM5
	zr21os7rxID5SO3RGpGYszW8Q89Sr0xTkUuFGC9yL5ozCmvoaqs64gLgG1ekYxZtrCDghthyvCEgS
	1y5yabvG94wFyEQHqdLpgKHTejgVTNp/zxE/JnBNlLkgwYIJwsrjLcLPP9c4v16y+u/uCveCP/JV0
	uvOVNmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rnF-0000000A33p-3hCJ;
	Sun, 29 Mar 2026 15:11:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn3-0000000A30Z-2gaV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56BD640AE4;
	Sun, 29 Mar 2026 15:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DBFC116C6;
	Sun, 29 Mar 2026 15:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797061;
	bh=1V/ZmE92fpR02Fi0xVWMi+6+p0QBtEM2/+YEMgeWtQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXVJmdvRc4VDmPDKXgJhIms9hL6UNTQnVa44SQacZPTnvMB53IY1x7suwXpA7TDTn
	 f/jBZ7b6t2BcoPALEmuE8+vLTb+CknqR1s7VaLLF/wdrwBUaxZL5mj2vpEUSZhyl2o
	 L0eHbv5IvER9f16erJz4ZsS9CuxtQobUVucJ9b140dVBcnDoMy9VUTo0wAYpMNVyiv
	 7g09OXp3q4jS5Y84y2ejLk9kuvyH1ojwMsvGZiC7D9F5UwVmWtqv7dexqIGWOFSNnb
	 LYuvbKrPC1aWnLiMGeDSpj1ixMf838sOIkLt4R/7i/Dmb9ROs0z43pka46TYcGMv8U
	 iLJj6YYTSgUfQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:41 +0200
Message-ID: <20260329151045.1443133-4-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_081101_722557_C4870658 
X-CRM114-Status: UNSURE (   9.78  )
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm-dt

for you to fetch changes up to ce74a6c6d88ba9ee29a6b99ac97ffcded577c85d:

  ARM: tegra: paz00: Configure WiFi rfkill switch through device tree (2026-03-28 00:56:36 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v7.1-rc1

Various improvements for Tegra114 boards, as well as some legacy cleanup
for PAZ00 and Transformers devices.

----------------------------------------------------------------
Dmitry Torokhov (1):
      ARM: tegra: paz00: Configure WiFi rfkill switch through device tree

Svyatoslav Ryhel (8):
      ARM: tegra: Add SOCTHERM support on Tegra114
      ARM: tn7: Adjust panel node
      ARM: tegra: lg-x3: Add panel and bridge nodes
      ARM: tegra: lg-x3: Add USB and power related nodes
      ARM: tegra: lg-x3: Add node for capacitive buttons
      ARM: tegra: Add ACTMON node to Tegra114 device tree
      ARM: tegra: Add External Memory Controller node on Tegra114
      ARM: tegra: transformers: Add connector node

 arch/arm/boot/dts/nvidia/tegra114-tn7.dts        |  13 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi           | 221 +++++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts       |   8 +
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts |  21 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts     |  23 +++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts     |  33 ++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi      | 174 +++++++++++++++++-
 arch/arm/mach-tegra/Makefile                     |   2 -
 arch/arm/mach-tegra/board-paz00.c                |  56 ------
 arch/arm/mach-tegra/board.h                      |   2 -
 arch/arm/mach-tegra/tegra.c                      |   4 -
 11 files changed, 482 insertions(+), 75 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-paz00.c

