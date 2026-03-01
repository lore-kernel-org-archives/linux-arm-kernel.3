Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF91FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 02:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+wS6RfRiMaBLFt3SktMGoxrt1Ux0TYQm6Y4YuIv4JE=; b=Wyw9NH8cC9D/1DYjixcrZp31sN
	YmF5a+fqRqzzhh8tDMPSz7Z2LpK530WUr3kJY0xQ92bIkE+IhLRojiUXhZhMBGN5TxXgNGdV5iFaQ
	Bq+yqZ92XRYUeVCBPFplI1x7vngJ4z9VA1vGY2YVqufyKQwfulbHUx3RFtuqJcXGqF+RaCu7i8sgQ
	4BYao5+McGs011z91O4jqTHliqD1F1DtM9sMXzGnK0HKxMODaRA40YNzwWevUR5z20EqkieFA//V3
	bh66GN9gkuksib6m4HBVMHMV29Cg9necBO0x2i37hDm5tr5sp00KGoOkrSoD+N+Vo2KmY917fCh9h
	iJ648TDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW6X-0000000AiI3-0d0h;
	Sun, 01 Mar 2026 02:00:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW6W-0000000AiHn-1hOF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 02:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D330860141;
	Sun,  1 Mar 2026 02:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B61C19421;
	Sun,  1 Mar 2026 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330419;
	bh=Y/Pkvml/BQFLsC8/UcnckneX/hvtllzBtpUcn+L9wlE=;
	h=From:To:Cc:Subject:Date:From;
	b=OtIkpI9sQnK2bSb6mwfrURTTHPFkDl0L1IriRaAJc1AQdgdcqKoKRQzCSbf+yooLh
	 GJcvqmrVzvtoWemtTv4ktY1LKTbNQZZ+IRppFJ7MYvlXwTgXnCRJ3PXGVJUOQTO5be
	 ei94Xx/Y29N3/PBZUEqe8eK9ARcdk49KR63pn9mKbfCIzXUvEtHfAYZ3ubQUbX/JGQ
	 Von5IsiPn8L56cB/Wjs0i5TZ5pE9/1THZMZAZp9mGr07Bwg4TnU6RFZqpB8hzt4k3/
	 exTiDuhsRx64EINn0BKJEEwA1rJ3r3rvn3vL2Ah93ihg2u7+nRm/if7ReBagao6T84
	 pt8gSym8Pn/ow==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	vulab@iscas.ac.cn
Cc: Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "soc: ti: pruss: Fix double free in pruss_clk_mux_setup()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:17 -0500
Message-ID: <20260301020017.1726306-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 80db65d4acfb9ff12d00172aed39ea8b98261aad Mon Sep 17 00:00:00 2001
From: Wentao Liang <vulab@iscas.ac.cn>
Date: Tue, 13 Jan 2026 01:47:16 +0000
Subject: [PATCH] soc: ti: pruss: Fix double free in pruss_clk_mux_setup()

In the pruss_clk_mux_setup(), the devm_add_action_or_reset() indirectly
calls pruss_of_free_clk_provider(), which calls of_node_put(clk_mux_np)
on the error path. However, after the devm_add_action_or_reset()
returns, the of_node_put(clk_mux_np) is called again, causing a double
free.

Fix by returning directly, to avoid the duplicate of_node_put().

Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Link: https://patch.msgid.link/20260113014716.2464741-1-vulab@iscas.ac.cn
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/pruss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 038576805bfa0..0fd59c73f585d 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -366,12 +366,10 @@ static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
 
 	ret = devm_add_action_or_reset(dev, pruss_of_free_clk_provider,
 				       clk_mux_np);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "failed to add clkmux free action %d", ret);
-		goto put_clk_mux_np;
-	}
 
-	return 0;
+	return ret;
 
 put_clk_mux_np:
 	of_node_put(clk_mux_np);
-- 
2.51.0





