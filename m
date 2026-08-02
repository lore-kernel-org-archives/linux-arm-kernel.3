Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED00C55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLpW5gyeatCqgQWKADGdyPp0PG5hne5uctT7k5F0+o8=; b=le+Wf4DmCDYdHqQYLlBFG1RHkP
	4QYOiTjth8jqe1+0qjvIuWUz03gOD/EXZLOnJEU09HCCU9jaC42FX72KiQ3IHAZztpk39DOvzXuXt
	J8rQKliOik66+NwcVZ/s86kNAX1D2yxhdI0jNlqDbqVYNK+UiIV8JOgXJDd/Y+Y1bR/jgBbNk8M0i
	yPK0j4KAp0r85kFDWXOrOmkFZJlCpuK7nWnPCFhqoFV7Cts14o8parSwmIgfpEJ1r/8ccWcxeF9La
	Lrm0NDDyPILWV4XyLDOZ6c36nuz7v5r6eKfj6Jj93VM+AEKil6rlUezoZs6ZxDO55TU1Aaml8lCjy
	ibIEjx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPs-0000000FqKc-1BWJ;
	Sun, 02 Aug 2026 16:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPq-0000000FqKE-3RPE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:51:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7A0242CED;
	Sun,  2 Aug 2026 16:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CBB1F000E9;
	Sun,  2 Aug 2026 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689517;
	bh=aLpW5gyeatCqgQWKADGdyPp0PG5hne5uctT7k5F0+o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e1xtCelOubxggcgyim5AsDat5rCduuOaGe/Rob3ALVg+lNu1GkfnhUyl93xAblFUv
	 NfJG31C8PT3Ws/87UTKdQy2LpKIY9DnZ9aSRVsJZfMNe6+fgR+M6zQIT+kLGeByVN5
	 WCFogF6GYyz8lXxIqtfv95hvPpdhiTz1l8uwRwVYEkj6M1/An1UZLCoGbHMJJiEa3K
	 WOLEBGy0Z/75nNZ/wp/tQ/GFXTnQsH+ODYhSeHkDhtB0+PX1kzGUT+qsbgGlMk4RDj
	 lOgyLIY1e0wA8e4eOp6LsjKRqg/iiUyOLUhzaf2gOcMWI3BN6p0j0zadJYvJ2y8oTE
	 JzZfMsHYBq8Nw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] ARM: Core Tegra changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:45 +0200
Message-ID: <20260802165148.1259649-2-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-arm-core

for you to fetch changes up to aa5d0900ee9d5772a23316ef129d3c29b497d721:

  ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__ (2026-07-31 17:39:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: Core Tegra changes for v7.3-rc1

We haven't had one of these in a long time, but a __ASSEMBLY__ cleanup
patch and a OF reference leak fix came in that make changes to the core
Tegra code.

----------------------------------------------------------------
Thomas Huth (1):
      ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__

Yuho Choi (1):
      ARM: tegra: Fix OF node reference leaks in IRQ init

 arch/arm/mach-tegra/irq.c    | 9 ++++++---
 arch/arm/mach-tegra/reset.h  | 2 +-
 arch/arm/mach-tegra/sleep.h  | 2 +-
 include/soc/tegra/flowctrl.h | 4 ++--
 include/soc/tegra/fuse.h     | 4 ++--
 5 files changed, 12 insertions(+), 9 deletions(-)

