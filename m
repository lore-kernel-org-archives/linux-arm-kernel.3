Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E05606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q4mVhsVe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uC5zYyNDKu5QdLJSVPD/ZbHeH86phuOD6U9spopPKrw=; b=Q4mVhsVexzH4T/V20YpMDZ3Rcj
	8T/Tt0GsTnJKijLyL81KygxGEsD0CFqjHDeS9aeAE2flZqUTxyIwP2EkQOiolargj3T+ToEGd4NdH
	A/euung3vPe3aMiJyq/8owE25Y9Jv8NhYQsCThxR2zeb/aQ5nZ0jWokHg1QXOM75m0RP0qY+pXmpF
	wuCwvlnKArgVww2KuJzYnZ86gTQmBBiMh/PdHjbMyJBNS56VwEruOKGk1dmoAhNNaeu2roTb5Eu91
	JlTr0EN0eLv/TQMH1vA/3Uam/rjgqkGUbD9oW6Vbgo/Ptq0B4VVyC9pR9Z/J3Fpo7aia0hpnr6lY8
	eTGVh4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF7U-0000000AVM6-3w1X;
	Tue, 20 Oct 2026 19:03:32 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF7S-0000000AVKg-15YH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:03:31 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so27273605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523008; x=1793127808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uC5zYyNDKu5QdLJSVPD/ZbHeH86phuOD6U9spopPKrw=;
        b=ZnecRuJt9lvsI0bt+kcNas1jL7TAvRM6iUvN5b6xeS6eNkirFu9yoccsRuJj1ekvQ8
         PI1ccCfYE7o5X3pE/y0wWgBRmapfH3cMqMaLHvpd73m1X32ZADKReBd6+MNNs/4aPjAW
         hwVe5Jvqu/Qk7Lq6hGnlkso2sSEEgQ0aAgz4z802kfA9ZfL7zbDwriOUSdcp5RK2Y50m
         h5TgbyzfKs+a2ETmSL6pi4j6m1U/lZY/erHWe9BXWVUU73VNKnzU1fT0f//nSSHc4WW0
         7Lv7+eAYfxYDr6nRReSY58/dxcvPIncmDHSuR2ZEHqkkUJK9Et47iMeBHq5x1gL9sw94
         3dSA==
X-Forwarded-Encrypted: i=1; AKwUvBzkX/bN93q9dS6qJf4vzVlOVlVnuA69FxNo8HRQ3jhd/l7/tXWgHeuJ6Q5xAnxfFSkpoDlgIj9zQvnA+8eKJZJy@lists.infradead.org
X-Gm-Message-State: AFq9FYKQyhgZa5xS96XTqVzyjBg59F6KPrrTGKY/95F7uGKK1cE5IZ9f
	FhEGNUk+/QKdr+aezOWFUdW40s1753mWHLZHWxvcFuzlYgOZKErcRrFZwpiatgcx+Xw=
X-Gm-Gg: AYBFou0+zqDYpyEoG3RTBwVeUJXtCa/amnox35RmOAzy15OR4RiNbhsY2J/b+AaCzOb
	gG/FXr3HfBaPEfjwGi73SXa49EXZ5CFJkqoYKhwW4pGbAqlW1MfiuAqOztqe13Aje1HZHsnHdLI
	jzRSgJSlhtwq0BD60EBFj1Y/3lpr5hXWt7498jdkFNqhHZrBWkqymoxrScHHkMz4C3OJvED1Up7
	UrPFZuuqRLIWZCKkIZh3wzFZUlNDdlQ0DyrBjsfGOg98u0CQ4YPUcjU2wH5eiV3V3bHS7iSDM5r
	Ml2jQ6FkVuYW86NtlTQjWiD5jJksIJoDnn+3dzjHyvN+R3lo+Ha8533BH/JnBBCUMuaBB9XoIG+
	hZNCfcRM2cSksrJ8GHlgHO71wjNKly27cArsHI/o8OHpOxGpQDaxuWQolfPxRIxAgjBImrKXsmM
	+Ex3DHVKu/CiaiJly5SMDkFo8UZHYeHfGlpVOtWwRXKtXqUYrzT07dIn7rkzp9wAQPaMM=
X-Received: by 2002:a05:600c:8709:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1d75e3eb5mr232302695e9.11.1792523008071;
        Tue, 20 Oct 2026 12:03:28 -0700 (PDT)
Received: from lake ([2a02:810d:d09:1b65:a3ee:29e0:454d:c31e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm279157f8f.23.2026.10.20.12.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:27 -0700 (PDT)
From: Grische <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Grische <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Tue, 20 Oct 2026 21:03:18 +0200
Message-ID: <20261020190319.884375-4-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020190319.884375-1-opensource@grische.xyz>
References: <20261020190319.884375-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_120330_315374_48DDE8B6 
X-CRM114-Status: GOOD (  13.31  )
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
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
on.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783
Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Grische <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 2 ++
 2 files changed, 3 insertions(+)

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
index 3ac7a7949529..00c8d4dfb553 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -129,6 +129,8 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 {
 	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
 
+	csr6 |= DMA_CONTROL_DT;
+
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
 		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
-- 
2.54.0


