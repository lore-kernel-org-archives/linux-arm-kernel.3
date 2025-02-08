Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F72C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tutg1hcgzbwWFewfp7lGkOiAHY/GORMI4dIKinVdgRA=; b=G95OHOxAN5pOIz2YKRJlTDnzEU
	v1Sj+h/Mni9g2ANfyNYUISqvNU0BHieyUyaQsaTh+FZ4FJ8ze2faF6RSs+Gtbzz5B+oPR8ttsC2cH
	iPleOrtkkYzxJFP7/GyzVW7rBwZ129B98m3AS5kiDDN7+b7qzqAgcmBQJ3zm4VM8wlFsIU8cx2xrY
	vtAOV0qwUSFsRp/eaNvvb9knPDOBnKW18HpTV6r7ktcHCheynSUy3Olu8rzB1i07xh0Wc+flbqY5J
	W1+MM/SOmUvo2JVJkOHvpFDptWAuAnqsBnYEMH0a/sIJ4lZlBxACVxYtWNNuJ6ld/vHo3BEJaaZ/8
	UxelulXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgh99-0000000Cd07-3lQr;
	Sat, 08 Feb 2025 09:29:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgh7k-0000000CcgW-10tA;
	Sat, 08 Feb 2025 09:27:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f0444b478so42561075ad.0;
        Sat, 08 Feb 2025 01:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739006859; x=1739611659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tutg1hcgzbwWFewfp7lGkOiAHY/GORMI4dIKinVdgRA=;
        b=cdE0A4OL957t183eBrvWQp4Bzsi+yTT6Z15WI7LKDrapS09vwnbqnc21ADwLat5rFL
         Tf3xfBws7k6sW+t2q7pkclyvOtqBWx5eXsdjkX/bbv9reEpblXL7a4MG1BPr/lWWhp8z
         o4T7el8N4QCFCHiKTDaq6PRUhixlwU4Aai5l6RGAoGhtH2CTZopNzzjzqFbB5W2pecxK
         BOLHi8DsYZ0vaT1HMkaoENoCMfrb/Q8skqJ8xJKoyKFEtzemiQIIKRK3iLGLF7NXZ6eT
         9iF1CV/3j83nCWEYDuLKmnN7uRGQkUGMgUyHnH1AHXOm+1BQoABMQ/LQcC6OnWPLKlbO
         meeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739006859; x=1739611659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tutg1hcgzbwWFewfp7lGkOiAHY/GORMI4dIKinVdgRA=;
        b=VrM9kInS0mOyIlhOz6F+f2nSXa7UGtdv2p2wy6o6Tpz5Okdb22yj6qWpxQdcCnihFO
         nSHVKhejYJtLqQz/QByRde16BydpEqVPX9/g9pOGXua8oCu3Qhi3+2KzjiDRO4XEyaUS
         uwGoaLo9fbpT8bEi06M5rrUQafcQQF7DKrqjyt6uBvbxijyKI5LeNLYxE8yxsPIksgV0
         aLOtq6JVwNA5cEyw+id941yqyxR5lkzGwCN8r6JsJXp2Yg9hr9B9BYqzNXgAO042esgt
         w5D9eaSpEStO/sOtRvRPrys0GyDCnGmVjzUyIG9lohNu2o+xkZy9kDN8PbTdzzpkaErA
         9Crg==
X-Forwarded-Encrypted: i=1; AJvYcCUQci4DjVmAEbSSKRJf8ItEFOWt51p+zTs4okBfOOqLKWI3EpVD8ongduLiJB/9N5juaVB3Ge2aEKErAUttUJ8f@lists.infradead.org, AJvYcCWE73QLRiWx1GuZr6MwFAz4BNLuDS1SrH68xzTxtA7O2swHeG5/lSjduqt102f/150jGuVJwzkbho9Lj68RE4A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfBa0Ub2RxbmiGXzf9V40cWJnLngJyvd442VfzyvX5ji36qgCw
	9ujzv64jBYbsfGilmIMAInReyzkX95ytrj8ldl0JYjLgVEPUrJOG
X-Gm-Gg: ASbGnctgyHGn3y8WdGi6n2AHVR6Yd/f/qgia4sSOcm2KU+eClLG2dW13P6yIXKn3MFS
	PexnuSE99fSP6Fu2Ktyfn2oFaDKbj97rAAiVTlYy08VqXZZp2wo2sSbUbsk8WwGWrC01gi+7B1z
	VKfbux9VZ8KSDgWHJAXQ7KTtAdW/Xui8wMP9IQTF5Mw3s0TlhHc4sBXRuNTKQlVCeKCWpuljRlj
	Ex00zvglfN+Fnn1v01SCrTDnk4ifcWIO4CsEdojsUM/ygAoGAFVpm0DLWlsIxnEqVQjokpRAwht
	DvosOLQy
X-Google-Smtp-Source: AGHT+IHaE1Pny20tOKsmxWPGT7N00vpoT1tCqZ7Msc5rofLkOL2NuLDdaQthdI8Xp7AeEGAoSmQtVQ==
X-Received: by 2002:a17:902:ecc7:b0:21f:6c82:1119 with SMTP id d9443c01a7336-21f6c821252mr24670645ad.18.1739006858778;
        Sat, 08 Feb 2025 01:27:38 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687edb3sm43554845ad.184.2025.02.08.01.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 01:27:38 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
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
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mediatek: add ethtool EEE callbacks
Date: Sat,  8 Feb 2025 17:27:32 +0800
Message-ID: <20250208092732.3136629-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_012740_283314_2ECA02BB 
X-CRM114-Status: UNSURE (   9.04  )
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

Allow users to adjust the EEE settings of an attached PHY.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 53485142938c..014de2c2624b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4474,6 +4474,20 @@ static int mtk_set_pauseparam(struct net_device *dev, struct ethtool_pauseparam
 	return phylink_ethtool_set_pauseparam(mac->phylink, pause);
 }
 
+static int mtk_get_eee(struct net_device *dev, struct ethtool_keee *edata)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_get_eee(mac->phylink, edata);
+}
+
+static int mtk_set_eee(struct net_device *dev, struct ethtool_keee *edata)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_set_eee(mac->phylink, edata);
+}
+
 static u16 mtk_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
@@ -4506,6 +4520,8 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
 	.set_rxnfc		= mtk_set_rxnfc,
+	.get_eee		= mtk_get_eee,
+	.set_eee		= mtk_set_eee,
 };
 
 static const struct net_device_ops mtk_netdev_ops = {
-- 
2.43.0


