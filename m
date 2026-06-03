Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26063CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zuOjzE83S2w3miwJiK/G2SRQFoPd2jOOmbLhRNJa6Yg=; b=BbV2aDoNorUZ3wFRt68mm6nJiZ
	SswkuLozZhRcheyNq1PkXm0WTcpVbc0L/yaaaPaH2mg12ignsrZngp4ccWfYgn1FuJ4Bi/fFwA0z9
	MuHduis0QH2NenhBU9MRGdZRNyrsDAxLUeSgrG+LtuHzqXa8rhb3OEjkOB8qbKcgdeY2nG5M8UiHN
	jqnuyuUHzkZ1NCBt0lyaojlU5BesAVxJZRgvBeBUTs9dMjQw1+5MQyAOzo6JfzojmVzQzlGfRmaZY
	5w6rSDhGA5cwb6iow0jeLgv6YRcEv4DVU+saJ5vPf5GzOqcEz9v7tAqnSweXLnmIZVIbfwtevV82V
	1w1+1AQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtHU-0000000Frhb-2F3R;
	Wed, 03 Jun 2026 21:37:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtHQ-0000000FrhE-3xCn;
	Wed, 03 Jun 2026 21:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=zuOjzE83S2w3miwJiK/G2SRQFoPd2jOOmbLhRNJa6Yg=; b=KLv4xqGHn/Rb59QQu7gjH/7r/N
	vOzVZz3GsMP8g3rfh44djegNWEANqKyi9gwZ060yBMGHn95argxyNIIb/Cpzfz9Hsb6VcbkiL9THf
	HnKKmUafK8GUfDWjVr7kUuAgazy33AICxLwtpkfJZt5wu5VIBmVAN/213ae87h7afDYgDzcKgeIki
	ADvdSvc39yFqLm6k5gQqlc+WWMf6pBloi1HXPqIy+XdidHRuGQ9+CuAhOhmGelQANLTCd93tO8CQ/
	ZjJXk88CEqNDWUl/ZNWqQG5iy7m2wJSSpvXaCpBUIbxu9CJU+5JHPVYCVh2nN1FOUxnkb05s6seD7
	iHz5mRrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: rosenp@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: rockchip: don't COMPILE_TEST builds on M68K
Date: Wed,  3 Jun 2026 23:37:26 +0200
Message-ID: <20260603213726.1025094-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_143741_061936_E55F38E0 
X-CRM114-Status: UNSURE (   8.74  )
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

Rockchip clock drivers use hash-tables with enums as inputs.

M68K does interesting things in its __hash_32() implementation, casting
that u32 input to an u16 and therefore triggering warnings like:

   drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
     arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (18720 becomes 8720)
     arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (1e8e8 becomes e8e8)

As M68K should never ever need Rockchip clock drivers, simply disable
compile-tests for M68K.

Fixes: 7edfb7fb58ee ("clk: rockchip: allow COMPILE_TEST builds")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 85133498f013..8b49fe6f46fb 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -4,6 +4,7 @@
 config COMMON_CLK_ROCKCHIP
 	bool "Rockchip clock controller common support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on !M68K
 	default ARCH_ROCKCHIP
 	help
 	  Say y here to enable common clock controller for Rockchip platforms.
-- 
2.47.3


