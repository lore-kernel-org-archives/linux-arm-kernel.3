Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 00:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pa7DMuZzl2EIMYYyYKxq35O7uGK+xt8eCno9bPDFjZs=; b=PejArMLu3ErmLhs/r2AWYIQpXf
	YaZHT2pdTn3rhWSeAjKXHpWhDxYpKW2rr2k913a7aZj33IculuzyUvnDCPfUg7X8u/7l7xrH8DW2D
	sKqL1HKzltiJm0pC4vTiuOg7l2cHsTPMvpxHGcRjnkjkbCC2sKmHYdOxGE7JhSDCfcyRI5wTf0BoO
	57Agv3J9KpXQTmpXB8yETlbqKvSGx1jQySy10BpTCpCLPLC5hDUDwypyz8q6fDvRXxwFySgGRe0Ps
	mxe2864LECn4aKCnOaTTgayhkugvqWrtkikiniVH2p1VHPT0mJ8QhrrNeXRn59wdMI5fHAEiPJTyX
	6lQ0fOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDuz3-00000006aBT-1MvM;
	Sun, 11 May 2025 00:56:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDux1-00000006a5S-1Zfu;
	Sun, 11 May 2025 00:53:56 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d965c64d53so15258905ab.1;
        Sat, 10 May 2025 17:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746924834; x=1747529634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pa7DMuZzl2EIMYYyYKxq35O7uGK+xt8eCno9bPDFjZs=;
        b=WK27ZhcHduTgJ2Sk74J0fiM0YqUF8+khM7mXbyZMinPEmDS3RpfB/d3do4TJmVCJj7
         PQLq+ggpmar+lD5YX7h7hKk72m2770msWtgwMmKRp+r9IFqJYLSX3VVmvsW5oAkraqCy
         PsoseEgXNmwK1lLSHBKMpd4j4QQwNSeoyyFFmsg5VwNPTiM/IflBDEYjqvAjzIxuJszn
         ecAjmm1fPQLF1fC+CrDfs6yPvQ+tP7EnAKFTH5f27F6HMcO9ufbyiPA8P/Oxu75dH9g8
         zcqZu2T6dC6SAp6DSaze0rAi2KKmfhDQEWCHvujLie7oaCx8oni88mJLvcvJuGMSYhIi
         3kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746924834; x=1747529634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pa7DMuZzl2EIMYYyYKxq35O7uGK+xt8eCno9bPDFjZs=;
        b=flpO28McNqHICB5ahfEPuU/3evifn60XcqSTMfW3EIcET2gqZ4Wbaf0tHmg5X6vR9c
         FmmkXpQnhbVP7nChDfexCN4Ju1QqVlJ20tju9DiTIqrHvzG85l6ORt44OkqKnLQHdfFP
         eUKqe8ZqmuJdm5ZaAFEnfjzL67ws5LisiFmFuW3x3FpF1Q0w2vXvN2sx6uQoJAoJn4a0
         OIAo4VNCj/Da79mZASNd1rQ856sC+nMnZIihEkPvfyUrU0i3FbMt8thKiyC/AcBuCouV
         IX1ZLS0AXVnok83K1O8Ik+kzZ5sNdz/QUrtZv5nMbB8O3XJXgQGM+bGCdbRBt14UXLEM
         W39g==
X-Forwarded-Encrypted: i=1; AJvYcCWZZTEiHJQ7fcn8F3Ik5BKqKOsOBY4+LWQeyoJPO+MfBzWOFaR/5w+sL8AP0JQUgW3zcW9VZicDJrCe1shojPI=@lists.infradead.org, AJvYcCXgPbDvdcSCQyVzFD6FGQrwekfieTKVKN2LDCUlrUoa4MYvas5xDhO2ZaVWoRHNLot8loQ/BwvyIqoFZgbyGzVh@lists.infradead.org
X-Gm-Message-State: AOJu0YwkplfEQ3s87qwv+ArkDLmN7BelD5tIdWR5auMkZ78cAG3JgOis
	IA8kLGkFC8sJ3SQo2JfcTfGDRyEClXKpaIhmvF5VlPfztas8tGWk
X-Gm-Gg: ASbGncvFLjOsJgl06A7RZFXGHOnRRG/k0q6k8kTBoyJq1I3D4IRUqagkgKj/nn5HwJ+
	+yPmxze/nHmj1fmIVHqsSdZ5ETrFBv5eNDMukws2vSn57hCzTl8cauAEOkh05ueu5/muMdxJ3EZ
	gKB5REQQ6H4EFBCT3ntSHcf2abyX2+tdOTADNLYqVGNsDE0hSAllT2gcHAyEsSL8r4jbnC4M5FN
	5KcZJ4g0fH+dMLvDqGDAl+Dn2e20SEM1L9xjd5yR/ePyejt/VdN5sSboktRCcQ4rxePVWGxcdg2
	PR6NpjSWPGJJr/Gfx1vBdqTiBcRNPqnv+3PxhE/9D90lIvUydnN195sIS+y3+4D9DkKel9vVYGf
	nOF/7ZMfVjHXZL90RDdf+3HV9ZXkSmOF9NWc/LvonsnPxaMo=
X-Google-Smtp-Source: AGHT+IGEQzPqFW2zBqw6OV63v5ytbUdgLh5lo5yyZnTnsFyes2HBpCZ9g5H+1HLo0WORfxLp+t9xCw==
X-Received: by 2002:a05:6e02:3c81:b0:3cf:bc71:94f5 with SMTP id e9e14a558f8ab-3da7e2174a8mr113697555ab.22.1746924833664;
        Sat, 10 May 2025 17:53:53 -0700 (PDT)
Received: from localhost.localdomain (2605-4A80-B00B-5AD0-0-FF-FE00-0-dynamic.midco.net. [2605:4a80:b00b:5ad0:0:ff:fe00:0])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224de1c4sm1001724173.37.2025.05.10.17.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 17:53:52 -0700 (PDT)
From: Samuel Williams <sam8641@gmail.com>
To: 
Cc: sam8641@gmail.com,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	David Ruth <druth@chromium.org>,
	Allan Wang <allan.wang@mediatek.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Leon Yen <leon.yen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7921: add 160 MHz AP for mt7922 device
Date: Sat, 10 May 2025 19:53:09 -0500
Message-ID: <20250511005316.1118961-1-sam8641@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_175355_438599_24173035 
X-CRM114-Status: UNSURE (   9.00  )
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

This allows mt7922 in hostapd mode to transmit up to 1.4 Gbps.

Signed-off-by: Samuel Williams <sam8641@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 826c48a2ee69..1fffa43379b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -83,6 +83,11 @@ mt7921_init_he_caps(struct mt792x_phy *phy, enum nl80211_band band,
 			he_cap_elem->phy_cap_info[9] |=
 				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
 				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
+
+			if (is_mt7922(phy->mt76->dev)) {
+				he_cap_elem->phy_cap_info[0] |=
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
+			}
 			break;
 		case NL80211_IFTYPE_STATION:
 			he_cap_elem->mac_cap_info[1] |=
-- 
2.47.2


