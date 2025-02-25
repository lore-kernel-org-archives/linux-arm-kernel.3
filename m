Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=; b=1dgQv04DvN5OmrC8jGTw4ZaKyS
	ZB4tgYnkArqxvfzzErmpB+xMdsFO9dEcPrb6MCNVCV5sCZxBB+SSBgKg1p4rf4PD3Di5aBTvwUxnG
	GTHuu94/UGz1jb8nNpGtKL78ryxxEyJ1JxPw0hmI45ntrimtCFxWpEa+CUkJX89uxr36l2cGcLGd3
	o4hDKlBMXjAmWjuz5QT9Mu6dmbHd/KTBP3uWV3TAqb5+SXzYU3lCTr6WA0Us1ZMeCifEF3JT3fznS
	mhnT+A7vwJUdHp6z+9Aqj+O8zCkcm8fcZocogwDzH7EG7od5al5y0l9WrdSt6pEEyev2AakmIxfnn
	YXlpN76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1s5-00000001Qyu-2Ags;
	Tue, 25 Feb 2025 20:49:41 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M0-00000001Kdt-2hyG;
	Tue, 25 Feb 2025 20:16:33 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb892fe379so911893566b.0;
        Tue, 25 Feb 2025 12:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514591; x=1741119391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=huU1PLN3EHU467/JSrQppanLYQFLNasGi1Uu0J75+Whe4lo7HC65r3cRcleIvqxS/6
         Em2Fpwam69JDh03EWOi7R4EGPkbC19PIE6HrBM2uR+gB2SX0/MJ8zDX1MIE14pqh6YJl
         ilu0yFpSE21D0G0gpNuCgxWDp4ENatYb9lCUvAc55YIZwrBOnu0WkLnjbb1F71RIDLt2
         rsN7F9f38NobhXOQFo+fz9HdHEOWSLYIHvugVnZFlPE3HTMEnh3nMvru5SiLihNc0zEv
         gtpgDQ40MuBO7e0/4J9HaIPMgUlPQRChzTDVCheFocAasrEOJ/dhuo2VsVQLsipQW2cS
         97RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514591; x=1741119391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=IQwMS2TPYS4ZnlnB8iizpi2xrP1vi5nzhDJ6ehOGiqPH7/2o12A4mGfVqeE+Qrdjr6
         cNWILfO8P58ZgDv+yLwSh86Ja2RltRXGYNJjr8gNjNhe/5bwYKO47k0ksEJZssEBOEwA
         pT2twIVaJWT7OeGfKZz6pNRQ7afw55ZAe66yzAurch4lYE2ox5jWKekPKw9BylgFEgrY
         NV2aZbv8X66AK4XN1t12DDq0SucXCCJ3b/7LgHEI4/g+h/3tFAlKdMlNGzDRd8NMHgsG
         ktyTj+V4bKPtzUEvzRqiv8+j9qvzGvnEpt+SCjL3RSgj6kc/EkUGsrY1MN6QgNWmTOV/
         LFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWViSWGJVZcisrnG+ZCNYGhzh2rwnVrl+hLIbjfx1sB4on2wog0DSwRJ6ZpYnF3rGZcPP2o9Vvb6i2PcXazVVU=@lists.infradead.org, AJvYcCXn6Cc7IR2NELnXqTghoeS6w6Tox1nBerQ27BDXA/QXvuDVTZWdLLGEEisPw2mVf3lYMFF7gnAXjBtExFhiwc2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3o+Kv9/cxcbneVyB/QXRSDMfLDemhPM28GGtZIx2nds6lWv79
	Tc1VN8FrP4/+/X0QyYBwUzaJG3AJRvwqhKRRP3HsYAFlwIecYHF0
X-Gm-Gg: ASbGncu9Zm/DVKnTywgIdbif+zGdk8VBeoNdseYNJy+RfumyOjdNXb8DZVmex7Qg46d
	Deh0BaSadB9zDVA6AawShlbPziFqm6mT9zA2ofzG6a/pWRqrH0KkjUy6goLykL6ByAbKDWervZ4
	lA5RwUe3ImAPDNYTOtlMMYSTmzMDb9bYTSN8DEXg6VhQ5yamkUUtp2QkYzeOiiDVQufnezJ4a4X
	NJ+S3WS2KJ5wKC+LBPq6swYdr7MqiPYyyKzfwBKdAP1YXfKG9oVv9d9RFKvEVxJyeJPZKR7muHE
	z7dLe5IXZ0IQFIOgdF3qxPaCxdy0HElmkactSVe98PYQjzVZyR0zbaIT7Q/jH450u6uVBe8l3fc
	lOq41TSIO6Dv3UzThkvNUXVVQi+7Pe5/toGXtuEOejD0=
X-Google-Smtp-Source: AGHT+IFELKJeBL47E24AYBhFNQB8kxvH4OvNCfLa7OLiE5g3zAvMls9N3TtS1GIRuC8kJEKI8Wmk4Q==
X-Received: by 2002:a05:6402:210d:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5e4457abbc9mr11921566a12.11.1740514590457;
        Tue, 25 Feb 2025 12:16:30 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:30 -0800 (PST)
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
Subject: [PATCH v7 net-next 04/14] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Tue, 25 Feb 2025 21:16:06 +0100
Message-ID: <20250225201616.21114-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121632_684358_8A2E85EE 
X-CRM114-Status: GOOD (  12.31  )
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

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
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


