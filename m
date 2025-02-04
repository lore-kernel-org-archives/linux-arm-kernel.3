Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27057C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib9AvLEqJNS6gnJbPJClceeQRzwP8bycAwF1f+d+KWA=; b=FwaNHJyDxvCsYjbHnNmXw4qk3T
	djxRa1nCJgqehDXG9+g0tGEx/0wYoiKteX9kIo5O9ra456VsLUL1Uqli7dEoJ5YsQxYvw4JS4r9t5
	z/EFX7JYZNvW+BMMA6gTDo4XjlKn7hPG4OUpathOAhhxph/aYL5R4OQR5VKPPoTBGZofgzQ/NwBy8
	dIZep3tvMhWUncsmlEvnUcAgbwu2/Qko80j9lxbIa3+MHofLvtQWVoXZhbtqBbGB/yIVopZWveXBT
	Jb6ab1sf/mBgk7ldwARD9XRqADb41TcbQksmMpg5sooxumZNXckXVAJj3EsSQtML8JQ+x42Rf8fi8
	gSO4Y+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPJi-00000001VCo-3Xet;
	Tue, 04 Feb 2025 20:14:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvk-00000001QJw-2eHH;
	Tue, 04 Feb 2025 19:49:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so9829866a12.3;
        Tue, 04 Feb 2025 11:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698595; x=1739303395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib9AvLEqJNS6gnJbPJClceeQRzwP8bycAwF1f+d+KWA=;
        b=c+KKJa5CoKGpAtkgzPoYgJV5jUXu1zIuxeUXi56CUp1z5AkQCYQvTDtKYxtJUOUpLm
         +HyYSmmt4SvSZUViIJYt4QsQOg00DnA+Vc3ReC5bEE1L7fKRcSvg5utmWKOmnjWpR6iM
         SE18beGBWzJDgsa7PvFU7FRwYnkHY8pft2jomobOAT+rB1E0i4aAkntFCIn1tsR5o2hY
         7AwubI6L/gYLv94TQNXnwyjOxo9Zte/bbOlyEL7JVbOEl8myKUOoV21CM+7MLVg91Kt4
         jdwoP6NIeQGIvdB4ujJP0vL4Z0TP/El99gJD64zWM2IyJdFhW3/hQ+rTc8MP2//Vx0b3
         7Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698595; x=1739303395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib9AvLEqJNS6gnJbPJClceeQRzwP8bycAwF1f+d+KWA=;
        b=czyCFQSw4c32W4Giw7sks25U8Mn2DSTFYTyQPrzTS2LDhiUr6kb45H1obA7a9hRjtP
         QKdl4V9haoBWCy9ztox6PdEqW8VZGB01vjQVkEkDlX6OVrg1q37sP8HCqI56Qba2goT0
         P3eS4UZFUU8uyofEJsrWDjAU/v3zwmLQ64Aes6cFBQHb+F1htojXRcOejbppNpudv8Be
         9PzXCACR19uXXStyUMZu/piYS70/9mpf+usEg/C5q1aEVtVOTcmAIzoN8fedXiAs7hPf
         QwY4xw0FbXnoCpJ4wGaRoq+oG7VbJvmuk50ybRuV4JFeGoR3olwlXh/3UC1F9lw1rvEC
         5RSg==
X-Forwarded-Encrypted: i=1; AJvYcCW7rmsROFUx3zf+1T9ANznpc24SIb03BqHwDY9FKwSyrABUazxx6PeXY2WH1ORwMLuMGJ0ZHdX5VFJoupOpIWgm@lists.infradead.org, AJvYcCXvuvUka77nKM75huzXBEH2DG0OucjyLrrNEdtRwuORchDS+HQftvPPCNGau/JqM2yT5fBB86RuGyxNrKDIeSI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfmtSwzLuMBaVprMv8NXejeeOk79c/PXqbep3MSUqav07jt1qO
	/3t6NpndXyEJZU8BKxleFAbMxfn5lDhDOknA6LSIiYCzZjSJbKpt
X-Gm-Gg: ASbGnctkdiXBUvHdKoDtNNiQBUkM5pPglHk9jOwqqYh2aY1FBS+0CiseHZFuKs39SqU
	0xmWDSw6qvjIt+9dMAPaQ9TKovOdPYzXa9OJbDocoPCBghvmZ9ilpdlIaWzeddbIomanlsy66qf
	8bd0E++yZ6GR2eGKAaIC3BO080KlyBw/5nqGFmrDeMUzsvXk/RqxZABi+Np6Huikdg8TRdkZFOg
	m+DDu875EjAesk6JT3YJ7N9W2gEuMDr7hewpzryIWgvMHiH8IEGSsnduBZi5PMwTUlQgfzbemMt
	hoQpLmW6skFjJ/PzKDITVOjvHFMQ7W/AR+7wrUBlSECdLnlzgi1pypruKJr0NcdpaXF4+qG6a7A
	Nj7FNCLQORaVfixcHnle6Et/zYsZkstjX
X-Google-Smtp-Source: AGHT+IGf3IkwvSSJoKILC1ANmqlMUZbmn5SVVf78+zzm+WJ3NpPA8bAAleXtOAgaw/lW6KLqcZmgsA==
X-Received: by 2002:a05:6402:4604:b0:5d0:9054:b119 with SMTP id 4fb4d7f45d1cf-5dcdb762aaamr643520a12.21.1738698594982;
        Tue, 04 Feb 2025 11:49:54 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:49:54 -0800 (PST)
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
Subject: [PATCH v5 net-next 03/14] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Tue,  4 Feb 2025 20:49:10 +0100
Message-ID: <20250204194921.46692-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114956_667840_A6BD7065 
X-CRM114-Status: GOOD (  14.36  )
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
 net/bridge/netfilter/nf_conntrack_bridge.c | 81 ++++++++++++++++++----
 1 file changed, 69 insertions(+), 12 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index 816bb0fde718..6411bfb53fad 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -242,53 +242,110 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
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
+		} *ph = (struct ppp_hdr *)(skb->data);
+
+		offset = PPPOE_SES_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
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
+		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
+
+		offset = VLAN_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
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


