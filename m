Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10938C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSlHq0SmvCt51JoCh9r13XuOzmtJA9g6nMobC24S5K0=; b=ifxroe1ypgkIt1Kgy5zmiw9xpn
	EpKpyf79+utZqW1S4Afj/sOWMTOLR9YscW4ZfY9550/5MmOw4hwSaQigblPWXs6ysL4E3wy/A4QkM
	+QZz6ETzfdHi0Dx58S00JR/mkXfS5KLbiRO/lMJBq139wlQj/TOrFvwixX6CM1hq2V7WFEhC+czTu
	sDTNm1Ti8ejitPfM5SwxtUTLKSyP8azqvl60x/3iAW9i3BBtqvBhCjgRocBGCYtov/Hewp4Pxc98s
	wX/3yhA6rHZch0cByN/I6sYTqc23NQL9A/KEmXznqLGNBMhejAuGbHncdqbJ5ebAVldhkI8D14CNm
	gAYV77Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRp-00000009mQA-29sJ;
	Tue, 08 Sep 2026 17:17:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRo-00000009mP6-0MNp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MSlHq0SmvCt51JoCh9r13XuOzmtJA9g6nMobC24S5K0=; b=Fl/ONwcv0LVBEfSlxZ4qW00DL0
	BM3ajoVn3y9ndjLaJm2ZkGDCz40vpm/tQ3t0pe4xa3fXCcAlC7K1n0zhE7QGCN7+57cIvIAActFMU
	MmH6ON5F1qMD9EYqB1KGKybSz2QA+QMjl1ZbNhU1/Ck/njyQxHzy2UXGhBLHW09P4etQgcLZFADzZ
	FgH9jONbAeorVSgCdJ9ttl+LTDMgnJGm3QZy7j9x+PEDSUqnaPEQ13bKn1bx6EpD1kMEY5ccpdXwa
	6lglaA9iXyE4ooE4qO9K6CIWQi1dfvXyOqvjECWFnBNunmsVbqFIz4jQje96JyMcCX9YtIWf16Uy/
	YOceVjMw==;
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zRl-000000008vp-1IbV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:27 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so9272888a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887842; x=1789492642; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSlHq0SmvCt51JoCh9r13XuOzmtJA9g6nMobC24S5K0=;
        b=VbWAvMshdfyZlZcWgiLyuh3BIEM9R3pl1K16foF+9lM4Mo0yObF+xCGqqSYydzU/oB
         wP0O2JWLa1u8dQL94sYS+tqpgPL2HJ07MA2kUrtYfhcqU9gWjVTHmRQwdvL2+CZweQkI
         IX/oJViSV0Qz8yrck+CeJc0TVAl9gR39PqizimXWbcy1EctSaTxnuDx4Jwn8shmUy6Ao
         yI33osm3dDI0f2zZ7OSFx8MYDJAPPFznfC2kRFCrIgl/sc/agHcb09Bfd+bRdItGBD6V
         P/KRcGo8dujWGYjAWIgMEFJJozmrlJQFTEjMgIUk99DH7CaeNE1eIDSAUMpngTQvbbZN
         RMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887842; x=1789492642;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSlHq0SmvCt51JoCh9r13XuOzmtJA9g6nMobC24S5K0=;
        b=ffFeW0RHawXbVWZVsQDmVU9+yInTqvck6vZ9Md2W0uXta8XhiZbsfrrBYYXZcc5nwf
         cge6Yy5r1xaiGXQ5735rcLYGrQxN10xs6r+h9usiOqI/NRLLRvocBAdspugWln4ssHSX
         S9+UpjIyDK9aUbo22JGxsbKJ3riGmUpu0PPZfnrbB9u3CVS3fLSE31j6p3XN8FbWEYhu
         Qk4xEU1CXXPMtzgx8jmEPgPUP1tpJzudcCfrHrbdmuopXfbYwdeLAXL64u5WvEJhdEqs
         KRTHvATetlDWNDjR/tINkizrT0O/1YLEV5DRLVroLvj3l9m89ryFOMFvIg+rZDGH8XwM
         qB+A==
X-Forwarded-Encrypted: i=1; AKwUvBz2kUew/qquswWdhh+3GeVx9MeMndFAw/dF5noDnoxNuYzj/UiT+lGctLC6pGSLMMsEIYpsARDzG3zeOFQXOwl/@lists.infradead.org
X-Gm-Message-State: AFuF++lLd6mmg900W7D9DHrldw5MlzoSPR7rnV3ngcYwJUhVOnf5k2US
	bVVFNegef0Wn899FKCjG/L1+9rMawiA+EhGTvq2OKpKCZh0HEW7ICUcqiHzWnZD+Nc+M59MyI6P
	Cnw==
X-Received: from pjbfh16.prod.google.com ([2002:a17:90b:350:b0:39b:9fad:2ae7])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8b:b0:398:9bd5:490c
 with SMTP id 98e67ed59e1d1-39b26214502mr42288900a91.19.1788887842174; Tue, 08
 Sep 2026 10:17:22 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:16:59 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-4-praan@google.com>
Subject: [PATCH v10 03/15] iommu/arm-smmu-v3: Add arm_smmu_drain_queue() helper
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_181725_613212_5ED44C7D 
X-CRM114-Status: GOOD (  24.08  )
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

From: Nicolin Chen <nicolinc@nvidia.com>

Add a counting-based arm_smmu_drain_queue() helper, to replace queue
specific polling loops. Its until_empty mode serves the suspend and
runtime PM routines that would drain the CMDQ. Any timed-out drain fires
a WARN_ON as well, since reaching the timeout would take some stuck
consumer in any realistic case.

The existing queue_poll() API is not reusable for such a drain: it is the
atomic busy-wait for the command issuing paths, and it assumes a hardware
consumer making progress. A drain caller is sleepable, in contrast, while
the EVTQ/PRIQ consumer is a threaded IRQ handler that needs the CPU: such
a busy wait would starve the handler throughout an entire timeout, whenever
the waiter and the handler shared one CPU on a non-preemptible kernel. So,
this new sleeping helper is marked with a might_sleep() as well, given that
an atomic-context misuse would otherwise hide behind an empty queue.

Note that a drained event is dequeued, but not necessarily handled, since
queue_remove_raw() moves the MMIO CONS before the threaded IRQ handler gets
to push the event onto the IOPF workqueue. A subsequent change will invoke
synchronize_irq() and iopf_queue_flush_dev() to close that gap, and it will
act on the errno of a timed-out drain too.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 +++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 06b7de2e6e4b..84b56849f6dc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -948,6 +948,87 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+/**
+ * arm_smmu_drain_queue - Drain an SMMU queue
+ * @smmu: the SMMU device
+ * @q: the queue to drain
+ * @until_empty: target selection
+ *
+ * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
+ *
+ *   cons0                cons                                prod
+ *     |                   |                                   |
+ *  ---+###################+=====================+=============+--->
+ *                         |<--------- undrained==0? --------->|
+ *
+ * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
+ * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
+ *
+ *   cons0                cons                 prod0         (prod)
+ *     |<---- drained ---->|                     |             |
+ *  ---+###################+=====================+=============+--->
+ *     |<--------------- pending --------------->|
+ *
+ * Note that a drained entry is dequeued, but not necessarily handled: the
+ * EVTQ/PRIQ callers must follow up with a synchronize_irq() to wait for the
+ * threaded IRQ handler to finish handling the dequeued entries.
+ *
+ * Context: Process context; may sleep.
+ * Return: 0 on success or a negative errno on timeout.
+ */
+static int __maybe_unused arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+					       struct arm_smmu_queue *q,
+					       bool until_empty)
+{
+	ktime_t timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
+	u32 cons, prod, prev, undrained;
+	u32 drained = 0, pending;
+
+	might_sleep();
+
+	cons = readl_relaxed(q->cons_reg);
+	prod = readl_relaxed(q->prod_reg);
+	/* The exit target: the number of entries in the queue at entry */
+	pending = Q_POS(&q->llq, prod - cons);
+
+	while (true) {
+		/* Accumulate the entries consumed since the last poll */
+		prev = cons;
+		cons = readl_relaxed(q->cons_reg);
+		drained += Q_POS(&q->llq, cons - prev);
+
+		prod = readl_relaxed(q->prod_reg);
+		undrained = Q_POS(&q->llq, prod - cons);
+
+		/* Exit on an empty queue, regardless of until_empty */
+		if (!undrained)
+			return 0;
+
+		/* Snapshot mode: exit once the pending entries are drained */
+		if (!until_empty && drained >= pending)
+			return 0;
+
+		/*
+		 * A timeout means the consumer might be stuck. In theory, if it
+		 * moves 2 * qsize entries or more within a single poll interval
+		 * Q_POS() would wrap and undercount drained: that could trigger
+		 * a spurious warning too, if the queue was never once observed
+		 * empty. Yet, that much consumption in such a short interval is
+		 * unrealistic. WARN it only, as a stuck consumer is a real bug.
+		 */
+		if (WARN_ON(ktime_compare(ktime_get(), timeout) > 0))
+			break;
+
+		/* The consumer might be a threaded IRQ handler. Yield to it */
+		usleep_range(100, 200);
+	}
+
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     prod, cons);
+	return -ETIMEDOUT;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.55.0.979.g7e5102b832-goog


