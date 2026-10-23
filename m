Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF55606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x7QvudG1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jt4tN441
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=; b=x7QvudG1Wxshve
	cBe4+sdCb5v5zyGfkuPvPekFIBHMUOwizTJcUP8j7v+3KUo1LMdgocjx53nP7H8VmF5p5FSA0rVev
	ufeXT2jxMxuEyhCRBDp8oMfFjN5KC+kSSsX1jhsRZZ+psnbYHk5ueEz+afVSklDTdC2l1zK6qs1+c
	BHGrVrCcUgZ4GHaQaDEJnkHv1XD/zy0Q2/3sJAXpP1FLrAzUrC6iQyum/BXx/04rueL6X3iUV80D1
	gFu74FKMhFQ2kfke5+53wp0fnaQqPZdLzzYcG0GY19NMYO/whuNU+bzr83WAmc7BEoRqWn2dDBYPE
	F6yNlkmDw6EpEsKDN21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kc-0000000FNZI-1BeP;
	Fri, 23 Oct 2026 03:15:26 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kJ-0000000FNKw-2pfZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 03:15:08 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8446af403b5so281138a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 20:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725306; x=1793330106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=jt4tN441lEe9/njDz5Q5OYZPEiajYU7Fl50Hhl5Fi+OYT/I9ArHRyNmg78CAe5jy4r
         sPavt08fTZeXg4UzLU9J8zAjMdt0HS/FE2dDX4hOCP/TceAwEchv5u5ruxXFpJUIqI0R
         UsP5xd+OxeokHFtM1uUkCrASCRHLn9HTQTlLSrRkvyHKuAsLa0QtYuVM5Oz85lQbftpe
         MbcR0jZNHyxMWs34pKdihpRArLQAqR12aYUubKzcjlEuVyVQTDx9Nt4Bo9F2ZS6QTH7Z
         ZajPlBCTbMNETA4mvnqeIq6sfUkZuhcXwDgZ4SoJv96y5e02xQ/GicVOu0qXC9GcR/eG
         5oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725306; x=1793330106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=XizwABm/564sr9aa2L3vhG9YgvyJPNtwsGJcYYHytfIUytpFAqPwMfvqw6JGuhKBNc
         FaeQ+tfjceDgwCN5f1plWvBbTXkNK7eFPlFU7wFLdMZ7CsAnUKwsgQ/IxTDO5edirJGA
         Ib7Gho1xs8Ti3Q8Y9eFZUWNwD5Qdj144AG7CFAVW4Hqe3lSvamd/joa/CklG2sALQ3Kp
         hvNP1d+SiwxdldomfOXp8blkyVkVlM92yJN3JdiVWd7u6Q3rza0B8CsBuRS1orGPFg0Y
         DGKFywvNNo7poyAYQ/xH0yCqvLyGmCqZQUaKK75lAnJ+IDY2gfdf9vg6WhhhsPJ99CSm
         Eshw==
X-Forwarded-Encrypted: i=1; AKwUvByHHu5WJdC3147T/A66lCzt3AcPJGF22ZegERMqcu+hCixmZ4G6Y9M1JkEnSWIR/y2LUdLs6fj2tBqyrwu72Cyr@lists.infradead.org
X-Gm-Message-State: AFq9FYKm8xkW3zcA2K4adVhTir3LCnpUge6T6rzV6AVRm9peLJNRm9jb
	HaPjpNMcUWPcqZwqlPfdv2c15CFiUc1ws7qncnTN2qVdP3OhfpSMt2jl
X-Gm-Gg: AYBFou1ZGEPgTpU7n94HwJGHABDqW/f2tz2MMO2Hk4A/4ljLZQclC31QayP1Oe7Wrx1
	F03jKDydn62VPcXqdGaNItDrAhTJuzDinKWSXk5FDXHsFvLhKInpVaXNSaCow5QC6AYLo0JGvIR
	OgtkcsDubpDtv8mUFdLzdIun8HNL8GsWChjbjfHNGuPT38AvBP2gshaT3B9iELd/tf70e7cSqMe
	13n1O67uWVLbS4ht5rqHlbdcPdfU4vnVo4NF8NL9yCtsPAv5S886IoyhQDruovZ2pZU1nnhobdd
	aY1+ITVo0YiJCoTewV2xD+XWH02Xg7z6on5VZCObwdOCoLKEgQJeYNy8M9eCp+LV60RtNEA6CIs
	aYxnmkcKFByUvD6RpZqFEsqLn1SYdM7FIVRV14W3DZBq7w/btTtnb6/TPskfluH46rfrP8MU+dG
	ckeA/kjnNophNH+uC1y614LGQfvXKLlxf+HU48J9sZbXcIZOnK5IN28qvxE4jBK01kYeAKv4wbS
	PV6J94T8v/ZpaYIGNDieBXvLr3ej8qrnS65/BNtPibKsbYLbF344A7ZL9IguxGTVHzNYkXmTCjC
	gBvQ9VO+ZzQBnwoI+WfN+AelOpdO+hYGBbsKIhNSPsyGxGwxuVC6ebvQU3WqCMwL9I544ZuT/Cx
	3aY8H/j/U48UW4Smy25L99qX2undicO3x95cPiaSHA2mJgZsqqq9J/yqWSGphXjY4TcqwF+HvDU
	XbRS2L
X-Received: by 2002:a05:6830:640c:b0:829:2866:3106 with SMTP id 46e09a7af769-84fb2712b6cmr633959a34.21.1792725306519;
        Thu, 22 Oct 2026 20:15:06 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:57 -0600
Subject: [PATCH 6/6] dmaengine: sun6i: keep cyclic state with the prepared
 descriptor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-6-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201507_750072_1AC420B3 
X-CRM114-Status: GOOD (  14.56  )
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

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f807d9386939..5fac3a991314 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -208,7 +209,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -606,7 +606,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (pchan->desc->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
 					vchan_cookie_complete(&pchan->desc->vd);
@@ -906,7 +906,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -995,13 +995,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0


