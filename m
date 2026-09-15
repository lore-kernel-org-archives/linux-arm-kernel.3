Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52989C982C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/YNXFiWPzTBLBEZ3/6oislIzg48i33eBj/LUKofpSk=; b=A68eenwUWFP7Il1+NdhYv/ondG
	2vM2t9882tx2ONDh36LWB9qjWLmOFKVE6Ka1zu7u8qjZETrQuqqq/d++NPFujLzyOh5BFKmj6rIvt
	bDIqoazATRCiJFwfGO/6SdCx6ubAoP9/g/Ov5MVnnXlnM+XNfd9AgRjb6mE3P0QIgUVyFuntws5oq
	I3CDkA4WH2SDFAiHfS7mxGe+wytN+jPzN7knp6fU1+394k8ArSwFTeWmSISQH6eTAJD7N5JXpsJf1
	5JA+oE10dm8ymyf0ZDxdtXSy/faJ6lOFEKAuj5QV38lPgkwQf331b7YeKdSEfWmiTKzvWMpe1eE5H
	4xXj2Asw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPn-00000007Hzk-0n5l;
	Tue, 15 Sep 2026 15:49:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPf-00000007HsJ-2TRS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+/YNXFiWPzTBLBEZ3/6oislIzg48i33eBj/LUKofpSk=; b=pHWupACr+efiw3xJlXvHo63seG
	6a4ev2g/6Hi5gxwIr/n7AljPjwcISwIO40AgS4ML77i0LHXNN2odQ1OkIli9gGVR+M/XiiOqInxaK
	LNEdVLEM4+tctEopP43oRQ6EI0woqJoo4dfsNU1uFh9Hf2PW7D/eWK9B7qG/dkZasWOl3HHydzgvs
	qZR9eTB5CG4RYnX7SO9dbBSVbnMunyXKMvH3r6bs6una9RFZT9Oqk1ReWlqmi1sgXedG9IJhsx2Oi
	aTApXIFRg2L3wzmI5GDBWUil7Mj09mpJ0xC3xHMcZG3vHn3LPungVtGPycJfD31ZuomcoVZvTbnKz
	B60kkYZQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VPc-00000006yUj-29mZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5BCE1570;
	Tue, 15 Sep 2026 08:49:31 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 188F23F882;
	Tue, 15 Sep 2026 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487375; bh=qzq9lLjuTS6Prgx1lZHT+cj9d8Nv+QaG1PQFXY2Natw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=svDIG3eLlH+MZGJ+ZjDsOxy/H8oVslMgdwyK82uskiJ5KuLb1GTfGSXOn8ZYcHhGe
	 ScDk1CIVt4a6T3OBuLuvkIAnzeU9Z55PFTl5QpQUr7GrGahv41vnGMYM1It3wQWtDF
	 6H5txtSipDRrpnzRRNIYkm4adKXtgTuKtVI+PQTY=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:58 +0100
Subject: [PATCH 12/25] coresight: trbe: Track per-CPU sink interrupt
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-12-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=2982;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qzq9lLjuTS6Prgx1lZHT+cj9d8Nv+QaG1PQFXY2Natw=;
 b=fV8kseG8x7mChJYniDqWNzR+udx1uwnsiclVN65ydu6ywIwAZZNBBmUmJu3DUASq7TPBcvFRm
 bGQeigFplLKDgtd2BTCeBTA0msPVOIhTk5BorL9AYtHGp1YXyjL9XY8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164936_919670_8317303F 
X-CRM114-Status: GOOD (  16.22  )
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

A sampling NMI can interrupt TRBE while it is using the active AUX
handle or buffer. Circular buffer mode avoids wrap interrupts but can
still generate fault interrupts.

Add an in_interrupt flag to per-CPU sinks and set it around the TRBE IRQ
handler. Compiler barriers keep AUX buffer accesses between the flag
updates. This lets NMI callbacks detect when they have interrupted sink
handling before modifying its state.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 17 ++++++++++++++++-
 include/linux/coresight.h                    |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index ab3c5c7d27f3d272b07eade1e6452559808b196c..8eb625d3fc99db57a18e35ef59ef814dacf20a09 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1185,7 +1185,7 @@ static u64 cpu_prohibit_trace(void)
 	return trfcr;
 }
 
-static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
+static irqreturn_t __arm_trbe_irq_handler(int irq, void *dev)
 {
 	struct perf_output_handle **handle_ptr = dev;
 	struct perf_output_handle *handle = *handle_ptr;
@@ -1249,6 +1249,21 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
+{
+	struct coresight_device *csdev = coresight_get_percpu_sink(smp_processor_id());
+	irqreturn_t ret;
+
+	/* Circular Buffer mode can still interrupt on a fault. */
+	WRITE_ONCE(csdev->in_interrupt, true);
+	barrier();
+	ret = __arm_trbe_irq_handler(irq, dev);
+	barrier();
+	WRITE_ONCE(csdev->in_interrupt, false);
+
+	return ret;
+}
+
 static int arm_trbe_save(struct coresight_device *csdev)
 {
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ddf18c970e343041787424c2019f2b5dd49154c2..8830c30be0df53a22525ef4fc3c7e41a0ec6fd90 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -275,6 +275,7 @@ struct coresight_trace_id_map {
  *		when a source has been selected and a path is enabled from
  *		source to that sink. A sink can also become enabled but not
  *		activated if it's used via Perf.
+ * @in_interrupt: Per-CPU sink interrupt handler is running.
  * @ea:		Device attribute for sink representation under PMU directory.
  * @def_sink:	cached reference to default sink found for this device.
  * @nr_links:   number of sysfs links created to other components from this
@@ -299,6 +300,7 @@ struct coresight_device {
 	bool orphan;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
+	bool in_interrupt;
 	struct dev_ext_attribute *ea;
 	struct coresight_device *def_sink;
 	struct coresight_trace_id_map perf_sink_id_map;

-- 
2.34.1


