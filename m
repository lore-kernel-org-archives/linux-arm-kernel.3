Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC21C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+OHgVTMwNaLyhipG8VCXvZ9u+Td0roP/gxOMHajBIYg=; b=cADno/eQcEW7CKvRW1uIBqTf5b
	y1rDTRcDKo4kj+5mMZrpn5Us/V13asC2IHU5gxjXVgUUttIJlMfp05harybrFj+52mPukjNdwoZYB
	mj19Tv2xZ8C4gHuJR4EiSdfqG+ULjqyUjrVDfdn/oCRSY+QrrvfiKld6jMxaVDHh8Rv85gzC1wE0G
	27iTAGoNq4CbTrJfuM0d7B8twp4X10w2blHiRbnnfKoYTb/DPlgvGbeJQ3sWyNFkTXGr1+JyKsT8H
	7HI/a/skbXeVv7+fVo4VynnMm83QzRTqdhhiW2/RwsEgK2AA98+8WOYDFHgo6Ewd9875lELIQFpqv
	sokJhacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIQc-0000000Gs9o-1JVi;
	Thu, 16 Jul 2026 09:30:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIQa-0000000Gs9X-2e2S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:30:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCEFF60054;
	Thu, 16 Jul 2026 09:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377981F000E9;
	Thu, 16 Jul 2026 09:30:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL]  Renesas SoC fixes for v7.2
Date: Thu, 16 Jul 2026 11:30:40 +0200
Message-ID: <cover.1784193843.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

	Hi SoC folks,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.2-tag1

for you to fetch changes up to 6fa6ee724d8dadf392139e242ac936b5da730c4b:

  arm64: dts: renesas: ironhide: Describe inline ECC carveouts (2026-07-14 10:34:32 +0200)

----------------------------------------------------------------
Renesas fixes for v7.2

  - Fix lock-ups on the Ironhide development board.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: renesas: ironhide: Describe inline ECC carveouts

 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

