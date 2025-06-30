Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A76DC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yb3IQbpuMS2d0N4ecb543eUhZW7wCeSSmO3q1oI9sU=; b=ZrL4Rk5mNsN7IZz34xdciuJt+V
	U3yiZArbXGTawhJ6UbUvszOm17OOpJjWeT6tb8PClW6kACLFC4PZaU9VteYK/buel//+7lDUn02km
	q9yfj/SjdQsBt8oKYIdGPUaxSuXFekC6kJenlBIOYYra2MBdv3bzwGHbukHp4Smafp/iH9vV2XbUn
	xYataV2CF8WvKQugz6XNMpf4ZfJ0k2iP3w7sYicYdqkpwmpAOmkfOkGqC6nItrUWUFamoRdkFlGWM
	s2NtV7FZPYEI7ZfKkc5PumyMsTYxxSoHagzmjSQ/K8/MNc3Y0VaHLA4yV8bJwU41XgRW8jMa/pkM3
	lB658jpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMTk-00000003XYe-2w2T;
	Mon, 30 Jun 2025 21:55:56 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMKn-00000003W4O-3SxT;
	Mon, 30 Jun 2025 21:46:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWMKj-000000007MR-1X2i;
	Mon, 30 Jun 2025 21:46:37 +0000
Date: Mon, 30 Jun 2025 22:46:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 2/3] net: ethernet: mtk_eth_soc: fix kernel-doc
 comment
Message-ID: <4ce2fb696b94350cf54b4b623cebe4f6d3944312.1751319620.git.daniel@makrotopia.org>
References: <cover.1751319620.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751319620.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_144641_862289_6192992E 
X-CRM114-Status: GOOD (  11.54  )
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

Fix and add some missing field descriptions to kernel-doc comment of
struct mtk_eth.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3: unchanged
v2: unchanged

 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 9261c0e13b59..1ad9075a9b69 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1243,8 +1243,9 @@ struct mtk_soc_data {
 /* struct mtk_eth -	This is the main datasructure for holding the state
  *			of the driver
  * @dev:		The device pointer
- * @dev:		The device pointer used for dma mapping/alloc
+ * @dma_dev:		The device pointer used for dma mapping/alloc
  * @base:		The mapped register i/o base
+ * @sram_base:		The mapped SRAM base
  * @page_lock:		Make sure that register operations are atomic
  * @tx_irq__lock:	Make sure that IRQ register operations are atomic
  * @rx_irq__lock:	Make sure that IRQ register operations are atomic
-- 
2.50.0

