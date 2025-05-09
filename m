Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B45EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkvwwQJoRkK9UkEicOFWY1loHWqTVo2MnO9FA+uEYGA=; b=c/QvZ+PRWgJiXFGoNaeKkoijAV
	I7O2rB3uDc2F6cBeQ1h+Mad8w6vR6tmtAs4tpHVXoaAsHC5ETtJ62ozod4M+sKnKkW86bpWycz/3s
	DEgOiU+Q8vqOX4XMlQufDpASprqEUODDuU8GUR3KWVpjUkc+F3hRfbzLmede6GtT7W+aoEIdfWAnz
	xTG5Pp0rh+mn2BDTdOWRTQ5eYjgraRDjhpG6rruuhkteVOiy2ROBCIw3HsboL+tOnbLNUhcz4xP1M
	p7uL4V+L4+pyfclbugWpJ9tuzNUgSUjNCIkna2IwT2D3T2fYAWMoqCey5QkgmAMm68B1XJIJc/Vjh
	sHpu9ULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQw5-00000004Loj-3Dd4;
	Fri, 09 May 2025 16:50:57 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOcn-00000003w77-45Nw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:22:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by baptiste.telenet-ops.be with cmsmtp
	id n2No2E00K3X0DE5012NoC1; Fri, 09 May 2025 16:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Nm-3RLh;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADJ-1vzK;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:29 +0200
Message-ID: <cover.1746798752.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
References: <cover.1746798748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072254_146852_BC4CE477 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 31d358e611b7cc21349da58dd2c9118c84b0859f:

  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC (2025-04-14 10:53:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.16-tag2

for you to fetch changes up to 3903b4701bc03d7d805c3df378a7fc2ff72cbef5:

  soc: renesas: rz-sysc: Add SoC identification for RZ/V2N SoC (2025-05-05 10:54:02 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.16 (take two)

  - Cover all R-Car drivers in the ARM/RISC-V/RENESAS ARCHITECTURE
    maintainer entry,
  - Identify the Renesas RZ/V2N (R9A09G056) SoC.

----------------------------------------------------------------
Lad Prabhakar (1):
      soc: renesas: rz-sysc: Add SoC identification for RZ/V2N SoC

Uwe Kleine-König (1):
      MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE

 MAINTAINERS                         |  2 +-
 drivers/soc/renesas/Kconfig         |  5 +++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g056-sys.c | 75 +++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       |  3 ++
 drivers/soc/renesas/rz-sysc.h       |  1 +
 6 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c

