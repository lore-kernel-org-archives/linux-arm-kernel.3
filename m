Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A62606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DwhuvoUJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KrVh8eEh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=; b=DwhuvoUJQiBTbBPrWuBEeqhqw8
	ffohI7aTMZDGswRZ5zSUkyOplbL7k+8dhwXf/iFdf93h8LyYz5lB1jxB3gpF9VQxhRBp2MIU8q2p9
	SYmfjNkjOJ1yZBSQmQ/Q0rSPPuVNlZ3Bz09/+YZc5U+oBGg6P+4PwdM8csLuETblebT9NYpvRdVXd
	AOtkMP7/eSzsZZBiyz46U9mkpzLBBl4bzhZ1hS7YHpRbGaOB6aFNDbsanqwO1VQEx2BQtwg+umHwK
	cPVK4Yre5eR16nnLmr1CeDY5M3NAZszifdeglboPqn4Z8M4WhMzJcifJ6WEk294fKcHBSnPBNqxyl
	SbftLzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdaz-0000000CuBW-3Voy;
	Wed, 21 Oct 2026 21:11:37 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdax-0000000CuAc-0Qsn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:11:36 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8256106635eso642372a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617094; x=1793221894; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=KrVh8eEhV64dS/t55WHLdjA7/9OVrOe9jiYPkRF2CNM9nfMMBd/F5WWQI53baC9lxM
         hZr6M6+cE7o78Sf7j5+xaeu5yUnIpiPRp16QXcup8CE8RWxkhyizNbiCZr1KLRPBl6JP
         0xaUuLg1FXeOaukqDx2hZwxN4+ZDuXD2GrU0p7AYzfIYpWYzq1ch7Y07MPl0iuEc6z7M
         A8dPWpBB11mSTKfX1SrBSx5lKsqKiP5ZrmHIEEIbGNNj9kXTe3vngLsuMI4wZSX93Mex
         uRIDxnKIrP7WnA7nlxtgNKw9iDlRvgE3THr23cE3gA3jOBEMiZBxSnE+aIWMrpK++BDr
         Zmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617094; x=1793221894;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=qFlXe0XGouAN2cEbnJJiFmk7fy8fkW677RxveBx76ZHKr+Ro/V3QulJz93P/aD3ml5
         CC/oEKgdkW+ZW9ZRoWx+a25ioSYMank18ibgdOTHBQ7+XvHTef7yrExHR9a/81jIHxZh
         UVux1isxg0y3lkP6Fi5QOQYtWHM5QHLUdho7C8ZSb+JU7+XW+hO2JLloX5BX5gBl/iJs
         AZjLyGT4wmjih8lqAIZbj3STw2/gOEvXLf/pFscQ8caf6uaCyJcsLive3/dWZIg3d41V
         NPIOuv0ZoB1ReDiigO9tRob9muKQ0XKwFCy2VOLlBU4F7uHC0gJFVvYMses1D4B1jeAF
         ontw==
X-Forwarded-Encrypted: i=1; AKwUvBxXZdK9HZS7UuTYfE2QYcSrfFLpW36BXfhPDd08sI8baFVehdRJuSFlTxHDH2b7cnnd8RZIiXBxY2s/iF3Wy9nz@lists.infradead.org
X-Gm-Message-State: AFq9FYIbgNp/jOLRLr5f9eb+o7fLnV3g9xf5G607y4GUp61w/U5H6uJ5
	JjCuWWJKpMS8JZuAxXVZdvhUOEP6PAEJFyViutC0fv/W+1YXXcR0+GQV
X-Gm-Gg: AYBFou1mQ+q0cRtBe+zDcEQDA9v+iXshMI5YjMbtroRi6TtOp5sTx7wPoQSzCd5rO7J
	CN/nTasBiCQLXws33MMSSpd11FL8tNLguKxcuGWL27oPVxPF6NvLW0BegjR03JIFzqADfqOPSvJ
	56jiV4NUriJgS+PO5VEEPwzyxi91bmqAdEN4cj7aBuiLyhNjIzE/WrtcjJUKGNyEi9QXRh1r5np
	+heKbEG7SPVJ0zoH8+s+0hKTYJhD2C6e1Wzgc/juld14SetR3AjUQ3KK6F+CKLOAhmp9x6OGjMR
	pu+CzWM8ztwOyTs2NEoBnTN3a2x7lj6GC7at5JEEckgdkdT6hyTanHq2VdLyKEYAQT4qFqbgdCN
	sGk1uiJ48Flbl+N0y1OqLaNni8HzsWT6FEv9h+ID2crRFSzvOvpPl3htiCFdiYVaoqROKqtAAOq
	D8hc7vp2TwP9xzxfzlT99Irr7vfV/0mMDCL1vwwraok+l7Rr2Km0e0MwZ1yX9SvaMz+WC0vNGpN
	1e3pD9ko2f7DmbqlqgeZrBJPgLsiqW3N7/VvyRX19ZTvAVAXXgv7wTx02bpS+bKhOW6pybImJSa
	ciFHvjk/x7fG595+0w0iilSTdj4QjpxlGQq8JO5XOBAJ14+itgjZtheM3V/ygLobuluutSLLo11
	T1/yCrNjdZSUZ7ioxZCuGyr5BwjoMlt1t6cOksloapUN4BZFviHuXgkYA9XC2mZsOQM2SzMkUOI
	Hgb2s=
X-Received: by 2002:a05:6808:1645:b0:4f7:a3f2:d8b4 with SMTP id 5614622812f47-5536055db95mr2302438b6e.65.1792617094073;
        Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b583fd57sm2806628b6e.8.2026.10.21.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:11:29 -0600
Subject: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3Q6CMAyFX4Xs2kY2IlFfxXCxnwrVrJB1EhPCu
 7vJVfOdnPN1U4KJUNS92VTClYRmLqBPjfKT5RGBQmFlWtPr1miQj4uUy+GeIEQLAcUnWvKcIFp
 5w6qhuzjXXbW7dcaqYloSPun7//IYDi6aF/pc1bXhrCC4ZNlPNSpe5JEYz8du33+vDdddqQAAA
 A==
X-Change-ID: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_141135_160713_79D882A5 
X-CRM114-Status: GOOD (  15.26  )
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

Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
chooses the memory zone from the device address mask, rather than accepting
zone-selection flags from the driver. These flags can also reach the pool
metadata allocation and trigger a slab allocator warning, as observed on
H616 when preparing the first UART receive-DMA chain.

Set a 32-bit coherent DMA mask before creating the descriptor pool and
remove GFP_DMA32 from its allocations. The driver does not encode the
extra descriptor-address bits supported by some variants, so descriptor
links must remain below 4 GiB. Keep the streaming mask unchanged for
variants with wider source and destination addresses.

Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical addresses")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..0ef6ed1f936e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 	if (!txd)
 		return NULL;
 
-	v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+	v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 	if (!v_lli) {
 		dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 		goto err_txd_free;
@@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		return NULL;
 
 	for_each_sg(sgl, sg, sg_len, i) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli)
 			goto err_lli_free;
 
@@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		return NULL;
 
 	for (i = 0; i < periods; i++) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli) {
 			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 			goto err_lli_free;
@@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(sdc->rstc);
 	}
 
+	/* This driver uses unextended 32-bit addresses for descriptor links. */
+	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
 	sdc->pool = dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
 				     sizeof(struct sun6i_dma_lli), 4, 0);
 	if (!sdc->pool) {

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


