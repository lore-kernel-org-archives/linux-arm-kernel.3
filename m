Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8B6C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=; b=B4CGnIGqwolBXgPRWs+Tf97dSi
	91Ha7Ofryq0Cb0hYuPRAgD9JnyeEc++YsNJHmay0Y3RigjCzJxdBRfRf/qMpDfm2KkriMgNbKNVnZ
	fijy2ykkmVn4uQmwFaPkgajrRWWpVTP1+CGmHHjOFMKPy+DmPdfEGjeDat5Cew5PrV4UGaKrKUmn0
	WBvp1GcO6AJIyPujxGZhYfgIaweNu8P4SBmEpd+qciv2J4DVEyLTY70k7fc7VDkcCvyPkUJDeLN5S
	6M6gubFqq3YmkaQla6CIBrCrKUN4RBAswfXh63ovObvU8XJUPzaPE4om8qEecx7g5mfaCQ8P9T1YN
	wPvXxsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7b0-0000000CgFq-34Ls;
	Fri, 28 Feb 2025 21:08:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mV-0000000CYIa-2Lfl;
	Fri, 28 Feb 2025 20:16:24 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-abbac134a19so382821566b.0;
        Fri, 28 Feb 2025 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773782; x=1741378582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=;
        b=nQLu5eYs50+PuJA9GYQa6THup2jMper7ooTXTlyPwhINjJdAeSbfFA4HGrZ5x8cd+4
         qxmZeJbsT+/pgNYqswxeX7J+bNNinH2eZmxzujyBbHnRUcdcaIlCU7KUdy39ZnNe5vmC
         N4EeQuR69eWtepbTBgjRD0wq5UHHzwCBl2N+M2vxky4fmQvFsYExVn+qNtCXF/OvIsGZ
         gNX2E/LNgEWR8PiybVC5jgB3kD8rCds5c7MHDVrXIMdWkWYv/Kn14YP65jMzRpsHmRm1
         v3u6/lbdRSQ/kPj8DH7dCIlnCDqEo4fr6+GKdb2m4cYpydwrOiDIs9nIzR1ZY4pPbscm
         8dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773782; x=1741378582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=;
        b=utycOAmrYrhGY/uUvW6P1yxeTcqzhwjJXKiPoPFq4DsFobnnvCHyMIs5f/G7h949kf
         0sXDMHSgytrK/uUq036S5mFSrP5AC5jj8fjaVOIvB3oP9iRG4Zhi+fQJnNrM3K87Oogx
         c0W1BoCpieTTO+W8TP7N1IuyhxomjBxAbZdAaVB9WUFPsDu1YhcFoZNzbC6vS9PUcnoY
         4diLzsCYe3OL5OuJ1cetrL2b1XzH4H5GdkNX7tk973kgoG/UVlxDcbHofLzS93mrMshm
         VsRT5k8TTy9nxideUWzSfTVWKWxzI62GEv9qK9ntXi5XhX2QR3rjmvr9adNgBTC+DmoM
         kCEA==
X-Forwarded-Encrypted: i=1; AJvYcCUFFV/2iD/FNKDjZaKpAH4dr0zIDEAWq1IfICtBhex4h5CbVsQZVL42rj3Zw9BWi1V8OfDcgL0kgVq7sL/LFTHb@lists.infradead.org, AJvYcCXtJL4c4qHpuuXTNQ2ya0g/eE3+35mAyQz4mtG8iSko5eyvhYK2URQTf9mjWX+5ze/H/U6508deYSDe9wRrepw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKhwIOU5Cw8sDmlr6FqjeD+b6LFOM/8RcVIhfuvCpRjTAZc7ED
	8eTNFkvW2yZRWQoL339C7+yoAsDSdjrvcQ9I9x2GGyC+spFMa51Z
X-Gm-Gg: ASbGncs8/+KIkniVUy3rxOd2u3oQGchz7EFrBfncUDnkZup/SjKp9JegOcLVZ7HZN8k
	ezCAK7iX8aBbzXwmvPn2SNBtpsqnLCC9xPny3e4WxBJ+Ufx0gkgJ1FneMOdJKt0g1iyiXpqbX6d
	f7E/CGJHsYnMDDFIZtFFZjt4wyaDZWPdlR2LFg2xlLDFVQq8FAxw+ZzHtR6rP+T3TL7vl1tSpFa
	CwGRgFCcqBzC2/Wxd1AYgeQh0H9db2EXahZU8b1AghTrD0OPtuLMyGrlUfdF7axTqhzdY7Jsxf8
	LyOXF0mYzFX8A4D2SwAl+ePm1eBh7W5JxOMnT+NBkStXJPukxJD4fPD9Qhq8SwD6TUQZdRVNyIw
	6J5nb9DHK3ZmAqM1tMPXo/RS4YBe3KYLzOk2qLMPmhwk=
X-Google-Smtp-Source: AGHT+IGiUhgcy0UU2Q21kNRFUyXsV4EZ5JKfRHYY7rLJLVAwzjlILW+HrVFwXhJC9gDCOjiMIMoAKA==
X-Received: by 2002:a17:907:2d90:b0:ab7:8930:5669 with SMTP id a640c23a62f3a-abf25fbb482mr535437266b.18.1740773781534;
        Fri, 28 Feb 2025 12:16:21 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:21 -0800 (PST)
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
Subject: [PATCH v8 net-next 04/15] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Fri, 28 Feb 2025 21:15:22 +0100
Message-ID: <20250228201533.23836-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121623_595755_D523DE9C 
X-CRM114-Status: GOOD (  14.03  )
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

This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets that are passing a bridge.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/netfilter/nf_conntrack_bridge.c | 83 ++++++++++++++++++----
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index 816bb0fde718..4b4e3751fb13 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -242,53 +242,112 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 {
 	struct nf_hook_state bridge_state = *state;
 	enum ip_conntrack_info ctinfo;
+	int ret, offset = 0;
 	struct nf_conn *ct;
-	u32 len;
-	int ret;
+	__be16 outer_proto;
+	u32 len, data_len;
 
 	ct = nf_ct_get(skb, &ctinfo);
 	if ((ct && !nf_ct_is_template(ct)) ||
 	    ctinfo == IP_CT_UNTRACKED)
 		return NF_ACCEPT;
 
+	switch (skb->protocol) {
+	case htons(ETH_P_PPP_SES): {
+		struct ppp_hdr {
+			struct pppoe_hdr hdr;
+			__be16 proto;
+		} *ph;
+
+		offset = PPPOE_SES_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
+		ph = (struct ppp_hdr *)(skb->data);
+		switch (ph->proto) {
+		case htons(PPP_IP):
+			skb->protocol = htons(ETH_P_IP);
+			break;
+		case htons(PPP_IPV6):
+			skb->protocol = htons(ETH_P_IPV6);
+			break;
+		default:
+			nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
+			return NF_ACCEPT;
+		}
+		data_len = ntohs(ph->hdr.length) - 2;
+		skb_pull_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		break;
+	}
+	case htons(ETH_P_8021Q): {
+		struct vlan_hdr *vhdr;
+
+		offset = VLAN_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
+		vhdr = (struct vlan_hdr *)(skb->data);
+		skb->protocol = vhdr->h_vlan_encapsulated_proto;
+		data_len = U32_MAX;
+		skb_pull_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		break;
+	}
+	default:
+		data_len = U32_MAX;
+		break;
+	}
+
+	ret = NF_ACCEPT;
 	switch (skb->protocol) {
 	case htons(ETH_P_IP):
 		if (!pskb_may_pull(skb, sizeof(struct iphdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = skb_ip_totlen(skb);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ip_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV4;
 		ret = nf_ct_br_defrag4(skb, &bridge_state);
 		break;
 	case htons(ETH_P_IPV6):
 		if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ipv6_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV6;
 		ret = nf_ct_br_defrag6(skb, &bridge_state);
 		break;
 	default:
 		nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
-		return NF_ACCEPT;
+		goto do_not_track;
 	}
 
-	if (ret != NF_ACCEPT)
-		return ret;
+	if (ret == NF_ACCEPT)
+		ret = nf_conntrack_in(skb, &bridge_state);
 
-	return nf_conntrack_in(skb, &bridge_state);
+do_not_track:
+	if (offset) {
+		skb_push_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		skb->protocol = outer_proto;
+	}
+	return ret;
 }
 
 static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
-- 
2.47.1


