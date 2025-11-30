Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA3D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VpKzwW+DrSxITLrqVUpcZpbwlWPuuva1N93VFVuU3gQ=; b=fhW9tKIHQq3RcK35VvzA7KvZ//
	A/l6v1Ignpk2ckuIGi1IC7w2WmQyhCDXUnp4zmaLHmfghegErAbxPTaIO5AZkCtrOS5er5UpRNaza
	xAi+wYz6mB4Z41HFxrCjkI22S0IkLp+lI8Se+cUP9+BfGfgrLU3B+0f8Ljv3HQtF/itoAE5WPtObW
	8BitzkrJOReWk4jO4cEzwKACwHOTEsD2TKQOcZAGs/3MzFc0JNBGowpqadumL/kjNjSSr+SRk2QsD
	TeYliNnVXdo2Pbupz2IsgIN0CxAMvb1aQtluvjyZrfBzHYSlsoVnWA2+lPjsgFgm42JUQaYx6Q/Ty
	9SCHDyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPnMM-00000002Wbs-29ej;
	Sun, 30 Nov 2025 19:45:26 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPnMJ-00000002Wax-1lKr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 19:45:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477c49f273fso39343735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 11:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764531921; x=1765136721; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VpKzwW+DrSxITLrqVUpcZpbwlWPuuva1N93VFVuU3gQ=;
        b=RDit4Plvm6InPFmxLQxrucFGCIX37FuChcwo7oXE/sMokLdvfshruKgO117ROFY03L
         utXkBBgwJyhuc18JCat/3nykeeKBS5yuBYCOGAbuo/562HuVLWqLuf+2ZqEaTqn/gO6l
         FCsZIv9leDmE5mSPqyoIE8agX9O4dqpiiUitjy98me8F4zQ6Gcj6kTYIPUtchz+R04zf
         RjJlV4L1uvAvDAWEz8Z2aV33yv6PxrMaCWyjdN8D75e9iZAg68A2OpNYU15VQw4Py9M5
         6ZB3guo4Hm0R4qh959uRw5uwnYHXRcXEPbbLqTMm3h0hjnqBSRpNSjkqeAP8pKaQiDaR
         ppiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531921; x=1765136721;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpKzwW+DrSxITLrqVUpcZpbwlWPuuva1N93VFVuU3gQ=;
        b=gFINSUdOya5qy2Op/paS4kmxds3ZpxB1kLdMvWiza40uWZrysTpOs4Yb6rLBEl+Hpg
         dWocaZ1KEi1A3fggDDnooy7amvy8R8FOOm1DbKzvOnO4KptQuGxZ1yAabHDThrwdRGvq
         WuZE4mporB+SscZc3zGs9CCNmM2Gj4atx7bGXtiOESLPiwsF++4leu9u5y2hrqxWc9gk
         mBb/ScNwVeisjHT6TWOu1SG68BqaYeXcpS59RcdJR3YLQHnH6hwu2G/8sfdRibtLNSPj
         KtBzaZvKzYzG+jEVYHbZBbbwZg9v3+MLLkzQa9CEu65Wa4hylYPd1AlGXEZDu15PwDoe
         0UJA==
X-Forwarded-Encrypted: i=1; AJvYcCWKoyd3i6XT+an1QYLpXUdvy9HmOZlUw1XgwyKueW+LFgsQr1D+K5fnxw+fU7x5GVanyQNg/KFrpACFuvmsGo8S@lists.infradead.org
X-Gm-Message-State: AOJu0YwYEEPnax7MQ/m4R9az60hoB9082LCvLlkL7ih5hFPgIn6CP9Ex
	kBOqYa5eJh05OtOY9iNjy7F44V+oMr7+W+6PzyWpOlQSkDsUl+1siaMyT1BkE4i9OFRxNp0s6Yu
	rC8nuhSok6bRGDg==
X-Google-Smtp-Source: AGHT+IGX+La27FykkneboKedWl3FbPZ7fIp0DKL/wu8LaMWfDRdIsROXD63+Az5xZoHNsgdO2DB82IvlLgkaUQ==
X-Received: from wmom17.prod.google.com ([2002:a05:600c:4611:b0:477:40c1:3e61])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr341232415e9.9.1764531920917;
 Sun, 30 Nov 2025 11:45:20 -0800 (PST)
Date: Sun, 30 Nov 2025 19:45:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251130194506.593700-1-smostafa@google.com>
Subject: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>, Tomasz Nowicki <tnowicki@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_114523_495617_FD50E5EF 
X-CRM114-Status: GOOD (  12.44  )
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

arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
as IAS would be 40 bits.

In that case, concatenation is mandatory in some cases.
Document those and add the checks, this can be simplified; instead
of adding extra checks we can say that concatenation is mandatory for:
- 4K, start level = 0 and OAS <= 42 bits.
- 16K, start level = 1 and OAS <= 40 bits.
Which cover all the missing cases.

Reported-by: Tomasz Nowicki <tnowicki@google.com>
Fixes: 4dcac8407fe1 ("iommu/io-pgtable-arm: Fix stage-2 concatenation with 16K")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e6626004b323..ecf27e86b429 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -223,6 +223,8 @@ static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *data)
  *   b) 40 bits PA size with 16K: use level 2 instead of level 1 (16 tables for ias = oas)
  *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tables for ias = oas)
  *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 tables for ias = oas)
+ *   f) 32/36 bits PA size with 4K and 40 bits IAS: use level 1 instead of level 0
+ *   g) 32/36 bits PA size with 16K and 40 bits IAS: use level 2 instead of level 1
  */
 static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
 					     struct arm_lpae_io_pgtable *data)
@@ -234,13 +236,13 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
 	if ((ARM_LPAE_GRANULE(data) == SZ_16K) && (data->start_level == 0))
 		return (oas == 48) || (ias == 48);
 
-	/* Covers 2.a and 2.c */
+	/* Covers 2.a, 2.c and 2.f */
 	if ((ARM_LPAE_GRANULE(data) == SZ_4K) && (data->start_level == 0))
-		return (oas == 40) || (oas == 42);
+		return (oas <= 42);
 
-	/* Case 2.b */
+	/* Case 2.b and 2.g */
 	return (ARM_LPAE_GRANULE(data) == SZ_16K) &&
-	       (data->start_level == 1) && (oas == 40);
+	       (data->start_level == 1) && (oas <= 40);
 }
 
 static dma_addr_t __arm_lpae_dma_addr(void *pages)
-- 
2.52.0.487.g5c8c507ade-goog


