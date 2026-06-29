Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRmRx3E2TRD6nMHlslynO/JAwSkEz+lHHJvdgNM8QVs=; b=FbBnYhEpnafOZIwrLAA09Nqkix
	/FdPxhlsmxHY4yQlIC55PogYhL198Q/WZQIvDnT67grswHi7/L+tfc233sI2oy/rUcH9hBYamFQIv
	B2WFMjlmA0HsZbZpAupo/0Rdb8r+4n+U540GLB382UyzwX/DUVx9XhbQyEDVOrGwRTlvrNzbyEaNh
	XwwIoQJBl8rvs3xGBsgqpQSSXnFYtWJjDRwBeiPENxGfETCUCNgnVgp68zNiCFoWBdBaFKPmtXBHR
	owNRD3w2iYVsPTajeGsWAiguk99XGj6bn3xOpPXBn5+E917oD89d+FAWIPTGqAiFJjPFvHRXY8rRu
	EzzqPPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEgI-0000000FBVa-2pIk;
	Mon, 29 Jun 2026 16:17:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEgD-0000000FBTM-3veC;
	Mon, 29 Jun 2026 16:17:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A715643E43;
	Mon, 29 Jun 2026 16:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD591F000E9;
	Mon, 29 Jun 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782749873;
	bh=lRmRx3E2TRD6nMHlslynO/JAwSkEz+lHHJvdgNM8QVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JZhPsXXJpH7ncGw3lp/PJH09S5+BpERvGGaxEQn1qdvzQl5/GGIeZdXVJQ8RSocr6
	 95+YkX/bG0NIrChQWU7/KdqgGPJrYTQEZho8sIssoLhrgLP3NkHdj4JZpRoJienv3L
	 F5slgVsfuyH8j9C4LfLPX2vIqJ3oeM2/O3nTVjiqx0yv0wwaAn9GOFWzrebtn/Nb+K
	 i2SWe28RYVTOyw/vOmZCTNO4jXz9b2nEE4nvFwwE1Ve+4HCz9eoEuI6aRK8xge70O1
	 brOpudAY3mUdOR4HXdPfPOo7NhZg9eG3HOegxS35tfskGphFy5YMKe58g5jlkW+8+V
	 AXRlMAOtcpWXA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 29 Jun 2026 18:17:29 +0200
Subject: [PATCH net-next v6 1/2] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-airoha-ethtool-priv_flags-v6-1-86bc600d31bc@kernel.org>
References: <20260629-airoha-ethtool-priv_flags-v6-0-86bc600d31bc@kernel.org>
In-Reply-To: <20260629-airoha-ethtool-priv_flags-v6-0-86bc600d31bc@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

Rename the airoha_priv_flags enum to airoha_dev_flags and the
AIROHA_PRIV_F_WAN flag to AIROHA_DEV_F_WAN. The "priv_flags" naming
dates back to an earlier design that used ethtool private flags; since
this series switched to tc qdisc offload for LAN/WAN configuration,
align the naming to reflect that these are per-device flags rather than
ethtool private flags. No functional change.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_eth.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 932b3a3df2e5..8bba54ebcf07 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2048,7 +2048,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		fallthrough;
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
-		dev->flags |= AIROHA_PRIV_F_WAN;
+		dev->flags |= AIROHA_DEV_F_WAN;
 		break;
 	default:
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index d7ff8c5200e2..87ab3ea10664 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -535,8 +535,8 @@ struct airoha_qdma {
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
-enum airoha_priv_flags {
-	AIROHA_PRIV_F_WAN = BIT(0),
+enum airoha_dev_flags {
+	AIROHA_DEV_F_WAN = BIT(0),
 };
 
 struct airoha_gdm_dev {
@@ -659,7 +659,7 @@ static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
 
 static inline bool airoha_is_lan_gdm_dev(struct airoha_gdm_dev *dev)
 {
-	return !(dev->flags & AIROHA_PRIV_F_WAN);
+	return !(dev->flags & AIROHA_DEV_F_WAN);
 }
 
 static inline bool airoha_is_7581(struct airoha_eth *eth)

-- 
2.54.0


