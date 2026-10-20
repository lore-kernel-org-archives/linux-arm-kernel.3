Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8h992mE;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=M+eShIty
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f2RC02k4kzNCEkVNB0+GicfGGVn/vdjSFeUmhuG7iU8=; b=Z8h992mE93chmb0aZ0f9QqfO4e
	AnStYDexyG1BY3QCDsjU3S0KOe5MwNJJXj2Jgq3nMq8PQg+LOQcIjDQGh5WzXC8UjP4U7JSZIgoHH
	DVofW/V4Sz6dXbusjdnkINhu9wvqZ/pbusNa5etTYZxhAISnSGJWQMkUIiuS2PLujq3wBjVI0FFCA
	3I0t2QEWbXzYzmdplJEePRqZB4UymPXzm4aFjicAZq9T8XXpvaL+REG6H4wP7inyCfXZ/zQ9La3JF
	jalyr0eWzMt7aW8CnyKHhd3n+Sq/U76zKDnSziK8+mIAhONBeuBhDHnouwbEKQBw8LqXMdtcX49J0
	txpXJ9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5fc-00000009FHh-1Upo;
	Tue, 20 Oct 2026 08:58:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5fX-00000009FFv-0ZMA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792486689; x=1824022689;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=AG80YPxqxi+pkt3jLWqElJJ+6PD1MdH6CVxrcZj82s4=;
  b=M+eShIty9NvRlBxu9MuRMfhCdwoUq2qMkYxK/uk17M/KK2PtK9jzhtKW
   zvqTMft7czsaRS0Oe3EKbFHjpCa5y/SRCleoMc0LzDK143RW2H63DPVEa
   yg4xE/ZmLeIIKZansfx8g95dXj5JshkkFFbXAps9U/t1Rt59PlFaT6kz3
   1k2X/uHB9Ntxw8aF7G7PV0RQX9XrtKOw5HoQVmKO+0JZ3pps/Gwp93Gtb
   06rXfvHWmGdZKXhzRy0xZyDLtOwIDa57Xx+YEqffMROvQ4JXjTtbRN6h9
   yMRG1ZuJ2eJWKD5ZGGFNKckHJw4ZSvG5pm17jnQ9DsAyREoZPCs6+7Hru
   Q==;
X-CSE-ConnectionGUID: g1XMydjBTL6qIJKaVNKb0Q==
X-CSE-MsgGUID: +ALR+oy0QVOFf9U4GZMkCw==
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="65303176"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:58:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 20 Oct 2026 01:57:59 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Oct 2026 01:57:58 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 20 Oct 2026 10:57:27 +0200
Subject: [PATCH net] net: lan969x: don't disable hardirqs in fdma tx clear
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-lan969x-fdma-tx-clear-irq-v1-1-b9f9d1eda317@microchip.com>
X-B4-Tracking: v=1; b=H4sIAPYs12oC/x3MQQqEMAxA0atI1gasSrVeRVwUm2pAO2MqUhDvb
 nH5Fv/fEEmYIgzFDUIXR/6FDFUWMK82LITssqGuaq0qZXCzwWiT0Lvd4plw3sgKshzoet13nTe
 6bRTk/i/kOX3vEQKdMD3PC39ukH1wAAAA
X-Change-ID: 20261019-lan969x-fdma-tx-clear-irq-d86877f96431
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_015805_592281_FCD1E031 
X-CRM114-Status: GOOD (  11.56  )
X-Spam-Score: -4.7 (----)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lan969x_fdma_tx_clear_buf() runs from the NAPI poll and frees the skbs
of completed tx DCBs with napi_consume_skb(), under sparx5->tx_lock.

Before this patch, the lock is taken with spin_lock_irqsave(), so the
skbs are freed with hardirqs disabled. RX skbs are marked for page_pool
recycling, so when such an skb is forwarded back out and its tx
completion frees it here, the free path reaches __page_pool_put_page(),
which warns via lockdep_assert_no_hardirq().

Take tx_lock with a plain spin_lock(), as the only other tx_lock user,
sparx5_port_xmit_impl(), already does. tx_clear_buf() is only called
from softirq context, so disabling hardirqs is not needed.

Found with lockdep enabled (CONFIG_PROVE_LOCKING), which the assert
depends on. Reproduced on lan969x by redirecting received frames out of
another port with tc mirred.

Fixes: d84ad2c0d80c ("net: lan969x: add FDMA implementation")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index c7e0e58ff0f7..053d125eda65 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -54,10 +54,9 @@ static void lan969x_fdma_tx_clear_buf(struct sparx5 *sparx5, int weight)
 {
 	struct fdma *fdma = &sparx5->tx.fdma;
 	struct sparx5_tx_buf *db;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&sparx5->tx_lock, flags);
+	spin_lock(&sparx5->tx_lock);
 
 	for (i = 0; i < fdma->n_dcbs; ++i) {
 		db = &sparx5->tx.dbs[i];
@@ -83,7 +82,7 @@ static void lan969x_fdma_tx_clear_buf(struct sparx5 *sparx5, int weight)
 		db->used = false;
 	}
 
-	spin_unlock_irqrestore(&sparx5->tx_lock, flags);
+	spin_unlock(&sparx5->tx_lock);
 }
 
 static void lan969x_fdma_free_pages(struct sparx5_rx *rx)

---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-lan969x-fdma-tx-clear-irq-d86877f96431

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


