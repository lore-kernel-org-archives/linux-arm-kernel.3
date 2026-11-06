Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC41606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EdnTBgnv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=83X7I5YDbIYy10X4mgzlqvfEyStnFtsT7gAcWs1z/GQ=; b=EdnTBgnvXQNJRXLXL+3EQon0m2
	rHkZfqXJDqYhkTKDJqEiv06XWa91FltDdevN+Tqa1AEHuQ0MTb6hC8c5tj2hbF37OyOCvjGz68IJb
	O3Rc7QstIQ9q+JZhDSM/+0ZiglKxwYRNypT87CZYCQE7rA8GKIhR+TpXkLCQhx7DjxZZ/Nen7VNTV
	Q9A20/hgVVJXe9p6mMVLRUm44AFgUOwEB3sxVzWOnmYdOpxlEzkw5NnChGGlsRvvfCCmn8R/H4O/0
	Dyg4ZZ0wpI/V4M65sXS4OaohC2ITsZgk75dERvdtpODwctcCEyKnarnvo3lzkXhUmc/5Q1zDQ0cl9
	sxE9aE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH1E-0000000Bt0d-268z;
	Fri, 06 Nov 2026 10:18:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH1D-0000000Bt0W-2LWA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:17:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5394601BF;
	Fri,  6 Nov 2026 10:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8C91F0089F;
	Fri,  6 Nov 2026 10:17:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.4
Date: Fri,  6 Nov 2026 11:17:50 +0100
Message-ID: <cover.1793960114.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

	Hi SoC folks,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.4-tag1

for you to fetch changes up to 8ca80811c3ba01691b424f4fef4db8960955df4f:

  perf/renesas: Remove remaining RISCV_ALTERNATIVE references (2026-11-02 11:52:48 +0100)

----------------------------------------------------------------
Renesas fixes for v7.4

  - Fix enabling RZ/Five support.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      perf/renesas: Remove remaining RISCV_ALTERNATIVE references

 drivers/perf/Kconfig        | 2 +-
 drivers/soc/renesas/Kconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

