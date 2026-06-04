Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F51CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OH9hQQFNIkDpasnao4boz8/RAiMZ7MOKPgy4BqZR+6c=; b=g9r9uVf2w6xYsVSB2NOpb5wsM/
	uS+tVi84s0YEvqQJ5z27IkMBf8x5BGnBQFDcRs8eK1jP7ovqEHslgFq+S3a2WeiTsTQ683pQmlFsG
	oaF3vnB3M0FC6Grei4ylRRQNrF+v2AePHuSbFeIE7LwPRVWzmcGYdrmLwpko8N945AnMKF+tW7sAy
	THPJVarGi1P2Ao1Nt1bz6CB3DyN+zxVbWDs+wBLCyo7fcFOGEaVwmncFrf37aWg5E8FtPZ2zURnap
	Q1ahjvOsdcK+qvwNHhNX+ltgKMsrcI8nEIVuhR2ReM3NM1FxkyrtmiRDFPwrFlD2WTWWRT8fUhWd5
	Yft1VCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VQ-0000000GpqD-2VZh;
	Thu, 04 Jun 2026 13:53:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VN-0000000Gpkn-3Obe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 13:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OH9hQQFNIkDpasnao4boz8/RAiMZ7MOKPgy4BqZR+6c=; b=ghbKDpPrDnAXb1aBdg29NSTBKg
	cMpanQilNYyYgyib8s9zSn4PTSY+CO7/tTtLDalfCR/qDhXxiWV5cMnKtHmmhUIx/7rpOXYcZN9rd
	8aNvB01xfO06LjPv7o6ZjVeT6PfvsaRmA12jkbxAnlTpWZ74JmsMEHn4HERnPPSq43XPfyvKTzRUU
	SH8OlRRFCzsmq/KM2Q2pJxV6ReHC0FeTlfWrU10uj/WELSUqDj/MGJ7pG4LwEykDPjs/xrS2zTL2+
	gD+wGX0wvzXGH8FXrdVn40APII9xvX+zKNpdNEVPlAJWzufp+oEz4CuA6OrkXeoyiRGGo8fIkBZWH
	QGIZjd+A==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV8VK-0000000EOrq-2jKe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso514609f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581181; x=1781185981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH9hQQFNIkDpasnao4boz8/RAiMZ7MOKPgy4BqZR+6c=;
        b=IFGfzLvCtHRXi0PxHye0PVEGL5yu1bwwh+/zJQq7g1W+9dPWKxSIHFN/os2e0eBa8y
         RiBD5WtbEEntQcyOLPA6txzX5vwlp9pfIG7zHsjRXsQk0eksxr6tGznhNTHGogXtOdv8
         mDJIJzUcG/wnjSuN5pccaNT6svvD4ljHyFV7QRtAX0BVbUS/9grkUSR0g3JY45gjt9lC
         kiUqsu7nSiXsgS2UFwK5Y/UTEFdCtyu6+hd4VpAswmuiMTnubAVjH355dZHw79qV8lKm
         YhOD4FeohdLKDGNSLwbtm3Db/gJ7eDnBv6ORolWyfVUFz43HDqYprFZTQJN46Apv+EOi
         owuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581181; x=1781185981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OH9hQQFNIkDpasnao4boz8/RAiMZ7MOKPgy4BqZR+6c=;
        b=CGYjJ21qSOhsjNZX/VqdR/Tgj7lmDle2idtpYi4nQ8fdtrDFVMjxi5RFG2bnbhCB03
         Jtmva2zWse2EnN5i0ZHLrNwipd/ig+ZxB/anlV+fr+aSoaVgaYeBRbJvoTGEOriVpycM
         1d8eQU1UGwgns4SJpHgZcZrTYQ3tvn6hHuJ2Cyrs7QAiMsH+7E9geC7nh5jWUMHtCnLG
         822rasxifN82cjRMsnz6WvL4+iJiAVxtleby9puBzTJU/DD8IKAP94nt31xYDcgCAcIs
         k1GTBZA1EwBtotugo2cBaoxQV7tolk0n9O507bhijW8EKKltuDRmEE02lkyGpq+/W7QJ
         KRoA==
X-Forwarded-Encrypted: i=1; AFNElJ+xSEjyjTQS5mcZuU+ulrsgY9XkIpSIuPrWwVfuXB7eZPBEnyX5NxpxM3Pvz4FzIwMnyyzvsAO/CBu6yBXFQ3zZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8eTbv0k8m937LpuqL+WJyIZpq4PpAxAPu4hFWWE5eaRfzG45S
	/MVdUVhnBce1VMGgih512BFTL+Pw4eThu/yx5zWRbLkq0CmKMQMxq/n6
X-Gm-Gg: Acq92OFlxinQ909JIYr4q/EV0AFvrhqCPOt63DXfoJXAeLCck2AZ8ZC/EZV+vMIak1x
	RMle55fq4Ep/PdSDGf8lQm6ZkIAJCMJG5a/MurKji1yapXEs2C/rwkn3zF8WBwz1aAxcWFZi/wb
	6dm7AjHIcYIoWz+8fjPHrjfQys12G7+2uuJvvztkSQsFrWBgFyN0kmdeP/mLY66WRop7P42WJBE
	oMLkA+eBeMpbNy6ACPNu6l3T+IHfTJ7pwT9ofHkUzQlEsrJ1JCTJAwAjVG0VrUMvkydnpO5+Suu
	fcMRY0eHlp6nD4XxhWYbHSaFahNIyJNDY4eEDye6JlkfwF5bId5i9GG2Mjs9jmtIRZLYJJxsb1u
	F2WfdwveWbHgsOp1/jk/iVRBl7lsCCFgdD281u9+6org7CvwXsnBE7hJMqGbGEE1UTXw+mYToJm
	vwvrPonCc1zt4BLFrsqV+fp6+BDQwJjgFYY2ftoIhBXv1Z4aiRXZ8Ln+4EI9Jn8I8=
X-Received: by 2002:adf:eed2:0:b0:452:6aaf:76cb with SMTP id ffacd0b85a97d-4602178b717mr9418813f8f.1.1780581180807;
        Thu, 04 Jun 2026 06:53:00 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:00 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 4/9] accel: rocket: Reset the NPU before detaching the IOMMU on timeout
Date: Thu,  4 Jun 2026 13:52:50 +0000
Message-Id: <20260604135255.62682-5-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_145302_826152_4022F856 
X-CRM114-Status: GOOD (  13.15  )
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

On a job timeout the NPU AXI master can be left wedged with
outstanding transactions. rocket_reset() detached the IOMMU group
before resetting the hardware, so iommu_detach_group() ->
__iommu_group_set_core_domain() asked the rk_iommu to stall and wait
for the in-flight transactions to drain. They never did, the stall
request timed out (-ETIMEDOUT) and the IOMMU core WARNed:

  WARNING: drivers/iommu/iommu.c:157 __iommu_group_set_core_domain
    iommu_detach_group
    rocket_reset
    rocket_job_timedout

Assert the core reset first: it quiesces the AXI master so the
following IOMMU detach completes cleanly. Move the detach after
rocket_core_reset() and out of the job_lock (it does not touch
in_flight_job).

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_job.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ac51bff39833f..e25234261536b 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -364,14 +364,20 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 		if (core->in_flight_job)
 			pm_runtime_put_noidle(core->dev);
 
-		iommu_detach_group(NULL, core->iommu_group);
-
 		core->in_flight_job = NULL;
 	}
 
-	/* Proceed with reset now. */
+	/*
+	 * Reset the NPU hardware before detaching the IOMMU. A timed-out job
+	 * leaves the NPU AXI master wedged; detaching the IOMMU then issues a
+	 * stall request that never drains and times out (warning in the IOMMU
+	 * core). Asserting the core reset first quiesces the master so the
+	 * detach completes cleanly.
+	 */
 	rocket_core_reset(core);
 
+	iommu_detach_group(NULL, core->iommu_group);
+
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
 
-- 
2.39.5


