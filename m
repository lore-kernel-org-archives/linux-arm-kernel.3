Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C78606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqvw8P8h;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPw//QGt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=; b=oqvw8P8hg52tX8
	Hzj41WHhqTqn/1Fo6iG+VNl73Rf8An5TKGt9MuaxQ8EZH+lzjFzyFJiXZgHhhPwHc+WrWXTBf+Sln
	Tul3Mk5moITE1e40LbxOWTKZkZ+TcsiSTK8BO4ijwxvIV1Y8Xeo30YDDIrDQ4v8Kt9R8mSYHEVAAC
	pv5gIcPecqyaa2+1Yn9ZhasM4vTUUKhZoC9V2I8Zh040Lf8pLV64JT7mgLPHAOFOEgxH3Q8ivA1y7
	h9vrRqifo6e6GICjIuKPw6IXgUG7dtXctUwSaSnES5JvGd5G3yhntvlxz0IsM4A5MY1+3UUrHnDpz
	oISwP8+D9JfhMTm2DA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kc-0000000FNZ0-0Zr0;
	Fri, 23 Oct 2026 03:15:26 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kI-0000000FNKT-0mzH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 03:15:07 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-84e513877a3so319568a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725305; x=1793330105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=UPw//QGtZf9VI8Mv+u0cyEPgIFGtQg2F09Ye2F5NcpyhSuIvwPxygCkovj6SBaavwd
         vs72AVK0NV3zQMjo+rDUtvH8e1sMPIpwu9HLnjXJEm/S2Ais8KrV8NZDpP+5m7Mhj5Dg
         F38IHCo7Qa/lZRNtit/lZXwSg23aJNVoqfuBACb6LndZDsvC9XJCORJk0tYRReVybQby
         L5AHMWmvBiGiVR+tkdgFrLk9h64V8iB5Y2lZci1za7jeV+yMc/jQraSn8XcF+l8KmtRL
         tRFbqK24T/Cu+LvXtI+EV3KwcgCW42YNayvxgf9m9tSXalztckMvMrm/XyLhBhSXFLXB
         gPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725305; x=1793330105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=vgIRFugBLqSRSe0s7WnBp2vexGsTbp7XLm/+K96cc5WCaLEgg+Dmxuc2jnJdaKt+Ho
         /uJZAcmK1AK4SdoaDZF5GXx65DaHx9wFnuaycGz+Nb5xuJkcy751QynapIbIwV9pDeWy
         o1KucgZhAPTq2f9QJNUBY5vwuUGJFveYUss6kZpj2oeg6dlZvFQvK25TDLzwnQgkij+7
         81kNJF+8qyzyE64kBbNfDg31RKEiXIX98uET6SQMRg6PmIQ3EgktddAwPQiO/TIpp3rB
         5HuAUtUzTO6QIuzoF4sNUGtrFZTI1gc5ueC6Y6f67UJzkB5ONzISDZLUnj78IL8bHA5f
         b7AQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7zSf2vJCEnjPEUgb5dOGzMg8daEPn9zlXe27MdFBYjclTp8UcXJj65PEEppAaX6R+FOvCTQg2Ef3DThHIyVl/@lists.infradead.org
X-Gm-Message-State: AFq9FYJSNSdQZp57RFjFrdqC4tGvkWCNL4CpLfnTkXA9k+fiPNFsANoL
	aUUabwPfYBwK20T6f58nAvAdSbxUYwraKFyblHtSqrhJ+x7Lga3HZK48
X-Gm-Gg: AYBFou0YimZHs2+kJhWCPMwEIN4jdjOu3Fk6JRkTzslWRwNhSBBBDFsDioGaycQwEel
	9YLEekvGEjMgMMw+B4N/cesTF1ny8a7Y4rSj3+aVBtfCS4XgsEngFnBTMPWoQfNjSQWmX4J0kHE
	gw8TVWWlSLKolvYDZtCFELkIh0yGws+anczUAvK9nZWWkNJsmVMhU2RdyrKRJcN1vE+csAm6DHT
	UQHtuYWect6Pa/lAr8d6Wx1DhgRVI7GjaXZoAIkJcJ62wlT9/sNeGjVYC2+of33Wo+zk/lSi18a
	oD8o94Lg120HO0sKFkxYlENgNIb5VpiEJSk9LmSDLic+spnOJr3ddW+iILbpj7iKrdnYxqyc3Sq
	CTqEns1oJfCjnGah00YUt11MwYYucQMDm2OT5wdtYQAhTzmhlLfMrtw415rtblAWYa9oLVvrHda
	f+aWx71yK7e1/2fV1onrWdwa3SpgUun5B97Us4FzthV4sJIdmXiI1ozqR4fgR9yGRMe5OfpVOmg
	Po8UBD/xABV1ueelSSAWP2z0+mbimxwEZ53apH8j86g/l2Lq2A+d7vr8m8RQ4FNVLurNyXkveBw
	s6rGHQvOp2biGB9p5TB4s+XyzRBbgiOnfruGOKlbf/yKvhUmMwzTZiTF4j4KN1miOisumi8N+bj
	jw6UpA6MRmwJsxOpONMt6LLkiomWvZICUKwYq2R/0gAlJsTx7/pq8vRCj38rH6Uu6XOwR76hPN7
	NzYAo=
X-Received: by 2002:a05:6830:a185:10b0:839:c62a:1661 with SMTP id 46e09a7af769-84e32d0adcdmr1665921a34.7.1792725305092;
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:56 -0600
Subject: [PATCH 5/6] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-5-01085f684c9f@gmail.com>
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
X-CRM114-CacheID: sfid-20261022_201506_269085_8396D1EC 
X-CRM114-Status: GOOD (  15.45  )
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
index 7ac6693a041e..f807d9386939 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -994,12 +994,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
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
@@ -1099,14 +1107,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1479,6 +1483,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0


