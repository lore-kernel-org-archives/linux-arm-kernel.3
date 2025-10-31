Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40ADCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=284z7Hal/NkUcCi7B3xmvIyDeO/MgHxqIKVnu+dZRzE=; b=dw9QMt28dr/BdAn9WhlQjjjRQL
	PquNS2v8dYfIa/59/DEU+7We8BmxCbJ+wwDIV8aT+c7xCWLWaZR26zJt4Cf3ekdvGC4s1ynGE5z3/
	KrJPdC6TyJgAHcq/UpzBElEKaNj/npM8yKLRZTTTF3klttxJajRNOiLe3xk0L9wu5C8mHV/3en9cl
	yGdvTOFMvKYiDOub50mhgbPlprziT6a7CLQRlIu7hcM7Xjcpcke0nNNkWVOwJdYbAehHA+VGaRusH
	777J7lNJBoJtSqOia17ToQpsYtMcFlzauR+Jn17g2SFAYDfjC2aEGys4bfKbb+63Xcai/PmyvTuIp
	GX6vDr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbt-00000005x3J-0UVR;
	Fri, 31 Oct 2025 10:43:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbf-00000005x0A-1PTF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12656408C9;
	Fri, 31 Oct 2025 10:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9863FC116B1;
	Fri, 31 Oct 2025 10:43:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.19
Date: Fri, 31 Oct 2025 11:43:31 +0100
Message-ID: <cover.1761905414.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761905410.git.geert+renesas@glider.be>
References: <cover.1761905410.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034343_414300_C5B9EAFB 
X-CRM114-Status: UNSURE (   7.06  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.19-tag1

for you to fetch changes up to 4765d59fcf8679372286bc899628c3721dafe456:

  soc: renesas: rcar-rst: Keep RESBAR2S in default state (2025-10-23 16:03:30 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.19

  - Keep the WDTRSTCR.RESBAR2S bit in the default state on R-Car Gen4.

----------------------------------------------------------------
Wolfram Sang (1):
      soc: renesas: rcar-rst: Keep RESBAR2S in default state

 drivers/soc/renesas/rcar-rst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

