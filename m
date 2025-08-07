Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D38C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=; b=FyyhBb1iCkW2DqrKqn9BYUL8YR
	4FFBt1QVpyzbaeMJejmFEHeR5LHmjBHogEwovF8AcDOvEvYs85FqHOu/zSGJT4Ff73CjAvbNvsUxa
	OENZVM1n1Rmp0KcemjxFPBULCZmy2bYSqg9dGA6NdQ8KnU2VO45qX0MvaFBb8I70aJkNWP588bRcz
	JJbLv3L8QnonAmRfzXc29ERV1mx9qmDn0kmv08G8xmoQ+e9XoHigBR/j9ryQZ+LS7rhP2+dveeSxR
	pOH4KkODk0CD4z9w1YXNSWtk+sXTQDLeRAaqDVraXszMRrR1Afs2MAM3G4LhKuPTsggxyZ4XX6f3M
	Uka30fAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk33p-000000014JA-4C2z;
	Thu, 07 Aug 2025 16:01:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk30f-000000013o0-20f0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 15:58:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so6545815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582308; x=1755187108; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=;
        b=eV/NHljKSqwnEvhMIQ2jPeOK5tEoF/MvPWutth5bec+NjSnt2i09Xz+wXIR49CvZ/A
         DQwFN2j0bpUtJUF7dOS9dS3MP/Gtd46GCGCF6Pp2bMOCPKpUE2Qw5oSCI/cKfmhvlxdu
         tUgkKh4MpfsQyHuZFL/Hx4DsPB4lkBpGI0lGIjI5eDGeu+VV6KdSpebyK5c58vlocfro
         7gFWyRVNEu0/lLbva3rhuKm46Fq9OSFd2kNjZxLrbFl/V1BjBkUoF+Njtp6SeGYUnk5L
         /zmHAL1nDHFwhBRkz1qvVMwILp60YxTOAjH/WZ2vpfOSsw99tLxH7v2lq7Of3PFsyVb6
         tn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582308; x=1755187108;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=;
        b=mRyfKBm2w9mnFy23l4NfzlLumkyv1ydiyFOZt6aHHimflHdtYz5hQzTQfqO4LaN0/N
         ZwnnPlUAFeyJKu9ckhiInCcrr0lZx2rlY0galMQMB2thDCl3VBsmIns2+M9MpmbU6HtW
         7sspurjamh+orOKs0CMuSO1hPrhveqJDnyAvqwMrMeQjmLOC+om6arUv4ACugGZneXWQ
         yld3yoGrlrzv+j/6z5FnHTOHw/l2HuIYNqlIUrOw5Jc38Jfu+LIKQm6l/kHt+zRyxziR
         9xx7uIkRPEGznPCf+gXAAU7UGnVXvjajRNLuautvV9xoQTd9KIM3FlXFCJuoh2N7saNF
         ZcMw==
X-Forwarded-Encrypted: i=1; AJvYcCXXgyyOJ3QzBdYf6bCjLUkPPcBWar9/g3gR0vrfYNX4XYE4YZ1FPWAnYThBzq/heBz5DCGfXcyqtbjmDT8CKo5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyFM/uSdf8XANSGjxk2TCy6Ktg3xNCjbMs19GILKwxXdVMJp8WW
	vZeVZkYFtm1RhSei3ai5YLjay8rhCDed4HEZuBPkgkwlzzIyb8vmH6mDBs5dG2oIBb4=
X-Gm-Gg: ASbGncuFOIFGXwxKcNnGtQPRhfkAHtD0S1SspiTz/YuOd/vos5zsKd50v/Z3hgllmnn
	UA3AABMlo3pajJlqGFB86/nNXjxebx1yZONyBF8CU4nhHSzwmbE/b+glLDIrSGF7OSlUcGKYaH5
	W6qdNe10/ONM7dDINRwQj+sTCUmKQU4qjSeF3b44IPEbBtaf91RUJsQ6Jwofk0OT20+gZPdkJde
	WP4mzOZDKB0U7Y+bBjDOuYvu2DBRYouDgJMH9y9QrcFlpXVXDxHgTdiEJs6bf0lBcjxBYZyUP1y
	PtlopcnywRXo+I/6Kp2V09fiPnFwblWT952Y+ebUkfj1KIG7C4kmdY5s91QUqN2VNEnpIggwBri
	kHgslg6lVILGQSQOot2jGWx8MufY=
X-Google-Smtp-Source: AGHT+IEQAtbjB5WuaftcfISb7loqx9lFVpOAzAnPzXuHW243UbLgIM9IVwryPWI9EYIwJTEBgNYAhA==
X-Received: by 2002:a05:600c:154e:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-459f431f845mr2720525e9.0.1754582307874;
        Thu, 07 Aug 2025 08:58:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e587e154sm108933495e9.27.2025.08.07.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:58:27 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:58:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] PM / devfreq: mtk-cci: Fix potential error pointer
 dereference in probe()
Message-ID: <aJTNHz8kk8s6Q2os@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_085829_517546_872F428C 
X-CRM114-Status: GOOD (  14.22  )
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

The drv->sram_reg pointer could be set to ERR_PTR(-EPROBE_DEFER) which
would lead to a error pointer dereference.  Use IS_ERR_OR_NULL() to check
that the pointer is valid.

Fixes: e09bd5757b52 ("PM / devfreq: mtk-cci: Handle sram regulator probe deferral")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 22fe9e631f8a..5730076846e1 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -386,7 +386,8 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 out_free_resources:
 	if (regulator_is_enabled(drv->proc_reg))
 		regulator_disable(drv->proc_reg);
-	if (drv->sram_reg && regulator_is_enabled(drv->sram_reg))
+	if (!IS_ERR_OR_NULL(drv->sram_reg) &&
+	    regulator_is_enabled(drv->sram_reg))
 		regulator_disable(drv->sram_reg);
 
 	return ret;
-- 
2.47.2


