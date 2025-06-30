Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73994C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1A5u/XezbCzc0vXccv/POOZnvtspnWkWrOLPiV9LNk=; b=W9dCqL4alrgtsWUAg6QqAtL2Qh
	ESbJRDGKuqfGmJQjUeG4wWudmy8nMdj22d/lCkFqWhk4NMxzFr5qUpdsiUu/NjJmUtKjcjMtUZPVj
	bLC/aVJkoyLjbrj4WEZghfaraUSsTdMnSn6LHJV6TDAjlXHOBCJjruLJhWt9W1z+kSz8uY+KCy+4r
	lenm+2dEYFBuk6ntInp7Z+wTN7UGLqxgiyNoaLzBB21hKRqMuEJvWIOU94LHEOm+OimZDgMT+KQ2P
	7BFbnlvUg4g/NeNvrtLbs83j/NBJpgIKj916OihIgBQe4eAbolDm+QvbKdi/IzAnat5y5zJ2gXDCo
	U3OH/KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB1G-00000001mBR-0hlq;
	Mon, 30 Jun 2025 09:41:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAvY-00000001lar-0JUG;
	Mon, 30 Jun 2025 09:35:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so605205f8f.3;
        Mon, 30 Jun 2025 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276150; x=1751880950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1A5u/XezbCzc0vXccv/POOZnvtspnWkWrOLPiV9LNk=;
        b=TY7QzEbZMhtEdSVOeNfbyAvq6VR2Ah6uSOP3ybAxz6ojLPeOhhTdr4HGi4F4sxEdD9
         sTIPxVv2yrtZs0JSPX1rkJPiu/jLW+dYGxUtRjFFq0R1I8t//PZQ91lMczWSMuBcFu9i
         okxJo5DbhhAr6NaNGbOlxeoXmgx/3ltY7c+3si7nQyFEOQbETc99gyWeQvtuEIsig8en
         ih4JSHin7yX9zmSCnZPC5h4ABf3LclSbaHDGb0qMiytVHm+O4zi1D4/HXeo/vp3qs/hy
         cfw5k7uPRWK6AugSqnoLsKsyBt/p+5szR9NaPoJ2utjcoVuSILn1QTE2Sd1XA+ekIUXs
         thJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276150; x=1751880950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1A5u/XezbCzc0vXccv/POOZnvtspnWkWrOLPiV9LNk=;
        b=rqdPLd3wpDzqpu958F0AyIx3yNa0cdEx+XL0pOwkW3W/9a8R7KibwQcvPyKXACkRRu
         vR93APFxUMS/A5wA573Jnm8/xHEQW9sAZtC2rFHV8EdEGdyd+vBnzXQY2B4EeLutWG05
         ee/lYl5S+pTBD9L7KfgzsYW2VsvMAs4k5kdfwjKu9r9u/Tt0AGtZQtT6XFjMcTYn0HpI
         cPvaiFYeDnHEwGSsYGJOPgy2VLsYV/aFZ6TTnOOWhy+J+OrClhos/5b5dg7zL5K8TFw6
         7oPFU0iKlDk92hCelyYxN5TqLOst0RSC1HyX0BxAhDKQHFIQW2DeZkkavnQglq8X2GWg
         CC1A==
X-Forwarded-Encrypted: i=1; AJvYcCWpFGqNYkMfrKLyGfUB05P2pQLddAMosIuYiuq366CIgVFxkdOMgLaQHkpQQcx8ncFu7NTwYUHn1HhRFcpyXlhlDQ==@lists.infradead.org, AJvYcCX2dqXYu3c6tGgxSEGQGApSI3/+e4QO/QbZxmIX28hbnd5Y3kCg+H4Bd6CwMHGBhPveeE80HmpL/7VM26Z/wrrT@lists.infradead.org
X-Gm-Message-State: AOJu0YzjMYfee9eqrOcMSd1G+vzqKcu0UReBx1NqAzSZHaNQenkXRH3B
	b70nCoJ1Z3xpoTlnfNKHXAy5dtGCeObXyJ9xJrruBYp9VrT23a67L8NI
X-Gm-Gg: ASbGncuS9xCsIZOu8Z1DSSZBk6Evnz9i0Z6x2SVfklwv+pRBW2tEUl4AsknvdTnxXS5
	MhINgA/bsovXraRZP1Zyv8iUBs+m2HMTQQErSISLdEUaQuX1X6stZn8opGPmecKGRJP5xLa2iQy
	gCtz3IQ4bVL7o6AOkTcZJU587ao947nSwalGfX5kwP8qkd5a/wDs1DLwp+zdUpi3/rmX6Kse3c4
	jPdLUOeFNr1wo4i/r1Fzp/OuLxh2NV3MHskYQF3fDdanOI7cqnQvDjHqxDZX0DJ9ZOlunpUpPxX
	HlPppuPjEwxhD84T63vFNkhb8AxIkH1+w8co2NjrqiESIe9C1cTeQX10MLHUkAhEN5Udz9TqkWQ
	uoEt24yaM129iXaL4n+xqTdyVwQ==
X-Google-Smtp-Source: AGHT+IENoQHFcKucvcnuAdWdAyrPNttNlfViNN8c8eBHYW6QCFoessLifIGmNu5Aps8j4D3BqFxOXw==
X-Received: by 2002:a5d:64cb:0:b0:3a6:d680:f282 with SMTP id ffacd0b85a97d-3aaf43b95cfmr2363583f8f.7.1751276150193;
        Mon, 30 Jun 2025 02:35:50 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:234c:3c9a:efe4:2b60])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec69dsm9774684f8f.6.2025.06.30.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:35:49 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Yumeng Fang <fang.yumeng@zte.com.cn>,
	Eric Anholt <eric@anholt.net>,
	linux-mmc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: bcm2835: Fix dma_unmap_sg() nents value
Date: Mon, 30 Jun 2025 11:35:07 +0200
Message-ID: <20250630093510.82871-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_023552_113379_2D0E2B41 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The dma_unmap_sg() functions should be called with the same nents as the
dma_map_sg(), not the value the map function returned.

Fixes: 2f5da678351f ("mmc: bcm2835: Properly handle dmaengine_prep_slave_sg")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mmc/host/bcm2835.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index def054ddd256..4fced9b36c80 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -503,7 +503,8 @@ void bcm2835_prepare_dma(struct bcm2835_host *host, struct mmc_data *data)
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 
 	if (!desc) {
-		dma_unmap_sg(dma_chan->device->dev, data->sg, sg_len, dir_data);
+		dma_unmap_sg(dma_chan->device->dev, data->sg, data->sg_len,
+			     dir_data);
 		return;
 	}
 
-- 
2.43.0


