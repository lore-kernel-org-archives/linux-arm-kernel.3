Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655860A3821
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gvpSm7SB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JBfqfbfr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QsiPImWCvspsQxeNXp3kuF7NO55DXC+1f0q/BU544lY=; b=gvpSm7SBrGCTHTLyE5SXuaUYk2
	XVrrqH3tQGhNFpcjARApNNoxwaJVsUVV5cfrkD9nj3vdPFv+5fcRMoNMWdMk6Hlxdf0OgxDxUPOgi
	GewMerNYnUV+t9Hj45JpCP5x2yR6Uxt2avuwpuHCxZfqY876JYv0xLywmDibFxxdnY8JZLDx564yT
	1mltwFxy5bk09CtZHnJwG/nTLDBjxxiEoFZrLlBMnWONoh3W5CHbFubaLSmzSoGGYFgfBECyd70sQ
	0QdFF4mv8sgkZwMRK08y0lUip1ay+WhFASLwk4UVbV9I7UPbfsOQW37djZV96PiEwgeTZMCo0gyS/
	UEySE6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBth-0000000A4AX-0Deu;
	Tue, 20 Oct 2026 15:37:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBta-0000000A4A2-1oeI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e8c028eefeso1654095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510617; x=1793115417; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsiPImWCvspsQxeNXp3kuF7NO55DXC+1f0q/BU544lY=;
        b=JBfqfbfr7Nf5uJO0QlcI1W9EXne3vbpDR+7ouv0CWKndPPG2UNUQUXBPayBddaC039
         n47XM1oVharO3fwdcLuhiDXtkjIn9LV/FjGcoqObh6fOqiEb6FZJA8QMgVsTlJA1/ns0
         ++9E0B/mNCcn87sVeBBI63N/cHRmjaDlgUbINDgDj6ARsbuv/Rh+Gh3yGqFHsmUOp+DZ
         bzNuoqB0pWTWqfYAbzdk/S961ynqu6KIjUOk26Pwoo4Dgu1/tRucMrAdBPR4axMlrFou
         eCsxUp/FS6mK+KYOpTLnFyHfi4Fpet3uH7MBVNcdjoRkPJcTNCPdVqiHG8YDA/8rf8hQ
         mTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510617; x=1793115417;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsiPImWCvspsQxeNXp3kuF7NO55DXC+1f0q/BU544lY=;
        b=l1Q0ZeSwq5PsWzoXqN7AfphPE8tbR7elx2Mfig0T5jK5g2coV2BACLeYU5J74dwW+5
         e+/FpBGQo2ezj4I5L27gDKISI6hJG3wDe2ArLtAchCjPFTFUgnv4Oufgm2kToDTUsE7Q
         1esIE0hQ/6P/Cfqq1nfDT1+iNC1H53Yu0LDDhCQa2tF4aV2AePsyiaN+zJEdAkCOJt3B
         Z7DT7+HRlm7IcRK4ypAr9WKDhwQcPNC4CvhnNEiIgSdTGMoDxoWaJ6PZrG/2k7cdpGfL
         uBGKf7duli7g1wMPruSgdysfPDJF2omRRoGWgBzfPK0Ao/QElxvNiNciIhAv/NA9epwI
         Rwcw==
X-Forwarded-Encrypted: i=1; AKwUvBwTRTcS3Fz2idrfBlZAPCGOfsV44ILJt56n7bimUpOAG31kA7n1e+8ZdCXlIgCjhuE0PU9uh2AimyClx5SjkIT6@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0zDSdS444t3MLoauOMWwfKR3lrYZ/eruh/N/E4C2VD20WokyI
	wDtuD90AE2Z+MStKEZj2JdFE9Zg6m/JRbWX/okCapuAKka1qMEMvrWAO
X-Gm-Gg: AYBFou0IAsD0OWdSRFwEkjw4kr16Fa2Nouazt4BcfuNO3xM3dj9+GorjskgtNyucQSE
	tr5sW/30QTZEVPW7dv33Z5/oGnjTd+pnVrXgzCSLcB1ZUgPunovacROqiQidiHhfW9S9+2H7pel
	R0h2YWbCFvdj7D4cqPKZiV0fKfa3MWoZFWsFrvCmLh6Wr3E7QAS4Vx2VnfcKDtiEiCRaKtyIIXw
	3FYKNVlvJHM2RWFbWdXMDPB3uAawLtTPchiF89k26oScHqFtWf2erw0DNuXvooXjWcsdJA2PUKA
	B/h9xW0y4xy80X03XQbN567YeKINxTHVIxks5Tw3+74P1u92kyd+b8pkVGsYTZ2t1iT77IcUmEu
	nxB53KZmNa0jXyK7yvMKRHiI4RiYKUExBzClBsrN47aSJwgPIWANdm1WA9DS0aFJ0Jv5nZFuNSX
	gpX9P8YnwR09KaH0MDIzIuGRaWawdNOEbua+Es3x8b/g6LDU8xuVGhjISSedM7gaMnDV+kRSVyc
	FwitmeK81Ljoa4Z8NamyHWMrQ==
X-Received: by 2002:a17:902:fdad:b0:2e9:4f73:83d4 with SMTP id d9443c01a7336-2e9a6d2404amr167599885ad.4.1792510616796;
        Tue, 20 Oct 2026 08:36:56 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486970sm736655ad.62.2026.10.20.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:36:56 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH] mmc: sunxi: fix clock and runtime PM leaks on probe failure
Date: Tue, 20 Oct 2026 23:36:47 +0800
Message-ID: <179251060762.3832.10358805890614600473@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083658_474493_265F044C 
X-CRM114-Status: GOOD (  15.85  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sunxi_mmc_resource_request() enables the bus, card, output and sample
clocks before returning. Several failure paths later in
sunxi_mmc_probe() leave them running:

 - If devm_request_threaded_irq() fails, the clocks enabled by
   sunxi_mmc_enable() are never disabled.
 - If dma_alloc_coherent(), mmc_of_parse() or sunxi_mmc_init_host()
   fails, probe only frees the DMA buffer and the mmc_host.
 - If mmc_add_host() fails, runtime PM has already been enabled, but
   pm_runtime_disable() is never called.

Besides leaking the clocks, this leaves the clock enable counts
unbalanced, so a reprobe (for example after -EPROBE_DEFER) calls
clk_prepare_enable() on the same clocks again.

Disable the IRQ and the clocks in the probe error path, and disable
runtime PM on the mmc_add_host() failure path. Also handle a failure of
devm_request_threaded_irq() in sunxi_mmc_resource_request().

Tested with QEMU's orangepi-pc machine: with forced sunxi_mmc_init_host()
and mmc_add_host() failures the MMC clocks stay disabled in clk_summary,
and a normal probe with an emulated SD card still works.

This issue was found by manual code inspection.

Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Allwinner sunxi SoCs")
Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
Cc: stable@vger.kernel.org # v4.18+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index fe4c0f6d73f3..437fdadb5950 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1354,8 +1354,13 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
 		goto error_disable_mmc;
 	}
 
-	return devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc_irq,
-			sunxi_mmc_handle_manual_stop, 0, "sunxi-mmc", host);
+	ret = devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc_irq,
+					sunxi_mmc_handle_manual_stop, 0,
+					"sunxi-mmc", host);
+	if (ret)
+		goto error_disable_mmc;
+
+	return 0;
 
 error_disable_mmc:
 	sunxi_mmc_disable(host);
@@ -1385,9 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
-	if (!host->sg_cpu)
-		return dev_err_probe(&pdev->dev, -ENOMEM,
-				     "Failed to allocate DMA descriptor mem\n");
+	if (!host->sg_cpu) {
+		ret = dev_err_probe(&pdev->dev, -ENOMEM,
+				    "Failed to allocate DMA descriptor mem\n");
+		goto error_disable_mmc;
+	}
 
 	if (host->cfg->ccu_has_timings_switch) {
 		/*
@@ -1467,7 +1474,7 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 
 	ret = mmc_add_host(mmc);
 	if (ret)
-		goto error_free_dma;
+		goto error_disable_rpm;
 
 	dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
 		 mmc->max_req_size >> 10,
@@ -1475,8 +1482,13 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 
 	return 0;
 
+error_disable_rpm:
+	pm_runtime_disable(&pdev->dev);
 error_free_dma:
 	dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
+error_disable_mmc:
+	disable_irq(host->irq);
+	sunxi_mmc_disable(host);
 	return ret;
 }
 
-- 
2.54.0.windows.1


