Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0988C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=; b=pwQVwObFJP9lLS4EMUGTgg1siV
	1cXo8m8BaM7Pt4jFn/prK7AyguE469act7mpwZ7vVCuTQiOfj9hCEpM8UIah7kbyI3orm1A5kNrOM
	s1YBVIu7lCu+RrM6m1aAsde1BFfo44t6vIfbUsrlfuJeapjARA1gp13nhIGcnPOS4RyXnNEUITyOM
	23AF5Pl51hpAeECpL9T1CjjtqSFKfZtbafZdYYBeRXwwYDppH+HsVq7l5+HFIDbDcm7EbIWK0LSKJ
	Ltj1KCQSakjEcExaTItT9rsjqhQMnoNBn0FK2BREZMODD/OsEU5xU6P8whNJKzT7h3TQpAtbw7Ijc
	mDI7nKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7cW-0000000CgNu-1YlQ;
	Fri, 28 Feb 2025 21:10:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mW-0000000CYJ6-2lL9;
	Fri, 28 Feb 2025 20:16:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaec61d0f65so517565966b.1;
        Fri, 28 Feb 2025 12:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773783; x=1741378583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=cs8rBBJCyy2XQpW7n0rhXTpWskepqRMOSzcj90mvduVWdgr67Eud3nkBsknP7IAwnh
         c6FH6LmF32j2QUqkF1oe3ihqUzyKQxOYKm5H7oXuyEDhGbbvrSqGHFzJW8bcW40OYWl8
         U5kitEKHbnCUMp1lmIqmUEtrGzpn5QQnz1zzpcBlWlAwNbnQKLF/BRLo5I+VhTJ2ec9E
         3o0A3ffwOc9kReEKQroZHt1lJfFcIzl1At2QcpSDFve9QUq0KCUvsfr38Y1KZnawAbgx
         95X04D+HBE1HW5UxO90dBv8GLVC8PiyL2EMHYjui6PRc1Ad7mmOtzLqE/h8pUH/dJWV+
         t9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773783; x=1741378583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=CNPtvFt4NF+oNuegmhlcEkBD9O3fDOgYftrujTWH+e541HIm/4I0xHTzBbzerifo2u
         JUNEvsJqfyiY4o6Ip17CzN1lZzhADLPgQXz9bmDINTP1ya3/dn4/cazVBchda0CAfHvI
         U+J8TpE1zEbTipoV4+/uKjTEi3irEHCX3RfiSS97L9vHzfdl0ZeTTOsotouJhYXvhUS3
         TC1C93nNUO6c5jj17JJc0jJQtOFPt1e4uMJP/YzJvjWRibPwKF/7X7YXKipEnee5pwIG
         RIhc4NnTS5LkkNvkNWAHlqYy8k4D4lMm8t8huUGzubWnXnWiYwcQZICdujnMhy7I3DB1
         4nUw==
X-Forwarded-Encrypted: i=1; AJvYcCWnA7QOj2G1oV4BrxwuuZD4GZMnb+UXyAIxb6EVRhX2oAUo9AmXqjYcRJWPO4LOnqRqXvH18/1G8uQ4TxuWeZKT@lists.infradead.org, AJvYcCXbsgd0V3vbe2dEeGDuD+mZN2LneWbEcLYq+F5xQhU5zeBcRgf+0HJVK4eIixgPpMbHi9tWb5F25NmDTtQ5ISM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZsTrfjbxXeW5ImTAa5+UvcTSXPnYXzScKIWM3debvOClqU4+R
	Om+5gnc6jFCJIryQiDd1SPvHhBmB5PGxW5PWp1LqwZy+xjygF83U
X-Gm-Gg: ASbGnctj5NlqwydE1HUOx9ZQILX14qGxMo+Yw2blhwWDLC0pBetSFeV2bD6t/3cAr9v
	svGeFZnanh4Ecwdhy9gfa+Ol4HjnH7tPk09Vmr0ZFsaZ7sn3HAMZD4K7gT1c/eCDNYc+C7KqCzi
	BeT38rqm56m9EHcH/4kpbKoBtk1ncVtjyY3aBwmUWfcsgu21ELEzOGafqkdpQd44/varvS9fbCn
	MDW8mNQqC2hjajaE8UBrPo+ktibgBmxL2hTHUVIJzBWPRDCiBznLYaLKBs9ita/rLM1zUfo8ON1
	ghsfKWee5FqgsZijKOhl+UntBPl8qzypfgi1XUgtp8S8Llwg1q4iBSFeRguyJ30e9B7oDUGWiZr
	4YnSpJRvMrH+mymSYa+IEEdOzSsSVrszl4OclA3XkA4I=
X-Google-Smtp-Source: AGHT+IFuUzdbgaD/IFSs5QLipx4iHpbTunJtFdHt4pWJCQ/QSyvZEmN8DMfkaEXDfQkozt/2Pfk6qg==
X-Received: by 2002:a17:906:6a05:b0:abf:16f8:5190 with SMTP id a640c23a62f3a-abf26822611mr449155566b.44.1740773782957;
        Fri, 28 Feb 2025 12:16:22 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:22 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Ahmed Zaki <ahmed.zaki@intel.com>,
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
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v8 net-next 05/15] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Fri, 28 Feb 2025 21:15:23 +0100
Message-ID: <20250228201533.23836-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121624_700350_25BDC263 
X-CRM114-Status: GOOD (  11.88  )
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


