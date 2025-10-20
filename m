Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413B5CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKF5M8Qdmxm2lxaRneT3tyNO0em72A0JLfb42ldXQ3E=; b=oqFzcr17QqDqC/QlCWgnYZf0BX
	R2HwX7v5AA897iHkJuwDbpaEg2DJ/SR5EcjofjcvyymWoBBLmqW9xb31SIJGbqcaztvPFyiz67YWj
	NvtelYSniUqimd7BYeISznYB1DbaV8PPRrCGlA+sOFUoyB3YroAIIbSXYMMNXtsHbcWp9O3WDyybk
	OFJANthglzRwCcr1tkstXdlYMN3c9g+KAECSRejLqiEloEkqA82SMm78VnwWyHaPD+eZPvgRHlJ5O
	EyduuUPha2dJxK3jWrIJAX1zKcwUYYsE38St2wrx30mxgwtqBPTi1HAvBvvnhx0bqrfB5Nt+lZ7oM
	CfVuysWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp3O-0000000DTFQ-1Bem;
	Mon, 20 Oct 2025 12:31:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp24-0000000DRU5-15L5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vKF5M8Qdmxm2lxaRneT3tyNO0em72A0JLfb42ldXQ3E=; b=IrxsNmmn4xX4W9drCYFTtHuJJd
	GbgQbqfWmXEV7SWzRYalpkKluKK5PdlBfqOg9iRVeC4XnN78/b5DgZJuoR3ktYJoij6+PwhF32tjy
	CNVMXlj2ilPb/BoWeZu+6PsJX/nwgL7himGKyYlPL6LFGmWttVHgNbJOrjgp7HaSaNOfWUx61h/kv
	dYIqIMtqzLtlo8LRoTlfg1rP6e1t4BkZrIuMyZwmXrtQRvockiUA6AxBZpzJdL+sY8vAH9SJWlRHg
	tuYdSBlQ0PfK8exyQtvAPymojJ4uwpAaBS/i/JCSCStUIFCHEIkka/86g2XWfBIY6d44pJIYiGkM+
	ZH3DLErw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1x-000000074Ar-3kK7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CEB043D13;
	Mon, 20 Oct 2025 12:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17544C113D0;
	Mon, 20 Oct 2025 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963410;
	bh=R/sYXDiHQLNGDpochXu8sf1+KEArDrCXfMKkHZAo3NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfMKwEFd/pfmiDkfDo5n9KeuYiEYhCsQ/aJ940GDegGX7uEJqlmxlVGTOQ7Ww1Hqp
	 uD+1CA16aZVjZZbfPhhHKG6YAYw7ryRtUB8YZmKSv035Q5QWwc+bbib4YCEKbwbexl
	 QCY0FXiIINiCSXCjh5lncOkNRO9lZugh62bzLSCpJp5bG5ryhJp2PXziBYMlOFnsxJ
	 X643ke48aqiF3AdlP6idPApPsYA3pucbueYtitQUKzMlZJWbQ03JVeqnVw/IeGjGCk
	 uF/Kot6LJ+RRDg53JSAeRaYl5sKjzng2/ORpHeL9jpaNZKY809oJuFnhtFu/76kJAz
	 4/Jr6/RSsIbQA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1c-0000000FUu2-076A;
	Mon, 20 Oct 2025 12:30:08 +0000
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
Subject: [PATCH v4 03/26] of/irq: Add IRQ affinity reporting interface
Date: Mon, 20 Oct 2025 13:29:20 +0100
Message-ID: <20251020122944.3074811-4-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251020_133031_802412_A9ED0BF4 
X-CRM114-Status: GOOD (  14.27  )
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

Plug the irq_populate_fwspec_info() helper into the OF layer
to offer an IRQ affinity reporting function.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c       | 20 ++++++++++++++++++++
 include/linux/of_irq.h |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 65c3c23255b74..168fde921bd27 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -479,6 +479,26 @@ int of_irq_get(struct device_node *dev, int index)
 }
 EXPORT_SYMBOL_GPL(of_irq_get);
 
+const struct cpumask *of_irq_get_affinity(struct device_node *dev, int index)
+{
+	struct of_phandle_args oirq;
+	struct irq_fwspec_info info;
+	struct irq_fwspec fwspec;
+	int rc;
+
+	rc = of_irq_parse_one(dev, index, &oirq);
+	if (rc)
+		return NULL;
+
+	of_phandle_args_to_fwspec(oirq.np, oirq.args, oirq.args_count,
+				  &fwspec);
+
+	if (irq_populate_fwspec_info(&fwspec, &info))
+		return NULL;
+
+	return info.affinity;
+}
+
 /**
  * of_irq_get_byname - Decode a node's IRQ and return it as a Linux IRQ number
  * @dev: pointer to device tree node
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 1db8543dfc8a6..1c2bc02818071 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -43,6 +43,8 @@ extern int of_irq_parse_one(struct device_node *device, int index,
 			  struct of_phandle_args *out_irq);
 extern int of_irq_count(struct device_node *dev);
 extern int of_irq_get(struct device_node *dev, int index);
+extern const struct cpumask *of_irq_get_affinity(struct device_node *dev,
+						      int index);
 extern int of_irq_get_byname(struct device_node *dev, const char *name);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
@@ -76,6 +78,11 @@ static inline int of_irq_get_byname(struct device_node *dev, const char *name)
 {
 	return 0;
 }
+static inline const struct cpumask *of_irq_get_affinity(struct device_node *dev,
+							int index)
+{
+	return NULL;
+}
 static inline int of_irq_to_resource_table(struct device_node *dev,
 					   struct resource *res, int nr_irqs)
 {
-- 
2.47.3


