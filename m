Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1557660A261C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YzTuSlXJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FIsCe9MW;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NvYW3HF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUYwdbG4sGnh4rJtyaEXbUadbRzgXptSYV1kw+ac9sY=; b=YzTuSlXJSrBh31Vu2rOl3hbB5e
	cqvdPV+cGmzdG+YDUPuzc9pArV2ZUnJbiYRwoyItnAdARSdc0DBxhME2h+SLoiuEC5sV5jigSDZ5b
	eZMxuUAT1iWEb7Em5XjUiWbAgecndoAIvLTeXtuCpXWkrJ75GOlevRRcMZ/FcE5IPDrGQT3kjRq2S
	5paepuSleQnF9dn9cAtpm3Ym3w2oylDtA0P5MtXHfyT02t4iTPeG6w5lhorvwEN3QTzVwYOS1B551
	J4N8eO614GtaHpYlDmiPtth3Ig3EK5Hel5HjZ26473Bp/J5EFn7LjLPUW9OK/qzxGeJ3/BUvy58ug
	xw83OylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXZu-0000000C8Lj-0k1M;
	Wed, 21 Oct 2026 14:46:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXZo-0000000C8H3-39XH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 14:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zUYwdbG4sGnh4rJtyaEXbUadbRzgXptSYV1kw+ac9sY=; b=FIsCe9MW1B7lyG4G2DuYJe8Wpz
	lC2jx19IIFoc3Nhn0zb1ogx+3DyCftMb9qn2NQ/KE1M/aSwj7nbt9txd3sW5A4IcyZv+De0WCC9pe
	SPmlEY4pSLEJ1tX8Dpnb0RwsR+G8X+qXNwZ8xXE89S5GsKo3qr3mNehwXQF3XaJhmv0ZCYVdH+QaB
	yD2Z0QMO6oEWWMjmCdaV/B6cfeQK0YnDvbJfK4OktWf5DbYxN+cMcFz5Q0iFXacSzQaqCXEa0Y/0c
	0JJ4UWrWsuviULqq/aokA17aTkqGH+msIRa4RRsLqHVwduE5VDyzN18HutUF+bRLounGAt8A3JSN9
	C7fJvoZA==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJXZl-00000005vC1-1jrU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zU
	YwdbG4sGnh4rJtyaEXbUadbRzgXptSYV1kw+ac9sY=; b=NvYW3HF5Ijz9XZuj7l
	Q0K7sVcjeyI/HaQQG4kklvscq+teEvEVA+QgJmH+TNZz4R4gPQDICcGlNys+8N00
	nocSKLlszd1vIJeDg/ZbzqZlKPj8S7dSBj96+4N8Wr1HArYM6++p4KtjoWNX79Xy
	FIeDZodLljPdd7NFZ4brKHtlQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3998G0NhqjItXBw--.10228S5;
	Wed, 21 Oct 2026 22:45:30 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Tomasz Nowicki <tn@semihalf.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 3/6] irqchip/gic-v3: validate MADT records before use
Date: Wed, 21 Oct 2026 22:45:21 +0800
Message-Id: <20261021144524.364143-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021144524.364143-1-yaojiale02@163.com>
References: <20261021144524.364143-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3998G0NhqjItXBw--.10228S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryxXF43ZF48Jw4xXrW5Jrb_yoW5Zr1rpF
	47Kr909w43trWag393Jw4DZFW5Ars2yFZFqFWxCa43Kw4rKryjvFWI9FyYgF1xJF1ruw42
	vr4FqF4UCFW8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7GYLUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQoHQWrY0Aoi-AAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_154558_008307_95283494 
X-CRM114-Status: GOOD (  12.51  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GICv3 ACPI paths cast generic MADT headers to distributor,
redistributor, and CPU interface records before confirming that the
required fields are present. Truncated records can therefore cause
out-of-bounds field reads while probing or setting up virtualization data.

Validate fixed-size distributor and redistributor records before their
first field access. Use the version-aware GICC minimum size for CPU
interface records so valid entries from older ACPI revisions remain
accepted. Validate the distributor in the version callback, which runs
before the probe callback uses the same record.

Fixes: ffa7d6166a96 ("irqchip/gic-v3: Add ACPI support for GICv3/4 initialization")
Fixes: b70fb7af6715 ("irqchip/gic-v3: ACPI: Add redistributor support via GICC structures")
Fixes: 1839e576968f ("irqchip/gic-v3: Parse and export virtual GIC information")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..89b9ef5927eb 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2299,6 +2299,9 @@ gic_acpi_parse_madt_redist(union acpi_subtable_headers *header,
 			(struct acpi_madt_generic_redistributor *)header;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_ENTRY(redist, end))
+		return -EINVAL;
+
 	redist_base = ioremap(redist->base_address, redist->length);
 	if (!redist_base) {
 		pr_err("Couldn't map GICR region @%llx\n", redist->base_address);
@@ -2325,6 +2328,9 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/* Neither enabled or online capable means it doesn't exist, skip it */
 	if (!(gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
@@ -2391,6 +2397,9 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 	struct acpi_madt_generic_interrupt *gicc =
 				(struct acpi_madt_generic_interrupt *)header;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/*
 	 * If GICC is enabled and has valid gicr base address, then it means
 	 * GICR base is presented via GICC. The redistributor is only known to
@@ -2437,6 +2446,9 @@ static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
 	int count;
 
 	dist = (struct acpi_madt_generic_distributor *)header;
+	if (BAD_MADT_ENTRY(dist, (unsigned long)header + header->length))
+		return false;
+
 	if (dist->version != ape->driver_data)
 		return false;
 
@@ -2457,6 +2469,9 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
 	int maint_irq_mode;
 	static int first_madt = true;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
-- 
2.34.1


