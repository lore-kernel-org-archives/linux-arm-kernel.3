Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08452C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3rErr10p9wOACNt+wLol9UrYf5v0rNYumxMy4SRbfs=; b=4I8BLpKIYAaicgiGa1+txWcBjg
	k9jl+fPs1gvs62uOMCcPkpzqd6gMkYoCAzx4nz+jXW7ye1NfrE/pQ0UJAZzgFI2MR0M8Mu/wrWEKX
	ilAjrxvddN4c96E060xQjK28wp6/U0DwhMGsw8gHm17UopTYVYCEbIWZVKfZPUzIl0R3gNCFN36it
	944P0NEs+AvPoEtVg4LQnO5uBh1i/hN20k0eA5RW1ryrq8oIrF2HmbejpL/dJgpm4RIOFGi5hpMkt
	sA1tAJ6sBn+DOpLLAruBW924a1kixa1o2jTGKIAOVWXiF0090mJFgpQDCO8I8iJvWoAnFK7uxPCJo
	NRnocFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdns-0000000Ckpu-0BXY;
	Wed, 22 Jul 2026 20:44:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdni-0000000Ckm8-3ZtP;
	Wed, 22 Jul 2026 20:44:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDCEC600AF;
	Wed, 22 Jul 2026 20:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242031F000E9;
	Wed, 22 Jul 2026 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784753061;
	bh=B3rErr10p9wOACNt+wLol9UrYf5v0rNYumxMy4SRbfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TClIpQjPHfNb2UC+86DccO1ZrMk2+zy5rLUTHbdUN31XdnfQmEyzF0g00UYVJvCt4
	 FXhV4YAcs5lWiKtyTP2/gpdsVZW7ab/ZGgLSaH0Q2SUFy141vcrOpLy6haasxqnace
	 6hhwS6L9eGbDYygci9yZTfTRBGHXkgZpaJcVmMhumYjv07vi2jDBbTYnEGPhr/JYiA
	 AiFqAUMG4h1dchH/GhbOXm4fscuN2vH0YcCHEUJpkTTtubdQ3HFcREsOzPasDqLqG0
	 MaMTXTfHgA9P07wMsqz+1DaUoobIBHqX3iXyFQ8EbvjqU0/peqdI1ZCDe5rMPbRuP7
	 ez0lmxyiPoqZQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 22 Jul 2026 22:44:00 +0200
Subject: [PATCH net-next v10 1/3] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-airoha-ethtool-priv_flags-v10-1-d2562c5dd942@kernel.org>
References: <20260722-airoha-ethtool-priv_flags-v10-0-d2562c5dd942@kernel.org>
In-Reply-To: <20260722-airoha-ethtool-priv_flags-v10-0-d2562c5dd942@kernel.org>
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
ethtool private flags. No functional change.

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
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


