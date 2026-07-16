Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C8C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfXo70ODIe+deUMsgoRZzV7WbheUeKes57gPQzywSfc=; b=0VWEa7wQeON3MFsqa7zOGySAEE
	FCE7q0DJGnMH4UGApEXW34jli+MR3mLjK0badkLe+mva4eENKl9f9y7j4aWdk/7KINuYx175nf9mI
	FF0U0u/8NipSe1TU3yUOHzxgrRCGgAk9QOfYhwo0f2DN6PNdKTAa4JZ17upwqDPXKFBwWeAG/Rbvi
	VguC2TWyU/2DqLotDSoNOJI1JYavwb0ZOsLoSNsIbWuYA2Ci9BMCyFeJfFLZWRVQTNESEwsJxQy3g
	kRARVh70+XsfBVAZdqomYveil2PEe/ConQpcRp4QbKJ3Y2VHyh+Oh5upCjUZTenV/3Q8fHXqcAsVj
	e6GpSdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwe-0000000GxOw-3BNC;
	Thu, 16 Jul 2026 10:03:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwa-0000000GxN6-3CdK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:03:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21DDD600AF;
	Thu, 16 Jul 2026 10:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806D71F00A3D;
	Thu, 16 Jul 2026 10:03:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM SoC updates for v7.3
Date: Thu, 16 Jul 2026 12:03:41 +0200
Message-ID: <cover.1784194403.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
References: <cover.1784194401.git.geert+renesas@glider.be>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v7.3-tag1

for you to fetch changes up to c902a6887eaadf56e6da79f68f8843cbe45cc808:

  ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper (2026-06-29 11:18:03 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v7.3

  - Use the of_machine_compatible_match() helper.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +++++-----
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

