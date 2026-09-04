Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1675CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4kv5pGZXqtBB60I0vKntwbkYj69MMCHELyuz3CQz7pA=; b=nsT5vsAjbtwwQB4OVFiwdoDFgZ
	PFrP85MNNLmaCRqKBHhEPO9ErllRJ1X+fsePFub4H6wdV7Rw4x/5RFwLMcibxwNZPu8o6seM4VNyJ
	OrI138M5E0lgOIfPIGk9HENKjYTOipv8Fa+sF6REMQ5/f7fSThsgNbkwowIX8yt/fmZpchSkC/4fC
	PAH5OoCT8cDmFfDEmPg1R/W5kcYwzRDZ190pclS9i4VXfKklicKLFBoNcz5AmOTm+7A1/ZMv7G9ax
	2jRhS6PVM4Z0jojfmpm4yNJHROzTye6E7xDe4BUPuhjiPlNtnZvpJX6qJMknfECWFCHfFEouhuj1s
	24wNmGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TrG-000000029Br-3WFH;
	Fri, 04 Sep 2026 13:21:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TrG-000000029BV-0XJO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:21:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8D3841A50;
	Fri,  4 Sep 2026 13:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007DD1F00A3E;
	Fri,  4 Sep 2026 13:21:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL]  Renesas SoC fixes for v7.3
Date: Fri,  4 Sep 2026 15:21:23 +0200
Message-ID: <cover.1788527983.git.geert+renesas@glider.be>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.3-tag1

for you to fetch changes up to 2ac7bad110be6ebe478d6bd57821f7f5259a1f54:

  arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR (2026-09-02 14:32:37 +0200)

----------------------------------------------------------------
Renesas fixes for v7.3

  - Fix Ethernet stalls on RZ/V2H, RZ/V2N, RZ/G3E, RZ/T2H, and RZ/N2H.

Thanks for pulling!

----------------------------------------------------------------
Ovidiu Panait (5):
      arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 27 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 27 +++++++++++++++++++++++++++
 5 files changed, 84 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

