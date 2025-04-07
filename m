Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA71BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7dFXeq2CgWYu3KZ9DVuWvCtQbxPHL6sdTWZtnaoyOKs=; b=D0wwMYLgkIcDSsRxEe7SKAn0IW
	WHBJ7k7TPv4QOHGnOjuX8SGpq4EdoWFyNjRuOyKrmTTDxanFJZ5U3BcTCLh537Zo1kC+hm/9GuoWC
	24zhk7Gdge938AQ4vZb+OEZ29lqTuuUarSXJ33uN82rQO+Gpoywq8bxUHKi0t8XKsqHRxASRJ37fC
	dW9lIIelIC3ZDcIflUlNkyzIX7BDU9YHZ6stMiZXqEntHqbSx8Z0J5jY6IitfvKQNVcVp0UP2rR3w
	LKM3/rMChdRUEQQrJnMuBI4QvtCD9lIMmfl5mK4oC6YmTPGvEVeBfT57LteKUhbZ0FLfBrASgbW16
	+YszjEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fqy-0000000GYbM-3BOA;
	Mon, 07 Apr 2025 06:21:04 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fpD-0000000GYOJ-1Mrv;
	Mon, 07 Apr 2025 06:19:16 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso2846439a91.1;
        Sun, 06 Apr 2025 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744006754; x=1744611554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dFXeq2CgWYu3KZ9DVuWvCtQbxPHL6sdTWZtnaoyOKs=;
        b=hkeLd+jK3ITm8M6lYYKWbr553k0P1Jy2PPtI1trZzSVQ6L5pXRY4x18WzBgeeiExoY
         4tkDocp1A8+XXuknZrmVDmADKGew+qZBPwRaIyPReb0hQ99F7F/09svULzVVgNZU14Zo
         RkCJCGGzoT/OJ5a7JUO3wE0qOgi410a9+VgI1LqK5fIbIey01nQ2pqwVbHj72Mq2rr5V
         ac1SaVwLQnfAkU1YptTdTfEyQSQ35v7kIKAAeZnZ8PphiKtl/7e9mdilVvlSHmE0UOtJ
         ZIppcLLKynzrfYw2SGfWFXmtkMxU+1Tu5Q1uSzT24IynN7AZjTP/B1Gzp3xiAAJXUOjd
         t8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744006754; x=1744611554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dFXeq2CgWYu3KZ9DVuWvCtQbxPHL6sdTWZtnaoyOKs=;
        b=AVlQTZM5wiNru8oFOWh+MTAXKkIed19U9lBobdneAVBRBRo/NNDtXiohwJgQvIlx/h
         dGnD0sJxMJNFZA/bhxMKYjUonV6Idl7Dek0u4VD1ckqDD0NRPM5I6tW0L+1GDn/6yfsD
         hBMQUo2K80OJtganbuuC3kI1WUxvXnKuVtF3jAQRuVy705gfzL56rKksZCwRTn22eACu
         Qk2fH0hpqdXKRIn9rrJdkL1MGi8OWDOcRUZ2GlZ/rK40G57f/BR6qOaNnE6Z2ZgjwkxC
         KDQla8UHv2BLl6yYkiPVAACOEznA4+nbrN25vuuV521IldR6IDhFuI9pmegqNN2u8gzz
         2bdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwTg9yPfuSPx5wnclyqLPLnmVwEw0iMfvmPkb2W1YGVTid/WoLhf5n+uxzC2bGiibxpUXPP5PRz6pyyha1h8o=@lists.infradead.org, AJvYcCWVyFQHHqvyHRO0zOCbozUU0fRKE0KJRPVcTP1iJpB8mOPWe0UpdHZooCdscYOP0HOUxsjfBZn2LmdeKqo9mc38@lists.infradead.org
X-Gm-Message-State: AOJu0YwvnWmYqQ/FKPmZM3FTQsenSL17FC81J2mccu9v5pN4U6fFRF6b
	YM2whZkR9x3OEKxJJoHjKMwXxkXBIzXHAAJAkoH0IeiNJ3iwdzRO
X-Gm-Gg: ASbGncveJ6EXtVfiRZV0jnJSIgf5PNgpyfNa5ky7P6UHX4ed3ejWyDDs7UdSaiuas2U
	GUavAZi9KEJ9pptimWX7BhEJfcEeExmhTNRwxV+Es633kbTv2pvIuoN4m1p9j9aFxujKWwIsew4
	J2rnpVjTat1+Bzql4A4lybwAwejKUodxQ5uaR1q9XB45UHgqsa2fDYpeCPMSsnS8d+oZOepbOqp
	vPbnEjllve3d8rkRRS++ioaCy32j2SB/ZNaoKxNkyBwucVEw4HrIyIwOD1aMsonoT4PjCI3gYqm
	cUjQUxF+mpT0FDZp0HZsEb4sX/b7sAdLnx7fn+eL6wEk62unbq374rSlMeiftSfOT1E06FI=
X-Google-Smtp-Source: AGHT+IHeXC09XSFChpRb9qXhzMWyzY1i/YN7qCwEDFJ4TLe1zHG3OW/lwBLze1CQACFTsx9I7iunWw==
X-Received: by 2002:a17:90a:d450:b0:2ff:5357:1c7e with SMTP id 98e67ed59e1d1-306a48a4b94mr15463045a91.20.1744006754416;
        Sun, 06 Apr 2025 23:19:14 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9cfbsm7967837a91.31.2025.04.06.23.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:19:13 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] wifi: mt76: mt7915: Fix null-ptr-deref in mt7915_mmio_wed_init()
Date: Mon,  7 Apr 2025 14:19:00 +0800
Message-Id: <20250407061900.85317-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_231915_364649_D889063B 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

devm_ioremap() returns NULL on error. Currently, mt7915_mmio_wed_init()
does not check for this case, which results in a NULL pointer
dereference.

Prevent null pointer dereference in mt7915_mmio_wed_init().

Fixes: 4f831d18d12d ("wifi: mt76: mt7915: enable WED RX support")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Add a blank line after each test and correct commit message.

 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 876f0692850a..9c4d5cea0c42 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -651,6 +651,9 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 		wed->wlan.base = devm_ioremap(dev->mt76.dev,
 					      pci_resource_start(pci_dev, 0),
 					      pci_resource_len(pci_dev, 0));
+		if (!wed->wlan.base)
+			return -ENOMEM;
+
 		wed->wlan.phy_base = pci_resource_start(pci_dev, 0);
 		wed->wlan.wpdma_int = pci_resource_start(pci_dev, 0) +
 				      MT_INT_WED_SOURCE_CSR;
@@ -678,6 +681,9 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 		wed->wlan.bus_type = MTK_WED_BUS_AXI;
 		wed->wlan.base = devm_ioremap(dev->mt76.dev, res->start,
 					      resource_size(res));
+		if (!wed->wlan.base)
+			return -ENOMEM;
+
 		wed->wlan.phy_base = res->start;
 		wed->wlan.wpdma_int = res->start + MT_INT_SOURCE_CSR;
 		wed->wlan.wpdma_mask = res->start + MT_INT_MASK_CSR;
-- 
2.34.1


