Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C6CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ZZlyfradZl+5Bcnl/kI9msiyohlupRsBccnKU6QuBU=; b=U+N5ce76koBiPbk78wXeCAbvrS
	IP6RmZp0e4UvayoYWd9ff3KDPHBp/Er5U08X/NIiUyeSBHgeTTf8Bd9dwyuXDqPfQDCqZDO5n6bee
	Xs+k3qAQlI6VvqgCZVwFIwCbKe181a6DVJbIlfOdNSfNtpk1K0nph9DKSEJ1uAwOdszXxms/H5JpR
	ud9wFlNmQKkCv0nHgudqkXv7+YZBzWYeZULePxi/30vgjqjoAWB2G/oUo57B6NyXSJJMBpK7fY2d/
	YEh33ArnjSFm6VZlNpptH0XY8ZF6h8ddp7vBEdaOsS3hPtV9T8A3dQLhq/QQSe5dGoKUREnxwjN24
	bX3slrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waU4r-000000028Mv-3NBS;
	Fri, 19 Jun 2026 07:55:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waU4p-000000028L9-2fez
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:55:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c69921bd15so9173395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855747; x=1782460547; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZZlyfradZl+5Bcnl/kI9msiyohlupRsBccnKU6QuBU=;
        b=C5Gn71qsqQrjM5WJ7kig7C44A4ogXM8Mgvq87P0DoeV+Jxs3b9NeB9wE5H3jg2Ehft
         bu6ROgLCC/om1sNYmLrJJhX5kwxExnhS5YpYcyAXHckSSXa2RmoEmNhfliv97Ht2VeTF
         5Zeg/a1bka0Y7VsAM/rhxDRrUUoOzSO94VuK/ubstazMysA+lxSI+sNitkVjpUcBrcOj
         JynQS2mO1cEPKKxUktO1wYx026t+EraloX6cs4JwI8fM+atxymJLjyJy/BdteVGB9pB3
         rHbpkj9jGL2++G/6L90TLrkuhOBhT1kFrYaZi+hi05xZbsEeXTrdkfamWNY5CmTHLCzO
         PzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855747; x=1782460547;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZZlyfradZl+5Bcnl/kI9msiyohlupRsBccnKU6QuBU=;
        b=iQAJuYWyZfitOcWf48l0Zy89Y9IIM3LWuAk0YAK+Ct7UdAw4k8+HAcKfYmhlY1slAf
         Tx2mbkkPsE5tpSyN1eWKVOXW6vLcCJ0Z86J6FY2hLyYHG5uXtT0sj96gn5LaVb6bIM18
         bPyinqp2FjGkv+jlM/6l8uD4knR38gzpYf3K1YlcdWRdHRdR+YiJwgFquTkv5jfcr8Ch
         lcR72hZq+3g9+ZXAtINouHtAmaI8OA7D20DVe6Zftt2a0G6yFt1DTsublFEnvTvVp9hX
         kGEcXO7+6n85o9oK8BST0ujX+HOHjMdSbCr7OshwJWSJwihGBS3rXq+qjjykro6+AvB3
         qMSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oQtY+Vkse5bnG8bvCUWg6dMItVvH46iwsHZ06I/HRc2l3P7qgPvpGA+vGydx+ud543VZFIgR4sag7ONpjPiXm@lists.infradead.org
X-Gm-Message-State: AOJu0YzGgZr2UChSc+pq7Icq1TLsBF7dKXllnENrKQzSUO+qxV+i4XIE
	883HTJCZ3VSfEqtVGz7SwoMHJ09xksjKYaBvYYSw8CBmB+W+aLyIC0Q/
X-Gm-Gg: AfdE7cksoV2p7gjngQOCK5I/EykKtqLE5UbTy+DfId1dGpxEh/5JnUZeqgkv57Ra0+b
	WeDeFftlRgEC9Rh4ziVyoooC9dOrPsIEht70POJL3qqaKqHa4LuGfMdAJ+aQwEvT5D+5aP60ur6
	qIQHcWQYFng69Vw5SiVtL4XtrFqM90tDI4f7eAtcJ09fZ+I31DANlPsb09VoTSS6+ntNsePzmT0
	agqk0UQ1iLhQyoPS018RrBd77Ee4j2XTJbjdBMxYJmHCNj9RaMIVRo27pgGEpDb1W3/7K22ZlPn
	EdD9QRIDtrOX6q/V60b1PlCXf9DimRKwDxD9PUR63WOgF4yBOOph2gBvkVSaivodeIU79MsXyNs
	7xOFzbHTNd3ajkr6edZK7zj5o0G4iD4jKj1cLncVDX2vnFZgg15N0ZaROVfToGd0Q+gnm+IBjXm
	yA/fVsNMrV9eocSR8K
X-Received: by 2002:a17:903:1ae4:b0:2c1:ed61:36ab with SMTP id d9443c01a7336-2c718fe57ffmr29966425ad.19.1781855746746;
        Fri, 19 Jun 2026 00:55:46 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720a1968bsm14892245ad.72.2026.06.19.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:55:46 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net v2] net: airoha: Fix TX scheduler queue mask loop upper bound
Date: Fri, 19 Jun 2026 15:52:03 +0800
Message-ID: <178185574223.2378148.13454900445528174929@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_005547_670407_95121227 
X-CRM114-Status: GOOD (  12.81  )
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

In airoha_qdma_set_chan_tx_sched(), the loop clearing queue mask was
using AIROHA_NUM_TX_RING (32) instead of AIROHA_NUM_QOS_QUEUES (8).

Each channel has 8 queues, and TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i)
computes BIT(i + (channel * 8)). With i ranging 0..31, this causes:
- channel 0: clears bit 0..31 (all 4 channels) instead of 0..7
- channel 1: clears bit 8..31 (channels 1-3) instead of 8..15
- channel 2: clears bit 16..31 (channels 2-3) instead of 16..23
- channel 3: clears bit 24..31 (channel 3 only) - correct by accident

While BIT(32+) on arm64 produces 64-bit values truncated to 0 in u32
mask parameter, the loop still incorrectly clears queues within the
same channel beyond queue 7.

Even though this is functionally harmless (the register resets to 0
and is only ever cleared, never set — so clearing extra bits is a
no-op), the loop bound is semantically wrong and should be fixed for
correctness and clarity.

Fix by using AIROHA_NUM_QOS_QUEUES (8) as the loop upper bound.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Wayen Yan <win847@gmail.com>
---
Changes in v2:
- Add Lorenzo's Acked-by tag.
- Clarify in commit message that this is semantically wrong but
  functionally harmless (register resets to 0, only cleared), as
  Lorenzo pointed out in review.
- Rebase on current net tree.

Link: https://lore.kernel.org/netdev/ajJIWMs4dVbfkHZ5@lore-desk/
Link: https://lore.kernel.org/netdev/CAL_ptrs6J3Ryw_4mVTq5VgzkB4RreF5S0huHyLvd9YwWr1m6jAA@mail.gmail.com/

 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d0c0c0ec8a..ca77747b44 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2212,7 +2212,7 @@ static int airoha_qdma_set_chan_tx_sched(struct net_device *dev,
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	int i;
 
-	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
+	for (i = 0; i < AIROHA_NUM_QOS_QUEUES; i++)
 		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
 				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
 
-- 
2.51.0


