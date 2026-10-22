Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F812606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SSYUgh0t;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tH3A14tV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=; b=SSYUgh0tkRb55f6Cgjy+XlfUA5
	GtsIToX9eouo9bgBV+CbWgOgsj5Z+zESQKFtdbVQzAHEoXIqYjsSIkofVDih1N8BmmlU/zcYMa9fZ
	j+QsVnPeBKufXcPZTV1mAgh4ff4FrvrnXQWhBH9J2RKgDZB1dfX1oxdPtvUQx3Hz9Xqv2unUcLNOF
	hmvrMsdryv/CIRmodDhxIfTPMnnFbzGwL301hD0DSTNGohbuU33Ry+sSFioAhodpATSdcwmwyVcCr
	kLybb2ljgC6xXuatGmYX2XnjTauDUpiWvNjdcIQBv8K4FwiaS3yBznMynDxpwa+Y/KGeiYKbFNqld
	7kZRrObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK04g-0000000EzRN-0er0;
	Thu, 22 Oct 2026 21:11:46 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK04e-0000000EzQX-1Isl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:11:45 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4b28d7c729fso193653b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703503; x=1793308303; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=tH3A14tVUNUan2Vs+x8oyPbJRDbDmbsNkHca8hu6haYR2dwGj+WTrbgMHy8wWGLvSM
         qBGRD+v4oJCd8GwTBfq87DsDtoQwPhw5Rad/auQECXQnoPq8+SsOvhc5JQSQ3oq5NeKP
         ABg4PCstLHNC4k221ACUX3hKkeEt6Ie0CLhWArs/SdFMV/5V7dTaFSXD6EyOyGOu3yje
         pzQHqG6uuyO/0Xg3z/QQZZ0CJYSyw1XxZqw5vnqZpgOW3RHrUsgT57Vp0BqfRRONp+Hy
         CaZPWkKvXz8G7dVsmemSeTeOYlH5OCCGB3blCu+8ZOnV+v/msPywUZBnIctbiS/fe/pm
         TV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703503; x=1793308303;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=G1zIMuY6O/SUJbGSYfdocpJOVRKhOhhjHzbnZzh+DKoimQlsLlfJzfXgqAsXH8GSex
         /xepTOHVHaFIFPAadVbnw+LbWH9FMJVXtyx7I0xmfbBlEvQ+4Olt2T3JwHSRtuHnT9Px
         L1cd6Yq2+Z/TidIF5w8d6nmsRIckBrZ+RLOXAbpL+NvtVyzJ6nhTRUICILZdnfJRUJfM
         /sYiWapYZUr8yk12LTl6TO//ZxWB6CGvw10C4EeA9mIPjvuQDS5P9T7PoVWRNO+gPtuk
         dHC5i4kOnQ4EKk+Yo8qM+z0RZxHmvzU/Ak6DOag+pXzXC+XTeYe9U1DcZrzwvKumiFl4
         LZbg==
X-Forwarded-Encrypted: i=1; AKwUvBy8lYQjh6rLu4Bz7h9Dzkk4xQ2oFvus+2eBjNr1S8mBCe/5epPYFXDoXvpuDDUJ61kT89Ophw811iXQ8OIUICuJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIkJaRzpNzBwz0N45rXEWxo5oteq8ev1f1DpNyqS++7X7L6Ny5s
	G8bJK0YAEawO5optnx6/D/HdIM5l970J2y8j/g1WrYMi2QPGAYjfx1hSQhik43Rs
X-Gm-Gg: AYBFou2mIo9bOzt2ggKq7z/Et3BiBFYYxJEnrL6ljtWPw7jZ64c3hlO0Eer+n4vW/9V
	PM5aVXq3Ygi2uaGIZBtnLVzfWwmAqqi72YFBaYrwxO6cY8i61b5S5chzjx6Kw0/1Av7ZOy1euv1
	3656XuXahfZ4NuduGcsgciirCsWoatYiaY8TBOtbDz66KZUQXqVExa6sNkRkb5XI7RXhm/h7gui
	Spn0Qnd+ndjSW/QMauZbnyZW7Isn7hdPMv6m8QKFWNtcXFy+SQbI9PeYWWB2Z0/wxmeWW7xL2ME
	PlMux8SlqTFbXvlr/vFjO2HUOIUr0/nHbW3OVFLlwHxaHMFkZwTaEDZjx/Xlo46S1pYXKl0S5tw
	bZkQwTh0+DE7hkNeHlgkiQZ2YJu0xR+tJTSVivpY4kQwSZlTBFnjjW07RHKjFONUW/rH2tIksWD
	Uq0DzPM7dFnKHXfFl2BSGFrW0L/1ETyX/B8gFws0GPT6akCmh5ZORf+M4cJolYq1DlSRyGBk1KV
	mJxIKTzQQsNFEg7XM2aer1MMPr7VRcjn3SYwCgZ39G58yeNRqlwvvQxxMLkwCpO/6iFRjWGSsaf
	4OrPw5hPb7UMU0Tk0d0U0yNs/fQOfcvw9uOfQKZ6Nh7zgxaOQJ45GxhmXAQOj76Bb5zdtPk8wEq
	vr5CyOW3HbA/3gzRv+9DcjmD9BdKK/A5EdV3MKSj9/suGkPkF7wIdXk5F2zm0Ijvu56xYIxsLPQ
	ARPQ==
X-Received: by 2002:a05:6808:1715:b0:4d6:92d4:c806 with SMTP id 5614622812f47-55be87540e8mr194875b6e.62.1792703503249;
        Thu, 22 Oct 2026 14:11:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be934e467sm78324b6e.1.2026.10.22.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:11:41 -0600
Subject: [PATCH] dmaengine: mediatek: uart: clear the active descriptor on
 termination
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-retire-v1-v1-1-3f9b99a9d89a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUrB1sIrXgVcRFmr60oyTKJC1C6
 d1N7PIf5n2bShBGUrdmU4KVE79jCX1qlJttnEA8llamNVfdGkNpGQJnCvlFi5VMY7AkyCygVZN
 Hr/vu4jrtvSrGR+D5+/fvj6ML8ITLFa0fg02gQWx0cz0VDnHiiPOx2/cfk+Fa1qMAAAA=
X-Change-ID: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_141144_381418_9E289E14 
X-CRM114-Status: GOOD (  11.05  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_uart_apdma_issue_pending() keeps the active descriptor in desc_issued
and stores an alias in c->desc. Terminating the channel collects and frees
that list, but leaves c->desc pointing at the retired descriptor unless
the completion interrupt has already cleared it.

The next issue_pending() requires c->desc to be NULL before starting a
transfer. Canceling an active transfer can therefore leave the channel
unable to start subsequent transfers, even after synchronization.

Clear c->desc under the virtual-channel lock when collecting the terminated
descriptors, after the existing interrupt shutdown and synchronization.

Fixes: 2537b40b0a4f ("dmaengine: mediatek: do not issue a new desc if one is still current")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..d9427d56bc50 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -433,6 +433,7 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
+	c->desc = NULL;
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&c->vc, &head);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


