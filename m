Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98672CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlXSyrbn6Izhv2YrILB6nNFYLC6BiF83ixfo3PpN4nE=; b=U2XRzZBWBVyulEI93AF0R/5WWr
	Ruj0C6v6G3SmHlAcxML49SaQ3giwdf5q8A/ahjQivutQF7o8LW+WwSqehdPXygZvzzFZKcL5F14PJ
	b/FkGOMr+w50IScRiR2OszNokPBeqjnm9WKa5RQve7bLeIVjn7RLrTV4n33PauIA1GHELooCYGMZe
	sU8CJQEuKeLubJerIUY+xXr0jOTIF1r2Qafk1d3ptf61d0JjdyzIlzdoabO0/wDw8WafBGn0jHpwo
	wrtgfPr6pOQFmQ+5f91o/F9W7moh7xF3qhR5zae2Fx3qr0ApoKORA0nMgSkAo6/4OrutS2pK3DPmx
	0/dWnfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWm-0000000DJfJ-07GF;
	Sat, 03 Oct 2026 09:59:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWj-0000000DJeB-18fk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AF6443F13;
	Sat,  3 Oct 2026 09:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5835A1F0089C;
	Sat,  3 Oct 2026 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021572;
	bh=UlXSyrbn6Izhv2YrILB6nNFYLC6BiF83ixfo3PpN4nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LJYYDCJR0KdqSvfB+0POSrfn+vCZOJ5f8rSO/r8nYfW3Q9x9TRYl8G2Bz9V/XYhhX
	 XV2iOtl3nzyoFbD0TccrGsDgZPDLiWoVdfnusxwjl7U5OJzl2RYNQkWQhjWTEFMCPb
	 WtZRkfi9xmVvsICJYDX1/V9RvPh71iVfUTVbNAqSbaQ6AAahHMvPuGM2S5WVN1b2Xp
	 X/qUih6XybBwSN0xtcR46g9NUoSyPJggaRmj1rwF+fZLN8ZhrwKRSvXZtZkMoiKk+C
	 4rVWqwQkaZcVLFz8zkn/r0btCnXkmEn7RONr1iVE1BnDhqlKow7jWh4Bilf3zKEdO0
	 8d/H4JbLKSwRA==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] soc/tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:18 +0200
Message-ID: <20261003095924.1370238-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-soc

for you to fetch changes up to 4eaed7ea6ab36e1160d660b05551702c36dfed6c:

  soc/tegra: flowctrl: Release OF node reference on error (2026-10-03 00:47:52 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.4-rc1

Adds various bits of core Tegra SoC support for Tegra410, Tegra264 and
Tegra210-B01. Tegra234 can now be woken up via PCIe. Some references
leak and other fixes round this off.

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: Support revision B01
      soc/tegra: fuse: speedo-tegra210: Support revision B01

Alexandre Hamamdjian (1):
      soc/tegra: pmc: Add Tegra210B01 support

Geert Uytterhoeven (1):
      soc/tegra: pmc: Make sure clk_init_data is fully initialized

Jon Hunter (1):
      soc/tegra: fuse: Add Tegra264 support

Kartik Rajput (1):
      soc/tegra: pmc: Add PMC support for Tegra410

Manikanta Maddireddy (1):
      soc/tegra: pmc: Add PCIe wake event for Tegra234

Thierry Reding (1):
      soc/tegra: cbb: Fix loggger -> logger typo

Yuho Choi (1):
      soc/tegra: flowctrl: Release OF node reference on error

 drivers/soc/tegra/cbb/tegra194-cbb.c     |   2 +-
 drivers/soc/tegra/flowctrl.c             |   7 +-
 drivers/soc/tegra/fuse/fuse-tegra.c      |  12 ++-
 drivers/soc/tegra/fuse/fuse-tegra30.c    | 168 ++++++++++++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse.h            |   7 +-
 drivers/soc/tegra/fuse/speedo-tegra210.c |  22 +++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c   |  51 ++++++----
 drivers/soc/tegra/pmc.c                  | 165 +++++++++++++++++++++++++++++-
 include/soc/tegra/fuse.h                 |   1 +
 9 files changed, 405 insertions(+), 30 deletions(-)

