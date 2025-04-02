Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA0C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 06:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OHAwMDUNKa/KS67Igj5f0vS6OHnJzwpFGFxB/aQLDIE=; b=T1M52bKTieH60echZUlBJd8p8y
	0wWGRBhCBbntkRw8Os3mdiv1J7wTD04A6AsoYYcXprPV8n1zXtaZbPpRK8U0Wdghma3UnPVZV4ueI
	umzEW9iOSNW/jcAUSsLQwbT6hisNV9BAjj5Gw2nfE47iV7G/SvE2ZLeUBnlPX5GiXEMBBT1Aol711
	df+q08yXeiOtd56R8nXX13Z1UPSO3LlRKFYiDssnpG1wE8QW0RAGWY/EqcPrDiuq9MiEEXfoVM2kR
	6TfiRAE0zoW5v4SIIyovXS+6c8OmeE0RV4bHeKfbyXmlvUXP1UIU1roLwMyJE4lHFXtDpE7/20G8U
	x2RyLfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrYM-00000005FAe-255U;
	Wed, 02 Apr 2025 06:26:22 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrWZ-00000005F3R-2ApB;
	Wed, 02 Apr 2025 06:24:34 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301493f461eso8142306a91.3;
        Tue, 01 Apr 2025 23:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575070; x=1744179870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHAwMDUNKa/KS67Igj5f0vS6OHnJzwpFGFxB/aQLDIE=;
        b=pbag9QzJ44om9jaxHPFff1xNjts22TVyCsGu8UhLaSLJkde+mXy0QfixtcbF9rSxor
         vZwSgAvtwypLugml8tOJLdCSDYotsOvfVwd0orIpQUDhGJ3A7C6IXvGVv4Zb/hOaCf1M
         YIepASkgV5fyu356yqt4wCTXXifZ84U6j++gBv99uPhAKfl6gJYWQ9son7nHB+NOvifa
         /ADSKG7/jCleIJKLXDV0KyuLhFtEk0ueQv0l/ARoSZIdb40PJudVQr1OHedrCJpxdxuk
         0MixNyghbCFgQfXdvUswJsOgs89xy9KKD+uWAQDVXkB9iUNFQPn/ZNYiwU3FIGW5nhaZ
         vIZA==
X-Forwarded-Encrypted: i=1; AJvYcCVRwXkwCec1oc2z/2F910bE+rM35ymgGP1BcfJ9Ym1lB9BRJnt5fxOR+STYwtT99CV9wKLD9+33CtqjMX9Z1t7Z@lists.infradead.org, AJvYcCWQ4dbH4yeXfih03wwKP/azvT8ovsn8ZncFQ029oWwSrmqzBW2kOhBfyOsyJ3A5bXARHvAbAgQpxBWG/E/Vg0Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4GpKsWoTg5IDOGAxxe+4QsPpYwaIycnlB8gFC6X1sWdXjNWLl
	WFT5ubt+Qkk3av7udu9/stqiTuWsgH0PQuyTKw5Lleik9NB6mk8z
X-Gm-Gg: ASbGncs9Z1rqjcTIxMnmZpvu6F1/oHpKUHZB2Lp8f5lLvsu3MDSwzFpVrPVH9Q/5olG
	/pdtMG1AKGOn02MHt97bRa78C20eo1nv+j4U7awZDZyJNd9tM1jnVbLPI1gWtCKvHwls+yV3sNm
	3YEn42AEKEmnCvdl03HVi5UXmN43b/9h2B42hKCu+A8mgnN60AOREsSYM/xlWcHdW6mg5K1DsRi
	Kf9lkEbsANDtkBSP4wZcnWY8xAs43U1/03fvhTM4XLk9FNuvPly0m8JEZV6tXOuRe0rG77/M7BL
	pnkN1alP8HWFaiMB1NvaXxcuVKg3BXXBK/s84EEoHcuvtg39IyzqgEA=
X-Google-Smtp-Source: AGHT+IGLDw+svnuLeVc9Vw/XXckwgRJWmGdIcd/ktneoz6ILKjyAsGLKhpl8Zd9YXMzbaiKU9bXcRg==
X-Received: by 2002:a05:6a21:9007:b0:1f3:33bf:6640 with SMTP id adf61e73a8af0-2009f5ff4a8mr26880852637.18.1743575070034;
        Tue, 01 Apr 2025 23:24:30 -0700 (PDT)
Received: from localhost.localdomain ([192.9.230.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def120sm10052479b3a.7.2025.04.01.23.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:24:29 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Feng Jiang <jiangfeng@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] wifi: mt76: scan: Fix 'mlink' dereferenced before IS_ERR_OR_NULL check
Date: Wed,  2 Apr 2025 14:24:15 +0800
Message-Id: <20250402062415.25434-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_232431_586947_04D28153 
X-CRM114-Status: GOOD (  10.30  )
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

From: Feng Jiang <jiangfeng@kylinos.cn>

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202504011739.HvUKtUUe-lkp@intel.com/
Fixes: 3ba20af886d1 ("wifi: mt76: scan: set vif offchannel link for scanning/roc")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index e7b839e74290..cc2d888e3f17 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -302,11 +302,13 @@ void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			   struct mt76_vif_link *mlink)
 {
 	struct mt76_dev *dev = phy->dev;
-	struct mt76_vif_data *mvif = mlink->mvif;
+	struct mt76_vif_data *mvif;
 
 	if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
 		return;
 
+	mvif = mlink->mvif;
+
 	rcu_assign_pointer(mvif->offchannel_link, NULL);
 	dev->drv->vif_link_remove(phy, vif, &vif->bss_conf, mlink);
 	kfree(mlink);
-- 
2.25.1


