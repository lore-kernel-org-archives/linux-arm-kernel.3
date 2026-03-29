Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42D6F3D611
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjPII5oaybYBvNCtsKjekCyFTanNB2CiKXbRUcpt/W8=; b=GUn4S6xGPWKa5CfhniWtYH8i2i
	SEdgvBAfKWcQu5seqFUwf1IHOlXsuSW/6fc/SgCTw4enUJOGIFWlz+yXlLv3EnAw954Ztjdzg73XS
	8lieQxnfpCzcS5BNsBiq1fMAx4XiilnxtyvkRk+3CpBpDBnZm1n9iJmTZWaUY5je2yqQKU30/36gA
	E6E7rBsPq+IPiJOMSPdb+zEq2X1m6iqWl1nOP5oPnK+ii7IAL2j/PYSwNYvyBktGB8r3c981Ybkxh
	KvY9elQ+hd26UDumv6R+DmSFxv9m/vGFGhiLIe/rVc4cTglnnlqZgtM8Hptdm9BY7+U8I5oCOk33E
	vzyJrVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rnF-0000000A33Y-2Tx1;
	Sun, 29 Mar 2026 15:11:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn3-0000000A2zZ-1XUB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 519B9444E2;
	Sun, 29 Mar 2026 15:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF744C2BC9E;
	Sun, 29 Mar 2026 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797055;
	bh=ohMCJ+s4bInP/pmkvfOwZWL0zoadxQwlt8rMN1PDwgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KBn0vyJOCg5l6xh4DCcDUaDzdNNjf6kNMXZLCTWlekLnSuINkPqGHqnUylK12Vw87
	 fHb/vVnkedCLBOmtr/6Nzzo9O2xXCT64UnN9EWEFD8FWIU6avwSfTmZI4BTmqe4Zvg
	 N69owR+OMNHK8n++DeK6a1C0n6tUsxIpQa3fBRqgAULzS23h+v/6K8AiXNYSz00hi0
	 Bo6LlE+nHRHnF61wRb9zutgEd4ThpAvwNRF8DDl8QydcE58U/jhh0n0YZkxyvM0j8x
	 Rd7TQTyHSBEKXJcbw9e0fkOD8jPzhIvYUs5CQBLBuedpALACzDOy7YPUeUJbs2+Wkv
	 +8yXZZuYlCl2A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] soc/tegra: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:39 +0200
Message-ID: <20260329151045.1443133-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_081101_445859_62C3DA42 
X-CRM114-Status: UNSURE (   9.55  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-soc

for you to fetch changes up to 4b23febb6b11cd06183bed3d21b87ba7d6a8a1e0:

  MAINTAINERS: Change email address for Thierry Reding (2026-03-28 01:41:07 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.1-rc1

A number of fixes went into this for the PMC and CBB drivers. The PMC
driver also gains support for Tegra264 and a Kconfig symbol for the
upcoming Tegra238 is added. The various per-generation Kconfig symbols
are now also enabled by default for ARCH_TEGRA in order to reduce the
number of configuration options that need to be explicitly enabled.

----------------------------------------------------------------
Jon Hunter (10):
      soc/tegra: pmc: Add kerneldoc for reboot notifier
      soc/tegra: pmc: Correct function names in kerneldoc
      soc/tegra: pmc: Add kerneldoc for wake-up variables
      soc/tegra: pmc: Remove unused AOWAKE definitions
      soc/tegra: pmc: Add support for SoC specific AOWAKE offsets
      soc/tegra: pmc: Add AOWAKE regs for Tegra264
      soc/tegra: pmc: Add Tegra264 wake events
      soc/tegra: pmc: Refactor IO pad voltage control
      soc/tegra: pmc: Rename has_impl_33v_pwr flag
      soc/tegra: pmc: Add IO pads for Tegra264

Krzysztof Kozlowski (1):
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra

Sumit Gupta (4):
      soc/tegra: cbb: Add support for CBB fabrics in Tegra238
      soc/tegra: cbb: Set ERD on resume for err interrupt
      soc/tegra: cbb: Fix incorrect ARRAY_SIZE in fabric lookup tables
      soc/tegra: cbb: Fix cross-fabric target timeout lookup

Svyatoslav Ryhel (2):
      soc/tegra: pmc: Enable core domain support for Tegra114
      soc/tegra: common: Add Tegra114 support to devm_tegra_core_dev_init_opp_table

Thierry Reding (2):
      soc/tegra: Add Tegra238 Kconfig symbol
      MAINTAINERS: Change email address for Thierry Reding

 MAINTAINERS                          |  14 +-
 drivers/soc/tegra/Kconfig            |  20 ++
 drivers/soc/tegra/cbb/tegra234-cbb.c | 169 ++++++++-
 drivers/soc/tegra/common.c           |   5 +-
 drivers/soc/tegra/pmc.c              | 662 ++++++++++++++++++++++-------------
 5 files changed, 611 insertions(+), 259 deletions(-)

