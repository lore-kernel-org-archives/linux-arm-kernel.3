Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDBDCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZk3JeyirwoLUBXqZzkAqiX9NeVczzoPY8QHoFEOknY=; b=ASMV7VoUT/YdoYP1o8dC7dTSyR
	8cwopXgopsEdnyJMWwnIOgpMELc1tCtVYHUNLc9h97y0kda/C7h7lkKpRgttbmSrm/Z6vST9SQi2p
	EMq/cF79YFt+Ry3HYkAQWrugdTTCbqFF9/T+ZzkWvNOF+pDX8Vxfa9WHNFkZzk2ebnBINbk/FaJSj
	zM1aEQGMUjAcwsonar8KHbvHslA8GDL/1groAYvoX/ueNQSsf/rYvAoQd/9iAdTtY4AujSbnYa/k/
	yEooGNqPCsyydjWg9Fse0rhHeEkOybWn1EA8qX4mDA08S46gDtdG/aU3iKScPA+G2tXHZEgCgLi8p
	MdumPRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLk-00000009H6L-2aU7;
	Sun, 31 May 2026 06:08:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLf-00000009H5Y-183f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 06:08:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C0AC60126;
	Sun, 31 May 2026 06:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BC31F00898;
	Sun, 31 May 2026 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207713;
	bh=IZk3JeyirwoLUBXqZzkAqiX9NeVczzoPY8QHoFEOknY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ws2BNiAYg/sWPPhQozVETTwHhfEFNN8TgQs8a/skT4fGzgB6Zm3MGAZLgXXhsPsit
	 lVrajnEgxLBJCmNOIwG0nFLmoX4UXDL05AgjcDnxnh0OejKStNhTuGFqzrlOGhD1uZ
	 gZR10FqeqFdGpxA+cePfPjI6zvC4/INDTmK+nUCZaJuLBYNYiyJa2XtlPDNDYsfiQ1
	 8Bqdc8NjCSPOuhU+64WDQFHtjoNR5u8rKtRN5NPV6LraWXBqghTn1WZcjUpl80ISrM
	 SAXISlzYRpUAoKZk+YQtiduOZ12KTykHer1tk9Unvl4JpCFMy1bHq+nPqioqCczc60
	 vhtA3WojV1XKQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:19 +0200
Message-ID: <20260531060825.1855391-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-soc

for you to fetch changes up to 8b8ee2e56f951ccf41d98eebe73195cea487cd48:

  soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info (2026-05-29 14:42:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.2-rc1

These changes update some maintainer contact information, add a modern
way of reading the chip information and cleanup/enhance some existing
code.

----------------------------------------------------------------
Kartik Rajput (2):
      soc/tegra: fuse: Register nvmem lookups at probe
      soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info

Sheetal (1):
      bus: tegra-aconnect: Use dev_err_probe for probe error paths

Thierry Reding (2):
      MAINTAINERS: Move Peter De Schrijver to CREDITS
      Documentation: ABI: Take over as contact for sysfs-driver-tegra-fuse

 CREDITS                                           | 10 ++++++
 Documentation/ABI/testing/sysfs-driver-tegra-fuse |  2 +-
 MAINTAINERS                                       |  1 -
 drivers/bus/tegra-aconnect.c                      | 14 ++++----
 drivers/soc/tegra/fuse/fuse-tegra.c               | 14 +++-----
 drivers/soc/tegra/fuse/tegra-apbmisc.c            | 40 ++++++++++++++++++++---
 6 files changed, 58 insertions(+), 23 deletions(-)

