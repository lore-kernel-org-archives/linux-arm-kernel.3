Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49360A2637
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8gZ0Kp2;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GALNdacz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=; b=G8gZ0Kp2a8IWlO
	YdVeBtqOor00dXMOnTW23qZDmTQxFCo1qek5z1kb7CeJ999y9LDMLun9Ugu2yu6jmoGkIIKyYa0Pc
	zm2fTG0+xpbzriiLOiu/6MUzVFvVH77ajerPM3EaUljekzVgZkPjYAy07zwO43+XmRc/FitT88Ffg
	CVgWh3q1hCbQhsYSTy0HAdxRlzC3fBgOhRDtRC4/4i/y0b5p5VL9TTnXvBPSxW3WoW0cYfMGy5Oo/
	ZUsqh5VIv5bcuQuqZvpCmuqqYHLrpfRRX9DXZCJQduDn3guaZS7jPfL6ysGQsCzT91lmoEaHlg9hC
	XG6eURrg+aubI+ASGdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8m-00000002oPu-3HlL;
	Mon, 26 Oct 2026 16:01:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8a-00000002oHd-28VJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:29 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c43373ae89aso480244766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030486; x=1793635286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
        b=GALNdaczM+sZ8QGf0vaIDFBfYQd7MW5O6LTJGuOk5usoUX0hTO5tGJV3tXukkTU/Mm
         KLI4Nu88q7LMCIjnkXjjIdh2w9W8NkWVxkGRfiNtR4n9sYGAcGHRpmP5Cwz+nOM82avG
         Ij1tmlrtHsLBYBbFkkP6ZgFwRKeh0jG6b+h1arvUpzj5h42CrHCFd9QG6MJ595NL1HlI
         TRM33rbl4Rl3tSg8Abaw2LSc842YrThDldd1b34N9PRlSnCbOkTPSQgc6LtdUk1JieKe
         APVtZziAAsYKaU6PGTdpw3gGQW1+l88+e2oBC47G6MEKeLalL7gf7dFYtvRblHCgr2Zo
         vPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030486; x=1793635286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
        b=lzKqlY6Iax1pCvaFOKObhhSe2JPiC3FhmK2u8nmiRK/WzQYYtGIKMExdfpD07smxcR
         UaUCMUoFOnsnHH/OSeFnCnbrFK5dIuQXimX3PO+PVXilwCjyJBxkjyfART4QwjbmhRPD
         Hyo3RtXxQF6I3Acu2ubDy5VLaciOByhYCxtQBJNZYFPvxj54tGawl33ib2/G0pbn4bRd
         RNKKs9rpnKXogYyCttfwfE40zEC23AE06vJTVumJ/l/uAxASqvZrVTZmQ3twbJ6D0X+O
         u/9m6ePz1saLRO0A2ZAzk9xfdLyBweW8acDTegNr+Kj0Z9xL7XvCpFJN6R/iUESD6H+V
         3RAw==
X-Forwarded-Encrypted: i=1; AKwUvBx3+PaxInFs0mjmVcImlShIcttKZSL0eqlG1F2dEOEDRMj7yLWHROh+Rf6RaNmFNd9oHAAodEG9NSc9i/SmNPGb@lists.infradead.org
X-Gm-Message-State: AFq9FYInfji+AruR+yRJswrYHNRDOB9ZT+a7rIKbwhT2kS/nEEdKQRzz
	Q5Kj73bIQjnHO62a4By1JZf0isWyjDPo9yylopJ9eTAueps4rifrPEbIBnyzVxTvyrA=
X-Gm-Gg: AYBFou2xUiPvrFuEGVdwOz60AbNdC/YPIKALe3+S3n9Z0sb4HFTHIfKTBmSd8xg1PML
	TnXavRSaw9HkS/m1yezpdnY5jZq4ZwbE91Zxi2+e+CauhhUiTcAdHdo55qSByNCEkssL060zlgF
	xgdCkUi424KeKQhAKJx/xiK3+9YUra/ZRS1N0dAdmIMvRtZQNLv3N/WRc27nu9GFkFe2itTWEee
	FRgd6sTyVDMqvLWVbmJaRdyjSLOltmI1kF59xHXmG/P2uE9CQqkBVegKnaOQyyWcAvlWqq2ZA0Y
	MLubNI7frlue5Dm0f6w6qdz0nAe5atpMhuAbp9Xa/uI0kDG901qXakQ7tinYEfUeDmuW4OfO0ex
	X78KK5RTIeFeLQRggBzszVyXUyepBgmgUQPn2KStnwa/w/JlXT0p57unkl1JJIEvtjBnxV448un
	2SwUEvdNZEyFWlCLykgwXbczbcUe/BeV3BoPOhNDsKXqnr+GfWoDSg+pLThhMK4jMPsSCV8g6Z5
	9U1MXJzicq5vzHcScKvwElvA6SC6agAGtr1QSgFnn0Y0msx/QJ4jfZ8wKMwIu+unfMx4OIb34wU
	nO70nTR9Rk2svk4hP/fDpuU/nqnSuwnBAYW1DKMOyE/ZSxMt1vpp20a9tQn0b8AxKCeYzHb/K0v
	v2reynMEbmQ==
X-Received: by 2002:a17:907:3e06:b0:c46:8b9a:39ae with SMTP id a640c23a62f3a-c46bde4eb8bmr821391266b.28.1793030486440;
        Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:20 +0000
Subject: [PATCH 03/15] thermal/drivers/samsung: acpm-tmu: Fix
 acpm_tmu_resume() error handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-3-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=5298;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qCVVqc6x/0s6bvl7rY2mwBkC7vhwwi3YsCjDNoVX0oI=;
 b=OXFKufosU6U5StLfJ2EhbNkIwQkfSSKgKLDfOeJRGJ4ZNoF2KUu4DMwUDH5vRQ4Mq598C/Kqq
 CY0W11kdtKqCDlgRvj8x/U86cthK9v74EmXyy00w+8tt0Y7/tsqWzeK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090128_604481_CD236F87 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unlike .suspend(), system resume cannot be aborted: device_resume()
clears dev->power.is_suspended before invoking .resume(), and on error
merely logs the failure and continues into normal system operation
without re-enabling runtime PM on the driver's behalf.

acpm_tmu_resume() treats errors by rolling back into a suspended state,
causing three problems:
1. acpm_tmu_suspend() disables runtime PM via pm_runtime_force_suspend().
   If ops->resume() fails before pm_runtime_force_resume() runs, or if
   acpm_tmu_control() fails and the rollback path calls
   pm_runtime_force_suspend(), dev->power.disable_depth remains at 1
   with the device runtime-suspended. Every subsequent
   pm_runtime_resume_and_get() then fails with -EACCES, breaking thermal
   zone operations and causing future system suspends to abort in
   acpm_tmu_suspend().
2. Calling ops->suspend() on error leaves the ACPM TMU firmware in the
   suspended state while Linux considers the device awake, so subsequent
   thermal zone operations run against suspended firmware and the next
   acpm_tmu_suspend() issues an unbalanced ops->suspend() call.
3. Rolling back sensors via acpm_tmu_control_rollback() when a single
   sensor fails to re-enable disables sensors that already resumed and
   skips remaining sensors, leaving active CPU clusters without thermal
   monitoring.

Mirror acpm_tmu_suspend() in reverse order by calling
pm_runtime_force_resume() at the start of acpm_tmu_resume(), and drop
the pm_runtime_force_suspend() and ops->suspend() error rollback paths.
Re-enable sensors on a best-effort basis so any sensor that fails
remains marked !sensor->enabled for the thermal core's post-resume
update, and drop the now-unused rollback parameter from
acpm_tmu_control().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 48 ++++++++++----------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f9802080acd7..f490551de69a 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -172,7 +172,7 @@ static void acpm_tmu_control_rollback(struct acpm_tmu_priv *priv, int start_idx)
 	}
 }
 
-static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on, bool rollback)
+static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 {
 	struct device *dev = priv->dev;
 	int i, ret, err = 0;
@@ -191,16 +191,8 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on, bool rollback)
 		mutex_lock(&sensor->lock);
 		ret = acpm_tmu_op_tz_control(sensor, on);
 		mutex_unlock(&sensor->lock);
-		if (ret) {
-			if (!err)
-				err = ret;
-
-			/* On enable, stop on first error if rollback is requested */
-			if (on && rollback) {
-				acpm_tmu_control_rollback(priv, i - 1);
-				break;
-			}
-		}
+		if (ret && !err)
+			err = ret;
 	}
 
 	pm_runtime_put_sync(dev);
@@ -539,7 +531,7 @@ static void acpm_tmu_remove(struct platform_device *pdev)
 	 * immediately, preventing clock leaks when the driver is removed.
 	 */
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	acpm_tmu_control(priv, false, false);
+	acpm_tmu_control(priv, false);
 }
 
 static int acpm_tmu_suspend(struct device *dev)
@@ -549,7 +541,7 @@ static int acpm_tmu_suspend(struct device *dev)
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret, restore_ret;
 
-	ret = acpm_tmu_control(priv, false, false);
+	ret = acpm_tmu_control(priv, false);
 	if (ret)
 		goto err_restore_sensors;
 
@@ -571,7 +563,7 @@ static int acpm_tmu_suspend(struct device *dev)
 			restore_ret);
 
 err_restore_sensors:
-	restore_ret = acpm_tmu_control(priv, true, false);
+	restore_ret = acpm_tmu_control(priv, true);
 	if (restore_ret)
 		dev_err(dev, "Failed to re-enable TMU after suspend failure: %d\n",
 			restore_ret);
@@ -584,34 +576,18 @@ static int acpm_tmu_resume(struct device *dev)
 	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
 	struct acpm_handle *handle = priv->handle;
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
-	int ret, restore_ret;
-
-	/* APB clock not required for this specific msg */
-	ret = ops->resume(handle, priv->mbox_chan_id);
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		goto err_suspend_acpm;
+		return ret;
 
-	ret = acpm_tmu_control(priv, true, true);
+	/* APB clock not required for this specific msg */
+	ret = ops->resume(handle, priv->mbox_chan_id);
 	if (ret)
-		goto err_suspend_pm;
-
-	return 0;
+		return ret;
 
-err_suspend_pm:
-	restore_ret = pm_runtime_force_suspend(dev);
-	if (restore_ret)
-		dev_err(dev, "Failed to force suspend during resume rollback: %d\n",
-			restore_ret);
-err_suspend_acpm:
-	restore_ret = ops->suspend(handle, priv->mbox_chan_id);
-	if (restore_ret)
-		dev_err(dev, "Failed to suspend ACPM during resume rollback: %d\n",
-			restore_ret);
-	return ret;
+	return acpm_tmu_control(priv, true);
 }
 
 static int acpm_tmu_runtime_suspend(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog


