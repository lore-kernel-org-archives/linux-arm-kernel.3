Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB9C36005
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aF+lshiTJwsEbYCiQIvW3LTB1kytaT25WY+mnoTd02w=; b=xJ5C63kYa+qniDvBdr7+r/ws4n
	KtBk5t+R8DPc1XUtY7PfS87bamQYlIx5BMjQXY9b9UvPVBv0SN3PGolbdTlt361w6fH8TYPHYBdBP
	v0h5qkZRrhibTUrnW5/Hc/lkJpUv2kneuwm7zA/rFIe1XK4eGoLpT5ohqtrTl8NMoMyDD9ssLn3xa
	wH9sQGYqibeFgGnarAX2UguKEH6/qqcwYqXjO9UYqAX0AJAK+zwofHLYga3cmgrJEyobdJeq3FyVT
	ijVPvYeVsoLvojx4voiGk/7YUNkDt2LovWTgrSgIDkUd6/MVdng1/a7df59UjAhA1RPkWg172PTr3
	sjH1Ov5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzip-0000000HUsy-1CGU;
	Sat, 22 Mar 2025 14:21:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzh9-0000000HUl6-0vvB;
	Sat, 22 Mar 2025 14:19:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2497122f8f.1;
        Sat, 22 Mar 2025 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742653165; x=1743257965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aF+lshiTJwsEbYCiQIvW3LTB1kytaT25WY+mnoTd02w=;
        b=jhXddAq1CVaVg37XZohUv5tvZwtpOSqrteXj0farGcl/shjYzM85/94O1aqnnWP+BN
         ftZJ6ygedZjxmPAabqtdCIJ54nWLyVuN1ZjPZp2tQ5vrzfcddWVFOOS/Oa7ly/y0GIB/
         rYC7CK3BsY1FROWFZ1ZKAMFwZps6vvxss4vBdJc4XTJ+xJLViYs6600tn6ScsuojGWUu
         e8qacehz5zDhKscpTN44Q1HU/c9PIOzfLswvjK1uGblRkJGSYqyF293IgPQDXwsT0mez
         6VZyZNJM/+Hh5JhgpZ3MFAyRJ7roDm1SauPskm3HlLJSdIPLLGXgOd1HzdBWxEinhc3c
         9/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742653165; x=1743257965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF+lshiTJwsEbYCiQIvW3LTB1kytaT25WY+mnoTd02w=;
        b=lmZhnUwY3xrtcuOJwrGTC7a/5dZUdw8kqXv3ooca5qcBmUtBkpuesI2BwthefxQZi9
         N6s4ZR4H51KLbZfHgVDWhHki8KcfUSfiB1YVtcx95msr/gPHyyrRlvOnp9qCAf+eFZe0
         NHJWEtzx8r67LUUrbnmQ4MPp9FVquaANs5lrRC7fnQZ5U7MYFe12/jHWgKeDSKGtLgBO
         tLWPii/cWWxhQv2WznB+/B5TiZuUSk5c3UT8zXz5BR6NCL51Xtjj4688sCwJ4EpTaX7a
         7IEWUBb0WC4xtEbEGt/rH33HUpiDupvvA2L9VClYF8P7cqMiY6jZhd/9pai1aVbcnJS2
         3OHw==
X-Forwarded-Encrypted: i=1; AJvYcCVHfqNegnbty9/LX0Ia3uyAxx9epx/A2bS5Ttwyj5gO+f4AwPaqVOmh6bDiMgtBGUPzGtK+WY4xYbX9RDNNwdvq@lists.infradead.org, AJvYcCXYa1MvnULoo/ya1+5ytRLNpkQZuKNIG7d+rnv5cYOoVgfhSFaUHDQ3iL03HcyglNqO9Hct0BeA/clb855crww=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqI46RsgkN8fAl04OdeSTfb4HLBDtqv7g1Eb0vEz/GK2F2qvxo
	rQ/kvCVpqmyT5j9JiGR0HCAUIdHaajtl+40UsLZ9GvKYD2Bkya5R
X-Gm-Gg: ASbGnct7YIS2paTKZYC7UnFW6LpNSHY3kW8/UUHFgQKV0XgPAEaEdRMrpCIX0yePyee
	QoPfz7+qqZK/tyXSEa0ZvqNYjOtdzA0b2/CeaOWtrj7f9H0NiuacJ2niZRYW4nHejfc21yw5fEb
	55IqIYJLHtA2oe6O9BFGDb5+vvpzG4z/2sZ8bPeFjREp+aDgyja9+C67Y0BEwVZxhrgXdUSSllm
	pw8v2oalxh2WHaRYOXIuKPIj5CDJCzHFka4I9dArY8ErF9BlSl/VnCMGmHGLBZElijBokMHfeuq
	V8u9uOhjzeRAsn+UscuAA1d9SQN3Be59fQop2wuEzJmFCp1UXADQU/sf
X-Google-Smtp-Source: AGHT+IESFJJXx1OaHEDpiDrDpp/1v/90T162quMXGMiu0ErBsYhKB7IcQbevvYKVQEpCP+boy7enFQ==
X-Received: by 2002:a5d:5989:0:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-3997f8f7526mr6944813f8f.1.1742653165247;
        Sat, 22 Mar 2025 07:19:25 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:c9a5:205c:4c36:bde4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6550sm5233487f8f.78.2025.03.22.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 07:19:24 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: avoid potential null deref in mt7996_get_et_stats()
Date: Sat, 22 Mar 2025 14:19:10 +0000
Message-Id: <20250322141910.4461-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_071927_276453_A4B829F4 
X-CRM114-Status: GOOD (  10.02  )
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

Ensure phy->mib is only accessed after the null sanity check for phy
otherwise the code may trigger a potential null deref.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 88e013577c0d..19391966ee3e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1875,7 +1875,7 @@ void mt7996_get_et_stats(struct ieee80211_hw *hw,
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
-	struct mt76_mib_stats *mib = &phy->mib;
+	struct mt76_mib_stats *mib;
 	struct mt76_ethtool_worker_info wi = {
 		.data = data,
 		.idx = mvif->deflink.mt76.idx,
@@ -1886,6 +1886,8 @@ void mt7996_get_et_stats(struct ieee80211_hw *hw,
 	if (!phy)
 		return;
 
+	mib = &phy->mib;
+	
 	mutex_lock(&dev->mt76.mutex);
 
 	mt7996_mac_update_stats(phy);
-- 
2.39.5


