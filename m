Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8924BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=; b=VxNp3iBOsYDjj2LRx9z+nSwmgd
	0E7TXWB/LvIbQkKHPdC8ON3VL7RCeon26yAtq1MufabSednv/UTd9qVJHMUV//YTRRx7SqyKYGck2
	PAvS/NZ/jkkPg9O0YuFrGvUInpbISX3wIWtm+4GozRr/d65BBm9CPUDDdvlMXYeCmPygNUsI1Gg3d
	rt5e7Y0kuGz/BVpA4tiGDK+TxPGQ3Ypq5Y+7ol7XpBItq6jUWlgHzhDJji3thjGhI5VNCavjYPGyq
	l0LHMkk+F061SR034ESTCfOzT3CKIgeyG7nwq3Nfl6nvkewC9CVHDnIUFgTU1Bz74AVivCw5kdfwY
	rT26lLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1qb-00000001Qpv-2U4G;
	Tue, 25 Feb 2025 20:48:09 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Lz-00000001Kd3-0e4F;
	Tue, 25 Feb 2025 20:16:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab771575040so31020466b.1;
        Tue, 25 Feb 2025 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514590; x=1741119390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=;
        b=GhUs+wc89wO7jHlCFQdxY5GIL/uPI2yPPg3GuKyIivbaJGA2+wUMETZbJ4Yu2ekB+R
         V+nC/4luDoXl9ViIX4kyFmOl2TreUAFBr7UHA0fYkd0Vnw+PF+UQbYbzgShie56yApBV
         +aDDp9JfvORiLii9lNJitOwv+YFfmX22UFit1WZMFxTnp9O4OxmtFPhNReBpCho3akuC
         Y/g43+5VXyxjePZRavOF7ZsJZXja2BGeclEcu96XEuY6E3RWdtS7YMKALkHtqaybTS/C
         C5xdZyQhaIbGi+veUhu9ocoII9hVtW9cZPA2TXlnGVMt61diUMHUZDFNkobeXDr0C8KW
         hOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514590; x=1741119390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=;
        b=gBUQKSnz4+2REqajXxhwaqKwa2JkbuzDC6MJ9/JwMbXYjEuQYDDXm+fMAL4iIhXDvF
         AcLZhNPQlIGrgikzXH5qyqExbJvoqBf+7KMB3rMnwsR+k4hMbaMKfoLOcxo6nJ8Kw9r9
         wu8rrq1M2ctaHq4w0MwXM6bksuJ0VBqVkAFPBHQ+xbj/z/0khalAHpebRA4zoUMTB1KU
         OuKKjpd6dufRNJ+zo+y/1wZMYenf0uUl1eWTmg9ACGctxXixX4sSeZYmGiYuCU3Nerzp
         ZCP/H3jqhCdbNlA+P0eOOQnyTdyl9e1jBlYP5MU3OA+eU87N+rBCSvPkwCFogill5NfB
         KVhA==
X-Forwarded-Encrypted: i=1; AJvYcCVySZ5smwot7amcbhLtDaSfR3/JAgHC6Sc89QtBCS1mEAhqb2ccXCHpHV1ZJfzUbcJXYiCB+Iu1/n+eHU9ebp8=@lists.infradead.org, AJvYcCXIBAMQtV6Axx7EfdQffDz9gx7QotS8uBK69kMZgTg2n/hLGpP7p7Pqe+I0lEjuyGW1/ykpn3KG6zOVtS1bxel0@lists.infradead.org
X-Gm-Message-State: AOJu0YxgeSizT1scLevx37Tt9Ix4gP4X7bJJYLENjdJdHDHmi3rnq+lM
	ZyQwl4SpBOSHaHU4jU2fqt6FhZOkAZa/ki3gKO8GhvRt10jfCdMl
X-Gm-Gg: ASbGncvXRvazCIn+4cI4GkDtJbnEU00Op/j6fQlsJTeodTMzGEJszCFwWT+4gFgZhbb
	zNUiBOl4KR0qpVbbzUx1zTPKr3nRrlrBwvSmQMF/acBs7m0fqjCMYFHQVAFbJsPA2alSQf+RlmI
	vqDOrqSmsFGYJKy64qkUz17zuTRmfNdVBbSoxGuC9mYt62NsK1ozvH69a//eib6S2b9uDU2gbz3
	/dmAVwiRuRgU4PGHUDB4XD7vvfn3ueumGeTxwIBQhbg0o88u/rD1w5YoPj6Qly/MKSbC81jTbBX
	XekeNKa9WviIHazNzdIcV5EBDgMkRO9buoRKEnYnfmO7ltFSaep1W5E21M++x4DSf1eEuXKEqC9
	TANJ9KckXMw8qPODQU4yzWL52uzKbkop0ce9SmoilGRw=
X-Google-Smtp-Source: AGHT+IGjYzWXLvnzGLyEXex+ETYVw5Q0C/1jRBzHoDa33wNIkf6eiEa2/vyA43CLHzQ2U9WVtqxm+Q==
X-Received: by 2002:a17:907:780e:b0:ab7:798:e16e with SMTP id a640c23a62f3a-abc0ae91168mr1674875466b.15.1740514589399;
        Tue, 25 Feb 2025 12:16:29 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:29 -0800 (PST)
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
Subject: [PATCH v7 net-next 03/14] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Tue, 25 Feb 2025 21:16:05 +0100
Message-ID: <20250225201616.21114-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121631_191590_AB763108 
X-CRM114-Status: GOOD (  14.45  )
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


