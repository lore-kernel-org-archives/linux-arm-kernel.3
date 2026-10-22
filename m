Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECEE606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4DListQB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aAAkj5mM;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jV1eySsX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qYOHuuQ+lfkA5BRdfuA4wsOKx0VJNbOe26fi2cEceWg=; b=4DListQBLrEuN6IkBy5U//HfLm
	S7Wu1xKMsgSH8ktgFfpeKOJi1ryJals0SArfXzDqH1ro0hwsV9vydUb09z8nk+xMgW6Ttnyi6vJuk
	lDJuZFhBLjtfJqdN+dpiqmNbpvmwWfALkzLqPGoyobyxh9WWOZCmqgFrjN7f7Sf4ij6fjw5iEyecv
	QPh8hrMu/5MsyEesB+W5ZmFcTufnlzjzLH27Suo8emgtH5cnsmuEHH1PRPhWGEoyfd+ZmRPsicKT4
	1NcSVqmOHj2p6H2Akxi9oEK8T5czj7K98Uk1c+dTeHLF4itakPRa1klU9x7v/T6k1NKwEZisJ0xJd
	GBwdNfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnts-0000000DdDy-1IuQ;
	Thu, 22 Oct 2026 08:11:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJntr-0000000DdDk-0YDx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=qYOHuuQ+lfkA5BRdfuA4wsOKx0VJNbOe26fi2cEceWg=; b=aAAkj5mMJNaHJM6WK/u9yZPDee
	QYqWfLn9wHf9SYPLv0SlIqdLTb5LyJJw9sOxezdOHi0GSb67FEAanlfHeXNyb50klVajd8YqWfGx+
	nEn349UKz1IRvABV0ZsY4iFt2aBOmY5XMubk2ofU5+6iFbIQAb6J4Gmi9v+e240YX7q8m74DtLMTl
	bncUdgCRRD3pTGveW4zg3KPfhdfDCdurUNc1wrfB2qmBh+cTIq1xqqjyefXbv+RY0GfEEavy8xdN+
	zIdwyXLROmzZGF0vMPGGnA3/RUgURM5zLegkQvIIpSbaU85hlxSIxEsRnplpqIzWuaLqMpAzEGRS/
	sAj+isxQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJntl-00000006aB8-4BYs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DC2C1596;
	Thu, 22 Oct 2026 01:11:35 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E39B33F673;
	Thu, 22 Oct 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792656698; bh=dK/jptfyGpjv63FMuBSceW6BBKYpzO/KNBTZR86K/Xg=;
	h=From:Date:Subject:To:Cc:From;
	b=jV1eySsXgMc4w3MGqgbKaG+GojN10rZQi160gqstgYqOtjzJJSZCgzPopatD/kP5P
	 AgXzifYAwKw23aIqf7KZkV7R9ClbOG4xOBzE8e6eBnOn3slUmzNKGLeG/OJgkCncvg
	 9Lt74zwEbwz6MBp59jHWCr4wcao8z1kZISLVUfXw=
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 22 Oct 2026 09:11:26 +0100
Subject: [PATCH] coresight: etm4x: Fix event count decoding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-arm_cs_fix_etm4_event_count-v1-1-588b2922a546@arm.com>
X-B4-Tracking: v=1; b=H4sIAC3F2WoC/x3MQQqDMBBA0avIrA3EabDaq4gMIZ20s0gsSQwF8
 e4Glw8+/4DMSTjDqzsgcZUsW2wY+g7c18YPK3k3A2ocB42obArkMnn5E5dgiCvHQm7bY1Fm9o/
 JWPSjfUI7/BK37r4v63le2gtnUm0AAAA=
X-Change-ID: 20261022-arm_cs_fix_etm4_event_count-49f384a2f6a7
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792656696; l=5144;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dK/jptfyGpjv63FMuBSceW6BBKYpzO/KNBTZR86K/Xg=;
 b=xFN48xQcxo/+laWhi1C2/nj87AFBSHvWUdW1T+NF+q9i1Qf4dsvfCmCxWM3ew/V6cvZFu0FrJ
 33cGPVYrC2uDyviJ8eUMFKR3pTh7B750mXhpa+P5uoTMe4hHyD6tks0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_091144_401413_5C15FF8B 
X-CRM114-Status: GOOD (  18.01  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TRCIDR0.NUMEVENT normally encodes the number of events minus one.
From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
means that no events are implemented and NUMEVENT is zero. The sysfs
event controls currently interpret this combination as one event and
allow writes to unsupported event fields.

Decode NUMEVENT after NUMRSPAIR and store the actual number of events
in nr_event. Use the decoded resource count so that older ETM versions,
where a zero NUMRSPAIR represents one resource pair, still report at
least one event. Update both sysfs event controls to use the actual
count and clear their event fields when no events are implemented.

Also correct the instruction event enable mask for the single-event
case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
event 0 from being enabled.

This change depends on the recent driver refactoring. With no reported
failures, it is not intended for stable backporting.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 +++++++++--
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 29 ++++++++++++----------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e21be6468e9544fe6e22f524de4fef9f89d7484f..b0e286f487017a4155595f14cbb9c9c33b17dc6b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
 	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
 	/* RETSTACK, bit[9] Return stack bit */
 	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
-	/* NUMEVENT, bits[11:10] Number of events field */
-	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
 	/* QSUPP, bits[16:15] Q element support field */
 	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
 	if (caps->q_support)
@@ -1519,6 +1517,19 @@ static void etm4_init_arch_data(void *info)
 	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
 	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
 		caps->nr_resource += 1;
+
+	/*
+	 * See ARM IHI0064H.b, sections 7.3.32 (TRCIDR0) and 7.3.36 (TRCIDR4).
+	 *
+	 * Before ETMv4.3, one event is always implemented. For ETM v4.3 and
+	 * later, NUMRSPAIR == 0 indicates that no events are implemented.
+	 * Otherwise, NUMEVENT encodes the number of events minus one.
+	 */
+	if (caps->nr_resource)
+		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
+	else
+		caps->nr_event = 0;
+
 	/*
 	 * NUMSSCC, bits[23:20] the number of single-shot
 	 * comparator control for tracing. Read any status regs as these
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba82cd608d3d61881fe8153db020ff..fb38f0102290a53a681934c827abf107c141a740 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
 
 	raw_spin_lock(&drvdata->spinlock);
 	switch (caps->nr_event) {
-	case 0x0:
+	case 0:
+		sysfs_config->eventctrl0 = 0;
+		break;
+	case 1:
 		/* EVENT0, bits[7:0] */
 		sysfs_config->eventctrl0 = val & 0xFF;
 		break;
-	case 0x1:
-		 /* EVENT1, bits[15:8] */
+	case 2:
+		/* EVENT1, bits[15:8] */
 		sysfs_config->eventctrl0 = val & 0xFFFF;
 		break;
-	case 0x2:
+	case 3:
 		/* EVENT2, bits[23:16] */
 		sysfs_config->eventctrl0 = val & 0xFFFFFF;
 		break;
-	case 0x3:
+	case 4:
 		/* EVENT3, bits[31:24] */
 		sysfs_config->eventctrl0 = val;
 		break;
@@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
 	/* start by clearing all instruction event enable bits */
 	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
 	switch (caps->nr_event) {
-	case 0x0:
-		/* generate Event element for event 1 */
-		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
+	case 1:
+		/* generate Event element for event 0 */
+		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
 		break;
-	case 0x1:
-		/* generate Event element for event 1 and 2 */
+	case 2:
+		/* generate Event element for events 0 and 1 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 						   TRCEVENTCTL1R_INSTEN_1);
 		break;
-	case 0x2:
-		/* generate Event element for event 1, 2 and 3 */
+	case 3:
+		/* generate Event element for events 0, 1 and 2 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |
 					     TRCEVENTCTL1R_INSTEN_2);
 		break;
-	case 0x3:
+	case 4:
 		/* generate Event element for all 4 events */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |

---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261022-arm_cs_fix_etm4_event_count-49f384a2f6a7

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


