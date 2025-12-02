Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D04D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 01:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CaYtSrdTuY3LdNTkqnJne197fCiBenWiXbiINPfbnG0=; b=EJzMWVGK+N0jTf9SpKI3tK/463
	aKTD3UasZBw4ZA+z3esvG310fbz/J5oG5KL/XRrnmHXNQ5cVV3a1hRS9zOHLxc9BNYeK8qP9sewzE
	utgPNAgLL9StVGl/QCOqIEOi87OdVVQISXU/vlScrfP/H3Mm9JonoWxhPgD45tcpXFJeCpINa7hEU
	GwLLJ4OEE61DQFJACpdAN3X9a1jZ6L5N1fI5heaK4bh1++7+qfJTg6/jRk/NaqqDXpI1zbnCdlZC/
	LicxDtOWMtnhiumuXunhV/Ai6dMk/eB9OOjMfSgU+crQb3DZ6wU7zjnNx9p7wXtHktGC/70jin+Tt
	QNu1w5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQF9N-00000004fmP-3RuG;
	Tue, 02 Dec 2025 01:25:53 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQF9K-00000004flR-1Van
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 01:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1764638743; bh=CaYtSrdTuY3LdNTkqnJne197fCiBenWiXbiINPfbnG0=;
	h=From:To:Cc:Subject:Date;
	b=nPTDAiP0neHVrHXLdjtLvbSTUATj3mMahG253xoY1xx9lc4FHZc0Ub5eV2/eSJXEK
	 pQeh0bgiac5SmsrSlF+j0SAEi+vWfhkrmH/LftN8ZXrB8Xjj0kkSetrSPKicgxiQIf
	 xxoiyl9/d0TePwMrUgpu1Gv5u99i7DQrCzIh0hKI=
Received: from localhost ([58.246.87.66])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 66917EC1; Tue, 02 Dec 2025 09:25:41 +0800
X-QQ-mid: xmsmtpt1764638741tk6h6a860
Message-ID: <tencent_A2BE4EE4983E2DD19E67E0D5CC6564D1D309@qq.com>
X-QQ-XMAILINFO: MCBrDuJrLGvm96QTQNCSgt319yUPHNDEBL/hOoPTn9fw3IHsad4deE7X/dXCDq
	 rMPe/We7COAK9awPn+nMofPiTvd5ovxyZGYoImBFw/uzZPqMbzDAqXKt0crK1ux6UsLLRt8kPhtm
	 CEJaNt6D5+uu8R3EcPb6ak//tiNaw+4VwREa0jpKiT01sIFRhIL+CZKZsePnn5LoeAm0lK40w4Ff
	 XTV6EP/Lqzt5kJeNjLj9zl2S0xGA+l+mRFg6kXo1PwVm/bYZJuEfEDYXhBK5YXaiSo7HYwkvXjfN
	 sQk5LHimThmfUwnqm8N5IvPkdoUHet5nm3PNXTBi8HCNm2T48y/92lyV2lzMJeVCD/r4ANk2SXoE
	 xtazQaCuMrCjj1Yho77mSnZKZh1O/FTqW7ogGZK6VJVRPG/YzL2v1US5TIOAkcHxDH9kUJ9wFqTF
	 qjV5tAEtpwjEp4Wrh87e2mWLTcXkVechEIvmpbnfOPxFpWUShO2Jt0zTEi7y2gXZjLW2WJbb+OuO
	 SUxo7AEF25rYaotyNjsS3ouh9MUAgj7sZ7dT16FVkEKHqcj0n3b3QMrsVftxC5tAv+GQt5Hn2FIR
	 Br6Av3r0rYyG2Q3z5Hk43McSy27deBWAdhUd0Ur2owEuOnJ3aH9MempwI69CH2IGYtwBVjwcfoyr
	 jzIkYahOCn4EmqE+J5Gn936g07QsDsX0o7+zNrxSEb4XwHM63DHjk/Eqygaehl3QQN/Dp+/ddGPo
	 VIf2V+yKxXiEr94Dn+0kj5aCh95K8/VNeUN8xMeNF/6TQTRrbf8KZpRxBuUFnFDMZLTjgiSyy7u2
	 ttd+KHu3O1a6PJ3N7f0XvXTzWpjqzgVoe7jX1M9GbMa/oElFFGo5z0wnzGGsdnxR0DuwMftixUNM
	 /NfXcesW+FYhcNVlhRdPetDqlr3dEZRWxxWxDvbAiZwLphpwcC19DX96SHMubuz7KbfBt5R1TQBh
	 hnP5y8h4oUkLcZnEGueqxUVVCbyczZ
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
Subject: [PATCH v1] net: stmmac: Modify the judgment condition of "tx_avail" from 1 to 2
Date: Tue,  2 Dec 2025 09:25:39 +0800
X-OQ-MSGID: <84d25646b6651dd52fcecd9036a877b0069b806e.1764638311.git.hailong.fan@siengine.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_172550_761366_E198DC3C 
X-CRM114-Status: GOOD (  10.12  )
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

Signed-off-by: hailong.fan <hailong.fan@siengine.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a..738a0c94d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4529,7 +4529,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		}
 	}
 
-	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
+	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 2)) {
 		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
 			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
 								queue));
@@ -4675,7 +4675,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		print_pkt(skb->data, skb->len);
 	}
 
-	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
+	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {
 		netif_dbg(priv, hw, priv->dev, "%s: stop transmitted packets\n",
 			  __func__);
 		netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, queue));
-- 
2.34.1


