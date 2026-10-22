Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Klyv19rf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Qs/wGq65;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU6Mx4VM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=; b=Klyv19rfFqvHgYA8NcqPf5Plp7
	thFh22fRfu5ZIvfx12wnze7XdvdS1qDOTZEs1SdvkClr68sCxj2hVMSlTntoeihg3tijgxQ3WtHWe
	CwjaJ7sGjOVHIOJX2Goe/g2Um3mPHxC92RBnOTU6dqlR2luKTNWqxwJ2KPyQED2JxIaIEZzlUqrPX
	fvrJI+2ejGyKlPfDWBUgy6IcanTs+s8lgW+61ZF4Dqo1Wyco9GLNnzsw1q2ZJhEFx3zTWSu4Np43O
	NpflEie6dRXHJPtr88kOggO6GCiYfEmPuM8V6gxaAlMBxwCtBI7AUuTMGSFWKh8IaMDTREBQ3DS1u
	bM9iVGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyew-0000000Eqky-1ElI;
	Thu, 22 Oct 2026 19:41:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyeu-0000000Eqk8-4A6S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 19:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=; b=Qs/wGq65pdxthwpH188/xzOhSJ
	Fbob8LXu6X8OYM32G+dXZuTCqIT07A1VIFCw7RmnRg9gLUAS4spKYyzUMQgLUqjmNSZDzj6Pkv5pZ
	4eN3tGjTEAXUOrwDKz3dcqOl6dMU1OO5gSzAQAKiBiZbVJ6lqBwZV6Q0bL626hIgDj3kIJD7j55Tj
	arRROoFKMeLTDIV/Bv1P2TNU4QfdTZ9YTumZcQXmOumUx5iqG+DZN8Ueue93TnFxkCceVilNNrwSu
	MEQ1Tn017ot6aZEk95knjysUJztazxtmokouQ84ilEBerkCOr7dE2khJA43zdfkLPSW5Y4bMoI4Ah
	0bMy2U+A==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyer-00000007rll-2Lmv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:41:03 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso120660eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698059; x=1793302859; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=gU6Mx4VMKhfqBd3kwa/3dftGMUZT/UyMrX3jpMoIqi6+3iwXToxc4v4G1d7JHXS4L5
         8vtLNE6LtKVQyPdZaMgt6JpFvjt1VlH3EIAKOf3CeXCikpuOaJDsfGOocbZWrcMx3Yyu
         AQmjg5t20NZ9JfIP0FindMqA9XQ4415s4XIiyL5NvC5vDZAKJdNcfKqZHErOI57lc2CY
         YwpGEC1VXTF9XOi0A5Xj33uUPqAiRXOHvgqHoLUn13VtXuRk6cntE1tQDOAXTUDDDmdr
         G8Q+m6Dq9R2Z7lY71MgxdrSkF6b1DarQ+LJTnoGK3Ipfr1Fp83axz92BKp+7r0/OsPVQ
         Gx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698059; x=1793302859;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=g815Hi9P6po6qHZJloEhuhzaPwa0hur8BDAFzYNfZDk31388LaOyYupw35UReJPtJ4
         eLI+u7Zbx4EKPpRMdOCObpoOTAYe2SGOWagpy7JpZhHPDlwhGByfuIE8bEYCAyzYT/yS
         HMXHioQMi334rdmn7LJZXSVKAoL42jMM6wqRgNAHTxo5DL2TnwLcpm9RpTpZuGgw+Z8M
         4bIAuV02MER985ibz11BjhY4LRp1k2RbSbzbbl7kvFLiLvchPojO1l8nAfcWHfDgcNjS
         vn+tLmVnEoY61WzvbLOUB5nAFwg2EN7Hp+BX8z++JI9WM8HBlhkoYyl5kfBZS5ISEzeQ
         Enyg==
X-Forwarded-Encrypted: i=1; AKwUvBxr7PUAEdv2N0K01Is94FahbDjcBd1ndiDgd3wXSRUfFqqCjTxuTOaDgCDTQyx4J78AdDmmNjpgD7EJHHwk2xQf@lists.infradead.org
X-Gm-Message-State: AFq9FYJQ4VnXat/x1B76IHzzxA3lOxGiBDTFl28tQ6hPIxIB7VRgqMYB
	AJ3g9RTJ5+jg2Jydx/qxv3YLNCX/bNFhmMe4VSkxOf1OoOgUGUvNZAkW
X-Gm-Gg: AYBFou05DIoI7kxm8O/axklcVv5d5Tv+h0d7lYRoALXNgnQb4DnDtwjtkajPco7reAU
	bem4IXZ4ihKrYpNUwrj5vVPHRW9hxz0PS9MtftZEapWdOwifkmt5vzbp8mGl7wdgfqgOO1skszY
	G0/hc2+xGSzBsrLxBTEdnUJ6r+R3BINct9bd18cs1+4/CZx2D1ESYjz0ae6JTNenjMrGZQzxeJ+
	r/s0Jwda7qMyeN2C1oFrEASSu8DrUuNOzAEAN83VSz0GtfOfMlSq1H0KH3wtcd8QNXp3oNoTbh4
	DMUGhbMxImFcqKRecer4KZcKOxddERAyrT9ynvMB7T97HBqpb/BPwW0xefpEZ+MSAaAoIhGebk4
	Xgjxv69R3hcVsI7QHJwvbuh1EyjokY68QV6Yr8sMefG//0UE5D5boxEdCMdJ/l7Uhwyk2Uq3LGP
	bQ8+0m/u3T25jhT+wk+gmlwv2OxOwgCYzxW7Z3vLoLYo33lDlK8B/IEJnG1pUl9uJhFx03I4toh
	4q+IK/pdR9QNzWJKMXHCveLhCRC8KZXyEjiQqIZEO/hyFw9aYaqL1sCwBCRH2X97np9FqlN/E7u
	BMu/Hbx3SLJbLqKh5epY8lXGoPW/KvRRf1iFMG4Xue9LpYGJvpM1WlwHULiLDOO+ZUY4L7aWyle
	S56uOpLxmaGbHASCx/M24XpD5o/OQDRuERkOLubi0lG+LZ6RpcM+S/tx9cWG9I3Bti60BqZZFJ5
	Xyhw5nRzfn7x/o8krTkVYMs9ww
X-Received: by 2002:a05:6820:6784:b0:709:8fcf:6d9a with SMTP id 006d021491bc7-70b88aefe41mr234594eaf.78.1792698058797;
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b8b2c4561sm42639eaf.9.2026.10.22.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:40:54 -0600
Subject: [PATCH v2] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBCFr2K6dpTyI8SV9zAsShlg1LamLUQk3
 N0WTuDyTd775luYQ0vo2PWwMIsTOTI6hPR4YHIQukegNmSWJumFJykHNzaKPCj/hFFYD60S4GY
 tB2s0fREmDryoZJUlWVOUOQugt8WOPtuTe73nQHmg9JEcG41wCI0VARNPgYm6J43nfRcaAzlv7
 Lx5TjyS/lKKVpB3Zckr2WGX81uvBL1O0ihWr+v6A72DrsYIAQAA
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.li@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204101_966647_89A5A913 
X-CRM114-Status: GOOD (  13.76  )
X-Spam-Score: 0.1 (/)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Add vchan_dma_synchronize() with the DMAengine callback signature and
use it for UART APDMA. The shared helper wraps vchan_synchronize() so
drivers can assign it directly to device_synchronize. Document that the
termination path must have stopped the channel and prevented new
callbacks before using it.

This lets clients finish asynchronous cancellation before reusing
callback state or freeing DMA buffers. Keep the callback wait out of
device_terminate_all so it can be performed without locks acquired by
the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
---
 drivers/dma/mediatek/mtk-uart-apdma.c |  1 +
 drivers/dma/virt-dma.h                | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..f1fc3bf48275 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -234,4 +234,19 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	vchan_dma_desc_free_list(vc, &head);
 }
 
+/**
+ * vchan_dma_synchronize - DMAengine callback to synchronize a virtual channel
+ * @chan: DMA channel to synchronize
+ *
+ * Use as device_synchronize when device_terminate_all has stopped the channel
+ * and prevented new callbacks from being scheduled. This waits for callbacks
+ * and frees terminated descriptors through vchan_synchronize().
+ *
+ * Context: non-atomic context, with no locks held that callbacks need.
+ */
+static inline void vchan_dma_synchronize(struct dma_chan *chan)
+{
+	vchan_synchronize(to_virt_chan(chan));
+}
+
 #endif

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


