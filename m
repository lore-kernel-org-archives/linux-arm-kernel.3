Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A7BCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JsNwyh+KeC3nDRQIncNAKnYy51JDR11+Uff9rlShFdQ=; b=GYfJiRAONMm9CClZ01BoU3WLVl
	shAXiQ6o+HvCQMXUQMaF6klffj7JBwCB/WtwvT82jug5tJNCrvfoHqIe4bCYRoAI71DkrgSHXhbeH
	1R7fwQzidNn2rn6yn7fn0AkzDDyNgMCgSC5npUX+wIJXfSCi2FrBJQWegTndrXC/YnjmNm2TE29RL
	g6zKjKlvPuh4a2eGOm7OnvyVptGV19UpZMEBK/+9FjGodIH2BVd40p0iellxE/YbqKadmn6glHwpg
	6Y4DBNoYuuNGvWSHZOov1YXCpn7C2p5Rc8Yioo31ugAG8pdY5t0oFoNcNP53PGk6Wtf96rUUMqsNp
	06M9kKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRP0-0000000Fd24-1CWo;
	Tue, 16 Jun 2026 10:52:18 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZROw-0000000Fd0q-38CC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:52:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0b944f6edso44761915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607134; x=1782211934; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JsNwyh+KeC3nDRQIncNAKnYy51JDR11+Uff9rlShFdQ=;
        b=n0NKBeuiBo770cJJdqHYeJgLVTa/qrXNuAyghy+gR7L4fjW1yjUyaCutz1pBB7Bhlv
         BLoS82ogmeg1G3agBb6ipqyyzBSxZcOnr3fpSxXO59TEfWRQY2ij6AYqt2Th1JPRxTUK
         ON6rxN5ISA0yiqrVTWOMh0kbobsWNbhGeUbUEH0aEA4guSmhUxBdT5AbaIX9g5gzople
         rDd22qASZXHm20DRUOL5nvru0aoMMTJNxMHBfdERwVw3vKsu6VAUQfwhPm4me85FHyn+
         7ShZtt99RvIz9dyq+UwDd5yME0PIqPf6HCQyRvW2yQfb8osjv42NLCnLOf8kWQWZaOt9
         4RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607134; x=1782211934;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsNwyh+KeC3nDRQIncNAKnYy51JDR11+Uff9rlShFdQ=;
        b=HG541smSdtbC+e+Vus0qXvkj4qpk2RSPnQPaHxAasmtbJraeV8i11HC9/GckFxs+1u
         14Nr0jxM0hWKNVBftX75SVC2jYso1b2mjXi/JAj1ZG+GOMinKMTJgm3RCliG6AGfY5Xi
         dSTM9Gjq9yj1b2CmLH9SoQfoPCHS0OGdIz39+OPGEeIQ8ZH6hxY66z7LF1bag9GcjDE/
         9ht2fJLBHPOfDaOwSgnu1GQxKaLczcU+w08jWLRqEa66T3YT/1o+6YG+w0hbsTW6Knyv
         186YsEJa3/7oE/SPepOzy+rExQ3cSCTfnCCANUGiMcv63qIiSqWPtVCyQr5SA5n6EPKY
         m50g==
X-Forwarded-Encrypted: i=1; AFNElJ++PpIuLVxd3Fcoh2LqwQOn/BjxlXUIj4wazfA1JIi9BtfeUtMJeTjGSdZUryTk1aP53HaCL9MhJJ38azzjzJBA@lists.infradead.org
X-Gm-Message-State: AOJu0YzjrxFUa/ylGaFyRhJiCax65KLLfiK02KcmSAY73MdUzBuXWR8D
	xDCxe6ZFdUwzEhC6HKH/DixB1tTocl26QrrHS4v+wMFhD3jAJShnvmcU
X-Gm-Gg: Acq92OFNGl8UCE8w0UyieC4eUDo39y6lp5xL8/DENvvfRdWX5ZMCYLguniYPUlzEuKa
	WNFDGGXtiNCOQNg9h3HPeBsP1o9cY+w23CvohpWt2tLKezj0YR34u+cJAzFf4fQ3CKb4hXNJRgJ
	kDPAsbCI2sMLsGgG3KTY/wHLf/K1uQIQiAJhXg99yfdrQR52FnfXsH1d+9QDxdIjKZoCwbuspa6
	gGHEI8Hx5Nxhy9cpAGRrP3755w8zX/0ZNKM97UtasxzzhnKdnGtV6YxQ57cITlktP38zBmhqLYi
	qPLg28gNbQxwH1n6wxH0bIvHIyX9mVjq2noGgyDKhyB1A+HGwY+pwl2y8nyKw9LROgl7ops7An3
	szmS3PPoetibFqtp7pIh8GhxE3MbTUnYpm2g04nZcmvubvj5mM8bNOcpIa391cR/QH2yjKPjan2
	P9b7dvkncBYEtR1Yl/pKYGRAtTJGs=
X-Received: by 2002:a17:902:e790:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c66424305emr154961485ad.17.1781607133919;
        Tue, 16 Jun 2026 03:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5535sm130371465ad.18.2026.06.16.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:52:13 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Fix QoS counter configuration for Tx-fwd channels
Date: Tue, 16 Jun 2026 18:50:29 +0800
Message-ID: <178160712947.2156222.3765685889775458986@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035214_804082_2BFCF3FD 
X-CRM114-Status: GOOD (  10.20  )
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

In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
using register index (i << 1) instead of ((i << 1) + 1). This caused
the Tx-fwd configuration to overwrite the Tx-cpu configuration for
each QoS channel, resulting in incorrect QoS statistics.

Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
counter configuration.

Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..329988a840 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoha_qdma *qdma)
 			       FIELD_PREP(CNTR_CHAN_MASK, i));
 		/* Tx-fwd transferred count */
 		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
-		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
+		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
 			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
 			       CNTR_ALL_DSCP_RING_EN_MASK |
 			       FIELD_PREP(CNTR_SRC_MASK, 1) |
-- 
2.51.0



