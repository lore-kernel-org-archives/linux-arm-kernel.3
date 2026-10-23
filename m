Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yqWwEhQg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qphnz00/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=; b=yqWwEhQgz6i6sF
	o+nD7J4a0V77E4PppWheefQO8II5g98AYkDDrQIoiFPoRhP0IXjU2Zva8K6If9zafW0mIT+fYVlbd
	C5cnuDJkK6xofDFSb5GrRkZ/tDOo8cWpt0lTgrnDl4670LieVgUYBI2tAv/aC750AswnTKWVg1PgJ
	K6FnFj7q2fNtw4kvto40Azh9JfDT8RoH2PBf/b+gknS3xHor/G00B8Q03xMzDNa07ayyVquXh/lCT
	JzsenLDfUfcHJawWxFKmw01DWMevBLDmyThVKp+bHx555oOeQSt+PMpCGOtiECB0o6bsiEIkr18CG
	2/ilj7wg02TFzQR8Gl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqd-0000000HBWv-0Pwo;
	Fri, 23 Oct 2026 23:38:55 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqO-0000000HBLW-26pH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:41 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-823b938464fso953477a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798719; x=1793403519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=Qphnz00/ajK9DoJZzIuGIPvhWnLIkQrRM1eOYWR554Jyuw+ApGhKG+La617yPpvUB2
         deSmDlX+qqheaNp6jPC/nqSMsunmdQOW4QrZ3eB7HRIdXaX8u8YtJA9mKpvZtEf1xbPl
         haBI8oBw+mAYLnQva0mZb0dfhyKgoBrXi2+g4cJfwEvADgF/5EoBQi2hwkN5lgslZ+DS
         DfLke3SExMCKmRsOAwkBwWqX21UOv5LU8894aIsND2vKTUKmk8+De/1ZC3BgP9Q/VEAl
         rFhvSKFEtKNZOAVc3qSTxhiMsYfXb3OLCrad9dz8E+wmCYCNZw5wwsiddB+WUwP/ymrt
         OWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798719; x=1793403519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=IlW46dFjWl0MjrhdGzv/Dw8UNI8WjjrAAeJvmF3nygK84BP2dHIBX9tSxX4HKFwEuX
         5f+65iTGB0jXLTyHTX5Zi52L6JV8NUGNw5lhVcAynrGLuxB+godUSmk6m9jYDxlMwkLU
         dNZfyc6syscaySNSwvIFMXoFzu2/z7SFrsW0ToSmTA29PGZU2UIpVNgkwztJ3lnunhjc
         eT09qJBG1y1ZCvlCiaVhpjevzwTOm+mpqy5jnjYZVts2fqtbtYZkjIc2qzVO6LOAmAxY
         xNCpjjSUpMfSfYiNCi5Q2jayUvXbBnO7mnuH04r3SBP7VJcFKOTM0KoTvggNHu54a6fi
         9oIA==
X-Forwarded-Encrypted: i=1; AKwUvBztSSPmKQ2eolvVhFTnQWLP/Dh0SC2/2HMbU30paUxQlQrTqtKezTuN3v+GbqWgwM6HTfKsksnq9/Ei4+BQMqQk@lists.infradead.org
X-Gm-Message-State: AFq9FYLAAhUtavByWrlenB3wjjrIBOMexHLYLjnlT1wQhxttRDusFrl+
	niyrB1Eef1yroMhwLTsOW1RAZx9sQpSlpafO21wZv161N2ixiDik58O8
X-Gm-Gg: AYBFou0/RZba1rc7JZeqEXtfeEA8iVi+ND3JPCAdtRkuWh/mtz5UP+Oi6B7oFv58DpS
	sKGQr5KdpT81qnXMSy17zEJPNzoQNuQCxbz1hdynTAy1q65uW35WJOR8/79B+83Q2MhBzujJhyJ
	jGFqSrdoZJBzPGSQV0SdzX31VKW585s8UhQ2jQK2KDq74NzM8Dbz2lpjgxko6TtU3F3+6n7lDsj
	wB2oupXtYByWCt99VK6QJp/KOfYE6u5egST8MziHo7zRJtrTk2dqJQdtSbzucylYc1r2KWzLjFP
	AcR0iXvab8hqxH/klBA0jSrPi9P6dODQHHfHaflRiqyacNY4+M6f2hazpKvFo3SRPX5KWP5IQmm
	y969K15pFGFJkjx2E2YZF6UoAFEE3V25e1xxKKkwLdyYD/mUUX3KVyLkwMsNegS2fplzECLTC8l
	2taSNQa9Icb26IX5aPNgFq3WWRbrhLDui6T8+h0wAL8/k1CAyZHvzHzmSX4el03IuHIRwV+H+Hi
	bRa2RdtHCpD/VzdTEYSB1hFfQTv+MSNoj8Pzm/dkByOd65Oqtao8yRL9m8tiLMimSdRyF0fORSL
	HvjgrllJDl1ChyMNhYkaaDdj5bPdtpBdQHXQOl1XASp9U1B08siN/MX6p5dC6wMFN9SfHgNbu4T
	6rtJ5eL6mViLjkEXQcewWFmJ+rqSIdYCFOfy6UeEuT8T9iuot9VKoyuuBTH4aanetFBDPv87f82
	h1oetO2ZDSuLsA1VWGAik7Wm1n
X-Received: by 2002:a05:6808:538b:b0:4d7:2721:cfb0 with SMTP id 5614622812f47-55c002e295emr491276b6e.31.1792798719329;
        Fri, 23 Oct 2026 16:38:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:24 -0600
Subject: [PATCH v3 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-5-ef1acb0be768@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_163840_580215_EE944581 
X-CRM114-Status: GOOD (  16.00  )
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

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index d3a63c866645..900bb629ba3b 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -490,16 +489,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
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
 
@@ -536,7 +531,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -582,6 +577,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -601,13 +597,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -983,7 +981,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -999,7 +997,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0


