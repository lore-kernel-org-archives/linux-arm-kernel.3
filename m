Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6402CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQ4F7kGt6pV/zzUb5uMaILzlgimsXYfSNCl5wYcsv4s=; b=aizeEuVr9digpfglk3+yAc91y8
	IyMnCS4GdxC19vWKcEvopexYd7b3q0l3imNqlPihQIx0HIZ3cFiZj2zoUoNh3uIbuuCcEMjMMmmQU
	Sm1Y4QzOB/swMnX+GWkF7hHXH4+59oudhJ7DNIoXBFiNik4Bvjzwsx1cPdQIwZU8+qC9FxuLmIa8t
	+4ZoZQ8aXKcHcWOtMB7FZ53bMXMkIwqYeqb4RaC1VsWXy0n3juMVeDj916aewafDnyeSQy0/msZYR
	Cb8E1UYYiYPDJHL/Fh95VTt2/hKsOWDzz9da83Zx5DDQbs+lCwUjBF5LfeodHbG1ygGr+KS53cVMC
	AIZECx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8h-0000000BNpL-1bmN;
	Wed, 23 Apr 2025 17:44:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cz5-0000000B8J5-0R99;
	Wed, 23 Apr 2025 16:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64BAE61569;
	Wed, 23 Apr 2025 16:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F861C4CEE2;
	Wed, 23 Apr 2025 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425802;
	bh=N0YsuSsw6LR3Wlo+UHK1R+dAY9Z0n1sTB1iAGMETzA8=;
	h=From:To:Cc:Subject:Date:From;
	b=RU/7KPp4/suA/UnOfYAmeq4B9hf8W31UfZR5LRkYWcxfLFZYBDMKjvgXLGyReWrX8
	 cS2SyM3sVpgpl6SGTACLiUHe627IB58+zUmIQm2SrtID4W4+frlAS5ouaQwYz+ktdF
	 0u04e7SzXOt6kRrvWwOJQrmzJ/51E5u553kRkWOgcgCDBfWsub/zNq44crTNxZEN6U
	 S6pUqfqOKKlTWe5EeQf6cegnxJMg3ajfGPjLmGuve0FZbJ4XNNiUol+ZBlaeecm7zU
	 Bgip2TS4nNfEwva/VftKSzlzirD5f8Y6BgTBrrVdeM0F42a55oy5/2KfecU22d5DOo
	 j7zCE+QlnwIDQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Georgi Djakov <djakov@kerenl.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-dvfsrc: remove an unused variable
Date: Wed, 23 Apr 2025 18:29:52 +0200
Message-Id: <20250423162958.2223689-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

This structure was left unused by a previous patch:

drivers/soc/mediatek/mtk-dvfsrc.c:542:43: error: unused variable 'dvfsrc_bw_constr_mt8195' [-Werror,-Wunused-const-variable]

Fixes: b06785283ec1 ("soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 7b8486ce1c66..41add5636b03 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -539,12 +539,6 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt8195_desc[] = {
 	}
 };
 
-static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_mt8195 = {
-	.max_dram_nom_bw = 255,
-	.max_dram_peak_bw = 255,
-	.max_dram_hrt_bw = 1023,
-};
-
 static const struct dvfsrc_soc_data mt8195_data = {
 	.opps_desc = dvfsrc_opp_mt8195_desc,
 	.regs = dvfsrc_mt8195_regs,
-- 
2.39.5


