Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC1D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdhEIbF7;
	dkim=pass (2048-bit key, unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.a=rsa-sha256 header.s=mail header.b=btDDOzo2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4JPfY/UHj4f7eqHiyhZ2femezXDsVyGV3rTvSzt5bQQ=; b=TdhEIbF7ROAJugwAx7t1TKbwY7
	nv5pveO3fGkdzTTkoMEucpIog3Iur1sTQJyB4am4sPQSkrHeD0iJTa9ge3O2FPdbYsyokpQPO47TQ
	XpKS3mo9KO5k0BZ1sWA3kKOLd1+x2b+KaIYFiqBxK2M0bEGXxALDPoqR4fgqUfjcY7bfqLumZzmbr
	/ODZonce0//mOfWo2hRbS8ybK7/HO+ViiFurV8l+1VPAM1v/eH/Fmo4ChRhU+ZrDzHZFfMTZYlgJY
	VPoNeFvPFoFa5ORk3WBS+sJIHtpcUbOUeLv9yxXmkrJDuGOTeKFFXKZ7s3EhklJF0epB6n8DZ8jp+
	XNSgxfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeSH-00000004Ie6-2Cph;
	Tue, 27 Oct 2026 10:30:57 +0000
Received: from mail-gw01.astralinux.ru ([37.230.196.243])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeSD-00000004Id9-3Vcl;
	Tue, 27 Oct 2026 10:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1793097043;
	bh=d2djsUKdNLT3oLKi/a02O9ek2q7+gLB5GxB22bqd9+g=;
	h=From:To:Cc:Subject:Date:From;
	b=btDDOzo23Z9qNSiz5hBdQsiyq0sT8yzfdLmN8t1kYHXFn+s2dEOH8ME3rlrWzkCkh
	 5yTquoZaE/xVsWtXErCei3iAOoV7hnXqglB8CVntPK+UdsowXg3LGoyZC2x7fzNPSW
	 J0cNQzEPZYxFWrHddwPUgbrcJueWVHhmU3mDBrxdInkJH8eY2WQBhlGludtyMnKjDg
	 UV9wwqHy9x0NmjpbJEV508lC8WLpbmIWlLhDZ7v0HeoeHfboQdSLYJ3v4MeHYRhPf1
	 puxxuWthmJ3OfHNUO/XZqUWzwF1fdYmSnzKlJhc9ZRbyciVATpuQWjqOoEjmeRTk2/
	 CiiRKB1jvw5cQ==
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id D0CB725591;
	Tue, 27 Oct 2026 13:30:43 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Tue, 27 Oct 2026 13:30:37 +0300 (MSK)
Received: from DESKTOP-D46TNHI (unknown [10.198.50.125])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4jDRbJ5GCBz2vDt;
	Tue, 27 Oct 2026 13:30:36 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	Sasha Levin <sashal@kernel.org>,
	Chenguang Zhao <zhaochenguang@kylinos.cn>,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10/5.15] net: ethernet: mtk_eth_soc: pass eth to mtk_handle_irq_rx in poll_controller
Date: Tue, 27 Oct 2026 13:30:16 +0300
Message-ID: <20261027103017.471-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.54.0.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2026/10/27 07:39:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 132 0.3.132 b92628ca234da971a1a6d61b32804bb3075f0fd2, {diag_burst_silent}, {Tracking_one_susp_tld}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, new-mail.astralinux.ru:7.1.1;astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;patch.msgid.link:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 207021 [Oct 27 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.27
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/10/26 18:21:00 #28745978
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2026/10/27 07:39:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_033054_411939_2827F3DA 
X-CRM114-Status: GOOD (  10.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chenguang Zhao <zhaochenguang@kylinos.cn>

commit e095f249e2209674f6366f6db0383a2b96e19239 upstream.

mtk_handle_irq_rx expects a struct mtk_eth * (matching the request_irq
cookie), but mtk_poll_controller incorrectly passed the net_device *.
Calling ndo_poll_controller with CONFIG_NET_POLL_CONTROLLER enabled
would then crash.

Fixes: 8186f6e382d8 ("net-next: mediatek: fix compile error inside mtk_poll_controller()")
Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
Link: https://patch.msgid.link/20260723055735.885112-1-chenguang.zhao@linux.dev
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
[ mdmitrichenko: 5.10 and 5.15 still index the RX IRQ as eth->irq[2],
  the MTK_FE_IRQ_RX constant only came with commit 498190100992
  ("net: ethernet: mtk_eth_soc: add consts for irq index"). ]
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
Backport fix for CVE-2026-80694
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index dc29403e4b73..f1f0e1f59323 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2230,7 +2230,7 @@ static void mtk_poll_controller(struct net_device *dev)
 
 	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_disable(eth, MTK_RX_DONE_INT);
-	mtk_handle_irq_rx(eth->irq[2], dev);
+	mtk_handle_irq_rx(eth->irq[2], eth);
 	mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
 }
-- 
2.43.0


