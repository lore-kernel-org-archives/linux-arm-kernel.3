Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48976606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LhO/KqOo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SiGFTdaA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ajRh/8q3xGrAtR9/oKjXRIyuCbzBYMEpU+B4J/2GtKQ=; b=LhO/KqOo4q6HU7
	O8jV+AlvR1qX9fZDjtprQBzSi9nI9kIoZXV0C4SwopbbWa+Kbg+2SyRIRg6GV3ASuDypzsbbJFC0/
	TFDeUxQZeSnVtCQ5uW5DGZnv1xtUEwl7nNuWsF530s3LLtOGTLvqK6+m1Cy5+SnmkDoB7AsItIKEN
	FUwB3N9xXc8BsmjLIRA3Iun/lSM/KN0ZGEEmepaCFT7TtmIQNrhuhseqdp345SfjJ4X9kgVOq3Q9E
	k9nPd+/LUra8YZSao7vOuwae5IebwasVhKnb+XSi5sJQKSRoLPzXPLlmqUTFg85PLaGs9wxsokXon
	wTGloU6pz6oMPWIJeFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE9-0000000GnVr-2HRC;
	Fri, 23 Oct 2026 18:42:53 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE3-0000000GnSD-3sdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:49 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-55651e7de9bso670562b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780967; x=1793385767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajRh/8q3xGrAtR9/oKjXRIyuCbzBYMEpU+B4J/2GtKQ=;
        b=SiGFTdaAT4rD5E/g1pSMycoVh66vsoQR2p5AQvaK5CQncYCz0n2R4EkIsXnWKLLbG0
         FCPF9/K8C1ifd8Ao5sWuzOrQaXzsWZQ568F7h2vpqwdzGaTdZBfUy94nq84Z0VLLsu3e
         Y+zRjrgaKdNhgEkOs7A6fszgBUEeWw4vrAj/9DijHMp2E0A9N1L8eLO64hpnEoQr4/gW
         vC9mg770s1bTL3I8GidLujONPPk0hNHwlxzk79C0X0kagfH5VcTlF04SwHghmGx0xNpg
         6gDpcE9arrD5juUSRcYg0L9k7yMFWsCdpcD9NF7GN1P0VQplJwnAbWO+6639283gyhGH
         Y+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780967; x=1793385767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajRh/8q3xGrAtR9/oKjXRIyuCbzBYMEpU+B4J/2GtKQ=;
        b=qBjLnC9tPsoW4JpIIgYHO6Yy6iGGuQB8QzNA25Ougym+rKp0rd56KFuPZd0AkPxM9T
         6XvEUHCPYZ5oqfE+9rokrFzIM8AYN+VITkCt3Ia2FtE3rDFg007ZhrziNO/AZtHNuo4j
         Nb15QU/ki9yflCjGWftcaF+otYl4EH2GgNlG6oJZNEYwtGdMoz12cxwnZUQ2AXknjpkh
         qOUv5W/6goAlChOy50AMHCXHRYp4aC1wnUikDuujTRp1yj3Uxzet4fVRDiowkFf116aN
         l1ESfYoJWYE77hyV3WuqYITHcZ6CWh13qd9mRU6adVhyGa4n7aeONkA8ztJWZmTbJLLY
         1keQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZhUaKfMHCv0yiisHyA3u0One/Uszjs4PktiGdvpdy4+ANkVDgrlXECkqw30s0BlmUUavxmTP0ugibNBKXv/Ms@lists.infradead.org
X-Gm-Message-State: AFq9FYKlwQ3BeXwhOGFwdQRYUeOTjUhUxoU0XbgFlEhgYCGvD+UUm2/e
	r30JBz+fdDTE7+3KNIorn4MuZs54nvcyvH4mtdoObDI8dixAuFDQwKK0
X-Gm-Gg: AYBFou2VnFG0+eJgT3rnMHXJyZEvxzBGwITolw/JtlfJJ9NeFoOLXH+IRxljgvk5OaY
	XUrkeOBIMtunqV0OXkjmLsy1eJzn7TChRGu32lKTSbC0mJqx6Y59WAbtpWPtu0FDKDW8pzzjNNt
	qXB72fmG8SO4PFy/0GkqpPehyTrcEyFxfxTqnqb1dSCDUi5r2ZAvZCOk2uWAbgC7npJVvLuBxQK
	0c7B2O5GFE52fiNf54gNnRAlMV9S8XKDXeOA699EUGWRCtoY6jpNbJg0oaNGnoAzV7hblTmB3zE
	ejPZT/8eW1bq+c9su3DdkB2CeVbw179SyFQG9+Vi/fFBD6LtMlxpkLMnE+yFTl3eLBP7SnkuEsv
	OT4DjvbU4Xf6XjpoU8jSfNx3cQ9BOpyXBvrtxQll7wVEJmN+u3Mi66HJhaRxt6S52+KpILw3Lw/
	FOTOcBbp9T1Jxj/6P8/subUcddCEzsc/Az3P6gH9xpKztDDt4532QANRktx8m/O7kK6GUMgZK8q
	0xgrD/bDvoIpZlY5uxv5rpxb71MwFIk5gzUe78r0Sy/LgAZxU8VA3shSjPzUQlOiCmc5RcCZCoy
	bGpW1sgf3Ict/liVDoB6lBQYfS/rWBPLDmlXlxOMYCZRUhVyAfN2r+5zw4UJOPMG1UJSojbee9b
	dXk8/su8a4TsrOJbQpW/I862NsC9//tn8G+qQpeKoRHT7nSZSBRv+Z92aeKYARlK+aFrhGPMkyN
	6Ss9Ga0Q283VdVwDab5MvcFiKB
X-Received: by 2002:a05:6808:198d:b0:4f3:68d6:f0dd with SMTP id 5614622812f47-55c002f88b2mr60849b6e.38.1792780966700;
        Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:37 -0600
Subject: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_114248_030887_6C80DF6B 
X-CRM114-Status: GOOD (  23.45  )
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

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an owner snapshot without protecting it. Termination
can therefore miss a new assignment or detach an owner while an interrupt
is about to complete its descriptor. An IRQ status snapshot can survive
reassignment and be applied to the next transfer.

Use sdev->lock for physical-channel ownership, pending channels and the
shared interrupt registers, nesting vc.lock inside it for descriptor
lists and cookie updates. Allocate and start each pending channel in one
critical section. Read and acknowledge IRQ status under the same outer
lock, and protect cyclic notifications as well as ordinary completions.

Clear the active descriptor pointer before publishing finite completion
to virt-dma, whose tasklet may free it independently of the allocator.
An assigned channel without an active descriptor is ready for the
allocator to start its next transfer or release it. This replaces the
completed-descriptor pointer and keeps residue queries and termination
from consulting a descriptor already handed to virt-dma.

Mask and clear a stopped channel's IRQs before releasing its ownership,
and clear pending status before starting a new descriptor. Schedule the
allocator after termination so other pending channels can use the released
physical channel without depending on another device interrupt.

This also keeps process-context acquisitions IRQ-safe. Client callbacks
remain outside these locks in the virtual-channel completion tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 124 ++++++++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 58 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0a9645171180..a21acb9ecc27 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -217,6 +216,7 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/* Channel assignment and register access; nests outside vc.lock. */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -486,22 +486,23 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -524,15 +525,15 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
-	unsigned int pchan_alloc = 0;
 	unsigned int pchan_idx;
 
+	spin_lock_irq(&sdev->lock);
 	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
-		spin_lock_irq(&vchan->vc.lock);
+		spin_lock(&vchan->vc.lock);
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -545,10 +546,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +557,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		vchan = list_first_entry(&sdev->pending,
 					 struct sun6i_vchan, node);
+		spin_lock(&vchan->vc.lock);
 
 		/* Remove from pending channels */
 		list_del_init(&vchan->node);
-		pchan_alloc |= BIT(pchan_idx);
 
 		/* Mark this channel allocated */
 		pchan->vchan = vchan;
 		vchan->phy = pchan;
 		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
 			pchan->idx, &vchan->vc);
+		sun6i_dma_start_desc(vchan);
+		spin_unlock(&vchan->vc.lock);
 	}
 	spin_unlock_irq(&sdev->lock);
-
-	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
-		if (!(pchan_alloc & BIT(pchan_idx)))
-			continue;
-
-		pchan = sdev->pchans + pchan_idx;
-		vchan = pchan->vchan;
-		if (vchan) {
-			spin_lock_irq(&vchan->vc.lock);
-			sun6i_dma_start_desc(vchan);
-			spin_unlock_irq(&vchan->vc.lock);
-		}
-	}
 }
 
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
@@ -590,9 +579,12 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
+	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
+	spin_lock_irqsave(&sdev->lock, flags);
 	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
@@ -607,15 +599,17 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
+				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					spin_lock(&vchan->vc.lock);
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
-					spin_unlock(&vchan->vc.lock);
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
+				spin_unlock(&vchan->vc.lock);
 			}
 
 			status = status >> DMA_IRQ_CHAN_WIDTH;
@@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -952,23 +948,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -977,17 +974,17 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
-
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -1000,15 +997,25 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
 		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
 
+		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
+			    DMA_IRQ_CHAN_WIDTH;
+		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
+		sun6i_write_irq_en(sdev, irq_reg,
+				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
+		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
+
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }
@@ -1017,8 +1024,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 					   dma_cookie_t cookie,
 					   struct dma_tx_state *state)
 {
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
 	struct sun6i_desc *txd;
@@ -1026,11 +1034,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	unsigned long flags;
 	size_t bytes = 0;
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
 	if (ret == DMA_COMPLETE || !state)
-		return ret;
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+		goto out;
+	pchan = vchan->phy;
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
 	txd = to_sun6i_desc(&vd->tx);
@@ -1044,9 +1053,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 		bytes = sun6i_get_chan_size(pchan);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
-
 	dma_set_residue(state, bytes);
+out:
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -1057,25 +1067,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0


