Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ralD6rc/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sUxbqrRB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=; b=ralD6rc/BtYBc5
	DuBCI7RL6xjpEDgzA6nzxqw2ZvOvqDAgOMtum2fj9xbA8hYcgpYx5czPNeKfvZpedj/TjSs8gZrld
	Ty59OONQPUEvjn4CGAbfYSVFKIrLEZsVcuMgcNiPOKBXTAtni2g+TqZukfAk014hGxH2YVd1dXwD2
	MP6IpYY4SWrKBHhO1VQ2Wk0fcXCs4+ZJbqh0vC8nhIvv3spp8O4WynpMgYJcWaQsjSIQT0KH5F0mv
	ZFeCPS2ifbTQHHi5rljRtpc4dbK70y5kjYKdIdfh0tIyE047FUe8zwohHOREmQ4EekRxIqz1yLt6I
	OJjcyodY+9CrlxdxDekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqd-0000000HBYH-2YRU;
	Fri, 23 Oct 2026 23:38:55 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqR-0000000HBOd-2XbP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:44 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-46556b9e02cso877554fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798722; x=1793403522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
        b=sUxbqrRBV5yPR0xI1NBJz10n0XXPTLYx1VGXssZerc1uSdcnHjM83CLKXCVFgcGUCj
         EZEyfHLFnvb/Wo+TENgFgL5WI11ZKVXRKpRyCQOaYtQxtpckjFHmxGxp/0pXm9YT73g8
         FidU3Sl0bbjeWLJS+NAC9j21USZ0jXmHYF/9i1AjizEpiZnhC0aJHXNKTIJA2Fb+APnJ
         LrpP223k2VL8NxGDBhulUrjRK4klhVR8JG1CUTyexCsqdwqCrMsBU54PFVAplfs8dvo/
         r8DBwEVTPSxWKhfXnwkXcBcmxRxDZ0wUwxOJINGlF32qoZWB94uUCX/rjKkatrnechja
         SOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798722; x=1793403522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
        b=cz4rJVqqcmBgplsTUwRzyXDB3VRUObPAvMEhTz4iMJy+c2eSWTcgHCbBZogzQabzmo
         Wicd2MRFI9wkWeWbmU/svYHHIK54JbaP0tAZEcmKr/WgldI8JQNKEfQv9a5bF+q4tCAq
         GTDTOwVV/1oWJL99BzViBKDqLRt5anu9VnmhhGccYDM7w2LTVz3bv6eysi7PTZI4fzaa
         C2NaAhA5mdW2zl2sDUz8yz7uCz2hDrHKYyQ6w6ECQVLuJK5HNxZX/JLS6SA5/mx0TwWb
         ncE6PE9ZQBLOeNOwG8WMXW5Rg9E19OdJfk+87YoO0htQ/o6z8ItVl5Tj2L++SXOj4ift
         +jJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwELnjHXSr2A99jR4EGuGglDoLTL4mb/s+aKH3v2TvX69zZf4jz7LxEeRaFgxwmvo6nkUJk0Um0a+RzWivvEyXE@lists.infradead.org
X-Gm-Message-State: AFq9FYIDhGNLSDmzv1cwerOyiQfG42ZBwu8UuhjLPJ0egCkgDFCzKRJM
	7gKePH/0XEgnbGCIDGe9jFWi4FKKEAuY81oqMEecPgexzXYi5xmwgAh+
X-Gm-Gg: AYBFou3RVrvTE7sE9Icfo6w+R9gaPR+nwgWNA65+oUyrCdLtZN75cLSbiTBHTU+fVlF
	nCESqxJQEc0c1n7Gq+LBeR1L4G2rCTBr+KMSs86vGkPAf9D28jWHFJdt4xRPgl+jKyoVO3O8byx
	Zmghhxl2WBwM8pe5/FOq2EY/CqRhyX8b7bPLk7zmXJmdth8rvGJ0tZ6imlSRvxs8/yZhfWC9B3m
	8rscjUPXvbQ6cLDHh+yburFYwdIEQFXNwVEtt6jSNRdIxrqsVAyIslVM+mT+F5TDE7kEhXZcyjR
	dbPmlQqhKGaQiP4BfWUL+V5u6N1k3EpTB6VBaFr8nkA5Y+jSRTk66mE868zI8cpzufBo9ufdL0A
	k89dh1qzfTy/15CwKjJHTkEdCHfIQyUyP3UEfnDz+93hBQc6Lgq60fTovXGbRVozgtuRSN4LN/c
	vfGLcDvBtf/258hDF3M1WeLV9oh1I+69+VYDA4uj+VrWXAAyhd9R9pIaZ+o573Ul7dVPXH1wQAC
	iAb5xCUlfWIrRdnQPDFHPw3VY5Kzoc6CL47nbLfkp0MxKYVvD6LBfWvVC0vKYDwDiqRdbsYn5L6
	BluJnBLBrTJ7QPAGwu8BQ+6t5E8EmObp9enDNxLx6fkRxoaIkNtNy3EZV4qhdEGNVDrUUVChNug
	tZFB9Uk3DLepF+2VFduJZu2lRYc2r3l2BK9OG2I3af/QSfGWQCgKLrd2KXiWdNiIoi9KYk8x0wu
	FmZmgaMXswVpTjN1FU+22d5EH/Rg==
X-Received: by 2002:a05:6870:d61f:b0:4a7:2baa:8701 with SMTP id 586e51a60fabf-4a83f9aab83mr427138fac.15.1792798722385;
        Fri, 23 Oct 2026 16:38:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:26 -0600
Subject: [PATCH v3 7/9] dmaengine: sun6i: track paused virtual channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-7-ef1acb0be768@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_163843_668940_579A104E 
X-CRM114-Status: GOOD (  16.15  )
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
descriptor when a paused channel's previous descriptor completes. Release
the completed physical channel so other virtual channels can use it, and
clear its hardware pause request before reassignment. The paused virtual
channel retains its queued descriptors until resume.

Resume requeues an unassigned channel only once and schedules the
allocator, so an idle controller does not require an unrelated completion
to resume it. Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index dab17b3863fc..25987f550707 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -537,13 +538,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 		pchan = vchan->phy;
 
 		if (pchan && !pchan->desc) {
-			if (sun6i_dma_start_desc(vchan)) {
+			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
 				 */
 				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
 					pchan->idx);
 
+				/* The next owner must not inherit the pause request. */
+				writel(DMA_CHAN_PAUSE_RESUME,
+				       pchan->base + DMA_CHAN_PAUSE);
+
 				/* Mark this channel free */
 				vchan->phy = NULL;
 				pchan->vchan = NULL;
@@ -935,10 +940,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -960,12 +967,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -994,6 +1003,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1050,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1086,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0


