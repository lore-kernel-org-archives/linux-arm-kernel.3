Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05930F41994
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mXUR6fwEd+l0SmGEm+HWa6PfAmUsYcC1//bGnZmKVY=; b=t+z5GRGOxFCVmhrtewmt4aay2p
	ziLpQOIcKsp4o3Qp6s8g/SjiVSI6wmqJpfsrhLJSg/a2HR+GKMfWvYCigcdh5QKAVf555e3Cvjgcv
	aa4+BuZk6ESvqaWeUoonmC6ojLuf17mYzVQCxjlg+mk0tWcYZSME5Gi9qoojopyj/baCmjJ1zfjE4
	wAXzOeIFMgqXYqfqNKvC+Ga5r9Eg16Q7hvCFjSG1mNe4dZON3mfgqPZoKDpru9WzJd63ipjte8wUY
	qnptm0AxvTb9Ao5yMUFK3VambcidqGy4VprGy7ZC3Sll8cudqFjg7T7roeyIVU7urshvedYebcsHN
	K1IH1jdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrM-000000014Ri-2JpH;
	Wed, 15 Apr 2026 11:56:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrA-000000014Do-1vZ8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Apr 2026 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0mXUR6fwEd+l0SmGEm+HWa6PfAmUsYcC1//bGnZmKVY=; b=rFptDrY0IbnVrpUMkuqwzqE2oN
	OYZFOh/tYhjMTVfuNw/80s+RWQemdFdNniBXlBKXYl+yU173HsNyrQG6fT+GeomMninuldgWpuXHK
	3YHsTUz30O0F/JPF6QQPhvAbjjh4yGUo/py3A9xZsjXDTS2Kz9dx1GUjizOxJObwc01ABij4Z+ON3
	+4CRjo8+2ArchroyxWzf6Ibw8xpOkrIZeVG7JbftQ1oCtheO5MW6lDMFFWKeSNce7dEC9iTG0vZrj
	eoU5OCpjiL6aP4RZU51ABgfxPqkwetp1uSfddxHtUNeZlH5eyeMLoDUtOkWByu3ZG4ODUWbOtFhx3
	R3C1874w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000002NLS-1rqm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AE3F44565;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60099C2BCB4;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254184;
	bh=IXwtASoWr0Rh5sMg1W1zwBg/xgjbLHcI6sW2VMPX6cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sHtPq55UjzdF6ukDT91Gl8m0uRYcXOQ//O1LYM5YuFQPNhL21cES1CPkWqYLTpBo9
	 QAQsvHGNLLF4XBl9IfRVuISbtgj3sK88o5I5KJCxUeD64Uj6A6gVUakkmYW01/uNW+
	 a4/quDcRVrg4hzi8eADrnKRYfH0oAPtEv7hXGDIyFVe1tk/GvNV9UIOuR9Koo0U3pb
	 d51RgsJsCAnVEOpH7R2qhHirtuLjZk+0ZLE1qsqBgb/VLkXCSgd1ITVtP3ATxemuXE
	 9pKTob7V6keaiDdsty1I9AsM5U2j0r78hTxiP1NG/Qda8yt+0cVUVJJxktDaGGG5T0
	 +3lZ8pP7k6kIg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyr0-0000000Bqsi-2X3c;
	Wed, 15 Apr 2026 11:56:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 17/18] irqchip/gic-v5: Immediately exec priority drop following activate
Date: Wed, 15 Apr 2026 12:55:58 +0100
Message-ID: <20260415115559.2227718-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_125628_138290_C7734FA5 
X-CRM114-Status: GOOD (  20.07  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

With GICv5 an interrupt of equal or lower priority cannot be signalled
until there has been a priority drop. This is done via the GIC CDEOI
system instruction. Once this has been executed, the hardware is able
to signal the next interrupt if there is one.

As all interrupts are programmed to have the same priority, no new
interrupts can be signalled until the priority drop has happened. This
can cause issues when, for example, an interrupt remains active while
a long running process takes place, such as when injecting a physical
interrupt into a guest VM in software.

The GICv5 driver has so far done the priority drop as part of
irq_eoi(), i.e., at the same time as deactivating the interrupt. This
means that any long running process (or VM) could block incoming
interrupts, effectively causing a denial of service for all other
interrupts.

Rather than doing the EOI as part of irq_eoi() (which the name would
suggest would be a good place for it), move it to happen immediately
after acknowledging an interrupt in the main GICv5 interrupt
handler. The deactivation of interrupts (GIC CDDI) remains implemented
as part of irq_eoi(), which means that the same interrupt cannot be
signalled a second time until deactivated by software.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 6b0903be8ebfd..58e457d4c1476 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -218,17 +218,13 @@ static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
 	       FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
 
 	gic_insn(cddi, CDDI);
-
-	gic_insn(0, CDEOI);
 }
 
 static void gicv5_ppi_irq_eoi(struct irq_data *d)
 {
 	/* Skip deactivate for forwarded PPI interrupts */
-	if (irqd_is_forwarded_to_vcpu(d)) {
-		gic_insn(0, CDEOI);
+	if (irqd_is_forwarded_to_vcpu(d))
 		return;
-	}
 
 	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_PPI);
 }
@@ -963,6 +959,13 @@ static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
 	 */
 	isb();
 
+	/*
+	 * Ensure that we can receive the next interrupts in the event that we
+	 * have a long running handler or directly enter a guest by doing the
+	 * priority drop immediately.
+	 */
+	gic_insn(0, CDEOI);
+
 	hwirq = FIELD_GET(GICV5_HWIRQ_INTID, ia);
 
 	handle_irq_per_domain(hwirq);
-- 
2.47.3


