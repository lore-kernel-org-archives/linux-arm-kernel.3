Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039A7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p78/MDpM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ll4hR4DE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=; b=p78/MDpMXktDro
	Kc+sVV2xJn4uvHjFgZ3Ty+kIysabrDpWkpK5xBrSKLgokIaD2/oVlb32nwNEMJdKzX01z20cpiyBX
	c9JoZhBvzrYV7xIiDBt0pClmL94VzNeVxU6ZcebMSGkl6lBWDz0d6xrSiUIdFXsTS7NJUxo0oxYju
	scFb2FWqrRA8AkVl26ZK1BqJnlM9u/6ypCw5tg1ICn37HYWqbShz7OBuV3JocF/ug2uMc51t3I+qD
	xOMKoPU2RFMoaaJx1zqKLDREV5msajKMXGavcH1sBhiogXJsPAcCKT9g0Vuj1U+ioNDoOJq4nGuNt
	g+/xD1C7tQ+1dDI3WYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqd-0000000HBYc-3FEX;
	Fri, 23 Oct 2026 23:38:55 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqT-0000000HBQC-1h92
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:46 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6deb848ddd7so997920eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798724; x=1793403524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=ll4hR4DEPyEgTl4S0c018aS27itJIVBD4Vtk9o6xHZNRf1w/WTBPnF90nd1yB/gFyU
         DZwXJ25n0J7vP7pVjIXFqMMw+9r+eegbYyIHtYuhDzSVDKf4ZptkagjfnHaJMs1T/0ry
         4a6elQkkJejYUAbeyY1t3OqV6OCIg1iMiWzETYvpVnS3m3qmj6HVjU6F9dNB0Jbxg6pW
         JS7t/iKR2mSZWL/0RF+Zm1t50y2JHvdSxRfiOfCFdgKbju2ihtwDVhKumLcche4YvyQ+
         WiIb1u4ZxJ2cTiZgHjKmC2iVqWEzbkmLldTxZbrNbEpXnXpB5MbY8fK3Q597uQfzoVMA
         Vkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798724; x=1793403524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=Ejig2xtknJgGKLW9xenN+52DghJy/knEmtL22fsUxE1GEbRM+UraRkqmWaiOvm1xuA
         lo1OViUrPNKK4y+O/hoVjwLtx6pX54nTQUHj4zpumG62hb87BfmkhEbgpUBYqCv5u0ne
         88bphDnDd+2l54oP/TYQFW+RayRsMeNe7I7vQgHIW9M28o2LNeysY1SP0vJtaZWBnZG0
         a9bmUCmIEjU0JkQNj7jtj+vajKrjntk6nf5S87xMvBkH/aLDcz0ffIC8qUO0w3s/fq3a
         RVzpUzFP9y8NLi5jJq1Thaio3G2GALMfSvR0vi7/q1RIeWiv11vh1bNDE2G0ex2A2rS+
         jX9A==
X-Forwarded-Encrypted: i=1; AKwUvBwMF5wWvlqpfnqAcv4hV5NRwtHndL0vq/UM0wAq2+YylOljK3RchE9YkS9JA54BodV/yeJoG0jaYrcC7NfR2bly@lists.infradead.org
X-Gm-Message-State: AFq9FYLNDu+vC6R0zRLFB4zyTXls6INR/y/CdYunjYgz7CrcQ5tkzr7h
	CurvDaX3LIQ0sfARZuUK6lNUs0WSeCdBrGhPa+gHkN7t2fSyi2yFgl81
X-Gm-Gg: AYBFou0adUJXfgdQqfuVDgPz+ifZxXMxJifd31Tf/MUC/SY+Dzs6O99vXpw4weRf6Zk
	3N2LqKN0JE8UMVmXCehyQreffzW9phxRdVGVvHzXFE7R03uoLZ6s6sc7PmJZ+/h1gEH95eHMylq
	JGptw95+uhDdU1+XcZNFN1+vY5kxQCSXMUeru/F43sRuapwV/tI0ZB20osYFrv3FuEkBqz+TuMV
	gXmnOepZBs7whsZb4SnsNnaZRY7pb0Ut7q8pyBBDzhBBEDj8esMS3bfA1lgorsQCYYVCGL32gs/
	DajdnwOJSDydjkGrJnqWCAY6AdIj0rbRL8B3IEa6P0yK2iDdF/78LZ/Lb66Y+musn49Ud1GIZ/s
	yJDtZfOhjSZS41qjsaj07yd5lZ8JSV9JJ3pcc5/z86G7acOCrBnWr+Uckod4aIlEmHOlGjIRuz2
	n5voe5LRICiaHes/pAXcRRBmU3QTqqdULgNk7rZ9PLiuRX+fp2PlfTN3JMwIpuDKqDGAMFv5Mob
	dRiY8kvFd9JDEV2+zK5uPfGR0ZJgMK36ZQD+9LFSVQMTxLmri4ub7u0/BQoVJ2Kq7mdRBLU0y0v
	lTlgP4dvtaHaM/cM1gBm/aG+ziz8ZLw2sOXHJkfQIojirGQ6ZvVj4Cj75Qq34InpsqRj2Zx4wWv
	6LFUgrgtJTtGcROYlkYuU+hGk/CWoMC5CjwKtUXGu3Pg1On8mco4jRIAvz6tbxt4m++PL2rfQHT
	JFEVOcIRmGkL4PSyV5ndHdy9ze
X-Received: by 2002:a05:6820:83dc:10b0:709:244b:b4f8 with SMTP id 006d021491bc7-70ba0ebf5f5mr161408eaf.63.1792798724223;
        Fri, 23 Oct 2026 16:38:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:27 -0600
Subject: [PATCH v3 8/9] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-8-ef1acb0be768@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_163845_622316_5DAA3A3D 
X-CRM114-Status: GOOD (  15.43  )
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

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 25987f550707..b83138745bd1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -999,12 +999,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1103,14 +1111,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1483,6 +1487,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0


