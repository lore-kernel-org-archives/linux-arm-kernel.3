Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC2107639C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foVVYiS7RexaElNWck+cN0zG121Ow3VWEAgh80Cg91g=; b=WaRY+VcXFnalwBerchTg0XXFBH
	hgq6xxr9O1JvpVkJ0Ktwh1d2QZWQPcAR9ZtZjdIRI7tL5BSDNyaAj+ynJfAQGVY8U7hp+3XQAPj+T
	iLi5L67hVhN8lvDPE7/mYV/gT4VkiAhOerP9jz+t5XlqqRsFQJgppasaTL1+1zWSQvupSkR2FEN3j
	DUopWXBf3tt/fYWCkOFUqWKAh4mPnyDLhN1KnWJDnU0fyhmtoPqaucSUPboneCbFLzV+GQq/ayrke
	AFClhdMiAx5mL4X38RzciqoSOBkWkQaTtiJ6/vnEzaHj479dt09fdN3DG8Q1lPt26+cvOiDeN/hRI
	/NEpL4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxb-0000000FvBA-3nvn;
	Wed, 01 Apr 2026 18:06:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxW-0000000Fv48-2lxP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=foVVYiS7RexaElNWck+cN0zG121Ow3VWEAgh80Cg91g=; b=ho8L3mkxJm7bXUr0BsTyH36lNN
	5wm2Q8Q69Q7yh62QWP0Psh4A6t3YZFJgMAhRY41LmUtgW5AgF0W+b0+gO8TAvngSQQI0OEGdDvfhk
	OnsthMPhUKwIPiOAIXzMwH8jKGZ6v/bJnlTg18rv/KBHh8qh69dklCRldiuXSP1zq2EIGy4A3JZru
	0TGHszsFCrq+FHqzvAA+pqVwSXEp+iYaMVH4RAFTC65NlhD+IewV9K7DpQT5/3LjZElcIOvFljzoo
	LjPa3y+vt/dzmdpt2u+kehmtQHc/EED0vHx88r6jekQr/F+rSUGSCAVidSmK5Auj2OFgHIc2zhCfd
	l10Nbe+Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxT-000000014b1-1n4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B396C1A25;
	Wed,  1 Apr 2026 11:06:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CFA63F7D8;
	Wed,  1 Apr 2026 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066786; bh=f1ZhSxbK5lj45fGxYKMIseZSqlRsS6XVNficr7SEZiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FRkkaeBdxARXHuBLTjsmZdX8KL74ogTf6Ee6ZTgvuW3HRmFx2CXnFW7TYHbrW/CK5
	 UGU3nKTBVf11Q3c2Yhn3AvkfZ1eo1HwUjoWwLRpjbz3g6ViY4UXDyPUUzB7NVaAJt/
	 CAi4WnHrlvYuiLjuJ3Gk2jnKZDJ97gg4kVRVMwBA=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:47 +0100
Subject: [PATCH v9 18/20] coresight: sysfs: Increment refcount only for
 system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-18-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=2948;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=f1ZhSxbK5lj45fGxYKMIseZSqlRsS6XVNficr7SEZiA=;
 b=XNYQbi2KxAFrFlXEMGOH7oWLJqSDubK7tIQ07uxOe8R/TMJRgusW+UMRhwMHEmKYY2YsXwjbh
 2hHnc5/ft4SAx8NOPAZuyfWL6D7WPMuyqB7//9eBd1vPAXeGsz87Qal
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190627_831281_0DCEF42A 
X-CRM114-Status: GOOD (  14.26  )
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

Except for system tracers (e.g. STM), other sources treat multiple
enables as equivalent to a single enable. The device mode already
tracks the binary state, so it is redundant to operate refcount.

Refactor to maintain the refcount only for system sources. This
simplifies future CPU PM handling without refcount logic.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 34 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 9449de66ba3941614928924086100866f3c88a54..75dd8c9f78174b7e604fbad6e8735656a2d643a0 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -53,6 +53,28 @@ ssize_t coresight_simple_show32(struct device *_dev,
 }
 EXPORT_SYMBOL_GPL(coresight_simple_show32);
 
+static void coresight_source_get_refcnt(struct coresight_device *csdev)
+{
+	/*
+	 * There could be multiple applications driving the software
+	 * source. So keep the refcount for each such user when the
+	 * source is already enabled.
+	 *
+	 * No need to increment the reference counter for other source
+	 * types, as multiple enables are the same as a single enable.
+	 */
+	if (csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
+		csdev->refcnt++;
+}
+
+static void coresight_source_put_refcnt(struct coresight_device *csdev)
+{
+	if (csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
+		csdev->refcnt--;
+}
+
 static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 					 enum cs_mode mode,
 					 struct coresight_path *path)
@@ -71,7 +93,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 			return ret;
 	}
 
-	csdev->refcnt++;
+	coresight_source_get_refcnt(csdev);
 
 	return 0;
 }
@@ -93,7 +115,7 @@ static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
 		return false;
 
-	csdev->refcnt--;
+	coresight_source_put_refcnt(csdev);
 	if (csdev->refcnt == 0) {
 		coresight_disable_source(csdev, data);
 		return true;
@@ -188,13 +210,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	 * doesn't hold coresight_mutex.
 	 */
 	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		/*
-		 * There could be multiple applications driving the software
-		 * source. So keep the refcount for each such user when the
-		 * source is already enabled.
-		 */
-		if (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
-			csdev->refcnt++;
+		coresight_source_get_refcnt(csdev);
 		goto out;
 	}
 

-- 
2.34.1


