Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC46FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hc9JLjcWwkigrZf9TZcKf0NBP2NYJ3u9RVUufIYiWxo=; b=dAVpKzkiK4ly74/GtUYoqvldtm
	U6noUztdkuNTqRNuEygMwVoGW+etf+uc7og+tSvhG/mgcDnrEsNFT+7YZAtJ4yzHQdgtkVHKIv7Ug
	WUHbac7blcnq9VW0/60xAtuJ2veB4vlELQeYSf5wei6eJx0+XyUKitR9qriejR9izNYdDeBwrPD9R
	OLJd6CcPy3tkoJCpd6JrQYZhftyvZpauTYhWAmpjdtipLMYEii+3IIDEd5oHVVZpdD5hP+fe2bVLk
	3WdQeXq2wlF5Qtmu6TmJod8T5l3XU3/MpI55qzGC1f35lEUZGFovOUz8Nu/f+cSpAaMuYxmEnuWFr
	sm5HbkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVfs-0000000AZI3-3w6A;
	Sun, 01 Mar 2026 01:32:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVfq-0000000AZH6-0wyE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C75764428C;
	Sun,  1 Mar 2026 01:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7569C2BC87;
	Sun,  1 Mar 2026 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328765;
	bh=g2OaSrwdKEpWhPv+QEXEVWvFKu3syn9agrnbERcbPhs=;
	h=From:To:Cc:Subject:Date:From;
	b=J16KgcDzZJK4mtNIYdQMQXyCMvHusawdjbm1P1uAW2H8+5yod+2J8uXQm8VEHXmkr
	 F4N2t1Ob8fe0PgW2vQP98N58JuhFAlhzQYt1rQkP23UVLABlux2CG2SQ4Gnh2lOvb1
	 FDzR6N+dJs+w/2J/yPmKGkkuPpKYd3xPnHF7OyoaUx0xKDQzWn874MchTrv83xzP0r
	 R0Snl3O0pZYAB7o1h6s7FvRWrDcs21PkBijGqpQI5e/aNCdwMkv85o/KuunQv4WW2C
	 Pq/9D+KVLg37mn5FHLRgPrVonfCjJZAk2wF+vQv4jUhlHlg7jgfU+8IR2Lgzr2+nY8
	 SI1y6q3VHJtPQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	j@jannau.net
Cc: Stephen Boyd <sboyd@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: FAILED: Patch "clk: clk-apple-nco: Add "apple,t8103-nco" compatible" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:43 -0500
Message-ID: <20260301013243.1691792-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_173246_394683_EC0DE740 
X-CRM114-Status: GOOD (  13.66  )
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ef9b3b4dbe767e4ac642a88dc0507927ac545047 Mon Sep 17 00:00:00 2001
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 13:22:00 +0100
Subject: [PATCH] clk: clk-apple-nco: Add "apple,t8103-nco" compatible

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,nco" anymore [1]. Use
"apple,t8103-nco" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
Cc: stable@vger.kernel.org
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-apple-nco.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index d3ced4a0f029e..434c067968bbc 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -320,6 +320,7 @@ static int applnco_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id applnco_ids[] = {
+	{ .compatible = "apple,t8103-nco" },
 	{ .compatible = "apple,nco" },
 	{ }
 };
-- 
2.51.0





