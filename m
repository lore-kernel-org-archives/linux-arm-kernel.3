Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E197CCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djD3Y0Nz6xCSNgvzQv0FMlV0XPA5TGOJDzSsNQVNlsg=; b=2t9kn1pbhF1W5XDXQuRznoDgPb
	PfKP4PKv9cCLexbcZuLoWU9CIoS6b6l2Fol7z3UbxKQxqv88s8EOWLfV1HGFIfcyD8JvACGD6SCur
	KNqUf5TQ5XU9kpI43lIDTDJ/6R/hw1ZxlZuTM7NI22YdzQTmQ15wJnOaPt3h3PkkFvagzuDZ4xf7V
	xyoP+mTsFmsg+4FB+ljiq7WHbDD2Vz3+rN+UGWdGIFaACS8ShVbfMrIx7WLUWV0ZRR3JgdwBLDpPy
	zaZyJE/vFfpIxnORHa7rZb1FGJJxRogP4hWxLIQdtqBy9Whstn0ejU5GF+GOrcafQLJUcKybnO6V7
	2iQ3BJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBj-0000000Gkip-3pD4;
	Wed, 17 Jun 2026 06:55:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBh-0000000GkgG-3OaC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:51 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djD3Y0Nz6xCSNgvzQv0FMlV0XPA5TGOJDzSsNQVNlsg=;
	b=GEjyCA0b5QKtKRrQytaHTDii4CMXm4UDTZlWVaC5FcDYD5Un25Hpl+2TqMzk+yJvZvQ2dp
	EhIM9UKQajrpVRcFxz3lAANPjtDx+KEQrwOevKnglXrRswfTm3CxW0KFwIKTIUyMBhwMch
	/gnL6r3ssi/jdv2Vg7hM0ldwPJKN2YIa0y3bfOH40jHgHEs3fF4mIm0SAzXLxDp38/EPnt
	ilbbMnpMPNi5ZApB1QFtJzjx5LjfXGf0MIavgcfyaWeketX1sW96fCrPATM5fXnwXCcmED
	LEhUFvAwBOgPtqsbG1G3M60UhyZnXVt1wH9UQGpD8w+Oxw5OrosAhkf/eZgZGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djD3Y0Nz6xCSNgvzQv0FMlV0XPA5TGOJDzSsNQVNlsg=;
	b=sHNGw7HJTUingmE29PYXAFSG+EyyaSt/4eTAWsUKpn2s51ydJkoR4f5eYYFq7WYGRmCI+i
	/1t8KsV5dCAUBRDA==
To: linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
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
	Steven Rostedt <rostedt@goodmis.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 04/10] mailbox: imx: use devm_of_platform_populate()
Date: Wed, 17 Jun 2026 08:55:29 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-4-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235549_991413_89335395 
X-CRM114-Status: GOOD (  10.31  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 516a05b64daa1..a8d4e970fb786 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -984,7 +984,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out;
=20
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
+	devm_of_platform_populate(dev);
=20
 	return 0;
=20

--=20
2.53.0


