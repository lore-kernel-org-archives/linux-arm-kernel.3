Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8AAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYwcUQI6eshpvBLm5vh2y6D9O7cayfFh4u0oZiMJgZ4=; b=AtCGKvsT6qO7sKT+pCZ9w5piFV
	w+Zx2Qxb1BoKaYwdK+2iWnentVamH3XmgSrimjaNQ443czcmkVDL7lYJIfvBssI80plakh34uBy6n
	3CWv9uaUA+eqVOBEfVjZyY5UuRwRkcL0wSGwkHrgY0QNHjMF9zI3n0AgsjRCjYUDODUvVHwpccChC
	bHKbvRFq+ofktkKBl4a/XqjkJ3iVX3lTWzNgxfuPcAUCKZmxnUT7pCuoBSeTbC6Fn3ESDSL2BOiLm
	8I770yRFzVc1KNA+PSiMF6qTrliW5iQ9+iW5wOC1zWq3tBrsHc6e1Jh9acZysOerHdQf+aJxlB8RA
	QBC2y5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J09-0000000HGIr-1Z9c;
	Fri, 25 Apr 2025 13:21:57 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IGr-0000000H8f1-2lD5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:35:11 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by albert.telenet-ops.be with cmsmtp
	id hQb42E00C16PE0206Qb4sN; Fri, 25 Apr 2025 14:35:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJj-3IuM;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKj7-06pD;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.16
Date: Fri, 25 Apr 2025 14:34:58 +0200
Message-ID: <cover.1745582594.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053509_832747_C347FDE6 
X-CRM114-Status: UNSURE (   6.75  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.16-tag1

for you to fetch changes up to 9e3b7138c3745a91d91e7e525e4b800ea276a761:

  dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support (2025-04-24 11:13:53 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.16

  - Document support for the Renesas RZ/T2H (R9A09G077) SoC and the
    RZT2H-EVK evaluation board,
  - Document support for the Retronix Sparrow Hawk board, which is based
    on R-Car V4H ES3.0.

----------------------------------------------------------------
Marek Vasut (2):
      dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
      dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support

Thierry Bultel (1):
      dt-bindings: soc: renesas: Add Renesas RZ/T2H (R9A09G077) SoC

 .../devicetree/bindings/soc/renesas/renesas.yaml        | 17 +++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 19 insertions(+)

