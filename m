Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73866C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=; b=Xpi1/PNHhFw7KAMgjiYm/PGAW8
	PhTgsjHjAsGtZu+Aq63M6gZxO9DbAPQXFjD0xx9kq4K1PU08k/snSl+QuoXjExFC3812qEtNVR4mq
	2q1F9bUJ3Uyo8pk7OqbiEPxxTOortKm0ApG/u1rtem2fH++/ompKalhedRttJ512DCEWBIlC5UI/l
	7nQoWv3GW1zAt93enLR6Ac2OvJtVQSbXFx7qezu3ONuIglKF3vz6zL6ZTx/k0Wr7pmHIb1AHkyPn+
	7BujHpXc7wl3dSPL3kxXiGV4WVMSBnwOJd3jfku94ffKqcGfDdcYZJ6ifqWiI2AI0vnABCTAScrMz
	XKGGm61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DW0-0000000557A-3mWQ;
	Tue, 08 Apr 2025 18:17:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DJd-000000053bC-1N3u;
	Tue, 08 Apr 2025 18:04:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3913d129c1aso4055829f8f.0;
        Tue, 08 Apr 2025 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744135492; x=1744740292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=;
        b=Vhfa217rJoQVYTRIKaOi5FEfVDs3t/OJiouvsUqY+tgwVBvoMKGfwGvFmJwgUGlRGb
         wDPg+SJt2biCKnDezjmLJeKgmh9OyRagAY1tUXuuGMs9gNySiXelDPo0muUg/4P/3Nj9
         YSQO76n6JNGu5nGX7CojPS/gmeJ1P9RtxpV1fIW9IqhrlW5spB3Tnc9qkeO1AINRqu46
         72fZO/xTm50tHucTNVn8ytj0rUR0t7FdmZAIGxTG500Z1kDdgMiapClFfpnRnuT/mRRa
         DCfMtpog8UTfMr4ibiBOmLimt5IzORWgdqagHxcfqfgr+2EAilLbm80FhYoLa+a1bvHX
         H+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135492; x=1744740292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=;
        b=cV+WeL62ApJGuR9IUKto75Dz55wtAXEwnOKdg51UNgQhIlFu510mx4J82uTfd9nGBh
         QEN0IDewAfoRQs1alFdcMg1uNpzfeqhQmyISzyJe6pikAqo6oW2v/r2p9TbnTyZEgUOS
         gourTC2/98PQN6epZetcHGx0dVZldvBJOZ4OjGQGzYyWidsZEwa/g6iTkSoCzrkXT3zv
         4B2u3t+XurhYwfwAiF1FWFghe40epHkcdATtD4S0TsqIK/nBeFRyMrXpFXzn+Gmf9RVT
         DFQ4RIJa3ABWfeI2kihTKe6XgvRP+EUJVVI3qHssa3FYoOYd2AFNWTvW371JsUeqgzub
         TD8A==
X-Forwarded-Encrypted: i=1; AJvYcCU2inEx8QK33YgYaFmlVHq8REL4Lxw3a6FH0XGkKdGXQnt8vv7V7p+xe+LgcxCmB6EM4l3uaEHWwP/P9dt+3nY=@lists.infradead.org, AJvYcCUuGdWt7Dqu//TJugHVQTZLs+XvECKmsHqSgRBBMXuWjnY1Ts0pcLj2NUoCdesfq/dsgdggfmLsNWvzlsf/RprZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5dtgiNB7iMyfJh0S/HG0JB1OkOSbMl44ppA4LUxA8JFdnwM5k
	boOyQubmzupMll1GbNlyea5jFdQQ9ag4p/OVqytyqBOTxANb/enc6Dk/fA==
X-Gm-Gg: ASbGncvsqP+bLffVSEihsCL1gk7SAZLUutqL2Q4rcSvs20d95myjzcBnHVX5bW7aivJ
	g0DcRO7qNskYy2mmbYrPIL3HwZSPBve6CtjvdBH4JZgPfWUkNV4sUlR6k0JVzefqc0l8D80Rs3U
	aiFfFTnpcBgs2lWNMhJFxS0iPOCqVqu4RJY3C9HSa+nQH9NJVothHDufDUrF4J36H9ep03w5yVw
	/M+8YxKFJvXTuIv9GJQ2S0SIAN5x+R4vlwXMcFN1b23r5d5X/Nh9hL3QsyxiXCoSHY32MgE83gt
	1czg8OGW4nc08qOKC+cQMme1bE68mMF1un2WXlKUcEKsaw==
X-Google-Smtp-Source: AGHT+IFW4ID2IVLIJJSO6AIqnzG5sx6n8ibzh5IQ9vxzEszMDqEO1Q5l1iqmcRSrWTuGE6wSfEs9sg==
X-Received: by 2002:a05:6000:2289:b0:39c:30f7:a599 with SMTP id ffacd0b85a97d-39d820f7f4emr4042317f8f.18.1744135491468;
        Tue, 08 Apr 2025 11:04:51 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:5b45:5642:beb0:688f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm176684525e9.0.2025.04.08.11.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:04:51 -0700 (PDT)
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
Subject: [PATCH RESEND] wifi: mt76: mt7996: avoid null deref in mt7996_stop_phy()
Date: Tue,  8 Apr 2025 19:04:48 +0100
Message-Id: <20250408180448.19274-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_110453_367356_D3DCB5D9 
X-CRM114-Status: GOOD (  10.55  )
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

In mt7996_stop_phy() the mt7996_phy structure is 
dereferenced before the null sanity check which could 
lead to a null deref.

Fix by moving the dereference operation after the 
sanity check.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 66575698aef1..88e013577c0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -68,11 +68,13 @@ static int mt7996_start(struct ieee80211_hw *hw)
 
 static void mt7996_stop_phy(struct mt7996_phy *phy)
 {
-	struct mt7996_dev *dev = phy->dev;
+	struct mt7996_dev *dev;
 
 	if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		return;
 
+	dev = phy->dev;
+
 	cancel_delayed_work_sync(&phy->mt76->mac_work);
 
 	mutex_lock(&dev->mt76.mutex);
-- 
2.39.5


