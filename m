Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9901FD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4vrJZC5ahOeXq+Hb/PflW1do0XksUSaqBYo40rXWmL4=; b=vytZ2oHqW975n1Mt2UHBJ0gGqF
	gUmW3h6C3OeqXobYPRmaWvYKwR+hJ8nYKwxZLqyXcbooV8uf20+DofIkRa1Fi9DsCIefp0CkEF5Bs
	yZ459cPPFGGhP7TbCm8N2aJdzalXvvc1MCuBiIO6zXGyzm8M/2NTL9qr8/V4PP9nYEEBBhxX+thXq
	w+jeGmAuL53/ai/XM9Pf/7SUZX5KSd6JwcmN8+X9efAtcMfmaY0IlvOK0ruZ1F51zRpeovgJlxu+i
	JrxhbD1yS8C4AnUTk711mFefQgVubkG28Z2IpfHvx75Ouo+EMgMwtk0gfXB1ko1gkcgPI0GjOCbVH
	ry4Un6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVwr-0000000Afkc-2RC6;
	Sun, 01 Mar 2026 01:50:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVwp-0000000Afj7-0N9V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DF2540982;
	Sun,  1 Mar 2026 01:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90ABC19424;
	Sun,  1 Mar 2026 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329818;
	bh=uGfV/++m4tGrtyJzvOCAf7ZAXaKn0ApjKBWRZ8SuvE8=;
	h=From:To:Cc:Subject:Date:From;
	b=QD/9svt6nlAyNXc3wZHfMHjd03W7h4nW+YqRwLt6VH+eBOQUHsSZpW+/BowMYpT56
	 abULgehuwhNl8JTkwW62U7Q5Bm0BYsTsRxxE8whfhdWo2BnURscD2keJybitBNhRRt
	 RMb84Z66RNdiEQPTKBBZ69IjTU67RmYJofpQ5al9+/FVaThXmpw56q1Wea06jK5wZH
	 D40dx/AmAMzMn79ldnWuI/Xuec3qx6+AO+7xXh7ubn6udsBZVs0lJ7du/Jm5BEnFzZ
	 uCWGj4NJDIApusdNFEI1/ohBy6dQDohTHpilk9fNeoAi2riwi7/b+bIaMxx8LQJKnf
	 RTJ93BWeBncHw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "soc: ti: k3-socinfo: Fix regmap leak on probe failure" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:50:16 -0500
Message-ID: <20260301015016.1716211-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_175019_146082_FDC10403 
X-CRM114-Status: GOOD (  14.19  )
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

From c933138d45176780fabbbe7da263e04d5b3e525d Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Thu, 27 Nov 2025 14:49:42 +0100
Subject: [PATCH] soc: ti: k3-socinfo: Fix regmap leak on probe failure

The mmio regmap allocated during probe is never freed.

Switch to using the device managed allocator so that the regmap is
released on probe failures (e.g. probe deferral) and on driver unbind.

Fixes: a5caf03188e4 ("soc: ti: k3-socinfo: Do not use syscon helper to build regmap")
Cc: stable@vger.kernel.org	# 6.15
Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Acked-by: Andrew Davis <afd@ti.com>
Link: https://patch.msgid.link/20251127134942.2121-1-johan@kernel.org
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 50c170a995f90..42275cb5ba1c8 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -141,7 +141,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	regmap = regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
+	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.51.0





