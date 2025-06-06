Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D346C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QKV+4ax/i9KS9PUFjbXXlSMf8xi5c4xdtzVPWafiCz4=; b=3l200NMaTFFMnnfFZoKnTtGRY5
	94OngCgSgLziIqUIW1iWIowJpxct0zR6Wm9GS5OKQG+U7TG06Y4eyTjG+Q+Fwdp6TQAW6MVylBCt9
	QQhOH0gzctTOz+oOz3OIPL8R1W8COLQsXlkuCQH2FeD86BMLfmEk7K9+OpemGXGSNLVWHgyRexpYL
	Q836dM3CxGS0jTmdP5Qu4eNf/kAkHSjgyIm0Ql/f1M/3ILF96NSRrmQLMZ57CoMrDcVHc9u1P64Ci
	XKX363mP4rVcFGBRRuhWKLGZyzqjKhxP6UC5KoKjOWOpM01OBlij+4WxnKeXT9MrHrhos6HBAbmnm
	P01ev9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRMh-0000000HIFD-2ESJ;
	Fri, 06 Jun 2025 07:19:47 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRKW-0000000HI6A-0cop;
	Fri, 06 Jun 2025 07:17:33 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-231e8553248so18567435ad.1;
        Fri, 06 Jun 2025 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749194250; x=1749799050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QKV+4ax/i9KS9PUFjbXXlSMf8xi5c4xdtzVPWafiCz4=;
        b=j6E3n++eWVGmj7rkOlRGlP6Q7QdGedvGTXvYDjf5/HMEszqqvcpD/v0WYg6Od2l3po
         5dmhUhojfyFXhNeEiJM0ERElmhejxDcpHDn1SlNv/xn8/kR2tJTFiQk+r7x3gHj55tiw
         x9bqINwyShz6rSZxzrVQ2VXrjmUHw/X1XJx8JSU5D+2uQ66V6PDiNBkfl2zDY6CPRWmO
         X7beIHdB5qwFmYcpAkJWAWKQ0FpPbCEahazq55gGrlqDrFOij5+f8kKVbxHne8PvCxrS
         5zU22nY3O0O6Y7jyu4ftWDWtHM/tz6Jo/U0oi4PAQufUw0XzCee8YES7HQ1bQjSjV9/3
         VrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194250; x=1749799050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKV+4ax/i9KS9PUFjbXXlSMf8xi5c4xdtzVPWafiCz4=;
        b=A0pvthCvuw4kCbHZ2Y36oeL9rL+/dj1XE+eVf9DaLMT973Q36wXzXMMB//k2cwMJ/P
         7GgTYAT/dNi7g/Ep6MfaUzubkRoka5n+0D23NIwLqmwtu8Dxvk11jNXnG5aWAXXT/OfR
         1ZURdLY6Qun2NIPexmKmAG8dXLJ3R/Ghisq6iMoyuBeWRCLLpCJjUbXt7XddPzfI6yaC
         L6Xg1If6h7r3B+dllMBXrSZQa0r3XhW9fawk1i3Ql3+SBxG9SQvSX5gBfq6EkhTI9RDC
         RQ/4mPT0H9jZFrUn2EOxedvlP0LpurWjz+uzoRVZnthwJ79hB8MZto71DSLnsQUhZJX9
         ibwA==
X-Forwarded-Encrypted: i=1; AJvYcCXCMcIOaUIVJOwFY4moXQW7qkgx1UZ3UukPVh7roIDdJnBGX9ai4/PMPkm0aIU8mjwUrPfjLw70awQMEAxqhvQ=@lists.infradead.org, AJvYcCXv+ZOjSYGuR6hmAHlxkxQMosxUnXiHU+6iP1bcXoiiPg0bRmqppWFmVXfyMdvb987OYdT/lUzcRmvgBt3/1lOf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw+mJXHC93UXJ3d2tsw20XmS23IFuHGEI5jWBoqGy5lgHcAx1F
	NJP2s/xWNGLP0K5iIENQN//1lDJUKDu3RICLD1YlCZu7c/JDTXQKwHSB
X-Gm-Gg: ASbGncvdvtC5ERV/hzvmvL8ePIStItzHnOegnLOl50pgZRJOs+0pVZVqpZdA1lTOs2r
	uUl8/erALnhRVxbCk3jvI8A9Gmyq1PHmliDmhp2XPaqUiiEeAD6zn2ABgef0PybpYi0aVJtlEmy
	zPejH8PG5TmVMtPxfcJ+KLo2MS4b1oLN+Oxf29o3E7+myXm3MOHj3JdulQ0bbNra7vT9x5mJBRy
	NHCIfKUQT1QMwioePrt3Ntk2mx2UJEW6splJL9LvMzN6JsVlI/ZBowDyR+i+SaxPfkDL0Mo+X5s
	YkMkoqY6/io1u7eqDz7Q3S1H3+5oo3JpuEzfX3taFJE1KjRH4KD2/5xyLAVAzV7In1BzgTKt3ul
	hgUyU
X-Google-Smtp-Source: AGHT+IGNo3qVc1h80cdtsdbqFE6SC5h8TPFPCwUyuDcI25fbiI6mtb5/kXy0fdjUUtBwCDDEu4pmyA==
X-Received: by 2002:a17:903:230b:b0:234:ef42:5d48 with SMTP id d9443c01a7336-23601d82cf8mr34434925ad.38.1749194250516;
        Fri, 06 Jun 2025 00:17:30 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([124.127.236.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff216sm6482015ad.111.2025.06.06.00.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 00:17:30 -0700 (PDT)
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
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
Date: Fri,  6 Jun 2025 15:17:09 +0800
Message-Id: <20250606071709.4738-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_001732_186492_8DBC9E51 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.

Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 47c8adfdc155..f7b870d2ca90 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -441,18 +441,19 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 	struct mtk_cqdma_vdesc *cvd;
 	struct virt_dma_desc *vd;
 	enum dma_status ret;
-	unsigned long flags;
+	unsigned long pc_flags;
+	unsigned long vc_flags;
 	size_t bytes = 0;
 
 	ret = dma_cookie_status(c, cookie, txstate);
 	if (ret == DMA_COMPLETE || !txstate)
 		return ret;
 
-	spin_lock_irqsave(&cvc->pc->lock, flags);
-	spin_lock_irqsave(&cvc->vc.lock, flags);
+	spin_lock_irqsave(&cvc->pc->lock, pc_flags);
+	spin_lock_irqsave(&cvc->vc.lock, vc_flags);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
-	spin_unlock_irqrestore(&cvc->pc->lock, flags);
+	spin_unlock_irqrestore(&cvc->vc.lock, vc_flags);
+	spin_unlock_irqrestore(&cvc->pc->lock, pc_flags);
 
 	if (vd) {
 		cvd = to_cqdma_vdesc(vd);
-- 
2.34.1


