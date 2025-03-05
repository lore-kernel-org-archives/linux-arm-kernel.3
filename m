Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BA0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=; b=hc3Ml+gMotvbO+rdN8Cfq+atIy
	yoEd4Ee50QRBq8YNGx0cHf4vh4A/1MWCLrhn8X0pIo2ij+6Eg9oUCLYppCUHSMRAPf8ujeoATT4l2
	HmIJP265Tf6OSkAz9eStqafflnSu+5wbN9W5zmI4csdaJ+o6PHMYbEPGm1JeIGI2rdJdkteBqwOpn
	+h2eeG7+ny7rZBAqbL2iIdZuu/sejVEJjzBbIoauwMwu69j87DkG/DYa7cX1wOfE01SUlDrTpUb0C
	cUlOsgrpzR67FRWYbB0tfYEs6bvzETK1KA1BRcLhTGNE6CPaGGLKWrLNjRNyfdgRhX7TesvLqb0VD
	itsuq+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmdm-00000007oPg-2A6Y;
	Wed, 05 Mar 2025 11:10:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0x-00000007gRP-2OOb;
	Wed, 05 Mar 2025 10:30:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac1f5157c90so291427866b.0;
        Wed, 05 Mar 2025 02:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170610; x=1741775410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=BPofwgjLiHD+aFrGOfZHuPRSSufS2OSF9PLBD/Y07wGueS6OKtu7dFTVDFS4e5145G
         3Cb3qvVQQNZZNblo+TNKQAz4O+V+/akvgRmfzSLCFqs+U7siAWR5A5OqCiEad2i5+HR4
         Z3mze9WJe3voC2cyzcMmjT/AzCiqnz+wRrN0+7ET3mNn2ZQaTJtn93faEuuVD/JTJa1F
         LLG6xei84Zn6J2rXE4FnbHNcbH2Mk/Oe80D4E6B/8jQnprCR8kHfc8GujbYs4Ba2O2ej
         iwdnWwrTOp5uMC5D6G7zcHcoOaFZHBzRQf7yFng3TKTr5z8NA/sUhgikkAM8PWtZWxzY
         8tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170610; x=1741775410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=p0Jn9HUKYz5Hb7hgNNVzDV1R+aoGaWHpWHTUUVJIbQnDESaPwnA/AyvUEPlS3j5vsG
         p7e/pXQj+BW1Y3cEcntqjCxSXVtUJi592UHg8jOPIfWxYs+PYSvJaxRafh1agblYRafW
         2i9ABOzReR0KCsB//ZFKJc2oIs1E2Z+T7OfjZEDSGfMPKpo+fL67IvlveJAFehvRWR3O
         VK1CUJOOw/LwAkko+aV0UFIn0FEj4pc/3EosBtkxKYcwBLkvdrBepLSvkdvrwgziejAl
         vOR8gwqQmNc7EBQRzXfEHuZf7DgXNX97ObP2u8ZHKxV7CHDChTseIGhzJjRWl+OjoaH/
         eMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOHqOlRQvssS+l8zZFxK3svOWc/ZqiZPZkHteUIj+8JWTtO2fRDoLppMEN6UlZ5jXR7jIxzVjPTsPIRz264Tk=@lists.infradead.org, AJvYcCVTveet5CTBwWKEQsnXv08yOv13fxx2e4Pa2PiUSguRiCNBPmnHJf1qZaGusbf7S/RLsPviZJlehaWAEHAYAqbc@lists.infradead.org
X-Gm-Message-State: AOJu0YwvvHkI8nwsb836yeWUZAMSBvym8WinMjawZTdL8nMNvd5eA4Vc
	y3A2RWz6KKy8C7f9jmvC3xLtOMxbBvF2MdEfQAaWfjaQUeQsb5V3
X-Gm-Gg: ASbGnct2Ct8qKNxCzfoeU8mCrrsgew2K8d2LOQUthxQmSrdzETj/u2iKj5T3FeoAMdy
	UZcbGA6hAxmQJqsdC5CHrdaBdUNUEAYM9sZIvOoQ6BCtl0/Ypcfmx10aQnUETwzGhkL0g0P9kho
	iWjz9s/0hNs40kqDIbreMSrIxhKdVBvMxwAyaA8YhgFkF+dbDkiCxGTMNPo9vaUTAcO6KqtFzrI
	V+r7Hs/Mp38xbPwrVGTCBeKfOLp+t1VECQJzSBgOmyU378lhy0foGq9Ytfpi91GuAk9WVpREfdU
	4JdtAijhC5UHzktP4GtEIFJhx0SvjbPpWD8pGCQEKJXr58b+9d2ZkpG4KtCaI54MPCg9gxfTo/P
	HZk/R7qeu7ojapFfMAGN/RkFnNnxQs+8reGrOZDw9YgN6vNmGfPgGGU7Htmiq8w==
X-Google-Smtp-Source: AGHT+IHxPPtoLfRPnCkh6koJ/eG/1JnXDYqS7eXulrdGgVMhsQC/yU7G5LKQ+8CrzPKHzBnta10/cQ==
X-Received: by 2002:a17:906:d54c:b0:abf:6f37:57df with SMTP id a640c23a62f3a-ac20e03ab40mr291110966b.51.1741170609587;
        Wed, 05 Mar 2025 02:30:09 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:09 -0800 (PST)
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
Subject: [PATCH v9 nf 05/15] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Wed,  5 Mar 2025 11:29:39 +0100
Message-ID: <20250305102949.16370-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023011_608552_0F2FCD29 
X-CRM114-Status: GOOD (  12.15  )
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


