Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5EA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePQ6AO7P;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eJ37z/5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=; b=ePQ6AO7PFOsBTT
	r+tQOTXQ+FI+dFp5lDungK6F7vKE02lD9/zgRci/CvlAg8YevMS/9JKa4X/h4kmv5fEtXbOR1RvUt
	34Zhw6Tov0o0z7Ikixz2rNNZBUOENwmeQTLsIpEHvg67ZZjVV7MBt7vTH0QCNwVz20paRgCfINt09
	6lfOO/bFmSCEx/mafc+wXNOPC4QVoVLjTCzz95n/kEdkpu97BcB3hE52T0Oy8NH9ylJ5Jix/LTVZf
	4wrU5ZJ+CutFFCUbKjkCAJxD2jr6HPW6IRdRGaS5YtBNigYh30Nvpt1pjJoWiOITI7B4X0SVK9Ofw
	m0gpF6QmdMSfpCBPmqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqN-0000000HBKf-2V1z;
	Fri, 23 Oct 2026 23:38:39 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqJ-0000000HBID-2Sh8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:37 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-46556b9e02cso877514fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798714; x=1793403514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=eJ37z/5VZedZw8oO/6GhS8q6jYqMD9RJWv1vKa2b0R2ZCF69VUtnRivUfw66Iz/3aC
         w/IYCujl09neByl3wEjpJHWqTjZbUBhWAJ1s6lwnV9tajAR/9yeConIyhAIbM2z4QP+j
         31xePh3oDOLrsbq6BR7MDI1GmDdW6/GoXkFCLDsoXqi/F6TE5Nu0XLO4myVm4NOOrh/H
         41bFQd1BYFLBV9sN5uk5odOg6jeIaP7s4x3vYHA+zvkuQmagG6BEMvCQpA9iWu8pMNnz
         unTUZLUTdOXYg7ipPOX4S/dKIAT8D3LBVr1+PQyO8F8qJ+O2QfLViGVxqofe8VQQQOUg
         LyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798714; x=1793403514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=B5l4kaR3WwGFReKP0c+MHWJLTDFJhlqVN5oX6QwUhC3ZSOkGZTJPsimE43rToQZ0vC
         wxHGsuToNR04L1AJO0IvjG9gJu7TTM9nWyb/hlA2x1FkwELBLZ1fn48HJMV+QwR+6u/Q
         44aV3kuh4cFEQQPvF4ohuNNzyjFizKS+ND5A1uCOBF8EuWbV3bqdN0TEFW3cVG0tfgXM
         5spFLOvIfBNAInkQYFcFHeEvVqJo+l2dnNbf+Up93q6CNvwMdjeUHqGaoyDkj9RzNBrN
         N5mrSvBJh6T7PQh3AL0hL5GwLAjn5eF5hu4jbRQZsdiHGkqpPYA0n4bZ5KmR6Y0e0zTk
         3s0w==
X-Forwarded-Encrypted: i=1; AKwUvBzcZ2I93yN23c9mKTLz+QaMqZMwv7V5FPfvw+9rVefAYQJ4XOo1MN8+hKMFF0U4t1ijaZx9oYBoFsXHMwetQFnm@lists.infradead.org
X-Gm-Message-State: AFq9FYL9EH+qe/RkMDmASCdshql3JrWourlo6KyI7svREEkHfLHLr5MF
	+OC8gNwWbIDrU9Am7SlXB2QXhCfXOIbucL4G+xBRjiY5m7lHIzYqiv8b
X-Gm-Gg: AYBFou2WNEfv6zsFUM06X9yMDv0OsLY5dLSQSdnoqwN5H4LfPTBFLdm4YuoluUeQ+1t
	jUiwrpkYMT5Y5kJPPTBm/Ug38eVeLWDck9WQZfblrAnp8eCUZevnAgLSZormSMWGQyiftdhw7f7
	EGwM8HUKHdQzQZsKzyBUGkjHwQkOi/p4LNp6knD4btIiiTR/E1Fvsm39UZfd2uFT34D1KRIz0xl
	JS4L5Uk37DrWGA3GgAi8L6FJm8ln9DB7aTn8C13uSVWvk9WsFYhJMrJNtpviPuF1ivQ13BdNu60
	azcBYKv5qNHlpTuNpPoiAxvYe1QxDEDk4cFVis43y7zINV4V3fN+vANmd/oPuf1e9Kwy2+1y8VP
	w2ijaXhOXqJnO/cxVsPfpxubO4/DBLglhq/n47on4OkT3NPX0JZhJm/wNrNvMzLnkFmiST3K2Hb
	QYoNobBpB7yLR5FDg0sx+/VBSkMDJRemKg98xishdujDtYW84bTb0/ZgdsNvMlGJTDJ4K9JU7bk
	VzdXJIRSLNHTuwsdytY5qb4MyVSNrKmS/zmO09YDDDWcX/va6szi5OtGTcHP8HRcTVqQf3FQWux
	ZhPKZCSkga0xxATM/6yrWK5M1pa+GDVFxei79g7TrZK1/dXwJnXD1axQzJk5S1N612o9NIjT9D+
	PsB0SoimJST0dYAqHKM9nVthGahTE0rhntlueOkRB1RaJKYFoDk8B9XZlVRlLzYscdGLBM9+t39
	GcXjw=
X-Received: by 2002:a05:6870:af4b:b0:467:e082:b93c with SMTP id 586e51a60fabf-4a83f053a93mr469646fac.2.1792798714477;
        Fri, 23 Oct 2026 16:38:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:21 -0600
Subject: [PATCH v3 2/9] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-2-ef1acb0be768@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163835_639621_A8173B4F 
X-CRM114-Status: GOOD (  14.06  )
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

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..3a6525dd3d32 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


