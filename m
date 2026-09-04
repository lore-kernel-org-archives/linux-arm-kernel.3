Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB17C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 00:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIbxqo7/mIPWCvVT9qv+o1kCIjomZ4BJFjHwEDyAcio=; b=AC1t1jak3qL64QViUq7NAXxXMG
	BYfxEhOwR0A8B3Y9tz5r9aBhYq0us00RUfVRhfR5QHmETH6302TZ8JSQGRh9W5zBY46Kgth/rkDbF
	qFU1TgJj/OEvUgJwMhs/eIxgUU++Zi7frssQYz2j3tu+lJOSy3UoRs4XC3/R1mKFmj1IbTbAzZ955
	VypP9GOHB+epS3b0qcP/HrgVHEHWS4qI7S4cSselx1cZJtT5r52y7O/8NPN7GTaPRi9fPNBIGgBjf
	679OljmnLC+vAObEo17IGZhC3fIrxr8SfG0KJFGz0XNk7anEnbPbUv1B5VBOYn/sa+Rf6vxuU3LKB
	Vi8D0GQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2I3s-00000000osh-1qEe;
	Fri, 04 Sep 2026 00:45:44 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2I3p-00000000osM-3nKk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 00:45:43 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hbd6f70C0z55y2L;
	Fri, 04 Sep 2026 08:45:30 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6840jUc1087556;
	Fri, 4 Sep 2026 08:45:30 +0800 (+08)
	(envelope-from he.peilin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 4 Sep 2026 08:45:30 +0800 (CST)
X-Zmail-TransId: 2afb6a9a14aa0aa-a417d
X-Mailer: Zmail v1.0
Message-ID: <202609040845307827XHaxAT2PmgJc9jjPqfAP@zte.com.cn>
Date: Fri, 4 Sep 2026 08:45:30 +0800 (CST)
Mime-Version: 1.0
From: <he.peilin@zte.com.cn>
To: <maxime.chevallier@bootlin.com>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <vbridgers2013@gmail.com>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Cc: <xu.xin16@zte.com.cn>, <jiang.kun2@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIG5ldCB2NV0gbmV0OiBzdG1tYWM6IHJlbW92ZSBzb2Z0d2FyZSBWTEFOIHRhZyBzdHJpcHBpbmc=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 6840jUc1087556
X-TLS: YES
X-ENVELOPE-SENDER: he.peilin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 04 Sep 2026 08:45:30 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A9A14AA.002/4hbd6f70C0z55y2L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_174542_101845_AD9A2C97 
X-CRM114-Status: UNSURE (   9.09  )
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

The software VLAN stripping logic in stmmac_rx_vlan() was originally
introduced in 2014 by commit b93819854d6e ("stmmac: Add vlan rx for
better GRO performance.") as a workaround to improve GRO performance,
since at that time GRO could not handle frames with VLAN tags. However,
this limitation was resolved in 2015 by commit 66e5133f19e9 ("vlan: Add
GRO support for non hardware accelerated vlan"), which added GRO support
for non-hardware-accelerated VLAN frames. Keeping a software fallback
path for VLAN stripping is no longer necessary and only adds complexity.

Fixes: b93819854d6e ("stmmac: Add vlan rx for better GRO performance.")
Signed-off-by: Peilin He <he.peilin@zte.com.cn>
Reviewed-by: xu xin <xu.xin16@zte.com.cn>
Reviewed-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++-----------------
1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..2e3b0cf10d66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5021,24 +5021,6 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
return vlan_features_check(skb, features);
}

-static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
-{
-   struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
-   __be16 vlan_proto = veth->h_vlan_proto;
-   u16 vlanid;
-
-   if ((vlan_proto == htons(ETH_P_8021Q) &&
-        dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
-       (vlan_proto == htons(ETH_P_8021AD) &&
-        dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
-       /* pop the vlan tag */
-       vlanid = ntohs(veth->h_vlan_TCI);
-       memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
-       skb_pull(skb, VLAN_HLEN);
-       __vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
-   }
-}
-
/**
* stmmac_rx_refill - refill used skb preallocated buffers
* @priv: driver private structure
@@ -5407,9 +5389,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
if (priv->hw->hw_vlan_en)
/* MAC level stripping. */
stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-   else
-       /* Driver level stripping. */
-       stmmac_rx_vlan(priv->dev, skb);
+
skb->protocol = eth_type_trans(skb, priv->dev);

if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
@@ -5901,9 +5881,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
if (priv->hw->hw_vlan_en)
/* MAC level stripping. */
stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-       else
-           /* Driver level stripping. */
-           stmmac_rx_vlan(priv->dev, skb);

skb->protocol = eth_type_trans(skb, priv->dev);

@@ -7964,9 +7941,8 @@ static int __stmmac_dvr_probe(struct device *device,
ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
#ifdef STMMAC_VLAN_TAG_USED
-   /* Both mac100 and gmac support receive VLAN tag detection */
-   ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
if (dwmac_is_xmac(priv->plat->core_type)) {
+       ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
priv->hw->hw_vlan_en = true;
}
--
2.27.0

