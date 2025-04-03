Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D221C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYpub62Wj/3iZGVbuufafvobpQVv5WnPv4mXzMUeJJg=; b=n0wO6vQB3d0ZkF2rP5spyqriSH
	Wpol0rwgTd5cBtyacQs/ttjRh6Up0MUzSRbpjlt3ZJ5pmKGs87OA+wGzP2ThrKd1+y6x/tNvyCOXE
	oNKRpf73lw1vV82NwD1umbfvXi81elfTzixaCzi8cBMu7eekimM6/ieM8c0Qe0ycBS2F/FJsFDvYL
	risNZN/s78/hTq4ZavmBaxhPlKLwk4nXIHR53c2X3xPwWIGrHE1L8g85w8iLdoplELWwzDb+C4gkx
	t4gg8VzQrqBvmfNABBr17BTqgQZDA/HAP3vnTL/PatOzIDsQ9bcGqhEHckPElZXAEtxjIMg3jaH5D
	DTM5Cj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EZz-000000080vK-0q70;
	Thu, 03 Apr 2025 07:01:35 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ERi-00000007zFa-48tL;
	Thu, 03 Apr 2025 06:53:04 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-ae727e87c26so404618a12.0;
        Wed, 02 Apr 2025 23:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743663182; x=1744267982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYpub62Wj/3iZGVbuufafvobpQVv5WnPv4mXzMUeJJg=;
        b=eZKIxC1uCCwHV3jLGMSij2ZO7eRbSmszZT19NbWIFHuwTjeZ55NRbwEyIaQYFSEHux
         cvaHOW1drEXM8p/Wky3R3/+OZErPGyJBRrjvNQBoGBEqi9uxOb5NzXhk6IYSCAQ6MqfV
         +34USZH/lGvNADXqCnajcPCjBnsFnsvTVCheIuQBfjePyLs8F0QAsrItNAce2iSmaiNR
         w5zHLdgAfPmV/U/k8AH6+2rl5cBC61tNbXJy/rhqM6L1Y8RtbjM7EWWf1FlYNQd5bher
         80X9c5yvE9kR0GgDVeRDkPfN+rs8QInDyVckwMDOw0JGIzlUu9fzCifgMRRI1OwsElol
         rdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663182; x=1744267982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYpub62Wj/3iZGVbuufafvobpQVv5WnPv4mXzMUeJJg=;
        b=BJ9k2eaI82hdj8vOA2dduQNz35jFCxKSsd7w5Z5V39cjE7DWJpjsU2xs584GgmOFe9
         6NYBNaluLoc0VsMCFkp5iZEjtxy7jUTGKppLW1c/afGPvFO+g4X9ZubAQ5/SkjQa3/nD
         jHqO/BRzYryxV/ML8XCUNAWPPsiMyYhUrjv7Fozx8cAulwEdUtxIDU5l57EZNlU30Kir
         Z7DvfrAhBPOJosmSNaJD5a2YyYw0f6emx2d5FyB3qWw/mBZ/azhrW+qD0L1ufW3rR5On
         llvcDCtS3XfESvDT4oLU4+XysX6UlPF0UYs1TsoQBBlqk/BcrrSxv/9eH7CQAl1FwNJs
         /xbw==
X-Forwarded-Encrypted: i=1; AJvYcCUcvK/I0AFslbOY23QKNRBAEqF9u2QWBrsvKafGdXg1idkqQt1OjwieuDS8I35P2RXBglD+nVXGe1XTRAaKB1pN@lists.infradead.org, AJvYcCXkcSPfNEWVdtw29ur3bBML6JmcXXMmcz70ZrvOOaX2PdepSw8VaeGDK1K0VqxCDXHwlJDKQQ058FBeOESoJ6g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVNO8zN2RyRBgV9mEdVhD1gmOHG/0SEv1t9jrezaanIBzMOGjD
	r7CkDY2qtrvhY0qY5I525o3YlofUeQat4nVGIfOpcwdxbqsAqaNE
X-Gm-Gg: ASbGncskQDiiMMslJ36OdhWNtct9LC690imagIpbba9p0oIQpdQjyA+tV/T6FfSqs+3
	/r1xDwTcGrdTozTCv/itSVinvQTb4+5LLU0v98Zz3Jmmuz8kjB+MJ3uuAtG8Hdr55gHnPokZoL5
	k11N2nwBvN75xB34YHeTnm+ObaZEOlnKunqE9um5sJpolXXOaQ6bb3X1Jyw0AP4P6HV5ToTD5Ne
	+0bhj7ifXVk+UIEzTl5W4SM9E1DCPm5v1sSXwutIvUbhHDJXw9xz+1tt9kSNBqJg+0lrbMpyH41
	2774JKAv/b+hoSic7/E1Xw5o9gBmai/dqkZ/nNocYPxiXsgL4gKi7MNpSqXp1+KTGOZuGNE=
X-Google-Smtp-Source: AGHT+IGCE0kTnOZqlcdKdPI+1K7KQk4hgTqPsTiKisFEbAoBuiq5zTXBPIVyS00/eWSAdgWF3j/lhQ==
X-Received: by 2002:a05:6a21:6d8f:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-200f8a6dee2mr2134125637.0.1743663182000;
        Wed, 02 Apr 2025 23:53:02 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cff95sm541118a12.15.2025.04.02.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 23:53:01 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	wiagn233@outlook.com,
	chad@monroe.io,
	bsdhenrymartin@gmail.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1] wifi: mt76: mt7915: Fix null-ptr-deref in mt7915_mmio_wed_init()
Date: Thu,  3 Apr 2025 14:52:51 +0800
Message-Id: <20250403065251.64749-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_235303_046296_EE49E95B 
X-CRM114-Status: UNSURE (   8.72  )
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

Add NULL check after devm_ioremap() to prevent this issue.

Fixes: 4f831d18d12d ("wifi: mt76: mt7915: enable WED RX support")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 876f0692850a..e1f2e32c4bdd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -651,6 +651,8 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 		wed->wlan.base = devm_ioremap(dev->mt76.dev,
 					      pci_resource_start(pci_dev, 0),
 					      pci_resource_len(pci_dev, 0));
+		if (!wed->wlan.base)
+			return -ENOMEM;
 		wed->wlan.phy_base = pci_resource_start(pci_dev, 0);
 		wed->wlan.wpdma_int = pci_resource_start(pci_dev, 0) +
 				      MT_INT_WED_SOURCE_CSR;
@@ -678,6 +680,8 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 		wed->wlan.bus_type = MTK_WED_BUS_AXI;
 		wed->wlan.base = devm_ioremap(dev->mt76.dev, res->start,
 					      resource_size(res));
+		if (!wed->wlan.base)
+			return -ENOMEM;
 		wed->wlan.phy_base = res->start;
 		wed->wlan.wpdma_int = res->start + MT_INT_SOURCE_CSR;
 		wed->wlan.wpdma_mask = res->start + MT_INT_MASK_CSR;
-- 
2.34.1


