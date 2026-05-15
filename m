Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1437CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om32yXhs+QvBym8qN0KqHr18ySF4002j+nxRXTzSuLo=; b=gEQz0cTS4o5JT48AIDKCiho1gV
	xg+NQ1Wlif5OxzFeHNyatw4Pxwb6aO2FYrrzj6vA2v6fNKjDDilpvzlcU7M8SzAt64K3VXJdfj62C
	+KVf+zGJ1q6Kp4QIMdcE2Zqm5DV3NIT3SAp6yGFs3NReIXAj5uQvUduqa6zO7coCRzpFx94R60gKS
	U7KRAa9NBZXbGNidScNV/nt6dFGC9Wp0f8yeBAg2MJA+R1YYB2iWf1lKE/q4pNznbO598dM7BG64u
	D2VYs/bpy7vAfDFrW4zS0HVqmIV54OShYOAW9b3xztVK4S9ori1GcZ8rw12SprU0Br0c/fWseogWV
	SIxDHQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqe-00000009JMn-3ln6;
	Fri, 15 May 2026 20:09:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqT-00000009J9R-0h95
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Om32yXhs+QvBym8qN0KqHr18ySF4002j+nxRXTzSuLo=; b=TIsuoB95kubgXsctCs7sGHyGIj
	sd9XPSoUBfN7NFCnXlEFqnLZdWfr7tIt+Aa2vrwMTCYee9jMAZ/xOq5GUMis6bBiLwiGma/bxHo7w
	pkbyRttAr+1lXsrqiUz28KEhvteWgrB5Bo7ii45+NlQS9SZroRsWUfdUtgj2mt/R2MtL05TO5pAyX
	YUuQ9XhUQpglA53Hz8CcQps+9vNJYq4x1VUfqgH19UsDAli4atZwVMhdkMRHtkC3RHJHNyXPQ4q80
	cuIJQmqlDel7FM5FKbdBlt8y/zzEFjkJ7ar+2+ecMvgjgCiY1rQifTloGgQO1RgvC80Z8ATdG15yG
	E8ZG2yKw==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqM-0000000205r-1OnA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6013F35EA;
	Fri, 15 May 2026 13:09:00 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7B783F836;
	Fri, 15 May 2026 13:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875745; bh=qmXnyAfd8XzEF5licnSwSdyXddUMt9j3gcpVUu/ZpmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UYqL8u63fh/4qFf4xTNQ+DzErQHSJgDgOoyI8Tf6voC6tHC8EStsE3vsbGCUzdGsm
	 BR+oFr6zINSMBemPLotmANd3+RVLTK/fE6PPdOWehOUuVTUF9Kk28iUYwFvjhXs/Xf
	 V+jNk8uRRXy+vJvoF4+I953Mv9urM8oin2h++cpQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:20 +0100
Subject: [PATCH v14 13/28] coresight: etm4x: Remove redundant checks in PM
 save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-13-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=3181;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qmXnyAfd8XzEF5licnSwSdyXddUMt9j3gcpVUu/ZpmA=;
 b=pqsj17JOSDXFd5KPtCv4pLrvm7u2tObi+et5EilEllXa1z+P6gP4DXL3ywLLMcZmKdUlOgsFG
 0+Xzus0dDMgCjPDyWenc+dLCy2t7MMYJuqJtjM3Ku/XAp4pDQ3bQQvf
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_210910_846095_652918D7 
X-CRM114-Status: GOOD (  14.69  )
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

ETMv4 driver save/restore callbacks still re-check conditions that are
already validated by the core layer before the callbacks are invoked.

Remove the duplicated checks and fold the two-level functions into
direct callback implementations.  The obsolete WARN_ON() checks are
removed as well.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 +++-------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5cd70f0f3710a5ec6406a89c034d30230f782b13..fef1270439e9d770fc0459e9ab8cab7cb40827ee 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1853,17 +1853,14 @@ static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
 	return !!drvdata->save_state;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int i, ret = 0;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state;
-	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
-	if (WARN_ON(!csdev))
-		return -ENODEV;
-
 	etm_dev = &csdev->dev;
 	csa = &csdev->access;
 
@@ -1995,32 +1992,13 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (!etm4_pm_save_needed(drvdata))
-		return 0;
-
-	/*
-	 * Save and restore the ETM Trace registers only if
-	 * the ETM is active.
-	 */
-	if (coresight_get_mode(drvdata->csdev))
-		ret = __etm4_cpu_save(drvdata);
-	return ret;
-}
-
-static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
 	int i;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state = drvdata->save_state;
 	struct csdev_access *csa = &drvdata->csdev->access;
 
-	if (WARN_ON(!drvdata->csdev))
-		return;
-
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
@@ -2113,17 +2091,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (!etm4_pm_save_needed(drvdata))
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
-}
-
 static const struct coresight_ops etm4_cs_ops = {
 	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm4_source_ops,

-- 
2.34.1


