Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7CA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mp146lPq;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=BejlXhH8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F3k3PE8AIPekmZigE7766sEXhbFL9LTuTu32Pq+ISLg=; b=mp146lPqNzzKLxXRqatbpoFa3N
	3B3VO7qDlhQLr5yA1vePTg19Y4pD2XOKSWSkcrihByLxZn2iT6Qz7ECJ4PlMmc/b23oWrhkoYpyvu
	X/ZLOLgui7N9V/GMETQjiuXeqEgVKN/kQwBStm27Xl/965nsIGFDypP2Mn5KT2fMr0Q7ggHenQjD/
	152CcX861BIFW4MTn3NpuOtRta5Azz5N/e6sDBUkNMNCi0jTNOzSOCujHvEgY3bBJafo5hzHasRkK
	SzyWcaCEo/ZaoFGGuRphj5S+I6qac7gxGXFV0xeRUd8olZVkKCrx8utxBAfbVLEsvkYupdHW9BR9F
	LIdC0a8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhYK-00000000TSB-3lVV;
	Sat, 24 Oct 2026 19:37:16 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhYD-00000000TOb-2XZ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870629; x=1824406629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F3k3PE8AIPekmZigE7766sEXhbFL9LTuTu32Pq+ISLg=;
  b=BejlXhH87PrIn63FFQf5h9twa0C8hywdO66rz04zctkyR5fyZYKuoCPB
   +2FKUnL1RcYJecLL1Fqe8cCNyf7SY/50TtVwhQTVqr/L+Pqd9NAnMMAmA
   6pBlVZiWYqTezc6ggacFp3Lnss4WrhXLbUvKNI878qnCJpAmgekyODqQZ
   3fEYlsdmj9ulzOyZvX2dRCf6pimw5QM+uuQFbPCYhtzeQsiGPdPmw2fu6
   sqB1/CnY7dA4X0hJk2jYTzGK8zwaUxekGpC1+QS4BzZLs5nGsKrhTasB1
   GfugZXSpZyUwthCep4bV4Jy/h+N6bcnDtnDdsdn/pd5p7gzg89CLk3UGo
   w==;
X-CSE-ConnectionGUID: YN5gyusgRrOLS5ByTSbayA==
X-CSE-MsgGUID: AgMJ39OuSKia9TG3ZboboA==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32018400"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:37:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:14383]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.136:2525] with esmtp (Farcaster)
 id 2c82021e-6993-44b0-b358-1481f7c2e6a4; Sat, 24 Oct 2026 19:37:05 +0000 (UTC)
X-Farcaster-Flow-ID: 2c82021e-6993-44b0-b358-1481f7c2e6a4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:37:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:37:03 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 4/5] irqchip/alpine-msi: Fix format and wording of the registration debug print
Date: Sat, 24 Oct 2026 19:36:19 +0000
Message-ID: <20261024193620.39999-5-farbere@amazon.com>
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
X-CRM114-CacheID: sfid-20261024_123709_708776_F0AB3FCE 
X-CRM114-Status: GOOD (  10.00  )
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

The "Registering" debug message in alpine_msix_init() prints
priv->num_spis and priv->spi_first, both u32, with %d. Use %u to match
their type, and fix the "msixs" wording while at it. No functional
change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2: New patch (Radu).

 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 8155f63cfd29..fb84b6046193 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -229,7 +229,7 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 		return -ENOMEM;
 	priv->msi_map = msi_map;
 
-	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->spi_first);
+	pr_debug("Registering %u MSIs, starting at SPI %u\n", priv->num_spis, priv->spi_first);
 
 	ret = alpine_msix_init_domains(priv, node);
 	if (ret)
-- 
2.47.3


