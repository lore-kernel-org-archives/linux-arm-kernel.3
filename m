Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BFFFD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EdwS4Dkbdklj7AkLxIxvRHGr7A9J7BN3ucEj6/CqhA=; b=FwWL3b4nUEodCjRdlTuSDmvWbW
	GSXIteuYSGShoCSSyqk4la02rigAp3FS0S50jai6v+u+gO06P/+D/8OR+mp9cbNywmQ6J4lpNmoNW
	OPAzmIRBMLUTjg/cSpjZxBTdBdZ/8kZosLEMuT8D5o8tYZN7gHpQhJndNWcOt+pRxPM36o6PDKPbh
	93FJjXE6QPDJuFH+jvszVIjBprdtso4nOr4AkN/Ux2O/BVmARHMSxGTgu7OiP1fnBnKXdFuK4yyIn
	U3IMuLR8WJK+GcQAfUtgBePxajMBl3+P5btUKX2nxWHXaV6lSApmo8ZDAlNeavNN1BCaRsCBHEtgK
	Xy/qFwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVeg-0000000AYW4-1uvN;
	Sun, 01 Mar 2026 01:31:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVeG-0000000AY5b-3fZb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93256401F3;
	Sun,  1 Mar 2026 01:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D69C19421;
	Sun,  1 Mar 2026 01:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328668;
	bh=XDkG6B7bK/eu/nQ1Z2Gbh1MDzgZ1mQuq99ntnQ9A1TY=;
	h=From:To:Cc:Subject:Date:From;
	b=VLy8k4rPH4l3FW7GqtWkBnxT8nwNO58O2UxoQgpFIvVl3lgWEwCgGpyjfQCDOQk3c
	 nxmHu/314mVxnaCMmW+bgNpLIeXaamCtbOc83GiOicI3HbzdTot47rVrtPb0PyGAk8
	 QZvEI/Vfdwgyq080rR981Pk7lrLGhjwdMTSjPzt/Jc9+Vvubs4q/rEXNPx0h78S/bu
	 UzFBl7y22y664IYJ1dLjmem9tvzJKm1SU08rWNubzUVhL0s+UszjpPlAv4AbQj6Kxd
	 A1a0ZhmdKli8Fzl7SbyjOYbg+72YZQsE87hfwqAcNSdHC/F6V10aCv8on5u3sHj0id
	 Bi527Lw34Ng5A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	vulab@iscas.ac.cn
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "ARM: omap2: Fix reference count leaks in omap_control_init()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:06 -0500
Message-ID: <20260301013106.1689495-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_173110_516129_BE2FD77F 
X-CRM114-Status: GOOD (  14.54  )
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

From 93a04ab480c8bbcb7d9004be139c538c8a0c1bc8 Mon Sep 17 00:00:00 2001
From: Wentao Liang <vulab@iscas.ac.cn>
Date: Wed, 17 Dec 2025 14:21:22 +0000
Subject: [PATCH] ARM: omap2: Fix reference count leaks in omap_control_init()

The of_get_child_by_name() function increments the reference count
of child nodes, causing multiple reference leaks in omap_control_init():

1. scm_conf node never released in normal/error paths
2. clocks node leak when checking existence
3. Missing scm_conf release before np in error paths

Fix these leaks by adding proper of_node_put() calls and separate error
handling.

Fixes: e5b635742e98 ("ARM: OMAP2+: control: add syscon support for register accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Link: https://patch.msgid.link/20251217142122.1861292-1-vulab@iscas.ac.cn
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm/mach-omap2/control.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/control.c b/arch/arm/mach-omap2/control.c
index 79860b23030de..eb6fc7c61b6e0 100644
--- a/arch/arm/mach-omap2/control.c
+++ b/arch/arm/mach-omap2/control.c
@@ -732,7 +732,7 @@ int __init omap2_control_base_init(void)
  */
 int __init omap_control_init(void)
 {
-	struct device_node *np, *scm_conf;
+	struct device_node *np, *scm_conf, *clocks_node;
 	const struct of_device_id *match;
 	const struct omap_prcm_init_data *data;
 	int ret;
@@ -753,16 +753,19 @@ int __init omap_control_init(void)
 
 			if (IS_ERR(syscon)) {
 				ret = PTR_ERR(syscon);
-				goto of_node_put;
+				goto err_put_scm_conf;
 			}
 
-			if (of_get_child_by_name(scm_conf, "clocks")) {
+			clocks_node = of_get_child_by_name(scm_conf, "clocks");
+			if (clocks_node) {
+				of_node_put(clocks_node);
 				ret = omap2_clk_provider_init(scm_conf,
 							      data->index,
 							      syscon, NULL);
 				if (ret)
-					goto of_node_put;
+					goto err_put_scm_conf;
 			}
+			of_node_put(scm_conf);
 		} else {
 			/* No scm_conf found, direct access */
 			ret = omap2_clk_provider_init(np, data->index, NULL,
@@ -780,6 +783,9 @@ int __init omap_control_init(void)
 
 	return 0;
 
+err_put_scm_conf:
+	if (scm_conf)
+		of_node_put(scm_conf);
 of_node_put:
 	of_node_put(np);
 	return ret;
-- 
2.51.0





