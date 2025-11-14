Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D25CE7AA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ta/AmC3TjT+2DzNzJIpGMfGfC0DfUfmMANJ/wK1D/JM=; b=G6Zf+3l9B/34fFBXuXtevUrfyv
	XhBE4wTJuop4sm8jWKapOIgXsEG//k0zzPHiQOjLJ68YjBQqovTQTIZJPkI5TYUwaWO3KYq3M3tFO
	Gu5qtK29DbIL/zR+kpRHxnI0yH/BVEiqfw6el/ySjnPHaK9KZolX/y2zHKrctBm9hWn73RwQw2J77
	mEsIFd0EUtAqOeWEtaA+0A+D7hemD+KnZEaUdBJ9y+kny/zRl46zFpgpbs76QjjkNsAYcn2EYgpkb
	AqG4topzY7+12MfbIjEVb9b47NyzdANnyzEnI89wEHJ4zXp/72wUcQy/UuUiO89wddECXZfEu5FG6
	iJQLp7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr4X-0000000C17s-0jYV;
	Fri, 14 Nov 2025 10:30:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr4S-0000000C16k-3VbS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB55143C4F;
	Fri, 14 Nov 2025 10:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F31C4CEF5;
	Fri, 14 Nov 2025 10:30:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:15 +0100
Message-ID: <cover.1763115230.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023024_895059_C4FC221F 
X-CRM114-Status: GOOD (  15.46  )
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
for v6.19.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v6.19 (take two)

    - Fix accessing forbidden registers from regmap debugfs on RZ/G3E,
      RZ/G3S, RZ/V2H, and RZ/V2N.

  [GIT PULL 2/2] Renesas DTS updates for v6.19 (take two)

    - Add Imagination Technologies PowerVR Series 7XE GE7800 GPU support
      for the R-Car M3-N and V3U SoCs,
    - Add Ethernet support for the RZ/T2H and RZ/N2H SoCs and their
      evaluation boards,
    - Add ADC support for the RZ/N1D SoC,
    - Add thermal, NMI pushbutton, and RTC support for the RZ/V2H SoC and
      the RZ/V2H EVK development board,
    - Add USB2.0 support for the RZ/G3S SoC and the RZ/G3S SMARC Carrier
      II board.

Note that "[GIT PULL 2/2]" includes DT binding definition updates for
the R-Car V3U SoC, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

