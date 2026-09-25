Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C326C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cSXpJsTAmKDpohkzKYsAWdxBNERvyX9ZUMK7Pk+TpZo=; b=xp5no5KPbtivsgXyZWseu57xiO
	W2pEk9BlAfU0/ZdrDdCVcilVjwhey4Q66jFwkYmy8/VwWV3gXfyif7yGvBwb4EFE6dt0XHhW4VFUF
	RHlFRDyLAdPjpJmOp6sFlfuFEZLEPi42tKcTJugxVAB9/3umLvsVM4LyGM6D51n6Y3Hh2ATGD2v2g
	pYBXAWto3CvuCCPfdQcKm9rDwL98Ug7DzquPt/69ruK8HfVK7FR6chLsHqIFAmFL+VqbSYP9co1iv
	NWi1kPNFlzjPvs6Dki6CFRO20U3n/Lh0po6thTmcl9L6pZCkZQvf0qeM+K9zHgAZtV/cqXqneCpxN
	WOpFZP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1gb-0000000Cwvj-0Abk;
	Fri, 25 Sep 2026 08:53:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1ga-0000000Cwvd-0Aeh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 790EF416B1;
	Fri, 25 Sep 2026 08:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E401F00893;
	Fri, 25 Sep 2026 08:53:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a78000: Add MSIOF support
Date: Fri, 25 Sep 2026 10:53:28 +0200
Message-ID: <cover.1790325809.git.geert+renesas@glider.be>
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

	Hi all,

This patch series adds DT support for the Clock-Synchronized Serial
Interfaces with FIFO (MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.
I intend to queue these in renesas-devel for v7.4 (the first patch in a
branch shared by (future) driver and DTS source code).

Thanks for your comments!

Geert Uytterhoeven (2):
  dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
  arm64: dts: renesas: r8a78000: Add MSIOF nodes

 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 104 ++++++++++++++++++
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |   2 +
 2 files changed, 106 insertions(+)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

