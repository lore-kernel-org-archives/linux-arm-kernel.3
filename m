Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DBE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ywGU5SNK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmKHW74P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=; b=ywGU5SNKnEV0xf
	6E26kAO4cyhF7iKdW/bixOE/PYxHpP8MUWVzkJIzf8hWcwd+7pDY3c6bEsICodbteAxj+ZsGN22YT
	Y2hMrn3/MRSnS6xvySz4hX8yAkDcm9ydRJpRjamRuKZlMggYGjWPS0iPuK0nCmHIR+DEqAj8i5RCJ
	aM/7dBateG4OIJSjhlM0nKwDNS1PwF0kxdWcsTfni3p4M+EEDMqMxsTRVtyim6uzm+rNkzxCuO7L0
	MpshHeRHcR+JqT5e7yjf2TC6irV7NkaqjbPMryD3tc3CuPRVP3HYYBt+ogkMeqETewz9/Awz6Es/e
	SDeAHPcUOT0+P5c3dlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaS6-00000005OEx-1c5v;
	Wed, 04 Nov 2026 12:50:54 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaS0-00000005O6u-3QZh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:52 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so430635a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796648; x=1794401448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=WmKHW74P5YK3fbtgdV0j5mh2YuqtWtoqI0VotoB/KQp2CqAQAtmCSRoSKyy3mhRDpz
         NC4LEOFN8rWwdOpNly+uNHiUJcnPD8+REjVfz1/A408SV8yfQ15wr0gyJZ+a6lCLmU62
         QCmIGc8Bkg3IS+BmkDvyLRvZ9EqLdKMy7CrQRWTVg68sCjp56sr56IIX2HLLh2jxiACV
         5lB/hYa5iUou2vArB+IVpq21h1CRikSjvfjDq6stzCWO13g0ro9a6r+VvmegQd4qN2sL
         zf6UswKIfmm7We8rcIvEuNGETntvSy2Jo1CHIYwI+Y+j32XA1pgEpz3PBlSw9TKDOsyk
         gfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796648; x=1794401448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=MfjI7+xF3YOoEniavj381SF6IKhm1FEQW21/1vR15GFTQTNHm/TjZ5LucolPAO4Uc2
         0+d9pP/8aWfR+aKVfm/k02ekpgODA8ZfdYawFWIuIDlWL6B2ajazV3by/7k6BVqDbd3b
         kuI2wo4w+dL8kq4tKuegf5bwHMJyljZiNQUYH/Il3zwAgxN0l96YFYQyR+wNSdZ23zFD
         6DFItOr3Nk6QDOkI8U8jsr2mI1lAKM0ag0WhLefUZyduXb27i7k3cFNBxNZkprndAmfH
         f1hwuvGs7ghOd5c3k32dRjfalnLKydgK7HRgGd6xfAFGJ8yNJDnh4Q8+7gjKtP12DMO3
         WmUw==
X-Forwarded-Encrypted: i=1; AKwUvBwI8SDdxqruZNWzzROt2E9MDlCra9Eaz6bp60lvRh7dwXTdqIlmi0ja6dGeaYMwLRWyn8omRbHEuhiDoekC7q5s@lists.infradead.org
X-Gm-Message-State: APuU4Z+jGCO7LsSOJ9iSsURaS4LbtFJ0lKnM004f0acWywewdnGmISqq
	iea5yrf07+czfpIp3CIi3StFjFUpfOsCyQfNqqZKHETha32YoJaV+pWfVT9ZOxa8
X-Gm-Gg: AYBFou0wXmz//leD6eoasLBg+fkMbGJL3XlHE7kbDi+er6hN3y3S8J1uJsqwqCo7fNe
	PjEk92bi1Qu4fCq3yhs/XXKxsPXg9OTK5latADgMfxSQ0e2HROQCOn2J7bqfY71frLqQHbpO2tN
	EOymtPGo81tjNp3zAjfZFzFbWDul3vkE8wYZzJ83MyvVeEyqZ1WCozb1VU8GP++o8aD7gks3v8A
	oEbHWHZY754Rk6u2LcmcCkW4sAdZ2jPFyrVgVcGAgUHPrP0gpxGjlOYnUo9xpVHkKXdFtR7jkEA
	UWdFtIGWLtoSKPKPCbCoq7VbqFs5n0QXXcnNkGbbfmeLC6y20xe7AZjCZTJaQJ2aaHchTErA7Ab
	duGvJqbO4IIiMQWaBZVycSO6Dlv+A3q3HKr9q9HFZW7iDsIsu++RhHnUVQkSLuNbqARSsUqXvLP
	rzVres6YwZsm1G90Z0bZZrywspCs1ow6hCglG9eZl61OwG625zNw/vGR5VS259ApfF19EwoX073
	wRRItEYmVEClbe4Lj5NRRSmrY7Z6NlFFY3ZcpF6/RB3RaEl636d66puSke/o4OWYp9O+bvZpYGR
	dpPswhslLaKnA6f+vYZ9FELpuPDS
X-Received: by 2002:a17:90b:4c52:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3ae897ccbfdmr13704831a91.11.1793796647941;
        Wed, 04 Nov 2026 04:50:47 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09449bff2sm3920799a91.9.2026.11.04.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:50:47 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v9 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Wed,  4 Nov 2026 20:50:29 +0800
Message-Id: <20261104125030.1183146-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104125030.1183146-1-zxyan0222@gmail.com>
References: <20261104125030.1183146-1-zxyan0222@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045048_860238_71B68A79 
X-CRM114-Status: GOOD (  13.10  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The generic timestamp_interrupt() handler derives the EXTTS channel
index with ilog2() applied directly to the PTP_ACR channel mask, with
no check for a zero mask.  ilog2(0) yields -1, which ends up in
event.index as 0xffffffff, and ptp_clock_event() uses that index in
test_bit() against a PTP_MAX_CHANNELS bitmap without range validation,
reading far past the allocation from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an EXTTS
interrupt arriving in between passes the flag check while the mask is
still clear (snapshots can also linger in the FIFO from a previous
enable, as only PTP_ACR_ATSFC clears them).

Check the mask before applying the ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 870c740b4a50..fd1142344950 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -245,7 +245,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1


