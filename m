Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D780CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHu0ybf8Zw3NyxF6mPleRKwZui1BrbXzpLJ2arEvlYg=; b=MpEDGwsx6gSs5PQxhoCGRbfs8Q
	qLIYzQfH2cdbQcOuQfi+s/KpRMLGi4an0TBm395BXrSn/hTOTWfelntZU4Ki7GDnl3q5DNP4BDc5A
	NPhR678aPZwCt4P/RYX3LiXlBLmfTLYAsczYCaH0L2nZ1XDXkfPoUU3ZnM5rU2kpwnD6DtFwpEU3+
	dLM3eQCPNX2zgb9QIc2yJrwJ6xvN/G/CX9fvuCQecaPSpfmLuBSlO+xAe2au3y3fEfwUY5Yvox6gY
	4hXqnoigpNUdbqGWm5b3CXpbcgqEepXK8MhwellMofw/Hkk5dCqSPO2XuSHK4UfkIpA5hhj8owCA9
	VICgG8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHk-0000000F7Hg-1ygm;
	Wed, 03 Jun 2026 13:05:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHf-0000000F7D0-21bx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:24 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHu0ybf8Zw3NyxF6mPleRKwZui1BrbXzpLJ2arEvlYg=;
	b=Xi/Otzu3nBL9YUMNqwEBz+6aq67HhwSN+0y9o0e3LpE1s4kW2RLmrfOBP2yU0/ubiJCslA
	hHn8oK2c1UXqnf1MIToBPULK+GxrpqePqmltthBxkJqeYOIv/2feEZOug9H5So0kA+f24c
	RrY112CugTbswQtjv5KKQ/Zv0royimccGgjrq7ABm60O/ZAA3xaQkhEqRNiyLATE1gZNWq
	WNpASo1MC5C/8dJzvNsAr2peJtLnsje3MV1utZOscwZGMzpUvWQEnzyOdkSlQIqPFqlWPZ
	r05nHQv94oYoPUVk2JGIKBzQ+LyijYgZxiHyyK4k+hw7Kwzg7Xsk9Zgj5RMWJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHu0ybf8Zw3NyxF6mPleRKwZui1BrbXzpLJ2arEvlYg=;
	b=u1VUUSx+QLpX4dqAbUVgaZVjJP9IJiLjmmKyAGbcqnB7MHXGpAhHy9RnM/002XpHjA1F1e
	7x3OKcKywHQA9RAA==
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 3/9] mailbox: imx: use devm_of_platform_populate()
Date: Wed,  3 Jun 2026 15:05:06 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060523_676223_76ADBC19 
X-CRM114-Status: GOOD (  10.86  )
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

The driver uses of_platform_populate() but does not remove the added
devices on removal. This can lead to "double devices" on module removal
followed by adding the module again.

Use devm_of_platform_populate() to remove the populated devices once the
parent device is removed.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 24cf704b4f9bd..1dda1437b87f6 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -983,7 +983,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_clk;
=20
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
+	devm_of_platform_populate(dev);
=20
 	return 0;
=20

--=20
2.53.0


