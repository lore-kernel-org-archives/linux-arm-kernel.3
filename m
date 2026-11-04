Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC5606D819
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZVHHsdO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=; b=CZVHHsdOyw3z9o
	zy407ZiukoMpXCjzayIKg02gj0eV/D6cRcY4E+ZI4TQA+96KKUHTngAi7mlA1J0MTrHLUL8n+9nA8
	X8y96Om7QGolvwGp17Z6uBRu8tUWsfft1am2nxpnfosoSvfVZMNQPsY0+fpuS0zxm2VnGuQWSsEzM
	lWsg91BTJIm1ZW7zh42dIdI4XIy8c5Kq2d3hq2grfYo8LcI/SPFjsnML5gbiRJ1EmrHcz3Z/EBlPC
	AJiULgh/HqhDrK35HBiU/x5Hh4oe3cVwMGj1MwR+wMebNebldj7tyYwvevC9/C+ssPsfPUoNh2zWB
	GPJtzhwRbHsznKqjRRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcly-00000005kvH-3EwV;
	Wed, 04 Nov 2026 15:19:34 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOclw-00000005kuI-0aUF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:19:33 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8574525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805570; x=1794410370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=jBFcDnq8GwOS2jhHCrjSDUMA4BGOj7MPNOY3frt9r3kByjvHqgctHPjxvc7cEME45V
         Z9WZgpD6UOMkh8zjFSU7u7wc5ZcVt3MoqvvZLH8morjbAJ7BpNHAt887hKnhxXZFl1PK
         8FhiIA7i242mGNnHdlZzP27LUa0uMBoSExQyv2odCA4+MMoK4BAWIZo9SwyOZn3jaOL2
         Z0vkYtWqmoquAIal6k7jt9C2CCXmOHGGBB/sFiJf0622vUSaT9DnAyG5YQNTugaenahU
         CvrTpRUuDZrXQYx2PgbL/Imk7UoOr7h4NqzCYksBmmdH8bz3gHv+Yfwlo0Ww++DnigVQ
         0ECg==
X-Forwarded-Encrypted: i=1; AKwUvBy2+1v4DK/5vvyDBZbFxlZXK/hYSN7kSN1i5fUn030wnAf8YRuyIKYUqb0Pp5rxRgaZ+/Lfd/rYkjusHDso8ghU@lists.infradead.org
X-Gm-Message-State: APuU4Z93fzpjHJxQy6FajTujjW2W/2iGdpPWqIXIvdEBMNECUIQYFUSn
	zCru0R4iY+JoyqBLWATE1NHqvDAwLDe88Sub8qiIxu0iRAjXIZGQ8WB0u9CCG3BSc3k=
X-Gm-Gg: AYBFou0NgaV6ffyMiN4uISQ+Dj1wJbB+uXP9JNCFor8k7sx0U3pmcCGrvjw+C7S/WZr
	vHjw4D/8DKZH71bMGB3frzRgwHxRAaCdverJF7zcz9oCIRZ8gCZkua9Q6BSi5xTKWKra689gz8v
	yQ2OU5wBOkGTsbt8hcXwYHAfBMF/UTZJZv1x0gxOoyPdX2OgSebSMD/65cQZnOCXL8uP01B8WZ+
	8tyet9A66YhxQwVdyp/hGgA7rOBk5xg6PZEeeNKo73Ly+2Pr7ALTs8w5BQXRxhJtUU18bOitllZ
	Yf/DrBBkVCyrY5FGwoHyCDCM16++wrakjS5FTqhqc6KtGtPX+X26WlYS3Pr7/aygTcR5rRQjNtp
	me7DbBCt/clRYnp+GN0QWrZajU49LDM402erFgJ3p104zV1GZcNRc13NFXshuxjMYryRN1G5ww/
	eOhdkKHg0cyF0sbOiZPhn44YA6NBoH7+VRg8iji0gegoBSOueDmsoY0w1tmYOs8/kp90ADPemKI
	wt5dcrIGFV4QsumneHT3TmsnAV70vt182J/uxTFE6S4x1NhVKKxH7ukwbICRXaakgzzDrWgfhRP
	bk6lU1zqKLXaccSG8MIlxWiFnQ==
X-Received: by 2002:a05:600c:1f93:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ac17ffb002mr392967005e9.6.1793805570362;
        Wed, 04 Nov 2026 07:19:30 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm4639812f8f.19.2026.11.04.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:29 -0800 (PST)
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
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Wed,  4 Nov 2026 16:19:12 +0100
Message-ID: <20261104151914.2651241-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151914.2651241-1-opensource@grische.xyz>
References: <20261104151914.2651241-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_071932_193691_1B41E0FF 
X-CRM114-Status: GOOD (  16.37  )
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

On dwmac1000 with enhanced descriptors, the hardware sets the Error
Summary (ES) bit of the Rx descriptor not only for L2 errors but also
for an L3/L4 checksum error. enh_desc_get_rx_status() returns
discard_frame whenever ES is set, and since commit 1b746ce8b397 ("net:
stmmac: don't overwrite discard_frame status") the checksum status is
only evaluated for good frames.

Return discard_frame only when ES comes with one of the L2 error bits.
A frame with only a checksum error is then reported as csum_none and
reaches the stack as CHECKSUM_NONE, so the stack verifies the checksum
itself. This matches dwmac4, whose Error Summary bit does not cover
checksum errors.

RDES0 bit 7 is not in the mask, because depending on the core and on
Rx checksum offload it reports a timestamp, an IP header checksum error
or a giant frame, and enh_desc_get_rx_status() cannot tell which. In
threshold Rx mode, a giant frame that fits one buffer therefore reaches
the stack with a verified FCS.

Also remove the pr_err that enh_desc_get_rx_status() prints when bit 7
is set. Once the MAC stops dropping checksum-error frames, any host on
the link can flood the kernel log by sending frames with a bad IPv4
header checksum.

This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
checksum-error frames instead of dropping them in its Rx FIFO.

Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
v2:
- Drop RDES0_LENGTH_ERROR from the mask of Error Summary bits. The
  length check further down already discards such a frame.
- Explain in the commit message why RDES0 bit 7 is not treated as an
  L2 error.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 7ece8d4157a8..d0622f2605aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -216,9 +216,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
 			x->rx_gmac_overflow++;
 
-		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
-			pr_err("\tIPC Csum Error/Giant frame\n");
-
 		if (unlikely(rdes0 & RDES0_COLLISION))
 			x->rx_collision++;
 		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
@@ -230,7 +227,10 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
 			x->rx_crc_errors++;
 		}
-		ret = discard_frame;
+		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
+			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
+			     RDES0_MII_ERROR | RDES0_CRC_ERROR))
+			ret = discard_frame;
 	}
 
 	/* After a payload csum error, the ES bit is set.
-- 
2.54.0


