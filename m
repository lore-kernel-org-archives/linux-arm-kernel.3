Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A99CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOYnN5zI7xxKgqHLT+auJ4GtT9sdG64BBmkBX8tu6zM=; b=Gldke8TWOtOAISmaldMNyRQH9n
	Ksnnnrfo7kIgB6z2Zg6ptLT+8CyewQEfrbiLceXQ39esbnCUPDh7IYYkknMfs6s2ny30rnJ8a8qZ9
	DjWSBn7nAiktAY5Kwt5zL5F4xK/XSA8XB2HxNtlVFElTEBqOV+x+EHzOpsF6ro0goeKi4HuQlndri
	Cm0QouBhEc63172Ghe3Z/pDidXzV79n2nzYrTnUO+i5ssVt1K5v4ziYXUTecclt7GSa6zi5HSM/ny
	sSaHBZhT44kx3aJcVhQKs4PAW3XprGklu0AOVgukw7iHRE6Ge6NJcMUd22QKzwplT41OoANGLtajw
	hopO713A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwum-00000006fiB-2BDu;
	Wed, 30 Sep 2026 16:12:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwuT-00000006fYD-2ays
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lOYnN5zI7xxKgqHLT+auJ4GtT9sdG64BBmkBX8tu6zM=; b=WdlTe++8UVGQN1sHsLdv/wGmki
	STrOmqt2a0JWjtaSwOfpy4eTt/IQ3SPluQwDc2rP9ychKl4aNDIs3oulhffAn/g1y0UqtcpNDxLnM
	0g7+/Ne04rMrJRDUpQvo5swT1MSviDMfM8B+/HXgqVJAjvemECo4Yani2N6QroQgSi4LfC7XBMvbM
	oeL8sTxfbhBNXPmyqSulSX1N4nm8DydxyguxmCuHk5FTnUS1upcWgg++zv9AkazpuEgddDRF4ytaF
	ngXg3SSdOrqH1k+wHAudPcHItz2fG/tz8I6PtDqUwNrRoG41Xiu4W4oyGyyAnoWlbbzGJA1WZ7hdF
	TFZO675g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwuP-000000043eE-0PUw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:11:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D694B497;
	Wed, 30 Sep 2026 09:11:46 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71BED3F85F;
	Wed, 30 Sep 2026 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790784710; bh=mhiFQi2dBjObRl78LuvvVUQq6uT6vsfGTPWbqHb1j5A=;
	h=From:To:Cc:Subject:Date:From;
	b=ttEWMnmSP+6hHJupnRbWqBuLe3k7hhK9BEZF9Apx/uxB3FrC1oGaqpdwFswGrGgxD
	 lKqC70LTIm4hrWpX20oUDdjXYBbgv7OcpUcwgzwLz4PaLZha6HWRBLOfLW1Sa3Y09Z
	 wfDNKf8Fb2fHd7UT5AWnjnHFWjDL3afPo5Z1n1dE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	maz@kernel.org,
	tglx@kernel.org,
	radu@rendec.net
Subject: [PATCH] irqchip/gic-v3: Ensure change to DS is visible
Date: Wed, 30 Sep 2026 17:11:23 +0100
Message-Id: <20260930161123.46368-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_171153_409593_A5F13D5A 
X-CRM114-Status: GOOD (  11.87  )
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

Sashiko reported missing GIC synchronization when the
FLAGS_WORKAROUND_INSECURE path modifies DS. Specifically, an immediate
read of the DS state after the write might not observe the effect of
that write, which can lead to misreporting the DS state.

Updates to the DS bit are tracked by RWP, so poll it after the write
before proceeding to read back the DS state.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..181f6eb11732 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -164,6 +164,7 @@ static inline bool gic_dist_security_disabled(void)
 
 static bool cpus_have_security_disabled __ro_after_init;
 static bool cpus_have_group0 __ro_after_init;
+static void gic_dist_wait_for_rwp(void);
 
 static void __init gic_prio_init(void)
 {
@@ -179,6 +180,7 @@ static void __init gic_prio_init(void)
 			val = readl_relaxed(gic_data.dist_base + GICD_CTLR);
 			val |= GICD_CTLR_DS;
 			writel_relaxed(val, gic_data.dist_base + GICD_CTLR);
+			gic_dist_wait_for_rwp();
 
 			ds = gic_dist_security_disabled();
 			if (ds)
-- 
2.34.1


