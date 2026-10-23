Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sh+BdxpO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BH2bngbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=; b=sh+BdxpOjtYUU5
	XekKSyHfIeEVS32J19Z5uIgrer4XAK1m/laWoDr8OlH12yfOFfWxwPcb+JYcuhYrrP87WN5PKe2eK
	ZFohArw5eeegBHFQqRGFSeV2fgqAKgM3+gttKH/uGIxVrGfHrAm6qtiMKIjYQo/ZrzLlDquebpH/5
	4glXwMpkc11xxnykSTO8hyAG0GOqQS907wulN9bEilQ6n7DBn8zQaSc/7hwOfc2Xdu67v+zrYh7yK
	NB2ICEiY/ILEMDIb75QaDeijm8OzGN9KbThhKxiMS2+3XMxhSde+qS1ntXT1dZYkcK4fxVrQd/pXv
	1MKHgdgFyyxLXmTsKjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kJ-0000000FNMN-3Njj;
	Fri, 23 Oct 2026 03:15:07 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kG-0000000FNJg-2w2H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 03:15:05 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6dde81a6820so312020eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725303; x=1793330103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=BH2bngbM8MtxnKcrhXXbMeOH52Nb2ElqL7RPYgoUcZdBLzdRSbz20x+9lOMfqFeoZq
         ByOcOt3Kcc8tsvaMaV5oFUp3cUQGjnFv2+QBIRcNGfg+sTf49FPMCtlD2VM5SbjxuphR
         1hiO5hNp8koLw6YAUuxJ5slI6xsJQg2xVBynZulfJI0Teq4kuUJKvnxYA+FK1tsb5UXx
         sPfsg+0v48gULi+XAOa5iYoKww2lDIX3ooS0GD6LlHN2OzP/Fd6LJcIk8s3H3V8vTvJ/
         0i8lmkpHH/3jXnebJJFCZGRsSmcFV7Jt/wZV0OanmhPEgSiYp7Ww+7ZKF8eUWq9pVYgM
         IdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725303; x=1793330103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=2AV5a/IX5B1ldPWz+xy/8KwUvFgRYd3dY5C2og8UnQHY5sTalgj/Uux4SYLiDUbPuP
         NKwn6SUXd+J/AAhxO+URAgg2vhegTgj5JM9W0vJ3xnRCsyN0U+Wd0JZijqjwtX4ry3p9
         Q/tlICUTg4s1u77A35CX3oYULbxTydCZGCcJmqtb8rQZhFMZsEmZ9qqXBGMBCSbmDvts
         8cx/hV8mNFwbNth+QTy5k2fbuhNwmZC+h3UZ46HzdSRMOexHqm1PAblya/fNKb/8ZNwZ
         shUUsNQKtQEtO0yd2u6hydSc2hRWkAUcG4PZIGy9ZoHjIB+HI8xbm9G+xprqFLLSkPb5
         S26Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUSTml/yqSdnoituuYXvjADrk3lcjvmb+BqJvyYB2qWuCsLvW3c8oyq7RNngzd4EwX8ZwymS1LuLkznlRIWaPv@lists.infradead.org
X-Gm-Message-State: AFq9FYLqaRm3aK7b3R6C/22bEoYz3eXUjaBIwP7as6yT/mqsmZfvMxqM
	2YQZISXF1rtexXBDLMhs1kOtovs8/FfwGRHOswrIA6F8Xrp+8ck8uByz
X-Gm-Gg: AYBFou0lZ+fbvqtdr10F5uT6Lm4b6rRdA5Yja2PW51itBsfh+LfD0a4dKhaawcQUQU4
	ysczrK4eqW4ORrS+1zQzqPBqnYv/+zO40yw45sEf+CtoGGFFm2CgL9UG4JfBmF2qAP6ydKKfOth
	0O9K7r32UwLFGycpB8RFLyoy79xJfmS1YySHyQYg+lrwff3k2Os6PhWuCP9utmTjT3bHqhPxQVD
	cZIUSL5X8O6+GO5eXnaQxmVsjzv8+WbmZn0uuMiNPysqKjXtY0bV2cJfscyR9GtcvEAfpAQNmnV
	L05eUTVTp8u6ACCoXAvOzi28O3pn/WbE69zSgzfrStQOnvgXhPTVJbPw+12qwFgfMzey75pWJqL
	8+4GzA4NmEfyJSJ0u7LrU2ao5SKLbysN4E4akWkjtqiLqdYdp3MRhZ7fkD5ZoN8K2rHixpLxFeT
	n7xc25ptpYuzRWUJwNmu37r0ORenIGLDrc3BcUVFfvqUrC+ph7AQtycH2nM3cF3mGxwjyeeX4j4
	EBVYi105AovpSDBvkfukWkFFMjY08GVD6stJ6gnTuz+NTd9rNM9ksLCrVs9NOnPmtWsth1POnSI
	FTrn5i0du6VMV6ela6Zb8TVwDqWkRzjMiDED+HuZVXXCNAG/j/x7ZlyN6og70FJ1oI/4wy3xlMy
	B1iJn/ieA/zOEEi3baGUK+QpFg61wuV8muRn2r7P99vxEkuEmsBp4a3rcP0NKeR5bBy72UtDlkH
	nsWLks
X-Received: by 2002:a05:6820:330a:b0:6f7:2050:a2af with SMTP id 006d021491bc7-70b88a8a106mr865282eaf.53.1792725303524;
        Thu, 22 Oct 2026 20:15:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:55 -0600
Subject: [PATCH 4/6] dmaengine: sun6i: track paused virtual channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-4-01085f684c9f@gmail.com>
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
X-CRM114-CacheID: sfid-20261022_201504_768513_8DA3A909 
X-CRM114-Status: GOOD (  15.39  )
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

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Flush the hardware pause request before returning. Completed cookies
remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Resume
requeues an unassigned channel only once and schedules the allocator, so
an idle controller does not require an unrelated completion to resume it.
Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index cd0562de7def..7ac6693a041e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -209,6 +209,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -538,7 +539,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && pchan->done && !vchan->paused) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -934,10 +935,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -959,12 +962,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -993,6 +998,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1046,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1082,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0


