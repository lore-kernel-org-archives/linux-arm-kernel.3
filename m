Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CA5C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NPmEKODxYJMajvK/1zNsFdtLlKRZEgYLQoOojKtdR1c=; b=OXsM/p/dKg/EYvBWWkQaproq9Z
	DpevBwr1Pv7LOy0S1m9pa1Ib8eadbatVDOmrIwr15TKt4wB+hu2BRs6nXXNKvBAVfad4vHGKlcA5T
	tZiATAhZzGS7UK2AYmqjfutsKoaBRhiz6jpnQKExNlZpi4xsli4+civ6NEFuRyJWdL35M2qCQCl9T
	jXKqZyPjxLIHPL8KvXbyDNA+ccIcNc7UNMDuZXmWzikmD223ZggdvOZCnbac7/r904kyy3ZgjnKCC
	MM+kDpj512buqqtt831RRiewnwp7vbA65UHbG+TDwOELiAc54UGyyW4a09yK0Czs00hF2Q+bxo7Rj
	jT/vRIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwa-0000000GxN7-2hgl;
	Thu, 16 Jul 2026 10:03:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwZ-0000000GxMw-0CW9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FC4B600AB;
	Thu, 16 Jul 2026 10:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C381F00A3A;
	Thu, 16 Jul 2026 10:03:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.3
Date: Thu, 16 Jul 2026 12:03:40 +0200
Message-ID: <cover.1784194401.git.geert+renesas@glider.be>
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

This is my first pull request for the inclusion of Renesas SoC updates
for v7.3.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v7.3

    - Use the of_machine_compatible_match() helper.

  [GIT PULL 2/3] Renesas driver updates for v7.3

    - Drop duplicate default for ARCH_R8A78000.

  [GIT PULL 3/3] Renesas DTS updates for v7.3

    - Add sound support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
    - Add more serial and SPI support for the RZ/G3L SoC and the RZ/G3L
      SMARC EVK board,
    - Add SMP support (32x Cortex-A720AE) for the R-Car X5H SoC,
    - Add hwspinlock and mailbox (MFIS) support for the R-Car V4H SoC,
    - Add GPU support for R-Car M3-N-based Salvator-X(S) and ULCB
      development boards,
    - Add SPI and FRAM support for the RZ/N1D SoC and the RZN1D Expansion
      Board,
    - Add PCIe support for the RZ/V2H SoC and the RZ/V2H EVK development
      board,
    - Miscellaneous fixes and improvements.

Note that the third PR is based on renesas-fixes-for-v7.2-tag1, for
which I have just sent a PR.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

