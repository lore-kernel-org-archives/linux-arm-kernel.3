Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A0C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkGaA4c7zu7TuRSY1s83dH0+lqC3nn6Z4nZphc3xrDs=; b=4Dj+NcUpG4xOj0HPHnEwOZbGy0
	i+0YJjBUbuGuIbw9FQeiUgGbI6KyTAzeejJrX524vcMiZgUKQM//V0vzJAVE/eC3/8HMp+CKjIR1Y
	kolHi/mL/VpvHoNqKjIHN7vjKX2qPRheI4Vl6kcUi1K6n9HPRVgfgJxccq8dTThPWVPUhBHviBANc
	WwHvqZ230u4Fc4y4rgWSI8Cu8P08EcgCPyC6pFOUprdKmrD8Qe8CPlpRG4z4kY14559Mq7bJEtY0h
	XSC7/fUExbFd6oMsoijLYKq3ZVyMFKHf9k2CzfYMmuLPKrLv9/BGnGs+7CxsMnKphkIrklFeLNQK9
	I4ChghBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPL1-00000001VMv-3ZOK;
	Tue, 04 Feb 2025 20:16:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvm-00000001QKS-1KF5;
	Tue, 04 Feb 2025 19:49:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1227369366b.3;
        Tue, 04 Feb 2025 11:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698596; x=1739303396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkGaA4c7zu7TuRSY1s83dH0+lqC3nn6Z4nZphc3xrDs=;
        b=IhIBX7SQD7n+cLs+SS8OWyo/0mCbFfHdaHEJRIMifFvqpqNny59T/clCVOGXcnEEjb
         tvh8Ui6Y5U073MOOuPGalahhEyVIeK3pOgcYKZIzRw19czHgAzg3ftLDg5Z9wcgsjvy3
         r15pYjQXwIVZoi0/pc5SLW8/ym8tSnT2AOCuEA4X+N/8TsLRjSykv+1OWWi1f1EEKp41
         BoSRFYs4Ota9ba571k4u7ktXvJPLXuW8O/xLcnvXSg54kqdbaWx5QKKhL0W/8mOltIHB
         pwdUrmt02EINN8tqWon6Uct+zxMoxpOPuLzrKYuzglIdFkbMFiZh6R5gpWw4wW3hm4GF
         5WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698596; x=1739303396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkGaA4c7zu7TuRSY1s83dH0+lqC3nn6Z4nZphc3xrDs=;
        b=iVdeqdPgyACxTGdRiVZuXM7a6sIf4nl4EkBAXZF77HrTst9bKgvHvZp8n2Qb8SwayD
         ETJUzhLMnXpyDsU7oyDfLt/jRBbKVn7YXsHL2TmAbtwjnBxiTn64bT6kdoyLZ2yTIwdn
         0Kn6HylonfI4Ar//PS3ffVak2ioC1SOrPFlnpaJFyM9WeD+5L4vM+huLYufeXzrFTwZS
         IUHXUV5C9Pk8JWvvKdXlr3eoJVNApegXpdbGYR79nMa8H2QGuEvyo0oSjbLt8p7aDBLj
         rAYw6cKd/rptg2gwTAyTDbTL/i2+IqS9rSrrSsJ3D84p34uDZ18keJ0ha8fdDV0tcZfo
         Y7Og==
X-Forwarded-Encrypted: i=1; AJvYcCUhPb+3Zkju6JrSpM8u7qnAULx/Mc30ySy2aKEqk+G9JPtlgX7ypxWbpe7u9d86oY7LqRF0KxmwD7vPD3WGKTQ8@lists.infradead.org, AJvYcCXY7poibnhqf5BFp46ftBtkIdvY6XdRMcPETWDgC4UsGTCR5k0tXLBILjWUAVsq0VzMGLVr0JjIFdVsAZSrlaw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwF/kdJqlKGDEbPbLY/daqakNEuGwn9o7ngUyJMjxCYt334Sl+X
	XBR7F+Me4CAzzm90CXq7g2CjfEf/qRdBG6YiwXm1sZJu98K8hQn0
X-Gm-Gg: ASbGncvIEZGhI4KnWJHHjVAMllL/mJbHj8xeuwPc+cGUJfwAvRFwrUP5M/OG7V4pq/l
	qwrFd6xDL2+VLfNppqY1OomMRJ+HQYw4XAjU1HXMSAylUuF4ViUYkA7Zpi+H6FAWlRvi+/lV46B
	jYz34K+srKY+qffBW6VDok1NNRas36gz4dVo0joX4tw160fYjqyi5hwCMpKiSFDSXJ5AguydO0g
	bPtZAWmGZhHliGy0QXOOYRQHazqdTAuqAGqtBA5erKlvF9JfYou46DFBgZCfjjaT1cUf+pzkZ+Z
	OIUMoL9xFoFDZmmm4K3us9SOTh571F21NhbmcIHAHIGBw0tL+lshN0UhYP5NbZ9iJiUHKj2kWZb
	uRhaO/0G3MWmHxaDj7eY3bYJ4zhXoVf+h
X-Google-Smtp-Source: AGHT+IGs4CC5gM167ZayoImsZp06NKQRfeGwh8m9DaNw+WB4zUAYvUsoKlU1KSkyxVdKrRT1PS7NMw==
X-Received: by 2002:a17:907:944c:b0:aa6:7220:f12f with SMTP id a640c23a62f3a-ab6cfce5fdfmr2766061766b.18.1738698596201;
        Tue, 04 Feb 2025 11:49:56 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:49:55 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v5 net-next 04/14] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Tue,  4 Feb 2025 20:49:11 +0100
Message-ID: <20250204194921.46692-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114958_350736_8988D228 
X-CRM114-Status: GOOD (  12.59  )
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

This adds the capability to evaluate 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets in the bridge filter chain.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_chain_filter.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_chain_filter.c b/net/netfilter/nft_chain_filter.c
index 19a553550c76..7c7080c1a67d 100644
--- a/net/netfilter/nft_chain_filter.c
+++ b/net/netfilter/nft_chain_filter.c
@@ -232,11 +232,27 @@ nft_do_chain_bridge(void *priv,
 		    struct sk_buff *skb,
 		    const struct nf_hook_state *state)
 {
+	struct ethhdr *ethh = eth_hdr(skb);
 	struct nft_pktinfo pkt;
+	int thoff;
 
 	nft_set_pktinfo(&pkt, skb, state);
 
-	switch (eth_hdr(skb)->h_proto) {
+	switch (ethh->h_proto) {
+	case htons(ETH_P_PPP_SES):
+		thoff = PPPOE_SES_HLEN;
+		ethh += thoff;
+		break;
+	case htons(ETH_P_8021Q):
+		thoff = VLAN_HLEN;
+		ethh += thoff;
+		break;
+	default:
+		thoff = 0;
+		break;
+	}
+
+	switch (ethh->h_proto) {
 	case htons(ETH_P_IP):
 		nft_set_pktinfo_ipv4_validate(&pkt);
 		break;
@@ -248,6 +264,8 @@ nft_do_chain_bridge(void *priv,
 		break;
 	}
 
+	pkt.thoff += thoff;
+
 	return nft_do_chain(&pkt, priv);
 }
 
-- 
2.47.1


