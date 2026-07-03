Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9275BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m752NnhF/FP6qFoaKmhQ5C6VfsVRyP9iPgdm+CBcUqE=; b=sdGf2wgSYaMT9vLlFbv4A1Y5ca
	25yGg7qNuC5B4gY4RO0pMh7yvb9k/rYB1GGMRkpumQnThR/lFpR8B4+pD7O+mBj5YWd+ezDwa6QB8
	nwRyrXE1GxZ9/JwXtc3xFKWVwfqOaGozlQvNFyPtUSQbZPRCqTx8s/s32g2Vs/T6Wt8+LrPaK8zG/
	CSFo+nFV1TBVKiQVGm/TUG1MqsBie8jxYrZqyS4lGbrJi+JOWjrxLXWadj2cWTJyqRcjjcmch4YRT
	kmGTpm+sn6dLmbQQJBHgLkIX8U+bmveTmK65vjD2oZPVYp9vMHJWuFwT1xRXxIhoYpdKeGrGzZY4o
	X8TskVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa4D-00000006SpA-0zCQ;
	Fri, 03 Jul 2026 09:20:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa4C-00000006SoO-0CLj;
	Fri, 03 Jul 2026 09:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAFF342B11;
	Fri,  3 Jul 2026 09:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1691F000E9;
	Fri,  3 Jul 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783070411;
	bh=m752NnhF/FP6qFoaKmhQ5C6VfsVRyP9iPgdm+CBcUqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VezMYE1DbX4icY0ru2G4bOVLPr1r0BkrgFbU0nHy9GSdpa1gdiSSh9JZUVV3MPKGX
	 NhA7zUNGAhFs5yLaMtyamhTMNHP9glRLiRAtBundyq2jUFLv+KpWNg1gBcaPQhXNxJ
	 sx2U5Iy4naApcJE3dKPAYu09wL1Wqq2W5yzSIJC59Qw7kVEdwwsLx8yXrmwXhBwjBA
	 ow2DN3HmTTlCK2D5bny3MR1V5pGsxdSyMeyGFIy4RnlUb/o9+0rt56iFmC/Lr3MwPy
	 nNSWjCCtHTORjwB30xbpV8HualtAcvAfeu46OD8SL3+4k0G3wMdcizTnGl621/+38t
	 bqJugp98SIwow==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 03 Jul 2026 11:19:25 +0200
Subject: [PATCH net-next v8 1/3] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-airoha-ethtool-priv_flags-v8-1-015ba5ac89ee@kernel.org>
References: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
In-Reply-To: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
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
index 59001fd4b6f7..41c1a0ffbdd8 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2039,7 +2039,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		fallthrough;
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
-		dev->flags |= AIROHA_PRIV_F_WAN;
+		dev->flags |= AIROHA_DEV_F_WAN;
 		break;
 	default:
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6d01a8e8da1..bf1c249255bd 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -543,8 +543,8 @@ struct airoha_qdma {
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
-enum airoha_priv_flags {
-	AIROHA_PRIV_F_WAN = BIT(0),
+enum airoha_dev_flags {
+	AIROHA_DEV_F_WAN = BIT(0),
 };
 
 struct airoha_gdm_dev {
@@ -667,7 +667,7 @@ static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
 
 static inline bool airoha_is_lan_gdm_dev(struct airoha_gdm_dev *dev)
 {
-	return !(dev->flags & AIROHA_PRIV_F_WAN);
+	return !(dev->flags & AIROHA_DEV_F_WAN);
 }
 
 static inline bool airoha_is_7581(struct airoha_eth *eth)

-- 
2.55.0


