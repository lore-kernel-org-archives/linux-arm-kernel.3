Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LDtoQ0Zy;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fM6fAgeh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km6joHkwcxH7CACYh2zbb3xiLfYHLA+77WxK652vDwg=; b=LDtoQ0ZyQerfFPc7oOKvHyntSl
	N7pJx9lN6QWjXs/xedKgG2rW8IYFQuQucbDR4cdaCPdi3curVK8N1BlRsaqoznAathXgiNf2xJDqr
	hQGntehy/amMZ+ukjvj2o7nv5f1nFZPphehxgUhPlYZZjCAiOaenQK/bzT0q7AxP2b/FzYGdiJQ37
	jnTQ7PRt6jHg+R5QWQ2bky6SzMKaBybjVhghuFQVssX5DZj6elULi1T69tfJPBQyxJ1azmk2tQx3d
	dlkZ1ASURcBrCGe93gDR37DsMlBoKLaKv6dyf5Ej2XDRQWBmIqNxLR9Va7WseeOoGnn99gnMrS3Nn
	8u6JKBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJROi-0000000BIrw-1uzQ;
	Wed, 21 Oct 2026 08:10:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJROZ-0000000BIo0-2qGz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:10:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D51C54E41296;
	Wed, 21 Oct 2026 08:09:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8520606E3;
	Wed, 21 Oct 2026 08:09:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0339D10328D61;
	Wed, 21 Oct 2026 10:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570196; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=km6joHkwcxH7CACYh2zbb3xiLfYHLA+77WxK652vDwg=;
	b=fM6fAgehrLndt57TzGIEIEpR1UIsINEzVwMBNBQr5yVRmpO145/0JiGtSMERL2WLTRdRXN
	xyl2Xaglj7w9mPTC3kHUloeMZ7cm42ldkMAImlyaTVg31l9nSKtVHjiDGKExCbVqv4+hzp
	UESISZau6NB0FkcDLgm+HJ/xOB+DM5xXzJXQZL1DJkKqSF9LGqOod1wvGhjWyAAGvfazr8
	/kRFVb6TeKGjzda278kNQbXkcLN8RtFqPY9UzYngXdWO1M+EdrjprbiB5mFVxrxasNSELG
	WLTJFrX45UEzPFGYSITDYFqe4J0/jAAS8Ej+6TTAMwpN/IVObtKJW4fA1tdmWg==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v5 2/6] remoteproc: k3: skip mapping firewalled lpm-metadata memory region
Date: Wed, 21 Oct 2026 10:09:43 +0200
Message-ID: <20261021080947.3747284-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021080947.3747284-1-richard.genoud@bootlin.com>
References: <20261021080947.3747284-1-richard.genoud@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_010959_859428_6DF22C53 
X-CRM114-Status: GOOD (  13.91  )
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The region lpm-metadata is firewalled by TIFS on Jacinto devices, so it
should not be mapped to prevent speculative access crashes

Just skip this memory region during initialization.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_common.c | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..baebb5de56f8 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -471,7 +471,7 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
 	int num_rmems;
-	int ret, i;
+	int ret, i, j;
 
 	num_rmems = of_reserved_mem_region_count(np);
 	if (num_rmems < 0) {
@@ -501,30 +501,44 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 		return -ENOMEM;
 
 	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
+	for (j = 0, i = 0; i < num_rmems; i++) {
 		struct resource res;
+		const char *region_name;
 
 		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
 		if (ret)
 			return ret;
 
-		kproc->rmem[i].bus_addr = res.start;
+		ret = of_property_read_string_index(np, "memory-region-names",
+						    i + 1, &region_name);
+		/*
+		 * lpm-metadata is a firewalled region accessible only by TIFS.
+		 * Skip mapping it to avoid speculative access crashes.
+		 */
+		if (!ret && !strcmp(region_name, "lpm-metadata")) {
+			dev_dbg(dev, "Skipping firewalled memory region %s %pR\n",
+				region_name, &res);
+			continue;
+		}
+
+		kproc->rmem[j].bus_addr = res.start;
 		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)res.start;
-		kproc->rmem[i].size = resource_size(&res);
-		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (IS_ERR(kproc->rmem[i].cpu_addr)) {
+		kproc->rmem[j].dev_addr = (u32)res.start;
+		kproc->rmem[j].size = resource_size(&res);
+		kproc->rmem[j].cpu_addr = devm_ioremap_resource_wc(dev, &res);
+		if (IS_ERR(kproc->rmem[j].cpu_addr)) {
 			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
 				i + 1, &res);
 			return -ENOMEM;
 		}
 
 		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %p da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
+			j + 1, &kproc->rmem[j].bus_addr,
+			kproc->rmem[j].size, kproc->rmem[j].cpu_addr,
+			kproc->rmem[j].dev_addr);
+		j++;
 	}
-	kproc->num_rmems = num_rmems;
+	kproc->num_rmems = j;
 
 	return 0;
 }

