Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFEDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAEH4WmKvOK8Jh2AGkuNuosJZIbY5mQ4vX4Y+Bpjjjk=; b=0yK0ZtQejb/Rqmjs8C/cc6aQ+L
	mB8yCxNrYDI+95RXj/pEpA5h46PENskMnTa948u1vyOJLozwyo0ZrV/3N1oC+nur4kJhSczDBaJsa
	1am/1Xna1A16E0oivQa9/WxPLikijtsQ+YHJnmcN4m65X74rTlMnBWTP9A16x5KMumF44qxMq5LY7
	TA/v5Eo1LCtKTWih6q6aM4feSJUN4Jvfi/5vwreCJB9fZXiztmJ7jciDX3voqxCjlBKUPTiUHuTjU
	0aLd1QMbpUycA6qpUaqaIvlxEI0P/QdWwb+Z3QbBcO+mPTDkpuxfXtY1vzRldDVLh2LrXbdLFShjZ
	TxE6Dl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWV6-00000006JNf-2OQP;
	Fri, 21 Feb 2025 17:07:44 +0000
Received: from riemann.telenet-ops.be ([195.130.137.80])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWLK-00000006HPD-35mS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:57:42 +0000
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YzxBk5XQWz53lb4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 17:57:34 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by xavier.telenet-ops.be with cmsmtp
	id GGxX2E0030y8aK501GxXRt; Fri, 21 Feb 2025 17:57:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsb-3jyN;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqx-1IZ1;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas DT binding updates for v6.15
Date: Fri, 21 Feb 2025 17:57:25 +0100
Message-ID: <cover.1740156745.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085738_909232_7BCC6F32 
X-CRM114-Status: UNSURE (   8.28  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.15-tag1

for you to fetch changes up to 00e3cb0d638ce70391470f894820d8442a155e95:

  dt-bindings: soc: renesas: Document MYIR Remi Pi board (2025-02-10 09:42:40 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.15

  - Document support for the Yuridenki-Shokai Kakip (based on RZ/V2H)
    and MYIR Remi Pi (based on RZ/G2L) boards,
  - Document support for the RZ/G3E System Controller.

----------------------------------------------------------------
John Madieu (1):
      dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding

Julien Massot (1):
      dt-bindings: soc: renesas: Document MYIR Remi Pi board

Nobuhiro Iwamatsu (3):
      dt-bindings: soc: renesas: Document more Renesas RZ/V2H SoC variants
      dt-bindings: vendor-prefixes: Add Yuridenki-Shokai Co. Ltd.
      dt-bindings: soc: renesas: Document Yuridenki-Shokai Kakip board

 .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml      |  5 ++++-
 .../devicetree/bindings/soc/renesas/renesas.yaml         | 16 ++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

