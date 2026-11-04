Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD38C606A7C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XLAvil/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bLOJZaXgrljjby6d2ZZG7h7GGo4k7OpcvIB3L0adEqA=; b=XLAvil/HfV56eY
	tlfMukmXxs6p+0vK9cxaxe+EdLaj6brYwqNAqkw5W1aMRNBHiaZBZTBJTaVJFXO8HBzVnsOCahIS4
	gRgt57WoJKagYy1iAJ3gfb6mAugVABW2WemSA/Tm7X5NUxZktCXcWgDyagCQcRVHb7p/V2qizHYHg
	Rb9NFYQvYzv7diJWtZ9AccMrIKZQ6UgE8XE8HI0lpY6Kiikli4ZCofX+Y+klh7zjupciNQWzq3BXL
	XIqLebdVBeNLfqhuzCzm2EJgjh+f4k/EEZUnDyGc5Zouxm7eGNiK8RNitU0nu2FRL4D8hnAQ9uyXs
	h+HMXGAYpWI+pbe7Ctdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcm1-00000005kwz-3gAX;
	Wed, 04 Nov 2026 15:19:37 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOclz-00000005kv8-00QR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:19:36 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso393033f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805573; x=1794410373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLOJZaXgrljjby6d2ZZG7h7GGo4k7OpcvIB3L0adEqA=;
        b=spLhq8vj/Cmkrc2Rn52GNrr8Qke+eTMQWSmCIdruuwAdAC5hnGkhD6KAI6chuNNqve
         tTcTznQSjeUe90sPzssyo+ZkAWCCvffnxAoNrV0OwuDm47y4xh4U4xY94PNstM9fteXz
         uqVfdnvuJLDen2CWeoK6DQzxCCg5FUjx5jxZDI5BvVWlhREb715BFHxudCXx8eKOLe7k
         xXRXKJL4fjS+7y8tMADBDtwR+yOch6rL0ff3s1qJXz1o9iODD+L6lcHez5jeuvcvCU1z
         cR7T6VYn3JoVGgEY+GVKFbSVC3z1ZwQZJLS6SL2qUjh1uWlkfnVAz2qhGQFwPIIi83HG
         mCCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY0y5VPfwmT+xJWRiOiYzPw5Ay7W/6Tjl7qt0fzj0OQa6/1sGgAs8m/qHsTlLAH4MQbxfF76VKr0FqwrI7ryUB@lists.infradead.org
X-Gm-Message-State: APuU4Z9/41KtLU7pIjm/bsopdM2PBSWCJ5SB+N3CQJBcIqMX9lAmyRmN
	pw9zYx/nm48Upts5gsfOGQzLJ3Vzv/JhdB490LBqzp6o0lTN1lAlDCtUiCXB4/fCkFVM5dIXxHR
	WrDQMM9oS3cIs
X-Gm-Gg: AYBFou089yOG2Hehk9nwIW422eioNNZSfYTHvRtFUCDqSKZXZN/Uc+UGQUfT19QnXVF
	RTU/NEfkVJUx37D0NaiyY1PHxI17UICWcUsQaxWpJQ+jRSNg+PBXtu24ZnRB6AS9tl4Zj7XNjwY
	91W+6IOunqzZxV3zw81wPRa6eP7ko4VwVrfEzaZaAGSn5+yJHsdiydVYQoxr/6d/FPwW4imXHI+
	OEQOiGm4/Rkn76i1G5S8lTxEAMWYaPLeCULBiFUdYneda4/IXUA1u7lhf8hwP+1gFoqWLRv0FGp
	nZet8b2rIXajhsQa5xuupX47nfCAUFaBcY3Lf0sMXvXFRuYwD47vus2qBMa+oS+0RqXoiZlNMat
	CKw4JjSXjzypCotSURwwlfXqgE3GKnTqGaFzs4x61LR8C3ga7td8STbLm87UabkUmwYEjT/F2EF
	odMqYHng0gVJ/6a7Ka7T2syleDRP5hT0Sti/SLe/Pq5VRJTsIEGMQZvG2/B/ZmAmvOV7vV4UxT+
	K5wq38fdOQLOQmjWy2Hs4r/UvdzoyJxd74nxtp5Nj2RQb2U2DfWcIPY6IP4N12ga6k5ttZ0nba/
	okzxF9s0/yvyGV9B5iGyxCOihVVUU00C17J3QfpJWCtzPWI=
X-Received: by 2002:a5d:6950:0:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-48e6e2fab84mr28602707f8f.33.1793805573103;
        Wed, 04 Nov 2026 07:19:33 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm4639812f8f.19.2026.11.04.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:31 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Wed,  4 Nov 2026 16:19:13 +0100
Message-ID: <20261104151914.2651241-4-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151914.2651241-1-opensource@grische.xyz>
References: <20261104151914.2651241-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_071935_083769_B01C9F9A 
X-CRM114-Status: GOOD (  19.78  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the checksum offload engine (CoE) is enabled, the dwmac1000 MAC
silently drops any frame for which the engine detects a checksum error,
before the driver sees it.

This breaks VXLAN over IPv6 with zero UDP checksums, which RFC 6935 and
RFC 6936 allow for tunnels.

Set DMA_CONTROL_DT so that such frames are delivered instead of dropped,
as commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") did for dwmac4. CoE remains enabled,
so the driver still sees the error status and marks the skb
CHECKSUM_NONE for the stack to verify.

Set the bit only with enhanced descriptors. The normal descriptor parser
does not report a checksum-only error to the stack, so cores that use
it keep dropping such frames in hardware anyway.

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
on.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783
Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
Depends on patches 1 and 2 of this series.

v2:
- Set DMA_CONTROL_DT only with enhanced descriptors. The normal
  descriptor parser does not report a checksum-only error, so cores
  with normal descriptors and Type 2 CoE keep the hardware drop.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 1de1f929d61c..004e6e30a68b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -163,6 +163,7 @@ enum rx_tx_priority_ratio {
 
 /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
 /* Disable Drop TCP/IP csum error */
+#define DMA_CONTROL_DT		0x04000000
 #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
 #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
 /* Threshold for Activating the FC */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 3ac7a7949529..31d5f79ef560 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include "dwmac1000.h"
 #include "dwmac_dma.h"
+#include "stmmac.h"
 
 static void dwmac1000_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -129,6 +130,13 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 {
 	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
 
+	/* Deliver checksum-error frames only with enhanced
+	 * descriptors, because the normal descriptor parser does not
+	 * report a checksum-only error.
+	 */
+	if (priv->plat->enh_desc)
+		csr6 |= DMA_CONTROL_DT;
+
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
 		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
-- 
2.54.0


