Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FCDFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOYUQCMofPxCpMZIbEcrtfKS6EdCMebAs1zs7KVPMaI=; b=B+EBMD7CcgrmduyQlLDu+KkPiX
	Bl58tPvsD6pbib/L0Y6Id/Blzzp1KfpEfpG2tDcAeD88f0CTAfXPiNwc0vocB5fNWgWkNufr/L8Pa
	prpxAvCpLNhtp+qPxVpxyzH7I8HPeqdXurkk2gYZzMrznagxFwEfxaScyfDYd49vUraduR9ZjurCa
	OPYgfpzmTa+CdRMyTZZ33AFUxsp11cIN9bnwhpD9rB599a3c6w3MUjbltFVhj1YyDcLZNzCu2HD0M
	hQqNVCRuuDk5gfQjvCTyQ5tQo382++h2+SvDYAdUG2GIEh498YsVZdxvpALMS6AOPMWQIUJIgilU6
	3acbCpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVwn-0000000AfiY-1DQm;
	Sun, 01 Mar 2026 01:50:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVwk-0000000Afhy-2Chu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 253DF43B24;
	Sun,  1 Mar 2026 01:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840F1C19421;
	Sun,  1 Mar 2026 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329814;
	bh=LLHmZiYKN9rzxQaqCtLEVylizM8yyWNCRPQ7HyrCwWg=;
	h=From:To:Cc:Subject:Date:From;
	b=oErN+Nk4NDTBGkSAZQENhdsNQgz/SXOteUwHZKpOQcm4/6nYBnMavwXto3EqxLLWU
	 AexQnoF+sx1iRPeWDssQxzAt5jw2souIAoFi1M9BAxvdm+0YqDhxZAATlwX4eq8id7
	 3Iz5VC1nUSgl8UXXT+lq+zo7BxX/2/9LAGWQikcOmTOydlS4dtuRFoebu8oe71lX6R
	 /dwQbOvJ95qKRHKl74gL3lUSmwwNWBtkd5mDH3fJcvEk5ZTCMBv9E0ZCv8Q89B2Ttg
	 ZhXYkX7plu8RDenztXAZqbrTCmfMDniBwmusmzk1zKMecB8cp7DXT26vGBKvQ6KYED
	 fq8osBl4QH2NA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	vulab@iscas.ac.cn
Cc: Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "soc: ti: pruss: Fix double free in pruss_clk_mux_setup()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:50:12 -0500
Message-ID: <20260301015012.1716113-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_175014_584736_44EB2CE7 
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

The patch below does not apply to the 5.15-stable tree.
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





