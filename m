Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6036BCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ynVgrV1BKxZf8bSSqKXL4ymJEj5mSIOpHynliU6D9pI=; b=2qv19YnJ+ZGkIl57zm9rRU69K3
	ZrR3dvzLLx4iRk1LV3q4+9ltr1PyO0Q8NN0xl/cEzZBb3aubA5Ij3ASa7ccyWvLI2CPCf45ff82XX
	vyR/huubR+WjXcN9gJh67qeOy5idvcD8V8sKlEU0rOht/LMWgAjMWd5P4XUfqqydLPUegJy9NMhqq
	TGG+4lzi/BvppwgW+NRsbPS/5zArtPqZ718IObA//28zWCek53FM5lllM61dTt12PYbSowvkTntAg
	FgjtPnYIs72M075bzILZT1mk+lDmLwkv1ocCThqC7gQLSHLRT5xB4lznGHEzxhnGonkGZU3wlTxST
	GAcK0X/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgPh-0000000GWkr-3j1S;
	Wed, 17 Jun 2026 02:54:01 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgPe-0000000GWjY-48Nr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:54:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36da151a152so3761438a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781664837; x=1782269637; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ynVgrV1BKxZf8bSSqKXL4ymJEj5mSIOpHynliU6D9pI=;
        b=CdFWr9PyB89OIZBJtPZ2JroBTHakruEv5EQB0qE3xR/1ShUedfpgbLfNBAjbQRbW1X
         YpHBaShibQpJqA+GgnqiLhQV9WqtfyomxMoBvo1ohWmYF17tCwTtn4ViHDpHNNQZV1+W
         cGrPuQBgbMLmLvpLBqpTmqLiwB6AgC3+HB5kgvoENIhpgf50t8VGG/jCWJpcmamu1qPm
         6HPl4zdBcoRv6RGnMKQ+6dqIx1emGZJeGxaVhay7SlTld9C6wouZE42C1Q1uM3hDD6so
         cm2Iop5D3UKAIARiTEivXfdHCLd+5/WfLPMFwL4I0gxGMxSc2OG8uSSDdinEqGe0nVW2
         2vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781664837; x=1782269637;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynVgrV1BKxZf8bSSqKXL4ymJEj5mSIOpHynliU6D9pI=;
        b=UOgfKtuzldjdhMswOoPPSv6F+4zecAloEjDcsS6DYoKYrdBxQ0QMU72LF0cZsuHT2V
         5do/kwX+1JpYlAW6HUzQGqD89GPgvOAHIXBxIa6MjY1o42EmNXt7/NnVvvW4mhWCj+7R
         XDgA1CUhzkYJurlGQ7faC+r5L4dWvBKnvRvKdgO1/c19lxKG9jHDVJgB8Gpnw47g17Dj
         nUuhxQTjxKNgqd07cRdZEqLWMZKPhbh/mwIrRR064r4kq5+x1ImCCMOWwXyx25C3tuYZ
         UHHaeD6KQiuz8jEPVwofQXwZgXklksrXVDEfSXCxpJaSDOov46qLFNpcOYrrrR0ewheE
         ogVw==
X-Forwarded-Encrypted: i=1; AFNElJ+ogXtoquxYjlPOHnqyoHKcE4TlO8Ad2cmCSz1YjCqYdGUAasbbG/u7Xf606LUT2RKDI14CwjUnU0sVkw5KMvHu@lists.infradead.org
X-Gm-Message-State: AOJu0YyWdTYFyD93q4JBwl/oUFpbPeLI5/P3oT0uwSVp9XJ5SeuFOeyM
	eQTXR27/GSrvobka8t8lFNOvnH0myUJ8FxR7VjAMAD+4i3QGmUM0UYyQ
X-Gm-Gg: AfdE7cls+MOB7fL+GBhEzTS4OOxs6pEFAL1CVSi81ave2Z5YiCw3fq4OAbuUpl402s9
	n19W+tHIqK6PnPEprJgYruUUWEJJxnU02M6i4eIY24m+a8u2NOWD0AjmCzcx4wLNCH7jJrkCqBM
	UtA1nXkmtg/qrH8wz7VyMk5WiGyo7rathb3McpolGpSK9eMM20wAzSD+COE3BsCtFWc9qKfzzmc
	iaakfu3u2nd2YBzCdewh6HHs8enuHQ6jhuXpKVbX+NHvNMXSj7FI0YTqKsl5GPBljpB9+1uWrfl
	zQ3/lqdgnM/VbBMnIFpOpi+CHM4zi5i8RxcfwHyQy/ISjXBYRyfHExR1gdL2kjijEywO/vgcebq
	e68YHsCGwvY+iC/8Pee56M7GLZ1UBA/WgFay8gfFvAkxwHigEMrJGLtMWwEWZG0eMuVYSbAyGzD
	CarAihWw==
X-Received: by 2002:a17:90b:224d:b0:36d:d8fd:4578 with SMTP id 98e67ed59e1d1-37c93437f61mr2004429a91.11.1781664837535;
        Tue, 16 Jun 2026 19:53:57 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae039sm4334909a91.1.2026.06.16.19.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:53:57 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Fix off-by-one error in HTB rate-limit channel removal
Date: Wed, 17 Jun 2026 10:51:40 +0800
Message-ID: <178166483303.2209640.10761097847073356089@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_195359_024796_CE10940F 
X-CRM114-Status: GOOD (  10.65  )
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

In airoha_tc_remove_htb_queue(), the rate-limit was being cleared
using (queue + 1) instead of queue, causing:
- The original channel rate-limit configuration to remain active
- The next channel to be incorrectly disabled
- Potential out-of-bounds access when queue == 3 (channel 4)

The alloc path (airoha_tc_htb_alloc_leaf_queue) correctly uses
channel (0..3), but the remove path incorrectly added 1.

Fix by using queue directly to match the alloc and rollback paths.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..02807b3967 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2805,7 +2805,7 @@ static void airoha_tc_remove_htb_queue(struct net_device *dev, int queue)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 
 	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
-	airoha_qdma_set_tx_rate_limit(dev, queue + 1, 0, 0);
+	airoha_qdma_set_tx_rate_limit(dev, queue, 0, 0);
 	clear_bit(queue, port->qos_sq_bmap);
 }
 
-- 
2.51.0



