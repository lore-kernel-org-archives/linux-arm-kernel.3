Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4BACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Btcv1JlLVeWzTDBBNk7kse99r0kzLSGMQFjG/1Oheao=; b=z8GGd8dwnsslbYStgMYBgSbS4F
	J1S6LaT690PQEOFKFb2NSDVmmCyx24RyglfUUQ1GnyTye93FOlPvYk6ns2vT5GL+GKjlpszeIgsA5
	Acx8Gzf2j6M5lkAcAZ7zMZdA1UPLMq4An7PysKaH7Xa+1dwS27eCmxTs0rvWtx3GiZVGCq+dN6P1x
	nqtj5Kjqbxi2Hj6jhzcwPA/4nxzqKhTyWAStY9e51Tv7Iiz1odzJE6JwWcVNH1SK9ZzKDjsQaTx+/
	2Lf+DLfIA61mi/Zdye51zhQ3K6hAZUaJcM6s1kkerBbGlqepLxkvXAk+8bsF74b4zphYAwNgV9Qkb
	vVERhwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us367-00000006Yxc-0zv6;
	Fri, 29 Aug 2025 17:41:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ury3n-00000005cZT-0i8o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2CB240432;
	Fri, 29 Aug 2025 12:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BBAC4CEF0;
	Fri, 29 Aug 2025 12:18:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM SoC updates for v6.18
Date: Fri, 29 Aug 2025 14:18:13 +0200
Message-ID: <cover.1756468045.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756468041.git.geert+renesas@glider.be>
References: <cover.1756468041.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_051827_225223_1775EE57 
X-CRM114-Status: UNSURE (   7.91  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.18-tag1

for you to fetch changes up to ad38ea266b8dc6e15e0d2a14a9d8543345fdba44:

  ARM: shmobile: rcar-gen2: Use SZ_256K definition (2025-08-11 16:23:35 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.18

  - Use the SZ_256K definition.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use SZ_256K definition

 arch/arm/mach-shmobile/pm-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

