Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C71FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pY9Al5zbc/SrySwfL7vtc1yg8L5bXnwUXk4c29dghSA=; b=4BLPPYeofUBO5sZVvRl/dVxteX
	P9MDhGpx5w0HKejDWCjJXbLnqJr4xIu/4Wxi/j9/EHlB3KS3rMB7hc5Xp/SDWNapRZ6QcEeYmLbZg
	30cGGsSV7XkeFTxW4KKQf+Iup2QaHkBmpHXi1wr56Bify9QCRBBx6Im9SKdNzO3qeq4C/O3v1nNjH
	mCuiyIQwtENYk3F8uF0f6N2b57dj9P3+3ZwdLN02rN7mlLCf4NhtuUUzQYqc4g2mKfhbhbrnrT0Mp
	/yKct8t2Stqn/zSx/eXkUQkgw9KUMvBMkYCJGeVTYdeBJj5lY6lxcqnjUyfatonpi6BF+A+DIaFft
	vAXJ9S1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVom-0000000AchQ-40nW;
	Sun, 01 Mar 2026 01:42:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVoi-0000000Acfg-2hIT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46A17405B9;
	Sun,  1 Mar 2026 01:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CB6C19421;
	Sun,  1 Mar 2026 01:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329316;
	bh=DZgwUkLbSC1Gsk2Cp5BMaa7SvKj5k//iiNKBuBlwVJA=;
	h=From:To:Cc:Subject:Date:From;
	b=Nll+fgC560Sb//QAfgRNhQn9pzKTpAGQdnHALF3swu9ueWX3SlaZzOzg04mgWMJLN
	 lFJDZO+9sDUZHFaFH7u6XwQkqvVVxR8iO3Zbs+bZ6is5aRFdcNJP6mwApVoPQ5qcRd
	 pL2JcfRyfuRuuYX5xALpe+HSfaFyIpzyBE5tn8XvAKMeYHZvRBLfd45GwATEVCWr/w
	 rXrYSaTF01sI+/0k6ptMMPOCfXOZFJsmQ/mk8/bvWr1FmxpBcQ/K2FXlDvErVp2W1A
	 Cc8KwbnKlMdrqfsTQ8D9tk7tbmn7+NbbXW1DmrpcSjZ+pfKn9qVlbkAnmXnH0U4GtD
	 NLkcizf6XAwpg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	vulab@iscas.ac.cn
Cc: Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "soc: ti: pruss: Fix double free in pruss_clk_mux_setup()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:54 -0500
Message-ID: <20260301014154.1703645-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174156_700018_2943F7BE 
X-CRM114-Status: GOOD (  13.46  )
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

The patch below does not apply to the 6.1-stable tree.
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





