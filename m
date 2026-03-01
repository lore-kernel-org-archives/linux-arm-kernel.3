Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB72FD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfbpNV++WnbidvrhLRW0ZR8jGWLVxzF/4hVOzGIUAyE=; b=VU9cuYa3eR7W8lmWzPBQv4ZI+G
	xp+3IVTYdBhj2LfPiuUWGzSonRwkqwcckCHPciGvqMCZdgwntmCuEofUT1uzyoY5+5weraBX+oU1o
	fCnt5XxmxpiqfgxdiHSh1Q+G488ARI1h7rRkzIG+umZ+LgakvOfI3vzmSniNqOzABBFN7Ta5Wd7RK
	3JbWq0rRIz4HyV2KXeL32xxNOuV6akF0HrfgSq+m1o6+Z/0aLlCKwsnHChi6bw0BJjwgbKPia2kvU
	G++ELFNAt7ybGyBoDcwcfLF8XbsSkdaJ3nPmRpBBRm1aEAcN5H6EMzoUuHwTChhU5joEW1vb5pb9U
	9YcfD5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVrr-0000000Adc2-2Of1;
	Sun, 01 Mar 2026 01:45:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVrl-0000000AdWY-0rhH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD723407CA;
	Sun,  1 Mar 2026 01:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2BDC19421;
	Sun,  1 Mar 2026 01:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329504;
	bh=jkGWg05M3okTPXJcaUkkRsRkBHXGo1RXAOfT/0/6vxg=;
	h=From:To:Cc:Subject:Date:From;
	b=TridZdTZCn5VCfiqyFdss6FAikyWUZNCJ39HPLpWolMFyw0U0f3qcuvIqtKCWhUNx
	 ov+vT8nWhBJxJhfyyQvGffxunTx7aooaR8Fk78tmiEgZ/rbnH9+y1M17sglTOq43+3
	 XOKkiMf2E3PLWiUv0ptHTUU5QaTjvAd0IptzyJh+SZ2q/tq/LlTxe+tKzz3K9BVn0d
	 T2EGp+3QIipxSFRYaE0WQ/nJvfWF/yxIhjHe+D9sp51RbBqilxnPizwwDzl3v+p1a6
	 lxeAI4pGqPJg56L9/KpbgeDi/YT4mdqDaSOD9Rb8kSId/24Ln0oh93ZE/OyzckYyBG
	 8d+fpiIQP1nmQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	peng.fan@nxp.com
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "remoteproc: imx_rproc: Fix invalid loaded resource table detection" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:45:02 -0500
Message-ID: <20260301014502.1707549-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174505_262678_5BB84D00 
X-CRM114-Status: GOOD (  16.40  )
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

From 26aa5295010ffaebcf8f1991c53fa7cf2ee1b20d Mon Sep 17 00:00:00 2001
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 29 Jan 2026 09:44:48 +0800
Subject: [PATCH] remoteproc: imx_rproc: Fix invalid loaded resource table
 detection

imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
resource table even when the current firmware does not provide one.

When the device tree contains a "rsc-table" entry, priv->rsc_table is
non-NULL and denotes where a resource table would be located if one is
present in memory. However, when the current firmware has no resource
table, rproc->table_ptr is NULL. The function still returns
priv->rsc_table, and the remoteproc core interprets this as a valid loaded
resource table.

Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
there is no resource table for the current firmware (i.e. when
rproc->table_ptr is NULL). This aligns the function's semantics with the
remoteproc core: a loaded resource table is only reported when a valid
table_ptr exists.

With this change, starting firmware without a resource table no longer
triggers a crash.

Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
Cc: stable@vger.kernel.org
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 375de79168a1c..f5f916d679051 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 {
 	struct imx_rproc *priv = rproc->priv;
 
+	/* No resource table in the firmware */
+	if (!rproc->table_ptr)
+		return NULL;
+
 	if (priv->rsc_table)
 		return (struct resource_table *)priv->rsc_table;
 
-- 
2.51.0





