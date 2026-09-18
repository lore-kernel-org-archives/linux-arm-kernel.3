Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B0AC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LStEsENTok96xGoAms0hkRXPRHSpzUaoNYF174l62WY=; b=4ZPlymbobgKvwRS5Yku0htvKgB
	CwJPTacNtINilGsw0CfV5/Fdg//G4+Ga7T8E8B/ERPZWoVrURnYg1SI8U8P2tWfHeaPperunXAWmG
	cUEITtzYZKFmZ94fpHS3hxUEJoNE4GecKaE7hrXRByk/Qz583RgHiMXTivsffc1E4MPyq9TjYTZ6P
	197L5O5Tl6Zc9pbHkztYk711t4SRVLd/aaxCEtt8kPczhu7XOEe6mY3JUkCT9H+VJn2Q8FOcYw2Lo
	nDuzaAN1YFqMFPQrMoDPuFMUNejwvbJyu77i3iYIH5tkqz7/VUI/BdMqRZCX0MGyY+Z6rpV1nW1t/
	65A4OHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V1w-0000000Dy0h-3beG;
	Fri, 18 Sep 2026 09:37:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V1w-0000000Dy0Y-06VX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95343409E6;
	Fri, 18 Sep 2026 09:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230621F000FF;
	Fri, 18 Sep 2026 09:37:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.4
Date: Fri, 18 Sep 2026 11:37:02 +0200
Message-ID: <cover.1789722868.git.geert+renesas@glider.be>
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
for v7.4.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v7.4

    - Refresh the ARM SH-Mobile defconfig for v7.3-rc1.

  [GIT PULL 2/3] Renesas driver updates for v7.4

    - Register the SYSC power sequencer on RZ/G2L,
    - Add hwspinlock support for R-Car V4H, V4M, and X5H,
    - Add initial support for RZ/G2M v3.0,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/3] Renesas DTS updates for v7.4

    - Add GPU and display support for the RZ/G3L SoC,
    - Add display and RTC support for the RZ/T2H and RZ/N2H SoCs, and
      their EVK development boards,
    - Add I3C support for the RZ/G3S SMARC SoM,
    - Specify ethernet PHY reset timings on various ARM32 boards,
    - Add Clock Pulse Generator (CPG) and Module Controller (MDLC) support
      on the R-Car X5H SoC,
    - Add GICv3 Interrupt Translation Services (ITS) support on the R-Car
      V4H, V4M, and S4-8 SoCs,
    - Add GPIO support for the RZ/N1D-EB Expansion Board,
    - Add Display Stream Compressor (DSC) and (more) DisplayPort support
      for the R-Car V4H SoC and the Sparrow Hawk and White Hawk
      development boards,
    - Add WaveShare dual-channel CANFD HAT support for the Sparrow Hawk
      development board,
    - Miscellaneous fixes and improvements.

Note that the third PR is based on renesas-fixes-for-v7.3-tag2, for
which I have just sent a PR.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

