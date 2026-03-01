Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7AFD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OmkxLjkALWWd8lyhTt0myzo0+8ncSSqPouUOsAt6kOA=; b=e2hjrGKvDmcyY7W+T5B1kKgP9Y
	vybVFVQ5P7V2xnn6/QMisgyD2chmq2m/XXXCfj7tkn/Wq8eTL8JlzYAh2tuGZN1S2dWVygLUTJn3t
	lGnwkTdHTmbRBH3amMeRyqFnq4PC71Y2JfmFyqxq+nNc/E03A9VG663e0oz0qxteaZV61upYKc7Ex
	QbR87/9kfERc41cM4kIoo4MPO71663ALXRGo+Uhny7gOWcEQR2chcwAjY+PLKyhLelt2K2NHT8+2O
	PLHWMKKORTP5/caLBTrMi5Hee4tiPl9T5znltYU/23vktch+Jax2G7GcydMkIFzBWiic09ocso2R6
	d+nZo/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVT0-0000000ATYC-23T0;
	Sun, 01 Mar 2026 01:19:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSv-0000000ATSo-3nHm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:19:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D456600AD;
	Sun,  1 Mar 2026 01:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E9AC19421;
	Sun,  1 Mar 2026 01:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327964;
	bh=S/Aak4m6ZxYDgDAG2cPMbe3IX7TZmOu0+52KR8O0TdE=;
	h=From:To:Cc:Subject:Date:From;
	b=d1pdJsTRBuDL4Zr6ImQ5CD+YYt0RE8scNhdN+Atb+dwfP2zsjBLI5ipcWxLLAL0AT
	 MTC+dF+60vsmxLp0ucPeH9PxcgSWcToFx2g9kjQhiMJ7P52kN1ckuCuv758YvnbKaX
	 KHrcwQkkFm7ua8DKTBDE5hBg5Z3tMONUPBAj92dbOtkG++MKapyPXdCqi0mCel6YiG
	 eB+TZBwkLO59DxDsotH+vKSffGv2aEujIlh4eTPVJRMVwZKMWdCtYHsqolblxJ9OwL
	 uw3IeP8kWUb1Fcbq5Qu/NJKL1E4bkGyiK19X02GapdEdrO7q3ovNVnmlSaXxhoVNez
	 t56U6RSd4pc+A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	vulab@iscas.ac.cn
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: FAILED: Patch "ARM: omap2: Fix reference count leaks in omap_control_init()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:22 -0500
Message-ID: <20260301011923.1674404-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
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





