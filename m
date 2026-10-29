Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6bTOgsd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xBSdgAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=; b=X6bTOgsduYKP++
	uvLPlaI/xt1ncinr4eHays2jHoTO40BNc5EZVbNKoLgJG2uCRMSLeWBNFgA4/sAsLDX4l+w0epD0U
	s4fOe5KjnwuYuwhFsD+/ruGYO9LxwvXgUWr1GUK6HYshXdBZ0lfDB71DAUpwSgMYChLe4HiwzOIg3
	fFCSUsjQC7uNq3sNXvcetHoteLbtAv4EcU/4gz5I8xK5vgsMkadRufTWFaVbvOi/olM5VfvsPpnPo
	qtkQNYOEegzhfV9KFrxTTMJYxCvavl3Auy3pjeTP8/ANC38J8XOlCTxDJnL319+MmaIWzMa0ASkTa
	mrNdvoZFT0DgnjvrsMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZf-00000009SP2-3piI;
	Thu, 29 Oct 2026 13:53:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZT-00000009S91-0ZXb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22257925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282012; x=1793886812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=0xBSdgAssbeU2GzyeY2JcAaebbm1oUI+u0ZuejvYhgX2MAElOxa0JUMn20YbcE/xvG
         QVtw6gN0EKrcIMjeCzRPw5e0jihtOlmnv5idwSFmA4oHvwIatCHcMqI2oyhqj3IQWaR0
         koMAiWseO5X6lRX/ZMuyK6d1wU/YNbBBIbNO+Z/VJVvMaTbtezvBZ/APfEkENGPuQFa8
         Oy5OGuRGvbi+ru4I38lNdLJ3Vf8QwMPxjez+EVYzdgZMJcRzfpXhayPoHig7THWZXsXH
         r3cmmV0XUiiQ/ZMXfdZ3i3IR5RiZvSyatN3s63e1n5EnjocFE9LCiZKOY6+66K1BD9qu
         GxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282012; x=1793886812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=z5HPfqo4++IoHGSpu3HVC9ucsfAHFNdKYZc+y/Lz3VjrTzlg2e9LWV2t71+heRAW4z
         CKVTWo2vv8jBLhsLXTm+qv6zqz+Vz2H4F9oSmZLV/AqlwVlG3hS2NE4OtRgCR56TdmMQ
         jGYfpOR+VgIBgreIpG7j3zcd0svPmLkRLkCCFefHSOzpM3XZjSK1FsUirB+T73IW/5dH
         PqIValeQuNZsbmf1+a4kbN6EMksPOF9hT/BQZGNRtk2BlrOm7JaFEeT9sAOel5k8BYaT
         Y3lkVQgEkYHBbYQny3fCHldFSTgFDSvd/wajFAtrEnOKD1x032YL5PkNojrMWhSc1CQu
         y+gg==
X-Forwarded-Encrypted: i=1; AKwUvBylOktIyCUuCNDSdP4JEeDR9byu6hA+HVJF1JH1LxopKh8O7GOCwXZt0qwR4rI8QeXy1IPw6BVyb/2ZO9GnnxOw@lists.infradead.org
X-Gm-Message-State: AFq9FYJgu1NKbvyt3vRQBtNnnct9uR0yzU5InT/5NqU4tSm9VWTFtNcn
	I1y0VDnhsUX/74To69ba+jWclzOuHYzNbhEWesW/pI5JdeFyFjn/nF0=
X-Gm-Gg: AYBFou3oy5K5l+de7M6dPxZPGDPqzNKX23kcjRwZtcmw86blL3Qzvzkn45ogdqhfnrW
	oRwt5Y2VGN+G8EvAc9SGnYnKAPZ3BN91pC0mfQQUEKPgZnclSHU+vOwpwkvgfaZPL3zCq1YN9BS
	CbYZiCONlT4mg/Dmc6N9bBhqOnqueSPh0zKVZdMQP4TlllFsLf3PXbHqh1lvs1H1Ovu4rKlqbVN
	ou9wQxZK+zzOKufAbN1BvUXrlwC90dmbNw8ut/uH/OX8jNRSNPTO+gMH6u6oDBpxIyKVtfvzO8G
	3JG3AKDOjSzDfkcom3jXd9tXXILZWSikeCzWbv/SK/ovnq3xwEzTIv8O32OsM3oS955S0VP0PUT
	vWBG06A0Gw0yAXpxyIZxHqRwR4GEfh3nk+0tJkjmgb3CZ8BTzujfHdxKOqO/0Uh6m+9xDcAckGw
	7X9E4NIYyU2EWtRvLEgH4i7GcJArVdCWuJTAUzlpqzekyi9o9oNv1ir9IJYBev1O/92YTfRMSrO
	PhzjWOR3mhHk/Tdlpgqcs8MKdNlwJO+LogMpxFk94z/vZVZZW+jKeBFdCq2lhMkdIRrvGbMlvvI
	3e0hjLVe/iz7K7oA/F1qaPL5/Sj/odHuV5VtZ3P9YI023A==
X-Received: by 2002:a05:600c:8b38:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a966c4062fmr131340985e9.14.1793282012331;
        Thu, 29 Oct 2026 06:53:32 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:49 +0100
Subject: [PATCH RFC v2 12/14] drm/msm: add lpac ring to devcoredump
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-12-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=SjlYjQ7B06EmsCE9KnnMd2bONmqc/uyNMNAcvp2x0Ec=;
 b=Y4u2ENL4nkbD0aM3WvJ/ELGPfCSRXNJvoXA78hkmUU4GFxXHhBZNuc0iEh6bPVi314GSCwW/2
 pbbFXwlzl23AkJnsI3vrmGEICHfTAEqdZf+4MgQRM3PA140b5G6lp9N
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065335_216273_DD04DAD9 
X-CRM114-Status: GOOD (  14.73  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 085e1b9044bc..1ce172e5f73a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -785,25 +785,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	ktime_get_real_ts64(&state->time);
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		int size = 0, j;
 
-		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
-		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
-		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
-		state->ring[i].wptr = get_wptr(gpu->rb[i]);
+		state->ring[i].fence = ring->memptrs->fence;
+		state->ring[i].iova = ring->iova;
+		state->ring[i].seqno = ring->fctx->last_fence;
+		state->ring[i].rptr = get_rptr(adreno_gpu, ring);
+		state->ring[i].wptr = get_wptr(ring);
 
 		/* Copy at least 'wptr' dwords of the data */
 		size = state->ring[i].wptr;
 
 		/* After wptr find the last non zero dword to save space */
 		for (j = state->ring[i].wptr; j < MSM_GPU_RINGBUFFER_SZ >> 2; j++)
-			if (gpu->rb[i]->start[j])
+			if (ring->start[j])
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			state->ring[i].data = kvmemdup(ring->start, size << 2, GFP_KERNEL);
 			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
 		}
@@ -1004,7 +1005,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 877f88ef90d9..6b05c2d45bb3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -640,7 +640,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.56.0


