Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6356F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vOjUllBM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gNWY5lEJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HwgBQHP7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=; b=vOjUllBM8SG6MI
	dNlca2eIKrYnQKMjxKcTPC0TqwZcm3pYxLuzkfLJ/wbL5l4cavXFOXkwfN9dGXPdbCS1pcpvjiaZW
	V1cqcu2iUPigeC9K/51YYzokQsTFFvlwO6ZNJx6vZs2oqlIMYeUJlph4JTzk5V9y9VafNjXs7y3Et
	6G8yIgrCD3UfHi35glhNSWK1SUA1+Wz2Rw5yzVlc6tYE57UgtqcJRUIxFomJjkn2v2XrMNhX78tqJ
	XFpl4DpoD0o1hZEbdDrPD/pnuqN1jbGwsGLaMkJz0EEA7uhpUX+ppcVWqlERnBvIwzAaF87NNKD4P
	ub6wR5t8D8GzYi04oFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqe-0000000HBZY-0Os9;
	Fri, 23 Oct 2026 23:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqZ-0000000HBU7-09Ge
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 23:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=; b=gNWY5lEJPUuoqkvNonX0eG6/5F
	ZIIs+xgLflx0mJP33w0jLwJMYxY15v0e+avB1SZJpXgghXLDiqhPikky28Eo6UYcDbXTFbItwfylQ
	B1pAaQOnX+43Pp1a8Pqj4LOWcl2t0nNByqemV00WjWvaQ5Ap1jtP/rmDPOMkrNeUKCbEAgw98rQOZ
	FaRc0cCsTwzC/fkCddfhkb+tCQE5OX68ipD+t0AYRXjNRgnbdxrBtwwxLAXXrdRo9tW0uyycvs2WL
	VO5saGqTkaZtzHynN3BLyx4787ojKnqCVY5mmKzjpZWyudhHFHO3BU6feskBssNwmTZ523fgkF10R
	GsUXqu7A==;
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqW-0000000Apip-1FSn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:49 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-4a75171af39so512256fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798726; x=1793403526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=HwgBQHP7fY08TeEyBP53g64qB26RwKHkkiWiN94C71nP8KJiGU6JLw1F7Rpk6dh+NV
         SX+TubaDRpPjyQwjACFcLg+IrCqeFgWYqlVQqPsbm6FvzmxfUhTYfSPM+GFTKzMatGt1
         rkg5b7pLnUiRE+9V2Brhi8SLbCmBQPH+tYQE6LXNU+mxtPhoCxdY2vS4rEltOASZFYLJ
         IBwZ2bmy+02wdi6ChJPs4ZistbrxIG9kyLJRgZl88pfgmmlpT87Gz/cWn2tSwdJxTb+P
         9EDknZ+4002ReoDUG7XLm7K5nqUPeG32N8apUfZU+dDbNaBm6bm6YzQlC4q1Ck/O8Ihw
         m1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798726; x=1793403526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=YcqGTKOIReceRTM9b0LbH59Ei5PgUcmb3Aje0gzLieup14pO5Y3t5Y3+cknGo11Uw4
         23WqQt90b48TAKjaKnqI4pM3VSjMs7YpgiUWlKpNMzwY4zarLiucvxK88EHJnLgs5CBC
         aLveDs++cahHwdXehowL20D34bQBbBsDfmzD7sOvENqJ91z4sSE4QJqMbislJ03clgQS
         p8mY1lzsR9vpwtFoOVwaYhH1KihrtzALCcPJVR+8AaNGxEKeuloCC+OMSG2/F4c3UVqX
         PieHtixo4IP8sLkbBwihON+qxu24lVvG3mC+F7IuwSwDEw3k2+kAHtSYlO2U7BN9To57
         jGaQ==
X-Forwarded-Encrypted: i=1; AKwUvByQtB8Z8X7dqxEj8K8EDFLD3VPSDjJ2XR+LHSzIMqoNoX7eKrsqYgNxVXRpk23fB5B07j4pIyf62g4a3+rhiZvc@lists.infradead.org
X-Gm-Message-State: AFq9FYIj+XQsoq4e054avfkECH+PEvZCOza76BY+Px8lpy0cGXKG00Ph
	jjlmqPT14d2YDqos9UXWhugnKm7jhuO1Yw1Sq84SRF89eYRDn42ouurW
X-Gm-Gg: AYBFou0nW/fI5nZUd8UOIu4rMaB00PDqVepvCh+SkXmPUkxwMUYWvho2ki8Bf0aOd10
	57+EAXO4jBMDBwaMl0XLxCsKh/4xl8QbeQPCYobCB+7U0UZmhyiPUlIReU+OBr6IwSrLL2Baw8j
	KDC95i8n/+FDJc+pjQNPOCP7JER4tyTAKBou5N5yw4RCy2MNDsDlMipfXh/nqPIVmj2boi3e0tw
	YiKhNPKlCCG11hF9GHBIsBNH2S66slVjsV9TXiNYvCdnb/66yV0i9eV9ljXKOEVK9le/nN3a3FP
	iQAXqiMSEbRzD+AEUgS+zuaEW0FdGWtpwsvn8ORreYuNBF5HXY7ygitOjx35vI/sIL0LiR4Ga9z
	zK3BTVYQzHksR33V8CJq4IovuhkYwLxzXbRYVioMRnHTcJUWSs+Hh8SoRVD45Y7mA/V28toE4px
	cR+Q4CbH0V7yUt+tVmss7XD8CJJdCXgpx+fiVbJrT/qsYFP4i8+Kt2BMMcvDdChaUqYYH9taxoz
	NhG5aEFUne2LUgSB6tILK6Txbrp1X8gONhzNCK5DeW2yZEv2JcOUDZ9I76WZ3aRku2tFs6PS5SQ
	eQzPVAnLGj5VRPARk+wLYNrAZJpxu0z3ZJ3fOBRu/oOTm4y24w2nDKUQMA3dxb+g7fdleTxu7vq
	oquRGt8HZntGaOquSn1qsUbQX4SOXhRXBKQCIcZwsw0TSlNWhQ/2v1oyIQp29HgblbJbcynZvYA
	8VWtI=
X-Received: by 2002:a05:6870:8322:b0:4a7:5eb7:ab9c with SMTP id 586e51a60fabf-4a83f58e567mr601234fac.28.1792798725802;
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:28 -0600
Subject: [PATCH v3 9/9] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-9-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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
X-CRM114-CacheID: sfid-20261024_003848_456448_56FEA99B 
X-CRM114-Status: GOOD (  16.04  )
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
index b83138745bd1..2152979f72f2 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -507,7 +507,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -610,7 +610,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -911,7 +911,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1000,13 +1000,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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


