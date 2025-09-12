Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yS3MVaBiPFvnqtziEvD6/apdL+y3TLGDsNfXHatWXM4=; b=YmKOvwX8kUQlz5Hs1thwiD39C0
	C55cG/5jxF/cAe50egPWvgj7YIe8YV3tquM6x2yvNZCOKK+DZSjXIjwfVhJUOK3AhjbCPpAGoLJTK
	0jTRpMbloSiBPbW9o1keR3UZCtoQiQuK9mgokhlkNfdYLD9jWsy4KnRmerDBtwEZ4I7IA9cfwlngA
	rs3nbM9AZYZyTRUP6qz2a57RoSHokuAGo0PRRS7HDU+WmGy+v65Gjt1479cP12G0LdoASWxFC0jLq
	PErxwRj6suNGOs3CXXEYnUMfa5nRw+y+qovKuDfVgEMdHedo6c0jdPsbV2d11pyo/43YWy7yRe1jr
	qiAwQK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jB-00000008oLq-0ICR;
	Fri, 12 Sep 2025 11:14:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1j8-00000008oL2-3rvd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DADF3601E8;
	Fri, 12 Sep 2025 11:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46638C4CEF1;
	Fri, 12 Sep 2025 11:14:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:13:50 +0200
Message-ID: <cover.1757669912.git.geert+renesas@glider.be>
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
for v6.18.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.18 (take two)

    - Identify the Renesas R-Car X5H (R8A78000) SoC.

  [GIT PULL 2/3] Renesas DT binding updates for v6.18

    - Document the R-Car X5H (R8A78000) SoC and the Ironhide board.

  [GIT PULL 3/3] Renesas DTS updates for v6.18 (take two)

    - Add pin control and I2C support for the RZ/N2H SoC and its
      evaluation board,
    - Add LED, EEPROM, eMMC, SD card, watchdog, and USB2.0 support for the
      RZ/T2H and RZ/N2H SoCs and their evaluation boards,
    - Add I3C support for the RZ/V2H and RZ/V2N SoCs,
    - Add IMX219 and IMX462 camera overlay support for the Sparrow Hawk
      board,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

