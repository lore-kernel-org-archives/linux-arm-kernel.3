Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02256C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ykrR7iAx9ez7r09+03/1ZkDbNGh2pKfyFPnmAhHSaXs=; b=0AakaYd6aXy3km73JMucNRgOc3
	o58nQisrwMrrJ1T0w81aNH4GHItGopSnQcGlcxdL1QwU0XbbnkQzqhn92lBjEy+R+tYXfPaMbRCtl
	bggci/vO2tEEBc3iFUiRLor5dSbvXw2Hpg2okrKTjrspqrAk559H0AVnoLLMG8VC7TSAuD2BT47BR
	AtXZFJemn00Gd1x4vJLwmIaI392R23LE/Q3jZtnAz6VZzIQRbMMU0OPOdIyR2fCC+hk8nHxJSzIzG
	CAbdmu4DdUOX8xwFJvcszmejFMFecVo4DOGbdGKBhntnTy8M/GP6cs5ltAr3wi9ZxQ5HUUrAxyQA6
	c5TnGTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EMe-00000007yLp-3e8V;
	Thu, 03 Apr 2025 06:47:48 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EIz-00000007xqf-3wZZ;
	Thu, 03 Apr 2025 06:44:04 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-af590aea813so862247a12.0;
        Wed, 02 Apr 2025 23:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743662641; x=1744267441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykrR7iAx9ez7r09+03/1ZkDbNGh2pKfyFPnmAhHSaXs=;
        b=BPEehj5qLN8wOjawegF+G7ZzYb+m4Ya1Qzb2YlrreQZUw+eZjZNic/C0y9oHAV+Kpz
         IoRxN2qPbA0bEneCQeYDwdIZqOfWKomOiMJ+JfrtXqsFOgMVtWwNcrSaggntbvvjlGfN
         q6LKzN3SRZv2O21X6wRLNaAgXnCIsX7MGSxodVIvxFZPjlxDROvFgIU3monEYNGfvxdA
         mB+XdMhJ03b4W+ZTMRyE/c3fdsqvQgElHZTK1ohSu+MWMJbN73ILUJHmo8gRwyBpZ63X
         vyViVQI36nYYnRiWm1amhmgUlN4xIY/2UrbEsUgKSTdhuHpfSfyOLx4Bo0zoebsCgF4N
         vYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743662641; x=1744267441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykrR7iAx9ez7r09+03/1ZkDbNGh2pKfyFPnmAhHSaXs=;
        b=KYLYFS1NRpn2r5LCeHc8qS5JWitNJxfbu/RkS9Whf9mB22NCVqZaeyItE2pU08Wc+s
         D8tpMAJHMayneujF1skW87F5fsQzI06vth9jIFANj6tvLCQbr0ZGH/jPi33HgQg//mSh
         fSyJFVlXw4wLR9kpKjOZDPGDpwJUbX6NF4k27UbAEMl5JnSp2wybTfasjiq+cHq8xYdf
         rp47Sqer4Ky2J5HBnhAGKdjlJiHFyyi/AzOerW+CKPHDw0eL/4fny0Sv+ZLPEFufRbHT
         JjlriPgLRTTh4AnBsnqZFHy5UiTNJ3G0QATSs43iec39DW1B3t+7GKBOH5/gDR9GtoEE
         ndbw==
X-Forwarded-Encrypted: i=1; AJvYcCV+q+KZPj4xfqB0Z8o+kCzJ+Le3mnyfBe/PR0zFvd1ADsPiytqXX8R+FHHuliO0x842cVSicdw9uKE/5fsMxtzC@lists.infradead.org, AJvYcCX9s03G2H7sam89N3Fxz/NZbvZjEyc91FezqOTZONuGMadAmGczqc9ORPqEbgxu/Qhsi3BtKNwhVSbY97cIynU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjN11nV24nvWVURIWIHOZrDfEeFm+tK4FwyOU1Neru29t7eC9i
	x0QpImKevIUQ5MK4DJojPSM35Nk+mDK+GFGM17T5M4623sEpy5K6
X-Gm-Gg: ASbGncuZBBjyXDuA+VnbZpxSoNgumlfbhXnO305q63Ex4b8dd9nyYMoCZiaJPlAuQhJ
	BVqbHZKo9DL/unW2J56JlcOob7ZeUuTJ66OQQ7nTLQU6jwozk5/fYyb0MoVvaMo6f5hs45wLdBQ
	1tT08XXrH1DTRKISLwpdl3EuYBtCI5OM2jLUz2Oto5EnYjjO/fR22z0k7bgpeZ/cnJLCg0/cJRN
	r+HdEU4brlmMzKEhHHTjmmZjfeH5iHPk75dpW1i6dpbaoq9xwztOI3oJscfxryqKCl0LP6foO38
	TZlfiAKGDrX2cRwH84Ub7MigM9jN0I56p5+9r2816ls7lJSO2ZRo24oZwWCx28dtQeVCXMo=
X-Google-Smtp-Source: AGHT+IG83pAigN0u9fFp1U+1mHdp8ie0G+EShwD4mUh/8O4s3BJGqBMlbGS+xQCeTPBm2I+l1DLKGA==
X-Received: by 2002:a17:903:3d04:b0:215:b1e3:c051 with SMTP id d9443c01a7336-229765eb309mr33330915ad.11.1743662640547;
        Wed, 02 Apr 2025 23:44:00 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c3819sm7055945ad.87.2025.04.02.23.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 23:44:00 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wiagn233@outlook.com,
	rex.lu@mediatek.com,
	chui-hao.chiu@mediatek.com,
	bsdhenrymartin@gmail.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1] wifi: mt76: mt7996: Fix null-ptr-deref in mt7996_mmio_wed_init()
Date: Thu,  3 Apr 2025 14:43:44 +0800
Message-Id: <20250403064344.64253-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_234401_976614_E964B013 
X-CRM114-Status: UNSURE (   8.64  )
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

devm_ioremap() returns NULL on error. Currently, mt7996_mmio_wed_init()
does not check for this case, which results in a NULL pointer
dereference.

Add NULL check after devm_ioremap() to prevent this issue.

Fixes: 83eafc9251d6 ("wifi: mt76: mt7996: add wed tx support")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 13b188e281bd..5bade83238bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -323,6 +323,8 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, void *pdev_ptr,
 	wed->wlan.base = devm_ioremap(dev->mt76.dev,
 				      pci_resource_start(pci_dev, 0),
 				      pci_resource_len(pci_dev, 0));
+	if (!wed->wlan.base)
+		return -ENOMEM;
 	wed->wlan.phy_base = pci_resource_start(pci_dev, 0);
 
 	if (hif2) {
-- 
2.34.1


