Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3466CF3D60E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXPuHC2qF5r4pIXZmZKanymyA2OuVwBkXeTcQGq1I48=; b=qf29x4sQQMLEHMYUCDIasE7tUI
	B7PFrHWS54tp+pUsQKpE7tGD5bt9S3oxjmvY+U6sQlKqGPPtpIPNJzzCTx9ut8kIJEUjWE2xI6U0P
	+XlmAw7LzDI8q/IfWPbhd9Upn4BU9JHRSSh2xfDomBgRUpyBCCuaXf7CkG3xHvviRtaLHkyayOM3X
	W2mOvDU0axiG2Ahzi4WguKt6eqiz8vCDJL2tbVmAqu4y+Ur1qKhFpOgWxh7PvADpejNvxEAS9r94Z
	CBi0xR/P4B4R5vozlimS2JLgp4A1Gf91PC4MThSqD9Cs0HUFUo6twxgCiaMD89wgzC6k3AS5FSW7U
	YgiCv7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rnG-0000000A34M-0n1t;
	Sun, 29 Mar 2026 15:11:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn7-0000000A31r-1AXF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CF87600AC;
	Sun, 29 Mar 2026 15:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94977C116C6;
	Sun, 29 Mar 2026 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797064;
	bh=M0Z1EGRJhk11Ga2j5XNT/BdQe2P0sTVW3/Z0KGEXD+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gP148kpIifBN/QiM9Y9Sy3Xf42W9rIziwv7KfS8VaUWrXW+jdq+bkLohGOEVauBx5
	 0wnyP71rweuemwyGbq1gkVagcFFtq/Lqgo9pC1JwgJXLKJU5iV4bGZeGpIoUeBqdSJ
	 tlcwOTUP574abdG1eZTdIfkQQZcSxPatKGPqywKIrDHFXZDDA0iNvuu9AqbPBHPdiZ
	 7GeObhVnM/lY66JvRh4MS8Ms/1rb6KeoLd/HzmtaE9BPmBRkuguC/ugm0ox/hKqV8A
	 TrrKhkU17ywNcEzVluAy8d1V/kZWjmO/k9f8jIjGXDE+6qPSyeFB8wvly3Mpzt3i+K
	 16lWo4PcGYR6g==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Default configuration changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:42 +0200
Message-ID: <20260329151045.1443133-5-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm-defconfig

for you to fetch changes up to 21e380f272415387454d81788f2d62642e1fe93a:

  ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC (2026-03-25 10:49:00 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v7.1-rc1

Drop the various ARCH_TEGRA_*_SOC options from the default configurations
since they are now enabled by default for ARCH_TEGRA.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

Thierry Reding (1):
      Merge branch 'for-7.1/soc' into for-7.1/arm/defconfig

 arch/arm/configs/multi_v7_defconfig |  4 ----
 arch/arm/configs/tegra_defconfig    |  4 ----
 drivers/soc/tegra/Kconfig           | 11 +++++++++++
 3 files changed, 11 insertions(+), 8 deletions(-)

