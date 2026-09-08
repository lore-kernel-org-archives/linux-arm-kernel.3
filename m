Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA1FC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2iK//7Sx8DQseV8ip5Ewj8MuwDgLsUnqOxaO8Mk9vw=; b=FHxt9FCH0YcwiauCBjWZ0AYYcb
	XUHK0qlp/JPbmmv6yBKEb39njNWT/ROaNr+Nm8Gl16VD1ROvC/nr7jjZqAgT7gfRggI4zqg9+MRoI
	F/Ig9oSWu2T2LFLgRxTyk8TFEXNyfCtXaWRcuQMSUkPVyu03NrCJV9b0zXKrtcA1Ykyj9PHag4KsF
	9rQYOZiTkji/KcFxxD6m6GZKa7FVxzpoY5pliv7yKf1tDOyNdcWHC7aIFB+1MLS4Pj7AJmMVzGNOa
	bxqji9bM9RTHxryu4Iu3Kor3PV7Dwf031QifMMah+njunT0eszRSWInxAG3usn9F7PXTQF6IzXX/u
	t19ayh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wma-00000009Goz-33qV;
	Tue, 08 Sep 2026 14:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wmV-00000009Gmp-3e07
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R2iK//7Sx8DQseV8ip5Ewj8MuwDgLsUnqOxaO8Mk9vw=; b=pooE8tpPN3xJ6VRF8xIN5Nepf7
	bUyaRKMG40hNEwE7ENhmMDJEusZC/XaPloRWJ7wHXQjhzjQO9crE33yr4aLYqo3U02IABONBBVlrm
	UcxSQ1o6ng02RfmlsJwwyvlFcEDe6dyBfDuYEfTm7ICG9EBjr9x6kW68e0b68uC3GVqC4wLJSEiL4
	8ogOYOQuheITMq+rZRHTGWsvu2GXYbxBQa130EMqGyQ/IAR4SirojCGDu6fZx5Z5SkISNwydlM2li
	7el/t7JgMEPvm689lq1BZjL0SBnTTM7mE/fHN0kIcLXriUGzrhuZo63X0Hr6YNtjaKCQbHqRMr+oS
	eN7CboVg==;
Received: from out-148.mta1.migadu.com ([2001:41d0:203:375::94] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wmT-0000000HXFh-03su
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:26:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=s9TT0fZk57NAYbdQgPZkg4s8vZfT60FtoXTyRRE+hbY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877594; v=1; x=1789482394;
 b=oUf2b2Me5yQ1AkdLjcXZPsY7ezdSRSf+FZqsh6OeISavuE1DxUeM4PkWAKetZy6F/KgvOdTk
 7YjM/Zm4Oj25/F61ESN1YtuOf0/UIxjFagO+BoPqwcXGe2jsfoNh+pG3w11trKG/0qEeEuiFq4r
 KaIfZarT0vQOs2O8ZK+a/KCU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14221e000fbbf8e3;
	Tue, 08 Sep 2026 14:26:34 +0000
X-Mizu-Trace-ID: 14221e000fbbf8e3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] irqchip/gic-v3: Release the partition node in gic_irq_get_fwspec_info()
Date: Tue,  8 Sep 2026 15:26:30 +0100
Message-Id: <20260908142632.2795308-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_152637_306836_7A3312FF 
X-CRM114-Status: GOOD (  12.73  )
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

gic_irq_get_fwspec_info() never puts the node it takes from
of_find_node_by_phandle(), so every lookup from a four-cell PPI or EPPI
specifier naming a partition leaks one.

The node is only used for the comparison against gic_data.parts[], and
the mask returned points into gic_data, so it can go out of scope with
the lookup.

Fixes: 68905ea65ceff ("irqchip/gic-v3: Add FW info retrieval support")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc4..b0142b0a93fa4 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1728,8 +1728,6 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_
 
 	/* If the specifier provides an affinity, use it */
 	if (fwspec->param_count == 4 && fwspec->param[3]) {
-		struct fwnode_handle *fw;
-
 		switch (fwspec->param[0]) {
 		case 1:			/* PPI */
 		case 3:			/* EPPI */
@@ -1738,7 +1736,10 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_
 			return 0;
 		}
 
-		fw = of_fwnode_handle(of_find_node_by_phandle(fwspec->param[3]));
+		struct device_node *np __free(device_node) =
+			of_find_node_by_phandle(fwspec->param[3]);
+		struct fwnode_handle *fw = of_fwnode_handle(np);
+
 		if (!fw)
 			return -ENOENT;
 
-- 
2.39.5


