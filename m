Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8409CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAm1lQ7yhd4gX3+khTjc4usVeRGoKvzZrc6QCVuO7II=; b=Rrdj0WNSHSv9ssWZye93h4YTcA
	mtF3vDoO23mrwZfAkuPjKUdfq03rwyFYPcjyEB4kg/cTcpT4Ow4cHmsic2pLBlgdSBixFln2XfQZz
	8b946aAmatA1htuV/41ObA9UyMJY3C04ShZpPnwu7gsUvyY23U+VIyNLIfr+4QIAYsIpWYniq+hIG
	yePI1Z2IMj9qefsQlEJgzmf7bPR1KRCMax6P+W40loqyUqgxBbUingxvpW9Ae7GLlqHnKEnA9Jljq
	RyKF3rYep+Unf6GAM4if0UsC51tLxAa9m+MoCcyUL5V6D1snJmGZzuje+izMrwy1nO45FVR+XD24S
	yGRS9ROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRUP-0000000Fe7H-1Htq;
	Tue, 16 Jun 2026 10:57:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRUN-0000000Fe6W-02us
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:57:52 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so2804547a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607470; x=1782212270; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAm1lQ7yhd4gX3+khTjc4usVeRGoKvzZrc6QCVuO7II=;
        b=SeBBTPKRZUzmLVfj+OwRmiI778wkirsRDY8LzFpkUmMEw9pl43p3rF6eeGifMW4cRt
         8R8VWoB/CXr/fYnjstrIBATPtaQhYUJ800KO6PFS0T865qWg31lF3YgBdCpIc1p98eFF
         4iKSj2+wpazmx2DHmhVkY0fNV7zGR7slUv1v/8iW5gdCByo1IQhOA4fuWFWTJ0j2Vs6O
         1Y7jX8c8IieydywD0OdZIiUu8i1neIVn+43Xp8qxZhLt9n8EiS0e5lD9rzSmr46C2TRJ
         nmng0EwE71QWZt+VDFk6vCn+9gs8R3PTZuk1+V5Mi4x8LorrSfItXv6/DTIwx7efABsZ
         PqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607470; x=1782212270;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAm1lQ7yhd4gX3+khTjc4usVeRGoKvzZrc6QCVuO7II=;
        b=F97O3EZcjDtGeu8JXSA7VqjgVfpniqk4TZ33Y4c6O4vxUrVLmj/C3P+4cwCK1lCTzI
         Rhs7j5YOubgTBT3soiXAtNAFdz6FM3d03D4795PBsYZ/6i7p0RIQuqqxdCqK5P76av7C
         zjvB8RiLEkPg+LuRnZNGs7CM2VOCGIN/lwc5mQdf8UU0/6YjpG5jRj86A53R0IWHtz8A
         eWZ2CS8EphCvX3bPVNELD5q8aJ0AxBYjQ9o4kdxxmAODxNPyuC2nqwxE1r1BKVsYKlNl
         3Tgo0J2mAC9/WznNgtniOgkkgGZRpR6hYJnwOeAzCBbWzA1nFmhaIBNvqzq5p6HysGVS
         j5pg==
X-Forwarded-Encrypted: i=1; AFNElJ9RtbvlUP0kEYnDkDXV5dxXXYSj8XvIAgmQXyyNBZknUBHAKWNVlEYvF9kZlgjKdMIVvW6dhgw6bv3edU5APGGB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/+Ki7oiEbI70ZMZN9DFZbhaN+TRWrLEc6SIhOLF2e2xO8ysWz
	MtEC3npjLEUcWFaTCkmilMKyz8DvniGpBy0rRxehNHA7yBl7cTFvHgwk
X-Gm-Gg: Acq92OEDiODacVLbRe+mMEyXrlnleTISdIB5jCNX3bvPdZOpyM2tBZHRP3rcv+bmKrG
	1Vw7yq24lAPrJ7y5n3yl8CTBGegWvCbWdY2aVK75wR8Jlnq4l9/co3QbumCehUDMUJILvVX/4Pp
	MnCbMHiCY2l5xmZledqoQZ4hsnrFpukPDE0exbxRbmONPB9fJEmGERfwWKtkgksbgVLJmjchock
	KOAiu8zjCQDq+WKhKNNQ6J/6I8Scj71587v3G5PYV+56lAG0rAnGa+Nz1aZ1tgBaSiabwVnudit
	kmNf31f308iu+y/b1qUqVZloxPKUuM+ohl5ig94HdRN348LOtI8y1FXa5rYaiXVkt09NZ+l6cDs
	cru5NYkShHOOePi15eAD60EcoJNmyakCY7vNsSFMKBGMfAJ4DV+cT6vijOvCaAEOfBfBXcNXrBp
	C1WJ/bLRc8b8C1/jirDwPRD5qYDfs=
X-Received: by 2002:a17:90b:1fc7:b0:36d:633a:e8aa with SMTP id 98e67ed59e1d1-37c528e0095mr3107649a91.13.1781607470166;
        Tue, 16 Jun 2026 03:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e79396d7sm9849057a91.1.2026.06.16.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:57:49 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Clean up RX queues in airoha_dev_stop
Date: Tue, 16 Jun 2026 18:50:48 +0800
Message-ID: <178160746585.2156302.190868309474762875@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035751_044604_CB17B5DD 
X-CRM114-Status: GOOD (  10.82  )
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

When the last port is stopped, airoha_dev_stop() clears TX queues
but neglects to clean up RX queues. This can lead to:
- RX ring buffer descriptors remaining valid after device close
- Potential DMA synchronization issues on device reopen
- Risk of use-after-free if pages are freed while DMA is still active

Add cleanup loop for RX queues to mirror the TX queue cleanup,
ensuring symmetric resource management.

Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..9ca5bbf64d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1771,6 +1771,13 @@ static int airoha_dev_stop(struct net_device *dev)
 
 			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
 		}
+
+		for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+			if (!qdma->q_rx[i].ndesc)
+				continue;
+
+			airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
+		}
 	}
 
 	return 0;
-- 
2.51.0



