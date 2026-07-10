Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEECCC44509
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn4cC1hqXiGcDScmkUXYezdlXnG+b6xdlBAvd4W444U=; b=cyczXr4wr7cPIowX45dvBRQ91u
	R7XKWuRW+G8EI74TgxN+irFcGd07r3GiqNlOjnNL5/2nt7cbDTE4KNtbXtsDoi8v+O78HjhC6eV7G
	pPjcfNHzvwaG+DT0enaMhlHeaATbNCY7tqScB0mXW/20/WLvIZlF+frlZjLDBrnT6e8E/LdvxLgyu
	D3VIrsfXvuSr+WqpWOpGaMwNCcTpamvupKfbYnigqpFDVB1ao7NBpjzSknMbyVa1FZbTE0UCCR6c+
	3kcfkVZAyOGJk4jDM7l3Ynj0ELNMdojHO1VNxUBj/dmbWnxqL8vou7SgvTiKT5v3dwI8YezHkJH4a
	eQ/9ox/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6zf-00000004UzV-3RFJ;
	Fri, 10 Jul 2026 08:53:59 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6zb-00000004Uxn-14NP;
	Fri, 10 Jul 2026 08:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673632; bh=uxrv4RU4kx2kz4TN49RM0DA9U2uRkeYrAsniJlkVWGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxIk0f6XWy5cxyaguSGDZjjYRC7Y+Sfnm6Qf0KRRImcbmbB8txi5fCzwnEMwrAjRM
	 gPRDFcKEiz7sZRk2v3j1iRNm0UguiBY2FyS2roSwQlQ8r8iZPkkVBPl7jvfjj1UFox
	 0oBJJeJMUvxlZQQpKFQJhvr0ilFjb2/3gj0hQvKc3A+xYjO3WLCg26ttfPmLT3ln1D
	 WD4BIscrD+UEps0Q5ivnWt3t/2oORyGYnLJ32azkTBO50jPdd89w297oJw/TI5l4P4
	 4Ct4XVpNQr4a7qDsY4PtNnQHbBWjRy1I1tXOXpa+jcPkgXZ7MisVGT2G/y98xQg21d
	 ds6LMXs3RfvjA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 3EC8E40B5A; Fri, 10 Jul 2026 09:53:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673630; bh=uxrv4RU4kx2kz4TN49RM0DA9U2uRkeYrAsniJlkVWGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZUyiT1pLkcDLBaxdGo1d2qyxadn8fyYS7IVBEz3BbahdiWSN+QUYHRtenYNP89I2
	 KYgLloDRAKfgjEVslrcHUezE8WYuWY429IVf0CxTYxeYMzA0bWVKE1zsqdwkDmaff+
	 eh4CHSN+Aug9p83+dc0A7H0VGvPi8CKu6DlyJoUzoGi7Pui0NjiFRPi3a9zsLYrdTh
	 eagij+o0OBCwGW8ji6MO4I0hhib/bSJGy3zVXTai5PNQBDR+A2F+hMXURTPsQZs0OJ
	 ClNKahqCN0MwhlfmHBOfuWVAfWWa4i9fNWmWfVzqXM4eoFZfoN/UJKkFyXTEOSztak
	 3hali2luY2P2A==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6E95140B29;
	Fri, 10 Jul 2026 09:53:50 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Fri, 10 Jul 2026 09:53:33 +0100
Message-ID: <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015355_429911_77C45B7D 
X-CRM114-Status: GOOD (  13.15  )
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

clk_prepare_enabled() needs a call to clk_disable_prepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index fded2c256f2a..e7bb107e6a84 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -288,8 +288,8 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	if (!np)
 		return -ENODEV;
 
-	clock = devm_clk_get(ir->dev, "xtal");
-	if (IS_ERR(clock) || clk_prepare_enable(clock))
+	clock = devm_clk_get_enabled(ir->dev, "xtal");
+	if (IS_ERR(clock))
 		return -ENODEV;
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
-- 
2.55.0


