Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E7AC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aXH91Xf5+A8l8cn/CjhyYPfYs5vnidBousxJjo7NL6k=; b=v5PMkJQqPTEHsZYEInqm9EapO0
	kARjw7OxDE834GrcIq5zTyc1rf719TObdzaoJCh8682/WKtMlo8lzeScAS9X7A3RBlndti08+BPSR
	9K0T3HwkuX5IkF+JXSzXiK+5pn01P7OEt6SoACHjHKOweSAfbz3KLfI2cjD5XqZYUeqbCexO+lYq6
	24FuCLtGRQXmlSoIgabs52TTkq0zwmhnCRpAegj3f6dHryo1HR0rSY2kzLtzAh2dF94xQuzpQng+E
	UteYjke6C27aalkwrHFDUadM5yHSg8tABGCWraZTQsGoev7a5svtaInOL+PR/XvMbbobl+m0BWdUC
	riHKBh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wut8D-00000002oRB-18gV;
	Fri, 14 Aug 2026 14:43:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wut8C-00000002oR2-1WIj;
	Fri, 14 Aug 2026 14:43:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEADA409B5;
	Fri, 14 Aug 2026 14:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EA61F000E9;
	Fri, 14 Aug 2026 14:43:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops
Date: Fri, 14 Aug 2026 16:43:30 +0200
Message-ID: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

This is already provided by <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested.
---
 drivers/clk/actions/owl-composite.h    | 1 -
 drivers/clk/actions/owl-fixed-factor.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.h b/drivers/clk/actions/owl-composite.h
index 6d7c6f0c47c8b701..ca055599b2fceb8b 100644
--- a/drivers/clk/actions/owl-composite.h
+++ b/drivers/clk/actions/owl-composite.h
@@ -119,6 +119,5 @@ extern const struct clk_ops owl_comp_div_ops;
 extern const struct clk_ops owl_comp_fact_ops;
 extern const struct clk_ops owl_comp_fix_fact_ops;
 extern const struct clk_ops owl_comp_pass_ops;
-extern const struct clk_ops clk_fixed_factor_ops;
 
 #endif /* _OWL_COMPOSITE_H_ */
diff --git a/drivers/clk/actions/owl-fixed-factor.h b/drivers/clk/actions/owl-fixed-factor.h
index 3dfd7fd7d292a456..bbac5afadd670da4 100644
--- a/drivers/clk/actions/owl-fixed-factor.h
+++ b/drivers/clk/actions/owl-fixed-factor.h
@@ -23,6 +23,4 @@
 					      _flags),			\
 	}
 
-extern const struct clk_ops clk_fixed_factor_ops;
-
 #endif /* _OWL_FIXED_FACTOR_H_ */
-- 
2.43.0


