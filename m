Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E348C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG0etjW1TTaFfFJDT4vpUGJ1qYTZAKtWRAXfYXcyMdk=; b=cKAjMtuqG4M/FnwG77vqgPxHzA
	lZNw7g7gddH5pmFTB0bUzAhBy/OZ3L/5f0GkK1kf/hyq/HXLpRfzYj340ex1EVDcs8Fb7q2ugwXEa
	s9WVxUoNnew48/QmNcmLnyv/q5nCeJc/SGANdsN4RLMhyC4n0EUMozkgEb9JddnfqlRrJFPqrnUDE
	IPEVJk6DGvWuSbeCoNiXRze8RHL+9M9oD6bKFh0guH1m9ja8fFuzZ/TEfRidGAsl8HmT2ea+HFYyb
	Ae8OWb5xEYUn7FbI5wFSEsIX5xhPZF2p2oEkvmCIMx8yXoMUTAxIlnrZnMkiQtM9T0oUmpPzixcZW
	Jr8+zjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPu-0000000FqLh-1tEN;
	Sun, 02 Aug 2026 16:52:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPt-0000000FqLH-1Z6j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:52:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBEA0601DE;
	Sun,  2 Aug 2026 16:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED7A1F000E9;
	Sun,  2 Aug 2026 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689520;
	bh=sG0etjW1TTaFfFJDT4vpUGJ1qYTZAKtWRAXfYXcyMdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X7y2csQ3YSGCcBQ9e5a0ZN++E+n71Ek5SLuqhnvAAJw0YLwqf/GXjpw+QcRaWhhAM
	 JDsjsFXY/Hmtl5Uh+GVv0unNjBGEsCxmUZUjDxddQiP1JerWO6Dap6PWgvN3nrhqqi
	 bk9ZxAPVB632ukQq8FbdK3hWHFD5pKLkULc+Pmxm/GX1UW1YO+8KCyVu+cSsy3BNE2
	 tGB6W4LA4d/0FcBfBcxf+6OYFdfKPXjX8RCdgi4iBv57olKuMROivze9nwplKLgoCX
	 +LaOcH0gVUvl1W/Y3PqFiQeVM2QUuqKS1n14EYkd1bY54Z2MAObdQbpiXE8WHSRFiN
	 eT4rabI9YzHJg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] soc/tegra: Changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:46 +0200
Message-ID: <20260802165148.1259649-3-thierry.reding@kernel.org>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-soc

for you to fetch changes up to 97ffe9cb67ccafb4644f820ef68662217b76c224:

  soc/tegra: Add PM dependency to SOC_TEGRA_PMC Kconfig (2026-07-31 17:56:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.3-rc1

Various small fixes for multi-socket devices, redundant error prints, a
Kconfig dependency as well as a patch to remove FUSE data as an entropy
source.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Don't register sys-off handler for multi-socket devices

Kartik Rajput (2):
      soc/tegra: fuse: Do not use fuse data as entropy source
      soc/tegra: fuse: Use device-specific instance in suspend/resume

Pan Chuang (1):
      soc/tegra: cbb: Remove redundant dev_err()

Sasha Levin (1):
      soc/tegra: Add PM dependency to SOC_TEGRA_PMC Kconfig

 drivers/soc/tegra/Kconfig             |  1 +
 drivers/soc/tegra/cbb/tegra194-cbb.c  |  9 ++-------
 drivers/soc/tegra/fuse/fuse-tegra.c   |  5 +++++
 drivers/soc/tegra/fuse/fuse-tegra30.c | 24 ------------------------
 drivers/soc/tegra/pmc.c               | 21 ++++++++++++---------
 5 files changed, 20 insertions(+), 40 deletions(-)

