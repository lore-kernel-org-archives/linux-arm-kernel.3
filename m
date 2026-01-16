Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58687D47CD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fdlXsIb3PdMdPvOZc+JjP0d3YWvB0BkXsLeAJmnXIwQ=; b=cCIH1YCXlzX+pa+D22l2ox3Cm/
	M8aLesFeVfP0ueghaoUt+FFQDdTgR31nEDBS7kq94EiUuWXqS7S9Gel0aPXqzqAxOefWqnCDtA4ny
	nvpe4HF+Myi9lksscG13qID1t5MiD0E2P9i2UsaTrH1FAIrUA6eDhbQEmUZcXBdZphupjFIPSYTmw
	VKRcehrNWmWn+Nx5+xpwHYt42UgeXAWrQBtfURLGEUeHb8v+UiYH/JLsIvrRxGg0uIWW/PSMnuEab
	HOSaXNy9WvbQZwaEeNNatUjfGoUSRHIHRGhs14Ncmp+rqjuj6aV97uE+OzVY+sppQrDcg/64eY2zo
	nN4Pv1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghPP-0000000DzL3-3waQ;
	Fri, 16 Jan 2026 10:50:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghPO-0000000DzKh-3B2U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8955760167;
	Fri, 16 Jan 2026 10:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3884C116C6;
	Fri, 16 Jan 2026 10:50:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.20 (take two)
Date: Fri, 16 Jan 2026 11:50:15 +0100
Message-ID: <cover.1768559762.git.geert+renesas@glider.be>
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
for v6.20.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.20 (take two)

    - Add and use for_each_of_imap_item() iterator,
    - Add support for the RZ/N1 GPIO Interrupt Multiplexer.

  [GIT PULL 2/3] Renesas DT binding updates for v6.20

    - Document the RZ/N1 GPIO Interrupt Multiplexer.

  [GIT PULL 3/3] Renesas DTS updates for v6.20 (take two)

    - Add cpufreq, thermal, GPIO IRQ, and CAN-FD support for the RZ/T2H
      and RZ/N2H SoCs and their EVK boards,
    - Add more serial (RSCI) and CAN-FD support for the RZ/V2H and RZ/V2N
      SoCs,
    - Drop unused .dtsi files,
    - Add I3C support for the RZ/G3E SMARC SoM,
    - Add GPIO support for the RZ/N1 SoC,
    - Miscellaneous fixes and improvements.

Note that "[GIT PULL 3/3]" includes DT binding definition updates for
the RZ/T2H and RZ/N2H SoCs, which are shared by clock driver and DT
source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

