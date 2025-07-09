Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iT+1QiDE9G8XyFlhLxaA5trMfsyxXOsEjllpaNAv1YA=; b=0EZNXKs8moiCBf9b2ktHaz3gna
	etYdnrEaPNeo7DlIAuOrVhcxpxYFKSLiZIQC4wdh3LKaG7s35iy+ZNB0821ESwP3oah9ua29eOuBC
	BXSPLQsWaRHma4pAdFlu2bDPsyA5TN47ekMQFdEWD9uz5kBHKtPpTl3pmXU9x5wvAYydna3mMGlZA
	tkXc2zNzAn1Y+tM66RZCOBsjMtauIEAov9/ARn33L5uK10oZUeeEA9nPn8TnIvv8LQfaHgFwUlxtR
	rSgWkDTFB/gNDb67Y64DGAS2jAafnsUvif91QyEppMuer2/Ka+eY1Bc/V8YhxC4kuLsFvPpf6UVkS
	zjdQOahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiI-0000000A84N-3MdV;
	Wed, 09 Jul 2025 22:56:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbB4-00000009mml-3KxB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 20:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E11B61152;
	Wed,  9 Jul 2025 20:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A21C4CEEF;
	Wed,  9 Jul 2025 20:14:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:24 +0200
Message-ID: <cover.1752090396.git.geert+renesas@glider.be>
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

This is my second pull request for the inclusion of Renesas SoC updates
for v6.17.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.17 (take two)

    - Sort Renesas Kconfig symbols.

  [GIT PULL 2/3] Renesas DT binding updates for v6.17 (take two)

    - Document support for the Renesas Gray Hawk Single board with R-Car
      V4M-7 (R8A779H2).

  [GIT PULL 3/3] Renesas DTS updates for v6.17 (take two)

    - Add support for the Renesas Gray Hawk Single board with R-Car
      V4M-7 (R8A779H2),
    - Add eMMC and microSD expansion board support for the RZ/V2H and
      RZ/V2N EVK development boards,
    - Add GPIO keys and Ethernet support for the RZ/G3E SoM and SMARC
      Carrier-II EVK development board,
    - Add QSPI FLASH support for the RZ/V2H and RZ/V2N SoCs and their EVK
      development boards,
    - Miscellaneous fixes and improvements.

Note that PR 3/3 includes DT binding definition updates for the RZ/V2H
and RZ/V2N SoCs, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

