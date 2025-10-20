Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683EDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIzvfWp9hLWpTMzQfqm3SVUzn87OAdAbL3HZQ0pKaDY=; b=HyT5oR/1OupqohvWteh9ETjs2W
	ts3YZpG6H+EJl2wEg6Ez5GD5EN1mlTAzdk+u6Cb+dJj+jgJrTbZpFTN96kpgtd9s1+E2bSiaE6uqT
	7LvJw/SqgkMHUNfxUYJcrXjwF+OGhRNIrlepKIxASr5UfJDVU2AvUJeisOAiWERbrikPFxlt0p2Ti
	lTXa9RHIRvxVb0iadXbvxKa2BFfyDPlcUmaliAPVCYTbGHKVdfv6DyEe1kq9MnDwgIHbWbCRNpmhu
	ryzB0vZSsNDTu4GsWyfcFwevBTRxZD5ZnPN7cnW9g2nA686dnc5H5ufPJqzZR/8Ao/uMAGwlyXJop
	QNjRs9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp3k-0000000DTmB-0OQv;
	Mon, 20 Oct 2025 12:32:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp25-0000000DRVN-1cLG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KIzvfWp9hLWpTMzQfqm3SVUzn87OAdAbL3HZQ0pKaDY=; b=LevxW87ekJv9bLJxoJO3pq0KNh
	b5SqZuW2x0yi6u/UN5ctTyxseqUvY2OucLxEPBRie33omsiD9td/+z/WipEPAq1Ff+M6CWy1tOey0
	PimM0dJ12vwF+fI0qtSB84UoWSev2cT68q0zdbYLsDN5VHVUw7QR8GuRwjmhb4y1lmPis+HH/5Ku7
	Q3esvQIPCcoyhugPyde3hY1bnkKCc/PhOHxu9ve2Zn2BQ5iU4/O3XVpRq+d4FW5PLt91PKx8LxWfj
	ZlAZkx8Waq8kZhuX4BXrWX2WemHvxgpONRlgfshRD7/3F/aSyPc7C/REF38SUOMXblXIvABhQTHj2
	3BbETgFw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1z-000000074BW-0eNI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA90348AD5;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32A2C116B1;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963411;
	bh=WQ1KbYH73pkv7difN/iSChS2f39lIQHsS0IK9hv/d9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oup1IVIom8Usan9IszwBgDXvWPjVMOoABwyZ6Fg32uCyEX2c0gzWwLlh69ASMVifs
	 yOow+zoKOocgvVTv/e8iyGsZK+FhRvS+9cFdZHW6+TEf9ZSn4eFIY/EMeGa///RM4U
	 y7bT6wM1aOylbKHPyJqGeg1wpjuhTPCOaHxeW6lRSX5Ek9f6go16YHfgHrAm6CrQL9
	 xgDGKLBlGo8WpcM/L4/duob7XRmGLNoc8p2zKPTbpQNIA6IN3+Rn4sMzhn1YNt0pPn
	 OKo85Z9D0ilpSiLmICSGJHKKZU3cbTfOnwtRdLosrchQQes/8eqMgV7RFyLWz1hd8U
	 1kznQfrSB4P9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1d-0000000FUu2-3utc;
	Mon, 20 Oct 2025 12:30:10 +0000
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
Subject: [PATCH v4 09/26] perf: arm_spe_pmu: Convert to new IRQ affinity retrieval API
Date: Mon, 20 Oct 2025 13:29:26 +0100
Message-ID: <20251020122944.3074811-10-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251020_133032_731392_F898D147 
X-CRM114-Status: GOOD (  13.94  )
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

Now that the relevant interrupt controllers are equipped with
a callback returning the affinity of per-CPU interrupts, switch
the ARM SPE driver over to this new method.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_spe_pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645feddad..1460b02d20e8b 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1287,8 +1287,10 @@ static void arm_spe_pmu_dev_teardown(struct arm_spe_pmu *spe_pmu)
 static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
 {
 	struct platform_device *pdev = spe_pmu->pdev;
-	int irq = platform_get_irq(pdev, 0);
+	const struct cpumask *affinity;
+	int irq;
 
+	irq = platform_get_irq_affinity(pdev, 0, &affinity);
 	if (irq < 0)
 		return -ENXIO;
 
@@ -1297,10 +1299,7 @@ static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
 		return -EINVAL;
 	}
 
-	if (irq_get_percpu_devid_partition(irq, &spe_pmu->supported_cpus)) {
-		dev_err(&pdev->dev, "failed to get PPI partition (%d)\n", irq);
-		return -EINVAL;
-	}
+	cpumask_copy(&spe_pmu->supported_cpus, affinity);
 
 	spe_pmu->irq = irq;
 	return 0;
-- 
2.47.3


