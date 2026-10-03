Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF2CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlLe9ES4mcBqbTqNdhC9FduZlq++oXYrUweaCi2aKHM=; b=k83gGFb3gJeNG+i3HNJXvf4tZj
	kRBY7IXUJMDAzWm7LDs7GY0pFUB6PbLDn6VmfHbuD+B1I5ZY6Fp+YzBV6t1qBP/BOwi7BDJIbxgee
	uOGaVS5KFQHhzaN4ua/a4jmq3YpVI/blgskEkzh/6cu3VIMzV3nzhpUaADW2c4eLrA82wcAmgnfvY
	cDAMlz3H8kmpQL0LW7tvTyjrIvOYpfXN6hMajg7EFSzVCk2PkjEcxwpHVEGh5i57QewZP5yVpiLDO
	pT8PtQZJ1zULKlkxTmN9YM++dbZ2/39EBoKQvQrKS0JWxxZgLKujkrbtaw7QKtL68ApIrZhOfcCqe
	kA5/RKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWo-0000000DJga-0XYC;
	Sat, 03 Oct 2026 09:59:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWm-0000000DJfC-0kIO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8AA4050B;
	Sat,  3 Oct 2026 09:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360551F0089B;
	Sat,  3 Oct 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021575;
	bh=RlLe9ES4mcBqbTqNdhC9FduZlq++oXYrUweaCi2aKHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PybIidDn5ZFmY6k75NMDqG831uJ7YiN1tU55G0VzovC4Ur69bGMgMscBeo7ofyUKW
	 z7/9LMbnPX4D7ti5sy9rYbmj1kvxpxt7KdO5/m59qZGqTM8ls1iZ41QJh23pIz2Vwz
	 5jFpc8c8F2MsxPVqClj3syxMtw1gxHkTlXoDanuIK7i1m9cGpBuzTeiWBitjG5AnRF
	 mdZrMRzMS4zoI5Rv5jATjnabcr59UZwL6IwzvoJsCqNzUJbSYNFaI6TdvwvbIrbK+i
	 fTyxOrcyaSraxsmQSrqcfunBP8dR7p/XCXCES8prKfV+2/y4zSo4gU6rmeEj+MlpSJ
	 yeI5RDPhu6KiQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:19 +0200
Message-ID: <20261003095924.1370238-4-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-firmware

for you to fetch changes up to 1bbcf4a19f1495f769b69e9569d8c1e81df074f5:

  firmware: tegra: Remove redundant dev_err() (2026-10-03 01:13:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware/tegra: Changes for v7.4-rc1

The bulk of this adds ACPI support to BPMP as well as a mechanism to
throttle bandwidth for various high speed interconnects. Some smaller
cleanup and typofixes are also included.

----------------------------------------------------------------
Aniruddha Rao (6):
      firmware: tegra: bpmp: Move channel initialization to helper
      firmware: tegra: bpmp: Add ACPI support
      firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
      firmware: tegra: bpmp: Add MBWT BPMP helpers
      firmware: tegra: bpmp: Add MBWT sysfs interface
      firmware: tegra: bpmp: Allow BPMP debugfs population to be skipped

Hemanth Selam (1):
      soc/tegra: Fix typos in comments

Pan Chuang (1):
      firmware: tegra: Remove redundant dev_err()

 .../ABI/testing/sysfs-platform-tegra-bpmp          |  48 +++
 drivers/firmware/tegra/Makefile                    |   1 +
 drivers/firmware/tegra/bpmp-debugfs.c              |   9 +
 drivers/firmware/tegra/bpmp-private.h              |  39 ++
 drivers/firmware/tegra/bpmp-sysfs.c                | 207 ++++++++++
 drivers/firmware/tegra/bpmp-tegra186.c             |  14 +
 drivers/firmware/tegra/bpmp-tegra210.c             |  17 +-
 drivers/firmware/tegra/bpmp.c                      | 434 ++++++++++++++++++---
 include/soc/tegra/bpmp-abi.h                       | 165 +++++++-
 include/soc/tegra/bpmp.h                           |   2 +
 10 files changed, 880 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c

