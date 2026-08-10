Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C2C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/h1pNasFi/92T6RUAvXDvHq7QawRH4lT9AOvszwUiP4=; b=iXu5WMPr5X6r1REOlAP/CLnFxV
	q5xhNEUEotc14kSywLzVuQpubg/RmrId1A5vWEQ6ruzkrv3E18pnvAbncpw1jYDZyDIYBVdf454GH
	rhwt5GlUKLpPTHkpUv7PVPxgw1rS7omXEY0o5Vke80ro8/Y9jI3fPzGJRS7i43g+PNFRlcqhxqca1
	pUfMUA6o4w3FxwZ0UO1Uld8Pd2jmaPReDVcxm0wCFb0CQKRSOAVakR/okbLKCBGCt5o/8xTu07z+s
	jUhHCuBEpNMWMiGD6gW8JYs5B9D9ElxopKhv/E1uLbsqD6n4ykG/B8+0t/BE6wS9GmfKNbWn2Bkd2
	0x5JTulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV2W-0000000Cf9l-28Ii;
	Mon, 10 Aug 2026 18:48:00 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV2U-0000000Cf8D-0JDn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:47:59 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-38ed4d37526so1408031a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387677; x=1786992477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h1pNasFi/92T6RUAvXDvHq7QawRH4lT9AOvszwUiP4=;
        b=n2Sd2D2BKo517GwaDAY3PqgN9QsAeFu8JMCQKRjWY6g7ih3/ZcRMxqWglzvXgHIYjA
         EM9nLErz23mO6D/mc2hL27rgxJIe9a3W54NIv5QhZqjRYPXljILMA5WYNyG4ASNoHxu4
         IPI28tv1rpCDKHOmIEAv5JNkAvbRy4hD4hGNvMWpNjOKuoprOdH6gZ+0ZIKgsaSiqJJR
         /V/DHwhFhgvhLafbodQsE9CNn34DYKHDGlUD04ZHVHSGxhJ9aAaqrjwbxg5M7TkZqj6a
         U4r8g1cVCM9VR33wcnLii2xvVQRlHnVGI81ueydR9QQi5gP1eNcNcIVJ9KGBapPABEOR
         9Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387677; x=1786992477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/h1pNasFi/92T6RUAvXDvHq7QawRH4lT9AOvszwUiP4=;
        b=oNSp0ZiqVwVoXPJRk8wAfKkOZFkhpmDxHGxFqVjEmghBMTwLf/ruTHTi4KHUVu/e0R
         q5fNH3U5lO39vPraZmCY0GlTDKQaJneHUixfVjH5MRR5l7GsIfKgVEa1EAxVj4uyEYqT
         g7M9U5CDskRF06LVg91CrjjinSXT675JjXHSDNWoHsJqTwfRT9Mb4P8pa0QVjTeGa9sm
         4thE65QRph3XaUJxjbz83iLzezjGpMpOyvzf5lUpvFgFIJbkGf6LD7+DAXJcw4oryf+v
         nSnJkarIuilS7+xwgr1xM5/LWXumyFMDozOeMiZ2H3KP2ZrdVl9ev735SdVPMmSJA6rs
         rmyw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/1ebPD16sgBu/RKZNDkcKOZkP3FDQcUD5T+Pt9uJI96suO088m1VlE5qQgc/AR17WdjB9nPR4FA1mfQk+U1VQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeo0yjSLnXetoBWJ8tCVrTMZP8TmChXWc/0YR4sGd+1eg8/dop
	2D3mCawOjIQw8us9StJL09mWcxN4eZHnsjwvPBTCph0kgWA9AIZqiNLh
X-Gm-Gg: AR+sD13PEZnKOuPHjN62ng6KgF58iZwfEXkWfDJEEr3tiwPaIe8IaFZ4vXu5IuLqU79
	Ng0DYWpxLd2DNYwbZ4fUI/Sgcxcmu/GSMmmXmPUwZyKWsLTkbWffIdGrW05geJNSl4XO6LTrBLs
	xUHBMDY+g6Oha2pRiQ7p5hxDBZ87m6vU7rZJpbY6GdqLxaxA6S+lUjutaSesK4/rALnoyYHuP9E
	MMXD3/NBk/bfagIhc73jUiF37Nh3x1TaV28ABlGMsrlp4H0L69PNQ2LAA9mPMy3ainmmGwdJzYC
	FAoLpq+gTW061Z2wM0fHYGqxmcOLHsJhkVxjyxc+o75Sg6MO0cahCKCkGLIOoCGyS5tAzIH3uyp
	0dVE+2d24YQ1KXRm7u20d3OtSezCMTai7b2rw8fXUSszsGvq607YBLdlIbi40oN2PuxLHi8en45
	ZqjP5Nu9/CZN1EPvfeZpPA54hXczsok4NtxifbLZw0ud1+czI1Ex/3mQ==
X-Received: by 2002:a05:6a20:918c:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cbce6cb365mr23635499637.5.1786387677292;
        Mon, 10 Aug 2026 11:47:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f38882fsm4517610a12.31.2026.08.10.11.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:47:56 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	alice.kernel@fastmail.im,
	dtatulea@nvidia.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next 3/3] net: stmmac: skip queueMaxSDU check for AF_XDP
Date: Mon, 10 Aug 2026 11:47:53 -0700
Message-ID: <20260810184753.135756-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810184753.135756-1-sdf@fomichev.me>
References: <20260810184753.135756-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_114758_110995_2F60756F 
X-CRM114-Status: GOOD (  11.14  )
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

Commit c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
was inspired by commit 92a0dcb8427d ("igc: offload queue max SDU from
tc-taprio"), but the igc change does not apply the check to AF_XDP.

xsk_tx_peek_desc() reserves a completion entry. Continuing without
queuing or completing the descriptor leaves the AF_XDP rings imbalanced,
so remove the check from the zero-copy path.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efa35cfecc4f..6e9d4cb336ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2714,13 +2714,6 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		if (!xsk_tx_peek_desc(pool, &xdp_desc))
 			break;
 
-		if (priv->est && priv->est->enable &&
-		    priv->est->max_sdu[queue] &&
-		    xdp_desc.len > priv->est->max_sdu[queue]) {
-			priv->xstats.max_sdu_txq_drop[queue]++;
-			continue;
-		}
-
 		tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
 		meta = xsk_buff_get_metadata(pool, xdp_desc.addr,
-- 
2.53.0-Meta


