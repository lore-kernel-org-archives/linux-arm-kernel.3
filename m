Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB10606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hEHBzI0K;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=JhQrt/Do
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yMu0dYJrCWSiOfaDMHw/hzzu7wk/SUoyHAnzJkBIeJs=; b=hEHBzI0KyqOOMpqeeytoXDGrly
	AITqiRbY6JcxjZnshw3UbQfgfYXpd2KCPG6WS5t5qwPEHRwW0aF9ctYDcia2AaQPstK+ikVKSGeCC
	5TtEtB2svVZ/z0f81YhMxpt6uiQSsPWG0CRVx1dN+clTMS0x+Al4vX6amqIE3idwc5OSWGuxKU1dd
	weZWT+LmCt7ichRkA4y8vjxrJGqIMe9IgPhBGmyiTv0IDZVAOOCBgkMB/qpWrQ4Oz8vfs3c/iqzvA
	8Jf8oOoXb/775dO36LpfsEmefzqHEBT48anUh45rlagDSCM/JKTT1OwPV3lYD408RqAryCCSirPZN
	ToxCZISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhYL-00000000TSj-2e1n;
	Sat, 24 Oct 2026 19:37:17 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhYG-00000000TPh-1Iau
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870632; x=1824406632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yMu0dYJrCWSiOfaDMHw/hzzu7wk/SUoyHAnzJkBIeJs=;
  b=JhQrt/DoUSbHHIG+0AfUFCLeFTiRQilEXdopFk3ikvT+zzCl7nPWqd9X
   L5zC+OkZgZ/DKhVrLgYw0szYXdNLb3FaIYLZjTT4Zp7HAElBXt+AeKOrr
   VFKscN79U068JL/F+qw5+97T4N/NkoJVeXMHq6TzVidu6baiL7i3687Jw
   z7AFeFavFv04/slKz3aNL7IG4svrDeJCm3R6/OCo5UdgF4s3U7Es9fSnD
   adHb2pjI1AIzUVyDV07qxQ6uwNzJwGmzD45cDq3ER9z+q58OJEqcUO+pU
   Vc35etfZNvc46rsCCXOAElSmWA3pZsZbA5tBxn1NKUVv8tQ1h+12c7ay2
   g==;
X-CSE-ConnectionGUID: 33Vujdh8R+aHpA/YdbLOhQ==
X-CSE-MsgGUID: GTTrso5XSXu6LCk6brR0KA==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="31923595"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:37:07 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:24348]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.193:2525] with esmtp (Farcaster)
 id 0659cbb4-d2aa-4aff-9f15-f722995b7d39; Sat, 24 Oct 2026 19:37:06 +0000 (UTC)
X-Farcaster-Flow-ID: 0659cbb4-d2aa-4aff-9f15-f722995b7d39
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:37:06 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:37:05 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 5/5] irqchip/alpine-msi: Add debug logging for MSI allocation
Date: Sat, 24 Oct 2026 19:36:20 +0000
Message-ID: <20261024193620.39999-6-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_123712_401120_48AF7A81 
X-CRM114-Status: GOOD (  12.02  )
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add log messages to help follow the driver flow when debugging: an
info message on successful initialisation, and debug messages on the
MSI interrupt allocation and free paths.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2:
- Use %u for unsigned values (Radu).
- Write MSI/SPI in upper case, to match patch 4.

 drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index fb84b6046193..c13646c763d3 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 	struct alpine_msix_data *priv = domain->host_data;
 	int sgi, err, i;
 
+	pr_debug("trying to allocate %u MSIs starting from %u\n", nr_irqs, virq);
+
 	sgi = alpine_msix_allocate_sgi(priv, nr_irqs);
 	if (sgi < 0)
 		return sgi;
@@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
+
+	pr_debug("allocated %u MSIs starting from %u\n", nr_irqs, virq);
+
 	return 0;
 
 err_sgi:
@@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsigned i
 
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
+
+	pr_debug("freed %u MSIs starting from %u\n", nr_irqs, virq);
 }
 
 static const struct irq_domain_ops alpine_msix_middle_domain_ops = {
@@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	if (ret)
 		return ret;
 
+	pr_info("initialized successfully, SPI %u to %u\n",
+		priv->spi_first, priv->spi_first + priv->num_spis - 1);
+
 	retain_and_null_ptr(priv);
 	retain_and_null_ptr(msi_map);
 	return 0;
-- 
2.47.3


