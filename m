Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eRl5BMH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDyp6R6XHxt49rPY0V1CwuTyDv1VXxyGmnKmgJVZ160=; b=eRl5BMH2pC0L6eU2JKX5XEJ05M
	kvVE+7qCDk94Foe030IBubbcA50Wz57GC2y+8rY057NEmR0IbQqk3x4AnFj221cTsmUMqtPSlVzvt
	yt/wpeii6IgZqNtyHIYvgTGwtvFOKVbkPBe1c+cfN2LL7D/SFuxKLqd3VB+NNG4fsDG75/NEtU6cL
	Xo+VzcuZ7kQ/FWeB1W2Db0xGAu88YvvH5dAC/QM1gry8A5PJXQZXALCq/zRpQJrB6OTBSmBRUBUCJ
	ZavZmg+4qWCdr7LcT0DQ0M00FOR0KYgqZHmwH3N+mW97F/O93UDTQFqQ9v3Yr3Ol2GVFL7s2TMjJh
	rKVZ5KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF7U-0000000AVLm-3Nak;
	Tue, 20 Oct 2026 19:03:32 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF7Q-0000000AVK1-1jqG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:03:29 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso889269f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523006; x=1793127806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDyp6R6XHxt49rPY0V1CwuTyDv1VXxyGmnKmgJVZ160=;
        b=mfne/S9WQ/o2b0QhKBJmEezLMqJ3TZLIHBqCIj26t2YmRNOlC+WAcRzQazyDmppXec
         JLjdUK1TZCPtcmG6PpF4x77YYi9MN+99GirWaE8r+1vxOv5L9RXgBZ90TjGoqxhZMaoB
         t+H02J29/e3kf3PgR4WYZQH/JuZhXAZ0LnZjHjZqCoTcHHEPl3gELSIW4jAH4F8wfZXn
         /tFOIHiET4bD0Tl0xBvgDXAUuufyxQxaOuUHL+fRm1pbyOQJGK+N9yiCwaP0AMXGqCqg
         HBJQROSJOshnAOQg6Vlob30ZDhllWU28uykAF7E3vFC4FpQJdAMQKOMSvsSUKLIc9EFA
         dsVw==
X-Forwarded-Encrypted: i=1; AKwUvBzrwkwN2B+VhGY4CgmFxgkd3XPG42j7wXXmSd2pMQi+GEWy3ZaI4QWbrIPwr/zwVnlJLr9iG12eX2WweqAJ3drd@lists.infradead.org
X-Gm-Message-State: AFq9FYKzvoRb9lsMloo7U8qFGxqX/z2t/NaNjDT3xVYps56B93ha7HMZ
	XiiE0PAyt5a1lzv8sRt1nbPrD/F2vCLZPj+ee4CkkOLOUU7w06mwccdVir/PzNJPB8g=
X-Gm-Gg: AYBFou2ymfpNu9fdxoFablC4IvhdmV8omB6ODOrcpbW3+qbiEuZbzyeraoO99mwa7t5
	KgjNXhWCCM5SDkhGJoXehvooW+yLB+gg+7vlBVkSAXwvms3UOOcpr6FdORqesYP3n74nBUHpGf3
	FB77TUkXSGq60H340zDAWD0AP02W15jz3G9f9NRfQTFRxf05Bkd13y3FshCj0UThCWMGej7nKXx
	fkjRjXnO3NynFm0QI035iiBgk4783C4ZdSrH+S67qtkcigVoJEQaRevpxbQbuNOoTKB6itxm2Mf
	NCS4HNvz9J4fQH+5sYyvJ2duLo5qeTGLkVlnwFdY8IiX5SLQbZwrpydhgWG3PCLuCcDAoyvWDCq
	T/Iw8yoNV3sUjPVwHdfEPYnonzjDTFPkgj7SfxXWdtgJ0KoJnD3iIzLxFkF1wjDP+3VnC3NWW+k
	UYYt0U4N+oDamghn2XnCZjVAOQb7TyZZq4OFkh5qi93x4tp5G3IkjfhVtwnMi92n+2CeM=
X-Received: by 2002:a05:6000:1865:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e07bb2cc8mr29021791f8f.9.1792523006337;
        Tue, 20 Oct 2026 12:03:26 -0700 (PDT)
Received: from lake ([2a02:810d:d09:1b65:a3ee:29e0:454d:c31e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm279157f8f.23.2026.10.20.12.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:25 -0700 (PDT)
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
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Tue, 20 Oct 2026 21:03:17 +0200
Message-ID: <20261020190319.884375-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020190319.884375-1-opensource@grische.xyz>
References: <20261020190319.884375-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_120328_491648_88BCB559 
X-CRM114-Status: GOOD (  13.69  )
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

On dwmac1000 with enhanced descriptors, the hardware sets the Error
Summary (ES) bit of the Rx descriptor not only for L2 errors but also
for an L3/L4 checksum error. enh_desc_get_rx_status() returns
discard_frame whenever ES is set, and since commit 1b746ce8b397 ("net:
stmmac: don't overwrite discard_frame status") the checksum status is
only evaluated for good frames.

Return discard_frame only for L2 errors. A frame with only a checksum
error is then reported as csum_none and reaches the stack as
CHECKSUM_NONE, so the stack verifies the checksum itself. This matches
dwmac4, whose Error Summary check does not include the checksum bits.

Also drop the per-frame pr_err in enh_desc_get_rx_status(). Once the MAC
delivers checksum-error frames, it can be triggered from the wire.

This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
checksum-error frames instead of dropping them in its Rx FIFO.

Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Grische <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 051253601225..5c43d32a2f22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -195,9 +195,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
 			x->rx_gmac_overflow++;
 
-		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
-			pr_err("\tIPC Csum Error/Giant frame\n");
-
 		if (unlikely(rdes0 & RDES0_COLLISION))
 			x->rx_collision++;
 		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
@@ -209,7 +206,11 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
 			x->rx_crc_errors++;
 		}
-		ret = discard_frame;
+		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
+			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
+			     RDES0_MII_ERROR | RDES0_CRC_ERROR |
+			     RDES0_LENGTH_ERROR))
+			ret = discard_frame;
 	}
 
 	/* After a payload csum error, the ES bit is set.
-- 
2.54.0


