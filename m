Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB54CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xVQzdkZfZGt6uJDP7MtoPwhfeFj+Xe0EF1rEE/XQ3xs=; b=Z2YHXpUoJjmLj4u9H0kqR2dDo+
	1P6EI9kQw+bFt+zugXbr0NKrZWsxPpbMu+9QY9oSEEygXeOADMn55+IR6ZK24zs9gW7rKhp3GAnCg
	oQ843GhzW+GlQ9JkOlr792Mxdpo+kF7nD9LFo6/pfVnK4plA2L7LagxvoIQVYhfmr3jlPQpMRd9tz
	19LKxQkoGquavdMKR2g1y6F46HI3u01RvfUQqqLrri8DwQ4utrFBYRFGTR7jV2NjUPzCgvCr0UgPN
	Uy41do5ZqVzuUFsU5qczkYxn4zst1vZ2d9LpbaeRRi8GoRwydfqU1IS1VgeguccWCsx07EGf2HnEJ
	3qy4o+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL3W-00000004zTl-1okR;
	Tue, 02 Dec 2025 07:44:14 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL3S-00000004zSs-44Nz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1764661443; bh=xVQzdkZfZGt6uJDP7MtoPwhfeFj+Xe0EF1rEE/XQ3xs=;
	h=From:To:Cc:Subject:Date;
	b=Ip4w5bLdnUd3sIXbK5C5pZX3Xw9j3t0f+312Jn3OPlWFD8Xz6K2c/Bx59CwVwN+Hf
	 PR2EDGl3OweMBBgPX2jyv5oenaeDvacZjR93SBTNggfhPguwaQ7idohLAeuroR9Ci+
	 ZbA9Ai5zYyVyUQSUVW9GhaRf6tF5LuPB+2kEcZCw=
Received: from localhost ([58.246.87.66])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id B0124C13; Tue, 02 Dec 2025 15:44:01 +0800
X-QQ-mid: xmsmtpt1764661441tygoogqk7
Message-ID: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
X-QQ-XMAILINFO: NnIX2CK8LSsJBX5SsFlQB+monRzvPtS7S73OadbW+wWoYUt0AmUJGPi33KBPGF
	 63YrYR66siDXxfWIj5oxLne/Y0Qki/NT0eg7sYqHKdvTKPqRZLPlXs5GzIunMxYL/VJGZ15naOqE
	 wrUeG6lThMt2q3JqMjEchfZBc2wu7EhJwB5y4bRG9HnbH+MQw06XeoAV0RU4OUIV9EPkn9ANDv9X
	 q88FM8NOmZqm2jm/vo+RKmANl710dEYMcgwSOe/eUxqdnG1unQjZwZOmo+m1+YcJRUVJETN+ZoVT
	 KGEFSVrU3grGLue/1uCDrVH+uKI7hgeYzpgsY+qdhN4L43iFdEA+GwybF440lMLSsb+q2fyJNmo8
	 pBs2auYEOFVYKogP2odanfvmGSw/Q/a0IEH0YzLGSxNtGu96cNmJgjbf64fUEif88IUtUjJb2o6j
	 YWTUHIwCx4Bdy1MmalQRRLu1x3e9EtW1Hf25WcAxtaIp+kJ2/Kg2fHAFEugNdHJGFHjyv+bLP4WX
	 W3orcMiG+iDrUrZWRjxlBczsMSqiXMaL1XZOGNrAmyAuEFhKfBjb0aJbaNziwb6ZXGfhjqOJ/Iev
	 KuC4NzEbkop6X+5Rv0A5mm2MKW8lNTbCxF7DZpUinIYeWeMQRn2uBwAq9u+Y8//lLPgO19siyAJj
	 M+eTP6+Zk7DKNfIMTtJxRRnAwQUdXB588BrR8o1VIf3ELNaa6l6BStWAkc1xeztBm10qnZYJ40dr
	 WNt4ujcL3chYUx0ikcUQRA78rBSioKxKjBywKiPIoLDMSd86TJf/UHkpCClWdQgaXRbQV2Z73oJh
	 Hm6g02ZKMwNROD9qHb6tS0hcWHEGP1nvghPE8AnZe9L7uj25q6xqzGoYJllxRlVzxjY3MWxuQ8Ho
	 vLEYZpKjn8fmcUIyskT98RnlcaoQpS/4Ksq6KREWo7CkFxyCq9Goea6ht5C092r+HjkiE73RYFlU
	 D4Td17sFPwOKxhaWEw/JasWyAfb+88RISX+U8RDc75xrVWL6ftQto5zbSZTU3RadcGPcZpnHFWB1
	 qkI3QBrw==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: 2694439648@qq.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hailong.fan@siengine.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	inux-kernel@vger.kernel.org
Subject: [PATCH v2] net: stmmac: Modify the judgment condition of "tx_avail" from 1 to 2
Date: Tue,  2 Dec 2025 15:43:59 +0800
X-OQ-MSGID: <406d20b7eff4afdb6b3f794e3597e7d0b4c34867.1764660952.git.hailong.fan@siengine.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234411_481686_985F228E 
X-CRM114-Status: GOOD (  11.83  )
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

From: "hailong.fan" <hailong.fan@siengine.com>

    Under certain conditions, a WARN_ON will be triggered
    if avail equals 1.

    For example, when a VLAN packet is to send,
    stmmac_vlan_insert consumes one unit of space,
    and the data itself consumes another.
    actually requiring 2 units of space in total.

    ---
    V0-V1:
       1. Stop their queues earlier
    V2-V1:
       1. add fixes tag
       2. Add stmmac_extra_space to count the additional required space

Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")
Signed-off-by: hailong.fan <hailong.fan@siengine.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a..9a665a3b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4476,6 +4476,15 @@ static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
 		(proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
 }
 
+static inline int stmmac_extra_space(struct stmmac_priv *priv,
+				     struct sk_buff *skb)
+{
+	if (!priv->dma_cap.vlins || !skb_vlan_tag_present(skb))
+		return 0;
+
+	return 1;
+}
+
 /**
  *  stmmac_xmit - Tx entry point of the driver
  *  @skb : the socket buffer
@@ -4529,7 +4538,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		}
 	}
 
-	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
+	if (unlikely(stmmac_tx_avail(priv, queue) <
+		nfrags + 1 + stmmac_extra_space(priv, skb))) {
 		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
 			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
 								queue));
@@ -4675,7 +4685,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		print_pkt(skb->data, skb->len);
 	}
 
-	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
+	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {
 		netif_dbg(priv, hw, priv->dev, "%s: stop transmitted packets\n",
 			  __func__);
 		netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, queue));
-- 
2.34.1


