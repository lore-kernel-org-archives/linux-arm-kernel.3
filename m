Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D61C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usKBdbdElss7N9QghB52D5PXx9lAMHyFjXg816UzJ00=; b=oI0XOecS5BfmyjDTRuM/jaQRbs
	ki0LbZTxIlbZG49qNaLFqQMVLRVTjshW6cgcs8Af6MnQ2l18SJzb88X+SaKAGa4kXizqrIumq5XsF
	+liANKXJM4irYL+Et9982SawI6qfDD+24QKZtY8E03ilgDvK64Ogz59IRpYN2rARx1IQekw/3EmZE
	CmYUyhpwE5eI+jITpiM+QoQ3PjZCXoY3SkGlQAW1aAW021r0Ap8/0zc1gEzE6mcmJXqk2JBaLcgs/
	kP3JgpWn7Lh4atXCpcx6VrgGv86ABev9xkURA73OxUdrTRxdPMfkOVmUKIBVfAU4JIMlkcfNOp5C4
	U5nKJkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwe-0000000GxPE-3Wg9;
	Thu, 16 Jul 2026 10:03:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwc-0000000GxNs-1n39
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:03:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9EBF601EB;
	Thu, 16 Jul 2026 10:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423081F00A3A;
	Thu, 16 Jul 2026 10:03:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v7.3
Date: Thu, 16 Jul 2026 12:03:42 +0200
Message-ID: <cover.1784194405.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.3-tag1

for you to fetch changes up to 07231087d5e24c4d9c578c824b96f8af913f7324:

  soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS" (2026-07-16 10:03:33 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.3

  - Drop duplicate default for ARCH_R8A78000.

Note that this commit was just rebased, as I had accidentally queued it
on the wrong branch.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"

 drivers/soc/renesas/Kconfig | 1 -
 1 file changed, 1 deletion(-)

