Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2354DCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnrXY4nKtL41DrpWV6jY8HibEUgELK3MwgT78fRwTko=; b=MMaM3dnTUKsyTN3wBJV4T+3gPI
	lu6s8vvyP4u/IYt22EbtQUfOvWx2s8xdv8HYc68dwnysWJyJ+kfhv5PbsQDvwn0PeADnrF7Dowpzq
	emyuvTt1boilszvO0BBv8zbnhLWkU0DxVlfcVgltdWeJ0dT7AJxdkdb5jic491u90K3KB3vGTjcq4
	8VJtORnTsh7sBRHCtvr3qNGyCNCJzK8UJGnNKFOMGCht7/V+E7lcAKs1WefzITuyHIIsbDrnczl9p
	opoqxvmX0viFF/9Y1QSQkmI/Y18yZee9YGYD9g/Cx2Ie/H32u79Xxbbjsyljhg0s7i/yfVWgOIv8T
	i8wewN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4E-0000000DUZc-21x5;
	Mon, 20 Oct 2025 12:32:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2A-0000000DRf9-3Rtt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OnrXY4nKtL41DrpWV6jY8HibEUgELK3MwgT78fRwTko=; b=e9e+oFSF8zZBB01pZEwK+piw+y
	L8zRRbRNa25u5/9LwU1aTEYAPBu66zqq/59akfbWtPs1QD23l4eKW59vpcFPzMAwPPNlvRinmPr89
	9V7SiJtJpix72CQKiBVSd58bRmslnDUtxgb1bfNjj6lN9MK1+NBz80XLM8R0L+xBcmfFSSOb105ij
	+LbxFhJTtIJpeNPcCbQXeXi/bT1OG/Qmpw/6O4eHbZQ9FVjZd+X5/QBjKIPMZxHWNjXavSXlFTxFw
	4waPD+c1EeIu4pl7drZrjY+O0XpT3AkLPwt1hR48nhMJu1L27lKEZp9XHnTW/u/wdBdNFB0z4mBLT
	yrwCwoYA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp26-000000074I0-0Aaj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 014FB48AFE;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F76C113D0;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963415;
	bh=htSs6qqxEyUkJEeEv+pmd+ZSERdhl17dnq7eKn3pDqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6FeGFXGf4zUQ1CRmobuEBTrFzc9EE4Qx19Ed6FX4QXvPbP7Lu7+5FnWqJL5I4S+Y
	 aHMvqc5csDW5SoatyZcuw3/Q3a+jPjf109jtrY4yq2q6ozae1oTR0TPKIOdzJRp71K
	 CN7E0UbtV1eatoJ442jE7sH5Evuhl9ygJpLUFQAzgzBboolpS6Kiv+/PMpeaQWaFUM
	 /jxLT5pIgJspwc5l8766QQdclrx3E1OnaZBo8XURYcNtBKnEwj5+NnmetsF+YC+jaD
	 Ti+U9ho97BWJ2WCcWZyijdT+WjysIf4zlqvU8ehZJ6qhsyR1mEZv1ToDkKxIiy1xr2
	 oFSFYXW6ts+2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1i-0000000FUu2-0Esd;
	Mon, 20 Oct 2025 12:30:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 22/26] irqchip/apple-aic: Drop support for custom PMU irq partitions
Date: Mon, 20 Oct 2025 13:29:39 +0100
Message-ID: <20251020122944.3074811-23-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133039_631977_62DBBA45 
X-CRM114-Status: GOOD (  13.53  )
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

Similarly to what has been done for GICv3, drop the irq partitioning
support from the AIC driver, effectively merging the two per-cpu
interrupts for the PMU.

Reviewed-by: Sven Peter <sven@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-apple-aic.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index cb8b6f40ce8d3..6305d25b9e77b 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -578,16 +578,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 	}
 
 	if ((read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & (PMCR0_IMODE | PMCR0_IACT)) ==
-			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
-		int irq;
-		if (cpumask_test_cpu(smp_processor_id(),
-				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))
-			irq = AIC_CPU_PMU_P;
-		else
-			irq = AIC_CPU_PMU_E;
+			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT))
 		generic_handle_domain_irq(aic_irqc->hw_domain,
-					  AIC_FIQ_HWIRQ(irq));
-	}
+					  AIC_FIQ_HWIRQ(AIC_CPU_PMU_P));
 
 	if (static_branch_likely(&use_fast_ipi) &&
 	    (FIELD_GET(UPMCR0_IMODE, read_sysreg_s(SYS_IMP_APL_UPMCR0_EL1)) == UPMCR0_IMODE_FIQ) &&
@@ -632,18 +625,7 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 				    handle_fasteoi_irq, NULL, NULL);
 		irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(irq)));
 	} else {
-		int fiq = FIELD_GET(AIC_EVENT_NUM, hw);
-
-		switch (fiq) {
-		case AIC_CPU_PMU_P:
-		case AIC_CPU_PMU_E:
-			irq_set_percpu_devid_partition(irq, &ic->fiq_aff[fiq]->aff);
-			break;
-		default:
-			irq_set_percpu_devid(irq);
-			break;
-		}
-
+		irq_set_percpu_devid(irq);
 		irq_domain_set_info(id, irq, hw, &fiq_chip, id->host_data,
 				    handle_percpu_devid_irq, NULL, NULL);
 	}
@@ -732,6 +714,10 @@ static int aic_irq_domain_translate(struct irq_domain *id,
 				break;
 			}
 		}
+
+		/* Merge the two PMUs on a single interrupt */
+		if (*hwirq == AIC_CPU_PMU_E)
+			*hwirq = AIC_CPU_PMU_P;
 		break;
 	default:
 		return -EINVAL;
-- 
2.47.3


