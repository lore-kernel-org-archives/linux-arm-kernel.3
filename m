Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C93BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbwCLFKbdOzKV5i/+UY6gKXliGQuPyrcEE9A2zGzU44=; b=nBD5xUb/nBJGHQAh50uAa3tN69
	KicOMQ1vOaS1iLpOMZziB68TlBTEvyP3ym52HbJGyVj0/uiRAvFP1OLSXgLurkpoHMBCVionYVOlY
	3kOxu7jeUGJhK0q23qyjy+tBMf6jeM1ZqBF84MbY50VsW0K/ejh3/K4WcQ75hZG7B0EbAdJx/qrng
	nhV0rOR8Iievq8+zmji5cidS9951Si9++WZfYPCbpzeOP2GuvxxdGScg4+XCulz1JVHlOcL8FMYaV
	8tsfAtMQ2ZfsxNOu+FXF1gq++hrYbtsIz+c+xvslhSLgLFd+QTWz2LE75o7UlviS4fdOdoHTTlsFL
	u25JujQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdBL-0000000CB0e-27SL;
	Tue, 14 Jul 2026 13:28:19 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdBJ-0000000CAzx-06vM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035695; bh=SbwCLFKbdOzKV5i/+UY6gKXliGQuPyrcEE9A2zGzU44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cVA2mzcG79KRLbnI50EKhF1N10snHcIhAQZ+yK963MRuf6GQ6AW/R0Tb3RtUHlcKQ
	 xyC40WMLCmNdPAJUF9bSUb80XNuzEQLVEwgt7+NEkNYwfmun8BPro28EedjdEge1gO
	 UyypKCYqoT6mXi0lj8LOj3OKH0PG8Fm8XEaYyDZ8=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 70B1EC6E; Tue, 14 Jul 2026 21:28:11 +0800
X-QQ-mid: xmsmtpt1784035692t4weielk1
Message-ID: <tencent_B8B26921190C2CF6D2C906B793EDA107720A@qq.com>
X-QQ-XMAILINFO: NxKoLLhE22aTd/x9fnDR3jp18PMFxxKgbHYDQIOpNvDpEBX+nVa4VyweCRJzxf
	 1fjJObbD3tZsMMrIRl5PTBVqq53QCVi5Wu567Z3V/NX6HG2gDiroCFfFZs8P28FUu+71rBbCdqDX
	 V7ZOc/voIoB61FnfK8VOclBigTkP0Pm/IMqLM5N+rVVchytNR4fvbhz21sUr5QHPYoopjuxykJTD
	 aZTkxLWHeN55Z2MRfnl6gpG6FxfNjPSSfPOWrVqVNXp61NANepUsB9qc9Yc1+lET9sJmdurncwAr
	 kKNwRqBx36r/71dudQFkUM9ABymWJlnCMODAi2x+W9bSZQA53Fpcm+r2YY+cd8ReJw/PZhJe3EIB
	 Oem6t9VNhiQ+cgxXhVZ5OxxoaVCf7dIrAuTPmiG9/Pq0dPMxlOJFZWeFTiENjuq44osnRc8iQyrS
	 yKsYJ2wr51Ii2nsIr9eXMhddexY578jnlllg2vQRhbXmZe+Xaho6w+7XIAJYxa9BY2Zg1sww/diK
	 u+C+r9x4AXyk9qerLGF6UCd/V8VKflV6rUZNDbA5HnPDydFZV3Xcplx/fuXcn2xdkNhVOGsFMw4N
	 zD9bnPhsrZHBx0nh4bOlmiaJQiTK3DnEhy2vyz3GhnAC6+iyaoyqOtavYDfDxFcwlBGYu4MQ82ne
	 P9GZBm65Pg5PJQmtbxduSAVR43i8+JQQxFKRfgYxzfcA7yGdMid3bvjmxIFnND7IFWsbZrLAEMo1
	 T2VYBTGy8KNxrQ+78t8PE6AeO/zaviMoLY8UJMgcO/8pnmZwo5mL3fqlGHZk/lAjlShWl1t14epe
	 5s96cJu1pm8beDBTpxz/I86cWJj8HnyZC9ly5QivJPAstQtT1ikp2GLrGeGzeXDQJxrQDQxBF5lc
	 /CgwNg4RqNE3Q9gynASlFEmL0FK6nKirz/hFU8y9l4BWEpox2lCuLAh7IAG6/uyxBdlLQl5oj7qa
	 YE8onleiEVAfjsRdIvPPLE/gAf3yXwYnFJ1sk2aLvyI1FOyHtK2Y1WOqKymr9EeIzQRx2Zhg3u4F
	 S2/wbGXvWNgDMETcyOuBNRXEkgLYS9oUKSsOJ0QtayJSTHb77BGntP/q7mMGnYCCqNvx3n2Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jason Cooper <jason@lakedaemon.net>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH 10/16] irqchip/aspeed-vic: publish handler only after domain creation
Date: Tue, 14 Jul 2026 21:24:46 +0800
X-OQ-MSGID: <20260714132453.3302672-8-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714132453.3302672-1-920484857@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_062817_409840_CA861640 
X-CRM114-Status: GOOD (  13.72  )
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

From: Haofeng Li <lihaofeng@kylinos.cn>

avic_of_init() publishes system_avic and installs the root IRQ
handler before creating the IRQ domain, then returns success even if
irq_domain_create_simple() fails.

Freeing the VIC after the root handler has been installed would leave
avic_handle_irq() pointing at a cleared or freed controller. Create
the domain first, then publish the controller and install the handler.
Also handle set_handle_irq() failure by removing the domain and
releasing all resources before the handler has been changed.

Fixes: 5952884258e5 ("irqchip/aspeed-vic: Add irq controller for Aspeed")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-aspeed-vic.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-vic.c b/drivers/irqchip/irq-aspeed-vic.c
index 6649b893f39c..bb3cceec375f 100644
--- a/drivers/irqchip/irq-aspeed-vic.c
+++ b/drivers/irqchip/irq-aspeed-vic.c
@@ -186,6 +186,7 @@ static int __init avic_of_init(struct device_node *node,
 {
 	void __iomem *regs;
 	struct aspeed_vic *vic;
+	int ret;
 
 	if (WARN(parent, "non-root Aspeed VIC not supported"))
 		return -EINVAL;
@@ -206,15 +207,29 @@ static int __init avic_of_init(struct device_node *node,
 	/* Initialize sources, all masked */
 	vic_init_hw(vic);
 
-	/* Ready to receive interrupts */
-	system_avic = vic;
-	set_handle_irq(avic_handle_irq);
-
 	/* Register our domain */
 	vic->dom = irq_domain_create_simple(of_fwnode_handle(node), NUM_IRQS, 0,
 					    &avic_dom_ops, vic);
+	if (!vic->dom) {
+		ret = -ENOMEM;
+		goto err_free_vic;
+	}
+
+	/* Ready to receive interrupts */
+	system_avic = vic;
+	ret = set_handle_irq(avic_handle_irq);
+	if (ret)
+		goto err_remove_domain;
 
 	return 0;
+
+err_remove_domain:
+	system_avic = NULL;
+	irq_domain_remove(vic->dom);
+err_free_vic:
+	iounmap(regs);
+	kfree(vic);
+	return ret;
 }
 
 IRQCHIP_DECLARE(ast2400_vic, "aspeed,ast2400-vic", avic_of_init);
-- 
2.25.1


