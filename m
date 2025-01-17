Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6596C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pWEO4mXmrgX9A+rahUTkZPxpsEQKDRWEFh1XmmPE8bg=; b=f9ImrBkPi7TAwZe9H4/kpJPHBd
	wzKc+fd8JJldBdIvs2lIu5upSGsIi9tee3e+n5lNCL1L2plNI8bEu7NeB9/AWLtxq3GGZyH7ZxfzW
	SsymNhJ2H9TxDXkEWc8CdEg0ry1N9mWi5KsmDx3/bsuG1oJDdZRV66TqCth6R97GXsOKghs3BCD4m
	nf8Xe7B/K33Zt8owQoZR2Bxos/lcTEOh4B5JoyrF3ErENlXdtLfV23cCvUqnGs9DCQMm3Eh9T8QjH
	5ploSv6JWuAyg3rlLzx8ECVxoRDR+VVTShXPh2LtXQi8A+14wFIpLHuNZYuqafTtUwMuvZBKxn0Lt
	GVe41X9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYogR-00000000gfJ-3pu3;
	Fri, 17 Jan 2025 15:54:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYofA-00000000gSO-3BzD;
	Fri, 17 Jan 2025 15:53:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3863494591bso1206774f8f.1;
        Fri, 17 Jan 2025 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737129215; x=1737734015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWEO4mXmrgX9A+rahUTkZPxpsEQKDRWEFh1XmmPE8bg=;
        b=lfPDSvMpRzOJlhzzewDIKHuhAQ5yslRACtnuUe6TOTFmQYqXLe85bm8ULaRdKlxsDz
         coRoSQMbUpG5W4MlQN7PpzC0F/i2SJBtxMlEhZLI+TZFV/hGQEGxhKyRlx5ThSbPKl6M
         rvfsQvt/VgbqszMUmocmo6iNPzsOs4FmUDVIAd6QMFqDlyYzvTDRjpFPOm2WiesVg+p+
         zj75ECcPvgi/WkPLDP5Wq1YtPRabtUc4N/bKLEyqcfgNX1U+tKo683Sq3WeriDasHLYI
         3PZEUoEUB7eDFFXwp7ALN1zyDXNSwHiDEvq4oXpwk5fFIN1opoPQE3Glt/lVSVQljiCH
         99uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129215; x=1737734015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWEO4mXmrgX9A+rahUTkZPxpsEQKDRWEFh1XmmPE8bg=;
        b=W0vstfRjcG1xG112DwX8DI4eSYLk5tVokOpgby6kE438ihh1Oz+Kqsy2QdeUzBdixn
         VolEah46FiBchkxSy0gweWXX0441EOeUpnFXiPBVWV4VjWGT8dBNUl4rF+X/8vgmwbC1
         fNKD9AKtDADYR9TI0ZU7f6wBH1bQg43szP9sUbpdooWkjI55bj/DoJWGCHuENxYiw2rC
         vURHEW6akUeLJ6DJHIH5qYgPnNKuL64YKRnu2vFhLCeNFSB86ZK7+gYSIQSShXO6+0w5
         zUzzMDWsKK8mYG5QO/2/j1EbZI2C5i/Ca6HxdIHp+A86yoBoR4NXtT0pcZXpFiv5LsMl
         DJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCUhcYgAQL+hwYDVntVBgYUPSzPY0x0RUMcrlY6N7l1tbxXsQBo9TWm/ZEZjH3g6cP91eFGmkHNJrSH6dQeKqbBU@lists.infradead.org, AJvYcCV/GYucbZCcVMy+BTYxgwO4kbg/q33ePdYQDgquUbFpa/+0nriGiLRDwlxYC4LyeLOMWmPRGLKgWZaoiWKeHKo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgNs1K1icIA5wIhF0ImWM6ZajYYxbVnWOVZSw8ekOWUvYhnuHh
	ynSO6SoNl9GMxdrKOI9H7P6z81KD4CJW5Sj3qqzYWRs1FMrY+m/h
X-Gm-Gg: ASbGncsUYzij0kdGtuekpxFabfkeXtX9uOwuIm/KBhyuLdKGIIS34Eq+fVvA4wQkNQ6
	dslzPRLRb9n/5yoRKCbZ5mEsYYiMoYH/U9VSRv6j2Pfv3aZ1m1gbuNDSpZJ6pJ3MW6kOv2JRFIv
	4sLrMxJ4lEt18rmo7/7v/nSskb7q8VT3yvdy4u4SAfvfLGAcs4ySWg06P+mF6zzSpUykyPRhz4d
	lAoSuS/u/EufH8JMwHuoMW7el143llN+vZ3eDmIZNpdRMybSN9/slXN6+8Oqi3yzEnPfNWaVO95
	nQyZ8zxgBt0dLOX8Ng3OUkpIgg==
X-Google-Smtp-Source: AGHT+IGNGiONpxV+GF6eyRmRWscmpLkuIBdAedL5zi2YGx6prpKmmwhZLampYCznTsZBL5ObecUgjg==
X-Received: by 2002:a5d:5848:0:b0:38b:dbf0:34f2 with SMTP id ffacd0b85a97d-38bf59f03c7mr3119509f8f.52.1737129214512;
        Fri, 17 Jan 2025 07:53:34 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf32758dbsm2854779f8f.64.2025.01.17.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:53:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net PATCH] net: airoha: Fix wrong GDM4 register definition
Date: Fri, 17 Jan 2025 16:52:39 +0100
Message-ID: <20250117155257.19263-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075336_796176_3D846B7E 
X-CRM114-Status: GOOD (  13.17  )
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

Fix wrong GDM4 register definition, in Airoha SDK GDM4 is defined at
offset 0x2400 but this doesn't make sense as it does conflict with the
CDM4 that is in the same location.

Following the pattern where each GDM base is at the FWD_CFG, currently
GDM4 base offset is set to 0x2500. This is correct but REG_GDM4_FWD_CFG
and REG_GDM4_SRC_PORT_SET are still using the SDK reference with the
0x2400 offset. Fix these 2 define by subtracting 0x100 to each register
to reflect the real address location.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/mediatek/airoha_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_regs.h b/drivers/net/ethernet/mediatek/airoha_regs.h
index e448b66b5334..30c96f679735 100644
--- a/drivers/net/ethernet/mediatek/airoha_regs.h
+++ b/drivers/net/ethernet/mediatek/airoha_regs.h
@@ -249,11 +249,11 @@
 #define REG_GDM3_FWD_CFG		GDM3_BASE
 #define GDM3_PAD_EN_MASK		BIT(28)
 
-#define REG_GDM4_FWD_CFG		(GDM4_BASE + 0x100)
+#define REG_GDM4_FWD_CFG		GDM4_BASE
 #define GDM4_PAD_EN_MASK		BIT(28)
 #define GDM4_SPORT_OFFSET0_MASK		GENMASK(11, 8)
 
-#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x33c)
+#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x23c)
 #define GDM4_SPORT_OFF2_MASK		GENMASK(19, 16)
 #define GDM4_SPORT_OFF1_MASK		GENMASK(15, 12)
 #define GDM4_SPORT_OFF0_MASK		GENMASK(11, 8)
-- 
2.47.1


