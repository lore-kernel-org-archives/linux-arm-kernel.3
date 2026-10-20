Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC05606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nEFiB4to
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XW2XawDSDFkTSk897IfBcZxxEG8qyMFEO8Acjxpagfo=; b=nEFiB4toYdto34/JW01egHReaI
	PehwIsvZLkYBnCqdjLdShdKqoUbUrBKazNOSL7TXWc27XftyNbh3NGmS289pRsLh3V5iEg1r4X8FM
	pCb6dnAucvuJStSC8whv/H5eGII+VLV3myh0b3ZgafSdiN09hCvftAaoO8RK9iZfToy8/aoJFmwHQ
	f2d4zwmSki2qaiwpKLZl+6cxWADVonZaI80eJp1mdecGHQlrIq97Zv2H7JV8o1eG5ldN8+8TYGHrb
	R4VMFtMx15ZA61b7iOkEwaW031knHGAGRHoYmENf7eLhCPi7Er3xrlDNv4GApVrE5k0Z0S9zFBUya
	JvfHuMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF7Q-0000000AVKM-2rzm;
	Tue, 20 Oct 2026 19:03:28 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF7N-0000000AVJl-40FE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:03:27 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1921709f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523003; x=1793127803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XW2XawDSDFkTSk897IfBcZxxEG8qyMFEO8Acjxpagfo=;
        b=Rf+OC9UD0i2duqrDl5OF1aFJ5VwZ2T1hpc9NW5nDJJoiuUaXIVczO8YMpWffZB52P4
         jKNHIl0lw8RI7iieIU0feGiBHGkw9RAoNzFPXFjD96K9vQ1ZL+eyDW7JcTuB9e8WIUV+
         eii8KSarXKmqmjb+axDni7nFSf1AwbikoIXnZihIOJmM+cgihhW23La9dHh6X8hADT+r
         z3bQntrRo6gNvX3zTQNslki8xGI7mdaQo97lg3TFCdiY7jF4+JPPl6tg7J9TcIFxACBh
         jexICSQUuWC4wC1zRR8528BQcFEodsKp/Ilm/ZRMjf9Y+pJRM0Op1jQ+L26IAarVidPz
         J4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwBfqZpa26s02mLZNmizIQxCxiB+4HkE7WqnosQV4T8xaEbfln59VFadKLIT/2LdF5jja/BjDStRPH68XtOqY2K@lists.infradead.org
X-Gm-Message-State: AFq9FYIwztRR4C8ASlwqCVgqRfF1nduUjVw9MQEYCQ0umsZgtazclSA7
	6MwgEV13Ncofckg96DVXaKsisTEdtAKfjO0eZC6WDpv0aOGKvfFLC7Oz5bdRnlo6beg=
X-Gm-Gg: AYBFou0TqgNj2rwFZnpkX12vcJOXnngDPO8w0oOpdeUeMPRy6V1K4yISB6Zlcle61zM
	g+I9LJDXea4j9S88krfk4D4QvR/D69U5uq9DnT5XVb1pX+s3x9mkEFu4hiHH4G2Kv2H7xyp03lI
	P5DRwu0O0hJ/dzitHzkz4O5NBj8XZaOaQsJFpsrUgdnso4l5enq9NyzQnBUIVWo62MN4vUss0Oz
	oVxTbByLvOfS9tQuOvE1J3ok5wiQIxUWnyQzoGuHkaEXUGJjmVfQmJ4NrlthivYCyRtRYFTi/ZL
	cyzowZcu+mKLF20v1qi2CO3ihZVQ651GcBGd8HO5vW4qcx9DoYPPSjxFXwjyqq36G3WLCZojByf
	WOxaNGBBqHOpPEARWgJQsu6m9gh/8dchy4zs5Hovg7jVLbOTRDNz4FxS4/r/bwHnTPu8dVYiht+
	jKV1gOif1drZlNQ2/SuMqH9HgZbBUjpfsgj0Ojd0+xFlUG/HSZ5ErcyWSRcAHxNOGsjqle
X-Received: by 2002:a05:6000:1ac9:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e07f99197mr25786391f8f.39.1792523003036;
        Tue, 20 Oct 2026 12:03:23 -0700 (PDT)
Received: from lake ([2a02:810d:d09:1b65:a3ee:29e0:454d:c31e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm279157f8f.23.2026.10.20.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:22 -0700 (PDT)
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Tue, 20 Oct 2026 21:03:16 +0200
Message-ID: <20261020190319.884375-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020190319.884375-1-opensource@grische.xyz>
References: <20261020190319.884375-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_120326_029033_6F7C4CA3 
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
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit ee0aace5f844 ("net: stmmac: Correctly handle Rx checksum offload
errors") taught stmmac_rx() to honour the csum_none status, but
stmmac_dispatch_skb_zc() still ignores it and sets CHECKSUM_UNNECESSARY
for every IP frame whenever the checksum offload engine (CoE) is
enabled.

Since commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") dwmac4 delivers such frames instead of
dropping them, so this path receives them.

Mark the skb CHECKSUM_NONE when csum_none is set, as stmmac_rx() does.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Grische <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9741f97fa37a..32810f949245 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5463,7 +5463,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5488,7 +5488,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 		stmmac_rx_vlan(priv->dev, skb);
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5698,7 +5699,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		switch (res) {
 		case STMMAC_XDP_PASS:
-			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp);
+			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp,
+					       status);
 			xsk_buff_free(buf->xdp);
 			break;
 		case STMMAC_XDP_CONSUMED:
-- 
2.54.0


