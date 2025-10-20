Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C23CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAgR1k2QMDh0+OxJ0tfR4hmzgez6Js2m3UpVQh5V+Aw=; b=mc1un403NGMmxlQGXeMWEcUG4g
	wgDnYeZid+wAMAD798d8vQeqcOfMZ8Xbjwlpeq/iuTxMnqDJUXNkP3icjKbsHDCJAQrrmmTGXAbZX
	QxaZhOLEFNZg/DOx3K9I/sjxlotNkcceahpHecuw7bgtlNhmSjxUcWgsow8IpCCzv7ItApU9bRlGs
	oltWstRJDsWpaDEe+P7E7WL6HRExH6lAaqCXE9ywXk1VhyY+RHfiRskVjHhuYiEXVPvWRjC0IUvMW
	tlC+4RHRf54hXugDcB1JeTy1jazAhFyxoeSl76RrilnajAaYLWkDy62qTkS1EmOZC1gzmYeh0L6X9
	MY665TMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp3S-0000000DTMr-45dW;
	Mon, 20 Oct 2025 12:32:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp23-0000000DRSt-3gs4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cAgR1k2QMDh0+OxJ0tfR4hmzgez6Js2m3UpVQh5V+Aw=; b=rqBR/ZT1B4LBfzELWIsZPmGUE5
	YAPipGtzOZPELsyxlDc+bfxdJgMP1v5ADUbd38Fl6cfT4mGNmKazZNxE4J+z2djwWSGtNb5rFHKOG
	clDbTagKW0krpHFpTAWvNNTZR1yPG/CBtonz4Ai4Qc+ULpkhVKdEl8SNkcyq+jXkYe8MI4gRpSu9t
	bzGOrqz69kBvIf8jzkIXgVFkAWTiodNMObmKYzs1JmCyj/gCqurVUpVjseq78dWYHBRwiwWbnwyGF
	BWS7epvr9w3iukgoDEtZ83jyW+YKxSgKozexuFXFJLb5BB/MFNqb/eWeiK9CJMpxAczAzmJvTkvou
	5QJi3JzQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1x-0000000748x-3gFj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E762F4416E;
	Mon, 20 Oct 2025 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33D7C4CEF9;
	Mon, 20 Oct 2025 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963409;
	bh=HST/sUWtIZNiNIOKHh+hRvomjQF/XTcjUD7JT/PX8wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsAgRyztlAAjxGp8pjp1m/4q6fcsOTlph00ZZwRTKCTuHoWP0o/hp4xOtlpuOVZxp
	 A8SYrv7Z0eT56XqSXoUO/X29JE4/Z0kaC5eDM3BBTr18H3HIbKqzRoojf5wm/G8BJD
	 3dmQfUjogscs49GW0dwLTh0slYoFkC/f8cNg1yiS3GTPzrofDtqnL03hdQOc8Jb3pI
	 c0vkpnLcXK5AIF7mIHfsKw3QfE/hCmxLmdPlMtdHvO556SuAhdJ4Kr7VkG8zzwWsrK
	 1+2fBj5+3URB1gnFwqYAG5fVYKbdk/08aPzJaaOand08zJZcsI/hdqu97f1M+9LaOf
	 a1GffeGRH0O1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1b-0000000FUu2-30EN;
	Mon, 20 Oct 2025 12:30:07 +0000
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
Subject: [PATCH v4 02/26] ACPI: irq: Add IRQ affinity reporting interface
Date: Mon, 20 Oct 2025 13:29:19 +0100
Message-ID: <20251020122944.3074811-3-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251020_133031_794703_8A3E02BA 
X-CRM114-Status: GOOD (  13.55  )
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

Plug the irq_populate_fwspec_info() helper into the ACPI layer
to offer an IRQ affinity reporting function. This is currently
only supported for the CONFIG_ACPI_GENERIC_GSI configurations,
but could later be extended to legacy architectures if necessary.

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/irq.c   | 19 +++++++++++++++++++
 include/linux/acpi.h |  7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index 76a856c32c4d0..d1595156c86a4 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -300,6 +300,25 @@ int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
 }
 EXPORT_SYMBOL_GPL(acpi_irq_get);
 
+const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
+					    unsigned int index)
+{
+	struct irq_fwspec_info info;
+	struct irq_fwspec fwspec;
+	unsigned long flags;
+
+	if (acpi_irq_parse_one(handle, index, &fwspec, &flags))
+		return NULL;
+
+	if (irq_populate_fwspec_info(&fwspec, &info))
+		return NULL;
+
+	if (!(info.flags & IRQ_FWSPEC_INFO_AFFINITY_VALID))
+		return NULL;
+
+	return info.affinity;
+}
+
 /**
  * acpi_set_irq_model - Setup the GSI irqdomain information
  * @model: the value assigned to acpi_irq_model
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 5ff5d99f6ead5..607db773b6721 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1509,12 +1509,19 @@ static inline int acpi_parse_spcr(bool enable_earlycon, bool enable_console)
 
 #if IS_ENABLED(CONFIG_ACPI_GENERIC_GSI)
 int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res);
+const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
+					    unsigned int index);
 #else
 static inline
 int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
 {
 	return -EINVAL;
 }
+static inline const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
+							  unsigned int index)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_ACPI_LPIT
-- 
2.47.3


