Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nRduz1Vg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABq1jG8c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=; b=nRduz1VgaYYNbM
	6mFtUhuft+ZMIr5mjz6twsUII862oCsoI/AQO/P+MpPD2oRM7M14wBhsP3rxVzvkwmjG3XwUgdops
	UWtsokVwPB8oD9WtujNgNMX6eoNKkvYchRrF4+tg485UGQijmphr40It2XR/JiIXLgpNjdh70ufhk
	+k3omR81HWKUQbEnSLQGlfo5KxJl4bEi9gREYpg7d0Y9C/JZKUzoufR2cwk6P1NLCsN5OTrcmFXlo
	B1ZFNe0e506GGA/7fi7wEFjEdl92R7pMpzPJoMgGR7YtJqugKFRt4m5+AYztpLrPwM75sPIq+zgXJ
	sAEmi2DC48f8tc9xNeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZe-00000009SNN-2hgH;
	Thu, 29 Oct 2026 13:53:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZQ-00000009S6Q-0OiS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1935859f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282010; x=1793886810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=ABq1jG8ca/kDEnEBd7pt5vEmE3wKeg8Q0qoguKntgtIsc4muJFoeX/bOy7cOAkqIB9
         xwN+zqaZX8FHSO75yVWUnNN8xy21J7ieObAHiowSh5j8Xtb9ZofoeDwblnZ1T7irOg1g
         OIzZNyiNeLvaPxvgFJln4genJBP5FfAzKmAKtQqDZCQp8CFjw8zF7ME7dL1wDfs67H0V
         3ZPD5wp9sksYW5Gk1l0Ji0eiIrbmvAFjiSHBdMRWES8uRA53HeWpsOzX5UEFNsk1l2Za
         gSbl0xmcERYvqikWGfygYmqh+JE9yWsmc0JZvX4kX2hMHrALvX8JGtmFMl9hF4YDUUXb
         kYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282010; x=1793886810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=tiFy6+Znc9UQfPS3RVQYRm83xgcfEE8L8UjWACMESNRyytI/otqzSatTpmZDM6z8vB
         oFV84YYuP8GrrW8RmuHmeXVh5NuBl+NQFKyMARohiFnfEPBLgXpONaAUk5To0ZOu8QAt
         0sRmImUy/NAA+3EgJlZMAdJeZXWQwoyu7SzRpOoJMusNS7tyKMVs/FQ2E1T7A5hygca0
         d7AQs+wGqadevpoOPcww1obGP4mXjgybCF/Msk8uOQCc7mgrCZJxauvl+b2pMSWl/W6Y
         0IXmSdm/FZKtdIJ9Pv4Wyn/larWW2Rix12IBhcfQTNzKXu5RxCEBynMZu2xCyv7TRn1L
         iU/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNeC2o2fSwFA8cyrnp6axmPqu6MazmNzmRA8vxLuU/xaO4xh3F7FzUN/7muB3a5crf0Wx4em2i4qWXcp6dfFai@lists.infradead.org
X-Gm-Message-State: AFq9FYJ49lpDHzyuWspjfI+99fLuUIvwZOPQuu+M3ROoU3GWSePj70nX
	mpjGmo8FKGwxvfiVbmy7rDgGXXmt3bjxVOebqS2LxRzQPpa+ZAAVRME=
X-Gm-Gg: AYBFou0p07qoMKea+jRHmWsN6XXgo1QbPqWboiBsLNQ5wRnnS/YFGu6O0lTHPjgSDHK
	foiNwPI3duyviUJ1HDPOCu4hkQHFcR5f3RSeGn0NvCVYwAgdyCEwx8K2jrRKhx3F9FP+d9dnIIA
	YNntNALn397jPln54v9R6kv/bQQP5k1U8FsYydG0dyY5ED9mkp6MCu54KzDbV0JQibIwZ1PSXAR
	4qszy/4KBDsS0LL2agOTeoGG7Hh5EurICYrnDVzD8dwrF/00Yz5rKImqA1pTPWxKb2VgiVxzMgw
	hIsptTtdwSb2Vs3Rqp+0bLwwPBOoMCzton+8gtXXzoVlAGr7h9H6EbVZoA0smDahGvgb+RbOuyZ
	mHabNlPOETxXoVXjXAzlp+Gffdc4nE1fbMgqJ85NZItDmntRhSthzQEsLDsaHWLacaRI0irYvgc
	Q+GB1Rg5/nD+psEMZQTEf1jOBBHUvsQ/PsH7jQkvHsF1OGhLQNbR31NCjvxGoyA5lJ4qGWIhPMQ
	/UuoTQFtioeV6vSMPMYIdmydc2J5GzLISVGEKE8gJtvY32Nj6uOca9GV9rfH2i7trJGZjD0cbjl
	CFaSN5oSrWjysD3ANMyIrsyrGLduXN4Ul0zXr8ivMlMeYg==
X-Received: by 2002:a5d:5e03:0:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48e5d468159mr13722390f8f.39.1793282010340;
        Thu, 29 Oct 2026 06:53:30 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:29 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:48 +0100
Subject: [PATCH RFC v2 11/14] drm/msm: set ctxbank and asid based on ring
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-11-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JeZ/oDOWBrzzXnhSTsaX5dWsSADptm5HwF/DPV1Xv4k=;
 b=4M7VMbDwjOepIjZPrdycOsvEBkNuot2Ltb1yMKAeV6IZ8onsZj759zJ8VBrGw6EwZ2ETpsOXr
 1DglU23L6d5AIGkk239c64rud6FZXnrAbBlSSiEjCojZ/rkF2k76XQ0
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065332_216621_B37AA621 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e82d0c0bc10f..57fc4035a753 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,7 +247,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
-	u32 asid;
+	u32 asid, ctxbank;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
 	if (ctx->seqno == ring->cur_ctx_seqno)
@@ -256,6 +256,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
+	/* qcom-arm-smmu always maps asid and ctxbank 1:1 */
+	ctxbank = asid = is_lpac;
+
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
 		/* Wait for previous submit to complete before continuing: */
 		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
@@ -313,7 +316,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
 		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
-	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(ctxbank));
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.

-- 
2.56.0


