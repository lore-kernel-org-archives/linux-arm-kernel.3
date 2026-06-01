Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC1ECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d64jsQFCzmAyp4LTXdkRVT3Shxl615R26cNlBzuDIPI=; b=ql1Bg+8S5vPSw+Jm9LCz8jSmlR
	bfSGZu0+WN3q+ywr3Md92AKU5RFKSdMI4JQAtBy7keU/EN6FCXS/B2FOEDljf+eWuMsGhcWES58/o
	GWh2COXfSGI02u1pWjFJ7md72SqRXeOkplVV+QrXeClu/xO8knvkEhhghYp8bib7axh65Bc9uYIPE
	ubL9F2KdBOlSPD6Z76ZJTuPNxvVzExmdsDY1vY/zGqIxcDA/g9miRU647MeheRZ097ieH9k9xLExu
	I7+/zReWmu1GSIsD07ruUm7O+0+55pw5FAAuAv7UedVkdg1kvdV9PQeGqgQ5pVnFC+G3XOtn81N8g
	XQ3HJLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2XC-0000000BCG8-14Qz;
	Mon, 01 Jun 2026 13:18:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2XA-0000000BCFZ-0YKa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:18:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 864F8442E9;
	Mon,  1 Jun 2026 13:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2914B1F00893;
	Mon,  1 Jun 2026 13:18:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:17 +0200
Message-ID: <cover.178031911driver8.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_061824_187260_11589D79 
X-CRM114-Status: GOOD (  16.62  )
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
for v7.2.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)

    - Identify the R-Car M3Le SoC,
    - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

  [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)

    - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
      SoCs and their EVK boards,
    - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
    - Add support for the R-Car M3Le SoC and the Geist development board,
    - Specify ethernet PHY reset timings on various R-Car boards,
    - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
    - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
      R-Car X5H SoC and Ironhide development board,
    - Add serial DMA support for the RZ/G2L SoC,
    - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
      SMARC SoM and EVK boards,
    - Miscellaneous fixes and improvements.

Note that the second PR includes DT binding definitions for R-Car X5H,
which are shared by driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

