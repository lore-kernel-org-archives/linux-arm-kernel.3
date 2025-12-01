Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00372D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 02:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9HG5vIZeG6DjcNDNCfRzCXn+GiaKTQ413V1uAk2ip2E=; b=KKT9Z6Vh6JYFNUlKd1aSCi42HA
	TuLAC2Gkdg0sXlB8+aTIyZZKgGmDxJoPxyo5LzSOF1+QmfmF+69yvElg2eG47CSRgqWMRgziGxiU+
	klJ3PmauylalTvyRQ6+E29VotpICmIVpiNuIJUYa/SZyV1YDg3Ch73fmvdLQpgxEIpsM2XVZHLu+6
	4BtMAt6P9CWKS0fvgCGccPTkFK8nUZCXIeLUzxpKyZazRi/AAD6KUnIjuyK0Jy4aKRcJ7YKD4cZag
	aVVH4Y7wqvkXpD4leahEfFSlXWAWoi/ER6ZfJvPZxa0qIMw9dUSVH36aAYcIlf3Y05mCdtBxTeK+p
	HNNw5AiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPu6H-00000002qGa-3yOb;
	Mon, 01 Dec 2025 02:57:19 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPu6E-00000002qG9-1IQ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 02:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1764557825; bh=9HG5vIZeG6DjcNDNCfRzCXn+GiaKTQ413V1uAk2ip2E=;
	h=From:To:Cc:Subject:Date;
	b=eLum1SysUyevzkZNTmmEMOovuTPPzDfFc5UZ90E08r2Of1AmBaMYCwSSHeVxjDhqF
	 DRRhGxBwAYrGtOqJmPkm7eiwgW0ZXW7ZpYAK+CX96xnMpLIKwiM1hA40fvYwsnxQ1V
	 ng0B9ZhlW1Z2F3K4vzb9U/FrYa8x8+7jlzPUfxnQ=
Received: from localhost ([58.246.87.66])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E4322249; Mon, 01 Dec 2025 10:57:03 +0800
X-QQ-mid: xmsmtpt1764557823tgzuvzj06
Message-ID: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
X-QQ-XMAILINFO: Na23fxG1dahlIHagbvu0S9yGh7KvCtlJ+jcO/sOXy3vdAOPN2yFS719FrteZgF
	 L9diDzWuXJWqZExU1tGfwGTKoKbsQPd96/dhd0X3ALf6++rAzohULa9kz10xikHQGUm6Zpp66kWv
	 EndmwTpJ8176XDKHY1VAOHYbrUfwparkH+uDFkbXszQ/mGkfGX6OwaOolMEeOQbfZdEo6nUdXERA
	 qgfyqsGWSOePTr0hKC9QobH5+OhwOjqqpCoDKKhLZ6bdqdQnbit7pe13ow92TD0b5RBcsn28o8eE
	 2yBClEfCtCYb1acj+6km3ATA4kvFqOZrmhY918y0MjHCcfWJpz3QNw4rN7AQ4Snovfxruj/pMU0f
	 9Z1T2Nxo4L20WvWv7R9Tyqw+vtbJO8/Ok0MP/ZpZJACbt0pO4lZjGfipAmEGt2vzw9SDEX3v9ZVg
	 /99UFmu9HuQGV9kmVdZSxQ/Nc1CijR4geosETVN37f8SjA0Pg+fBEvkCuU2nfZLLtV8THT6RMs8/
	 N5nBmKRq9W/2jeCANQ4GgmW6XtHxSlcKEiPJNZzDELEBU/v679NxGXtlG6GN/PXbuZxDD7hw02VA
	 f6Y/VPu2sVpBQrwsXQTwy1FH8rxbbCYbXgQO/InaNpsIVECYkCFtPcbUhEJJc9yhVcI52We3KR21
	 cwYL3gyXWs5Z3i1X10ykvfajeF3xQrVXbwE/DVvy18DuiONWy54hx9SREU6piKdV7gTEfpbVUqwm
	 JaRNBXmM4hKyz0nNlSzU2vBnh+Fyxke/VJrjd03Zbm6T9SLasLq9mLkRKL0sQJYmOCLBfJARz3Bk
	 pWKaI43RIDyXVY3QX1vlACYHKwRDm+rCP0EtVrJixx+m2VuwAq/NrPSbXC0ZAjPn6xrQBWphlfXP
	 +PfxuWaq7ShJwjhnXYBIWq9SjEoWpEC4TxjzDKj2gFASzfya1n3jPu7nzjyhs4csv+LFVEg8Ygs0
	 BOJVKB9qmkGx5qRg2CZSisgMNL9p72YCL/YV3jp5n3k71Rr6ArCHz8aa/NPUC8znOV2Ie8OlFPVS
	 Y82Q+woOejaL6Bcw4h
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
Subject: [PATCH] net: stmmac: Modify the judgment condition of "tx_avail" from 1 to 2
Date: Mon,  1 Dec 2025 10:57:01 +0800
X-OQ-MSGID: <20251201025701.16345-1-2694439648@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_185714_879796_863827F4 
X-CRM114-Status: UNSURE (   9.89  )
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

From: "hailong.fan" <hailong.fan@siengine.com>

    Under certain conditions, a WARN_ON will be triggered
    if avail equals 1.

    For example, when a VLAN packet is to send,
    stmmac_vlan_insert consumes one unit of space,
    and the data itself consumes another.
    actually requiring 2 units of space in total.

Signed-off-by: hailong.fan <hailong.fan@siengine.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a..b575384cd 100644
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
-- 
2.34.1


