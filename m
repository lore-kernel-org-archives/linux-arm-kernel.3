Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA68ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 06:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qljV4zxhAkYcJit8Mh3AtbiLJnmTxV3doedwBWh3bcU=; b=levshiyYV7+mdcgeB04rvBBfHS
	4Ix8TOx/dD520DkCbBDZvHG9OOD3WJbwZFJqRaIMcZN4PAqGSa/gv1iT3WqodyWrrN3eKdEJLDIIK
	Zwha035WBvsofT4wsFQS6sVZxTwVC9u6ill4mquqWZg93NlfVODp7/WCE/+714dVHCmev/FloVCEp
	ev7xc6ly5948600wXbQUA7tBOlJLXhDZHecRjIrzOkKDfjtjDbPQaZm+6D6vQ055d5CGRU+5AnG28
	JLO/3u7EIxkfrYJcCsWWDvitjZ7BS0fj6pIQMkcxWGFB7JCzXL4/a/Nr8HLnSgmhpCsDMuMJ3Enck
	HUFcdivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLv-00000009H9Z-00OX;
	Sun, 31 May 2026 06:08:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLl-00000009H6K-051j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 06:08:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 868F3443D8;
	Sun, 31 May 2026 06:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82931F00893;
	Sun, 31 May 2026 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207719;
	bh=qljV4zxhAkYcJit8Mh3AtbiLJnmTxV3doedwBWh3bcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c0QC/JhVuMFZoZcLYGcbXBzl0/3sjT2Ds9RZRFdXH0FT+97SZcFrFxMfpLLEr0uNw
	 ++6/s7Km3FpVwbSClW8NavPjG2/mRCYr+RSeK8uR55E4rN9sRJbKxcd/YOp7imxk2B
	 SmnCWe/NlM9T0Q2n6dXfp9+20y3oydGU+3/nowyy98mb8dQqwC0TnEF05T4rSf1sPc
	 B+H+Uzy5vAOJsK45eqSJ8cUxLL4AlEnJEEbxiipEP0JYnt42bngC2c3jAE6scllxJC
	 wgJf2N9ykVBmTiWIyGztLeYyaWReJ3kBLFgHdwvA8qc/E2PJbMJMXbq79MDixwTZvn
	 SPVUMWk9HiJQQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] firmware: tegra: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:21 +0200
Message-ID: <20260531060825.1855391-4-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_230841_083294_F1DAB651 
X-CRM114-Status: UNSURE (   7.77  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-firmware

for you to fetch changes up to 040eeafee0146b9d046caef501f387e107a59960:

  firmware: tegra: bpmp: Add support for multi-socket platforms (2026-05-31 07:25:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v7.2-rc1

This set of changes contains another attempt at resolving a Kconfig
dependency, propagates debugfs error codes and adds support for multiple
sockets to the BPMP driver.

----------------------------------------------------------------
Jon Hunter (2):
      firmware: tegra: bpmp: Propagate debugfs errors
      firmware: tegra: bpmp: Add support for multi-socket platforms

Sasha Levin (1):
      firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol

 drivers/firmware/tegra/Kconfig        |  2 +-
 drivers/firmware/tegra/bpmp-debugfs.c | 55 ++++++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 11 deletions(-)

