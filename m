Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAC4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wnNtboDgAN3l0RxBXJ7GpvEaa0XgYy7m1/m7BgIkhc=; b=HFzMzq6/8FlXjEI8ECY9mlx97s
	8C0+1lEnMdIKp1zFAcmPJhkNSkaOefNUGK3hhU2aVdBtxS/Po//PoYl1RS9Q9U5KIVNYnnDN1xvCP
	m6o5th/DVEkVhOl7vaMA6t+iallHRbnnqtEtZj1gXL4KNwxSJPNqiy3AvLi1Rg6YV9QxxpCkQ3cDm
	W55En9hxV0rnDiJx9iS4Auif8NaMuOSGmAgPgxzUOIkrF83xmpPBfgtmKcEUH7O4Im821IbGnGagQ
	ZEo2c4O5ebKl5dGpDh5V19aej2SMACh/Ji7HJ7gfD/tBB0z8ym8ZM5UDJEngZl1Z2jHEln+XeCiWr
	EW/WMykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXVk-0000000EHf3-2f2Z;
	Wed, 07 May 2025 05:40:04 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXTo-0000000EHSg-1IgK;
	Wed, 07 May 2025 05:38:05 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso9128436b3a.2;
        Tue, 06 May 2025 22:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746596283; x=1747201083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wnNtboDgAN3l0RxBXJ7GpvEaa0XgYy7m1/m7BgIkhc=;
        b=fsifdkdPVD4YR9uLYLNhf4xTBOnLhEjepEL0JdzopTgj7rSeS0GTlvNjxmjXz+fQQa
         ioWXn2E1LC8g1PTMK7AMHc6dLa+/PUERsDDQ13DIjtItdQbMff7EAJ6VK2B8E4DIYhva
         pM/6x9m7djKcgceKrDtZbXTPB57+BnJXJcKYNBakkxGLaY3uZ9+shTYC/eKLOvFRokw2
         vNmZ7V6veO6/f7Iiy4ilEWsbEBC7CqpnFpBPhDTbCuRpKjsxD65lZk/lQMf2SYjB/NOF
         DW6HiqBvRXImsFTlSZz/C+LxZIUti5qhuSf9QEv3dgc4Wk31G+cEwGq0f/xmwHZMhXVL
         AIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596283; x=1747201083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wnNtboDgAN3l0RxBXJ7GpvEaa0XgYy7m1/m7BgIkhc=;
        b=UP6qGMlnhog0nYnE1gsZ/v/OxydN3ip+hxiEZZAONrolhYMpHfVBPgLDMqNeXoT9NX
         fgqyOE4D/Bw3p4Ex6eSZNpyRotpQMM3ypU0qcx/2mp/5SE9inYaw9qYasEcxY/V8kyFs
         RJzsdSF26dbsE8qJ9XpXwu+eOtjW7q2V7DIviHpUG3FO+wJQNlw8FxuX8DSsFhDNYB+o
         S9FAYfW1pHBfC1Ka4ptsXkKOEHMyhM8Usivjbg9y//8NklhR1uDCiLwol4/9713KubNl
         06uEOJ2xKLnraqT1rctu62klePU+0OEbLiOrn/YwiXk3iTsW/9rOyu4RoRE87U3zJ+IE
         6CPw==
X-Forwarded-Encrypted: i=1; AJvYcCWU8pR+JnJ3tqT9wsTdGws2TJKnJg/XyD8AXqwZdE/oKP5Up7HN7Of/u3PjF/YLbzNPpkp3evYlrjduTVf0lvB8@lists.infradead.org, AJvYcCXu2cppucODzU/9ZmfpkaT95f+658nbKmj1JaMDJ6IzzrPg7sTbGX5YduqYGLXf2moY10SuFo3CufVddLY6O1c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfMVdqoGpbywcvMx+eVMvEQFfz4aWs9MF3mHKSdR5EFVKrPzDo
	TpWPUeYebwnwcuFitfNKqEWDrRKW7SxNFIrpkfNXpuuqYxJ7pbsN
X-Gm-Gg: ASbGncucNuwu8dDXtrow89DuoNRWewvhF/E3HCF4quEg+cqNTZ0Jf8GiLWHUhS2G/ED
	c9l67/xNNuZayabJl4jBh+/RSGkeVw1Ug91dXjWpK0Sb8Ovkd3PdCyqbyt7XYj6R87njmy2SEJS
	wJ1EFv7X7lMQe2k2te8eriLqguakM9ynqnDulrkZzMTTGS4yOQ4X/g5ADxSwOo/sK6EKo1r/w6z
	IP7cV+pk0B0T+QF08wSzVGK79wjPczGqyfG4Es8fCqCSTZNnGgD3z1+jNK6UYLJzQTh7c6nTw9m
	iOZ0IbAGZ762sxrfQP/toYRakXcJ/PltMFX1KE4wUewgrzyKCBpe/LKsxhQ=
X-Google-Smtp-Source: AGHT+IHym5Q+YAPg3jYRVQT1AbcSKrkylIIVQ0nly23ygpo9eo5af0TuH69Syh4K6QEhZQ2OLe4vKA==
X-Received: by 2002:a05:6a21:3385:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2148b81ec6amr3152869637.13.1746596282841;
        Tue, 06 May 2025 22:38:02 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([124.127.236.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b52759sm8714315a12.19.2025.05.06.22.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:38:02 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: sean.wang@mediatek.com,
	vkoul@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
Date: Wed,  7 May 2025 13:37:36 +0800
Message-Id: <20250507053736.47220-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_223804_349035_44DC05A2 
X-CRM114-Status: GOOD (  13.30  )
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

This patch fixes a potential deadlock bug. We observed that in the
mtk-cqdma.c file, most functions like mtk_cqdma_issue_pending() and
mtk_cqdma_free_active_desc() follow the correct locking sequence by
acquiring the pc lock first before taking the vc lock when handling the vc
and pc fields. However, in mtk_cqdma_tx_status(), the function incorrectly
acquires the vc lock first before calling mtk_cqdma_find_active_desc(),
which subsequently acquires the pc lock. This reversed lock acquisition
order (vc → pc) violates the established sequence (pc → vc) and could
potentially trigger deadlock scenarios.

To resolve this issue, we have moved the vc lock acquisition code from
mtk_cqdma_tx_status() into the mtk_cqdma_find_active_desc() function.
This adjustment ensures proper lock ordering while maintaining
functionality. Since mtk_cqdma_find_active_desc() is a static function
with only one call site in mtk_cqdma_tx_status(), this fix effectively
addresses the deadlock risk without introducing unintended side effects
to other components.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs to extract
function pairs that can be concurrently executed, and then analyzes the
instructions in the paired functions to identify possible concurrency bugs
including data races and atomicity violations.

Fixes: b1f01e48df5a ("dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index d5ddb4e30e71..656354bccb44 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -423,11 +423,14 @@ static struct virt_dma_desc *mtk_cqdma_find_active_desc(struct dma_chan *c,
 	unsigned long flags;
 
 	spin_lock_irqsave(&cvc->pc->lock, flags);
+	spin_lock_irqsave(&cvc->vc.lock, flags);
 	list_for_each_entry(vd, &cvc->pc->queue, node)
 		if (vd->tx.cookie == cookie) {
+			spin_unlock_irqrestore(&cvc->vc.lock, flags);
 			spin_unlock_irqrestore(&cvc->pc->lock, flags);
 			return vd;
 		}
+	spin_unlock_irqrestore(&cvc->vc.lock, flags);
 	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	list_for_each_entry(vd, &cvc->vc.desc_issued, node)
@@ -452,9 +455,7 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 	if (ret == DMA_COMPLETE || !txstate)
 		return ret;
 
-	spin_lock_irqsave(&cvc->vc.lock, flags);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
 
 	if (vd) {
 		cvd = to_cqdma_vdesc(vd);
-- 
2.34.1


