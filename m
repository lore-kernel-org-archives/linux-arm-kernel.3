Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B25DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RgqcuNM3b9JuHRlhF+Lg57zYP7GZj/pHv1sLESXeMRI=; b=oVZYX7wa4WhYnd/dYmi2izbfdA
	XPTlVI9gisRIRP8BflAtti47GpNkUVrb1KPVlgu5BUf5HsqKDS0drJrRF7pB3e/RWKBXAWD9zN+MV
	7I8grWOvndUFwy6uBLwl2i2D2G78N92D8oj8qtIyFfpk2BIOKCcn8Wk9mkpraJsQs9hK/KN08+haR
	ygavR2F/10OFTBZAYAvIEzCBYTAAtCGbKHUQIl14EREnPcjs5zysPWdB9COglrZDlEnsUtotMaWGV
	Ov2i+L1NAfbgpxyqBPW+Q1GBajOQ7K7f2jXyNOPsTF6Z9ZN6N/L3ZrtJel5NzUoVAkw92+OkWeErk
	nEy+Qyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa0a-0000000Elvn-2xfu;
	Fri, 07 Mar 2025 15:53:08 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZvH-0000000EkwG-0M9U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:47:41 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d269:b36f:7a12:a76f])
	by albert.telenet-ops.be with cmsmtp
	id MrnY2E00K2m8Uyj06rnYRc; Fri, 07 Mar 2025 16:47:32 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZuk-0000000DBkj-1ep7;
	Fri, 07 Mar 2025 16:47:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZv5-00000009sr7-1t7L;
	Fri, 07 Mar 2025 16:47:27 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.15 (take two)
Date: Fri,  7 Mar 2025 16:47:25 +0100
Message-ID: <cover.1741362039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074739_266377_84892AC3 
X-CRM114-Status: GOOD (  15.69  )
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
for v6.15.

The following changes since commit 5f7ebb81112c3f50ffbb8e576e4d35cedd8aabb1:

  ARM: dts: renesas: r9a06g032: Fix UART dma channel order (2025-02-21 16:23:01 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.15-tag2

for you to fetch changes up to 8bf8ad268e46403c7140ea5aaa85e9c659117dbc:

  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31 (2025-03-06 16:36:08 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.15 (take two)

  - Add GPU support for the RZ/V2H(P) SoC and the RZ/V2H EVK board.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 51 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 15 +++++++
 2 files changed, 66 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

