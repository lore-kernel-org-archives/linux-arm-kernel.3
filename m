Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E79AD1268B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 01:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FgD4FVBsIZc/lJgWx44TSx1/rV+CY/xX0o1zBduphyg=; b=asxnzaXyfj4XG0D5NrGvvuSl6u
	GlvIeh7sz8rn4qZ3Ci+31CYAS3V9SM1W4CYvwh0j/1CsKJBGtYwNgT88RnWBQWwcBun8Fwxd9cHEs
	vfb2sMOP7ChPwcxONl3YDJqrHKd0cPGTxIuohP39btU89oIoDP/zULqpCHC0AliTEXpRxQdLNy9Ei
	6XwIYeyrV3XMeh0EreHss+DNdcJamrvRAuGYJ6ukFdGjI+sAOCuDscW6Qt1NiAWhEJqMH6sx2fZv4
	wqIqA1+3H6ULY2IycbIVvD5y/agmoSnONuA0mSodmnrl5dLNoqniNd5RyGCJFlSzHlA6gVlhP8W8A
	u3zOL6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbiw-0000000602r-2tol;
	Wed, 03 Dec 2025 01:32:06 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbit-0000000602S-2bNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 01:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1764725517; bh=FgD4FVBsIZc/lJgWx44TSx1/rV+CY/xX0o1zBduphyg=;
	h=From:To:Cc:Subject:Date;
	b=YkOWFUDgoY329RdApQMaJfZissAdj/pwiDYdy5eM31fjtKOn6hcMGilwu3Fzi3RnB
	 rFOALpCZOYJEpPLWW2hSsWhnCUvrz18E86yvB87Uhgb8S7wL1YRub6wJfiuhWvy8DL
	 CP3iaSL5czzKH9Y19ODiIQoKKaKkPxBI2a/10Xd4=
Received: from localhost ([58.246.87.66])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 7F7B4684; Wed, 03 Dec 2025 09:31:55 +0800
X-QQ-mid: xmsmtpt1764725515tevgm4er9
Message-ID: <tencent_639FC431D959DA3E8FC007985FC88EA5A90A@qq.com>
X-QQ-XMAILINFO: M07Ulnfy3VHKVnABMxCOZ4Vj1SFpQK+ANJvNR9/RsY3dnBXHnxT/POhN78hogO
	 /MMywCcjYH3yAIEjAwzwA81HZaP9GrnFzp1bqdb9Wgs8y5S1rRchqkbzRMFDqfu/bPmsE7yK1QKy
	 3heICWirMQ+63WnqaJMBlDs7tsaJWgZ7ke6KcSm3+kkAZEbCSLEZKaDLXfg+kctph1WgNYdVocWJ
	 d+URF5SNp7WDk5+4ewcALjulP+mneOqRv0NTtBo0iG3TFQTo2/OwczD/03tb7C49E9azwCwCO8ta
	 zTh88G+HnCHfKGcCvspNlF6IRss5E0OA6Po4ynJHU3buEH51ZkASzm3lKV9LEcQe+Zb01qpuwfHn
	 +2z8W+mpaPJfZe45AbE2ofhhEy4Dc+blrPooQyH0d9DajoKjUAnuWPi5+fhzfjoAzVkZ4uIZuBo1
	 ys/OwjTXsaIy+RJ1rT26/B6EofTfIfSd/+x0PLOeiyPaZ0g2KyGqB3KjAn7k+zVJnviIoOCO+b4W
	 9/6prNXmraM5HvPcWRtRkCHnRbpSkYhcCtQPJ4ZUOVA1QAu4Vh4WWNPkrYfhXjcJJHdb/K5kuwkr
	 CjeV+EES5jW3WNWQ2OWO3/Nm/iK1jUjezyJR4UbZpXw2dFtjxo+Rr6t1hKJ3sNynLLLPNaJOkPog
	 tCmbUclzH0I12lWiqVPMYTSvQ6Hp5YE02arlWNcMyd2oPx6EahFiSxBjCJG1G5RsjqSHSXw1r8NA
	 Y3DmS6GLsPAh+XvGL3cyDjIsEzUEKE7dO1QgZkwxXHNqsLcxDRDgqXrUy2PJ173INXa50JWUz4Hn
	 BDlR7w8MA/fh43QcoOEabD52JtciPPIwaxKDLltAxqag5Y5G2P6HMzpF1io7wfWiQey5ilyHB3oW
	 hjYwRCIiBFAtTCmHnyN1f9sqzPVjPBnu4qnKSqL63eR861Mw/ITdnZJETLMpaEZ4YO0rYVq4QTi5
	 QwEw7thDoOTA0f9Qqw+e+9Pfb69qC+
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
Subject: [PATCH v3] net: stmmac: Modify the judgment condition of "tx_avail" from 1 to 2
Date: Wed,  3 Dec 2025 09:31:52 +0800
X-OQ-MSGID: <1f65707a427512e7b549809ec40286fb12b4c114.1764725087.git.hailong.fan@siengine.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_173203_989422_C282FEA4 
X-CRM114-Status: GOOD (  11.97  )
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

Changes from v3:
        - format commit message
Changes from v2:
        - add fixes tag
        - Add stmmac_extra_space to count the additional required space
Changes from v1:
        - Stop their queues earlier

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


