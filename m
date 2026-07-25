Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BBDC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 20:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEwXosTLOaG24TJ4Dcs3EuCGM4emZSACTBVJ5HxidrE=; b=X/x/CEvz/++Q4acaXFjczSJNeS
	jY4Q1v/KjD1Sf6AC6nz+kzRD5FCP+HijY4wK+DQZmwIC+L9WArWLMIopqip3e1D9i4/uT5g9pQpoU
	IbDGyKgX1kJ+Ysar0dQH2adQ8lwWyYSI5qPp7aKoKWJrn9bbWALraTe5xEXlE5mMOVI80fukfQVzs
	B78a3hwuFW8Yrrrwy4/ZKIYU5t+ZquJ9PP3yRecwdNZDub7+brEvl3iq9l1Dnicbl5FOxyjKO/W5T
	SztjhSh9uXL1rWh/MUrlz9VdcLgLcGhw6c6EFU3sb8XDHCpFklKVegEBJiiIKbrfg+nbShYCzBnE8
	xfoK05gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnjCJ-00000000hPj-3tIX;
	Sat, 25 Jul 2026 20:42:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnjCE-00000000hOH-1kAe;
	Sat, 25 Jul 2026 20:42:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97EE143B34;
	Sat, 25 Jul 2026 20:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A41F000E9;
	Sat, 25 Jul 2026 20:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785012128;
	bh=qEwXosTLOaG24TJ4Dcs3EuCGM4emZSACTBVJ5HxidrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AVPpQEmUlZu1TWIJidpY2bXpw3ZdEkPoznjwwtSDklIz15K+bYMzZdjkJYnDPY0Ki
	 oCn982BxIyx+pC6MLTQD+dQWzx47cQ7Rt1JIBPALUcRWVgtKa8LDusAoIWD4mR7s1i
	 ZQ1AFfS9I6ZVnD753tUu8cSBaFnOi9xKyLSDvgVtZ8vP1QajVVFyZzAuVO12t+S3lC
	 xmjMXBoQM7v8Z0AlyOiGl/cl6cI7sLLNRwwC1wjKBgD35bRHayUVU7VVtTUjjrpIOM
	 puuCEi0KW9LnqY7eoo4Kg4x7wl37J8kjxrR9drCkxg/hqHDMqPUjZNNdVMTsbYV935
	 p12HeikXBM8hA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 25 Jul 2026 22:41:40 +0200
Subject: [PATCH net-next v12 1/3] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-airoha-ethtool-priv_flags-v12-1-5136a30b2157@kernel.org>
References: <20260725-airoha-ethtool-priv_flags-v12-0-5136a30b2157@kernel.org>
In-Reply-To: <20260725-airoha-ethtool-priv_flags-v12-0-5136a30b2157@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>
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
ethtool private flags.

While at it, switch to test_bit()/set_bit()/clear_bit() APIs and
convert the flags field from u32 to unsigned long to make flags
manipulation atomic.

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_eth.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 79418e682f71..d9a44a11d8db 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2078,7 +2078,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		fallthrough;
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
-		dev->flags |= AIROHA_PRIV_F_WAN;
+		set_bit(AIROHA_DEV_F_WAN, &dev->flags);
 		break;
 	default:
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fe934f9ffe8a..24dd16fc509a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -570,8 +570,8 @@ struct airoha_qdma {
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
-enum airoha_priv_flags {
-	AIROHA_PRIV_F_WAN = BIT(0),
+enum airoha_dev_flags {
+	AIROHA_DEV_F_WAN,
 };
 
 struct airoha_gdm_dev {
@@ -584,7 +584,7 @@ struct airoha_gdm_dev {
 	u64 cpu_tx_packets;
 	u64 fwd_tx_packets;
 
-	u32 flags;
+	unsigned long flags;
 	int nbq;
 
 	struct airoha_hw_stats stats;
@@ -694,7 +694,7 @@ static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
 
 static inline bool airoha_is_lan_gdm_dev(struct airoha_gdm_dev *dev)
 {
-	return !(dev->flags & AIROHA_PRIV_F_WAN);
+	return !test_bit(AIROHA_DEV_F_WAN, &dev->flags);
 }
 
 static inline bool airoha_is_7581(struct airoha_eth *eth)

-- 
2.55.0


