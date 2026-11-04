Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4A6082BC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p6Q5lXoH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=; b=p6Q5lXoHBHw1pK
	9tnGNW/znCFSDMhIIrKTTkzFCOzCTqHNhu+ivGeUE/4N+yFViRV/0wkkDtOF/TsJscSxkndVJUwxb
	SREBoX+VPjpQKrrd2AJb/RCF0muqoEHvR7h2QmUl1yQLeaEVdgGWFf9oB7f7v1sq48y0assiZr2r1
	hS9OyaXrbR7X/bCfLwYBWRgdzQpnpBS5gLGDH6Mfz5GIz3to1gFWg58iGf71yR/S3PDwMFds7t0g4
	YUb6AknjLZjwyAfdheWRolbJAq+xpwSnbCXg6KcJuNjiN/gUDWuVL85FIoK2HMAewhEtdLtyCUFAo
	+W2sGeKPdFlh6UYT5AZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOclw-00000005kuf-2oms;
	Wed, 04 Nov 2026 15:19:32 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOclu-00000005ktt-1agY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:19:31 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so69147f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805568; x=1794410368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=XPUBg3Ru4hTJjxyuibUlgSIyOGbbf+yFxB1/eRIIUfil9lLZdjby5psXfPPKDFVny5
         KOtMoLKVGGNl4e4yFRbDbaQpSYA8ROyXCKkktTIJsZkd8Wz7rtGHeK8RL5QyKO7ykqsE
         S7lF2Zv8Hvh8mYay0XyGvgUD5tItK4PJwhd9sCAU1nqlMw2tXkyOddwwebIbubcuAF6c
         sjZ2Jk6SD0yyjDdESTbzGucfYMEeW+DXVGcbsU9ujoFmSt+Q6XCuqYk3D9/hRzbF/MSc
         K4Z2j9CAWn/TEfouflY5z56ORzghsD4BmGf+y0nijOt4bs+DtX6Z2n5zrEtvE8iXBzjV
         gG/g==
X-Forwarded-Encrypted: i=1; AKwUvByiTyCkkCq59FZhOvMe232/s/pT3I+jkcrdOpy8yvfZjnCEf/yBJILDYNeSs3NxpJ6XP9BHPaAN4OlXrenSA9Xm@lists.infradead.org
X-Gm-Message-State: APuU4Z9bT+mvrUcVRGWD4qa984zWRzFG4nNuf9VwbTPavd04CgSslYaS
	lBJbYSgion09NvOUK7eo0PQ2OVlbmC7QQrXZK9OydgJMI6spytunzCmj+YdehKK8V+E=
X-Gm-Gg: AYBFou1czdN1QfR6kNJKoTIOXnE3j52y+Xz+vKbzLM+c+Uvuud+LR9I2zN//T9NSepn
	UMfZpPR5J1vJuI9LVzee9Iyw2KQ1Jf/ZUQ9SM38d7PfLhx1M892SnZ1pQuajP2ATJGad6dvmb9K
	wouBZcvJoy4+XaV3B1d7yYPY9m3aQ9Af5UBE+p2NOKRhbH5ICXA6EBjFihxdKkdafl+z1x3GOvd
	oH4Ktp6Cafq+5avIUmoZ0e7bJX5XvRQZEXqH5O2y/ZAUJEQAJ4hubqtuen+HE+qtQdwu5WtJn3t
	lEK1kYl5BpxtwqzJOjxbtCMDm42NZuctj4H+57yw6X2z4D5G2HHOsYYv6POCKy/Nmhh1VmwixDY
	qguK9Dh6bUs1Fn6MZxIXGroEUAy81I0LQBv4c+bvHy5kneIU8Q4bLNgv2W34KZhJ4XaUnJNbpYa
	jpi9O3Nr6EH22hUfr0XRYf2sGLwzZyG+k9xqDV2kKKTQfgbCwdgCcNvG5kYuvz/D9FP2XGOHgTL
	safQqTinpJCInq0BILDlR/cjJePH52+GgMw2MO6AHdH46hD1Wnz3Z0pAm+flMuM+IbN/U2T+hD7
	1useb1rRRQG9ka+6SP8jlE6MWg==
X-Received: by 2002:adf:e18c:0:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e6e2c1d83mr40340920f8f.8.1793805567922;
        Wed, 04 Nov 2026 07:19:27 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm4639812f8f.19.2026.11.04.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:26 -0800 (PST)
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
Subject: [PATCH net v2 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Wed,  4 Nov 2026 16:19:11 +0100
Message-ID: <20261104151914.2651241-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151914.2651241-1-opensource@grische.xyz>
References: <20261104151914.2651241-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_071930_434939_E7DB6327 
X-CRM114-Status: GOOD (  13.23  )
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7ffed295eb14..3e5803db19b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5547,7 +5547,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5575,7 +5575,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5789,7 +5790,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
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


