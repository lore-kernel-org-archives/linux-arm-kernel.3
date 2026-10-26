Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4828606B798
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeWigggW;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kjq0vq5L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EZQIogsZeMKc8icauriJLlFLU0mrhDSe8yDu+EjToX4=; b=AeWigggWlhKWwH
	UPwkcr436NhW+oih01jvUhbvSI/Z9r58kZ6Hi7s6kztg1SdcBwxP6BopmMC0I74MrbpuUzp1lU/1W
	0rv5aMHr3n5BhCOSeJyI1r+/n1dqGGkKvCxT6a+/GFSrq60+lsCJTCUQYCndxs97QzaH5w+15DtDa
	EfuIUcv1WW0/2nMVqOwULMD8+5s5U+i16oUmIvQDUK/4pNrinbpQkxOBl/wi8yd9uOgGvSa12LyBZ
	1usXuiE38QmnhdcZgt9lsxFjujth10Xnzj5i5dBff0CFuBib25UyFyhvJPJmvtrTpnFK3yG9LkNXA
	wknAB5ZusVBM4CDsZyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8m-00000002oQD-42PI;
	Mon, 26 Oct 2026 16:01:40 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8b-00000002oIB-1XvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c3fd91337baso430910666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030487; x=1793635287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZQIogsZeMKc8icauriJLlFLU0mrhDSe8yDu+EjToX4=;
        b=Kjq0vq5LlReXYAWMxAmMm8DKRvQQ9cDgZzcLcERe8wF+sUaV93T7/otvk7KNTpBjhQ
         gVuH9q5q6HjPV1sHV6jBiGHsP6VmhEfQRPATctshro/K8nHrpCd59a0tXykFaCJdt/Y1
         aoTpx7au5waNgPHLATzk8sXXkAPthoPYgWurwm8DpRFgskQkEVzAJ6fLTbyU0ZLjACGZ
         IdfeVR8pYxxLo9dY4NHjTIi7nGchDE38bZKSncUrC2kfXYSHyBtBbw9R7W12OOe4Ql34
         D7oDnXCDEXzjkQVCgoStLHQE4ndSp+UUiw9YLnh/ocW9NFFdMujgaulwNRyUnIxYjYJC
         ihQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030487; x=1793635287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZQIogsZeMKc8icauriJLlFLU0mrhDSe8yDu+EjToX4=;
        b=fS46AvmKT6YUI+6l7X1aqttvk+VYqOjeW9aqnD5vdltXHzRoWxOcQ5UW5l3I7J35MR
         u5ig0ch4MPGmEPO/YDHS7h8FXPArehCJi8SImL2ie1Vcd6JGZ82AiwZYQI1fnjuNEMP5
         yKyx0DQxggcr33bv4+7WOIf+SktnvLpZsV+mAOta44Ro3RGvKjcVz4RkYl254k9bI/XD
         iMfqixPVsTFlIkdSa6aVvOYulKWv7S4zwdXmSJg8sOybyQtaOTwDjmRVaUsQlNmhOh15
         6edRrYr71Ok4kNsu+M/y0q2yJu70tGyKYCisK+YgfWYsnGrD/j2a5C52s/6Ht2ZimgUW
         FP9g==
X-Forwarded-Encrypted: i=1; AKwUvBwY4t4m3uC12QA7rFOumH3jXicagYn5M1vVDVG6h2d8oD91E2t5rlfXY6vW5dlzQTsX95JPfeJJt2x923pDQaiR@lists.infradead.org
X-Gm-Message-State: AFq9FYJHGVtEPkwWvrzpl5Io3V/5K/LoZsR/97YrN+xPWuNS8za/wQnD
	KjV3BNlH+3Ct9ZsEUKpbYPiicS1zdW9lAqKSAnOU+VVr2ObEsUqRPmNu9MFrps1iRgI=
X-Gm-Gg: AYBFou3asnw7mOKQi2+Z7BLv/lw0tB14SLC3t8VMCzddK5NRW8UxLDeUmEpc1wkPeIZ
	Gp61yN7Pptkh5BMnaQGe02sdBWBBS005RCBYvnuIVKM6tQa5pDnvBARHc64z8i8pGr2lFd0aHHH
	iXRCNWaVZ0N1NrbeMfLfoUegt3Uqd7lMANtZOGM+YqnZiAacJylGQ0jXEc5Le5brIde0V4ObQy6
	gJB11EI0ZzZ5VRZkFBmekFhFhG2KhleuVGcTQcTns+fCQSPjLoif4pZ8Cdcnfg6v0CqciF4dh5u
	e5BVzft3Rp8c2a2OU5v7CucYLMTAj4Uq0OHKhN+48tmMGhfyGVSX0rYpbRj6HxPg76iOBa0pQ7v
	z1VDnB/zz/116Hn+EA5s60pQnjG5y4mZAQa+pV12+09UMUC9G2OyYOdY72HxI3ocbG1IyCQ1IAj
	8uzBPazwkRwJLoNU8QvEhSb2KGMlzwfFXXn4HD9TiX7uYIgC631gW7TlX3qnwZNSr3FTsCSV8ex
	hOKj+5k+hnoGDniBujZUB9/2fILbvNlTSb6IYKROUUxO3F/Z1RjzsmmY2pPi8IIFCjty78DAatp
	iR2sRqwCQhzpWX8kKf6lQJzJ2k7UIOhT+GmXJA==
X-Received: by 2002:a17:907:6ea5:b0:c32:3da2:69bf with SMTP id a640c23a62f3a-c46bde8a540mr860179566b.30.1793030487233;
        Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:21 +0000
Subject: [PATCH 04/15] thermal/drivers/samsung: acpm-tmu: Disable IRQ
 across system suspend/resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-4-0637431b7268@linaro.org>
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
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=2590;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VungbphQq4N0jonOAgd10JUjrmj+uUeuGFdaY8Jr4Ow=;
 b=OlMBwVWV0K+I8MCQ7zTlId1NV0MOWldwb7ipLvJ1oDsDkvYkIkS52kjOcu7TB34yhnLWRvFsp
 3sUgZ++lT1yDBe1R+EvobwvPfYXh3UH1OsPkt2wDOLMdyswAKf4YaPM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090129_497666_EAF9A3B5 
X-CRM114-Status: GOOD (  13.50  )
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

The PM core masks device IRQs in dpm_suspend_noirq() and unmasks them in
dpm_resume_noirq(), leaving the TMU interrupt enabled after
acpm_tmu_suspend() and before acpm_tmu_resume() while runtime PM is
disabled and PCLK is gated:

1. If acpm_tmu_thread_fn() runs in that window,
   pm_runtime_resume_and_get() fails with -EACCES and returns IRQ_NONE
   without clearing the level-high hardware interrupt, triggering an
   unhandled IRQF_ONESHOT interrupt storm when the line is unmasked.
2. If acpm_tmu_thread_fn() is already running when acpm_tmu_suspend()
   executes, pm_runtime_force_suspend() ignores usage_count and gates
   PCLK underneath MMIO INTPEND reads.

Call disable_irq() at the start of acpm_tmu_suspend() to mask and
synchronize the interrupt before tearing down sensors and runtime PM,
and re-enable it with enable_irq() on acpm_tmu_suspend() rollback and
before returning from acpm_tmu_resume().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org?part=2
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f490551de69a..55ee97218f47 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -541,6 +541,8 @@ static int acpm_tmu_suspend(struct device *dev)
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret, restore_ret;
 
+	disable_irq(priv->irq);
+
 	ret = acpm_tmu_control(priv, false);
 	if (ret)
 		goto err_restore_sensors;
@@ -568,6 +570,8 @@ static int acpm_tmu_suspend(struct device *dev)
 		dev_err(dev, "Failed to re-enable TMU after suspend failure: %d\n",
 			restore_ret);
 
+	enable_irq(priv->irq);
+
 	return ret;
 }
 
@@ -580,14 +584,19 @@ static int acpm_tmu_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		return ret;
+		goto out_enable_irq;
 
 	/* APB clock not required for this specific msg */
 	ret = ops->resume(handle, priv->mbox_chan_id);
 	if (ret)
-		return ret;
+		goto out_enable_irq;
+
+	ret = acpm_tmu_control(priv, true);
 
-	return acpm_tmu_control(priv, true);
+out_enable_irq:
+	enable_irq(priv->irq);
+
+	return ret;
 }
 
 static int acpm_tmu_runtime_suspend(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog


