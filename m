Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40B6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKIHos904u/55jjyV61JBBioSUFkR0jZBzN6/oqpIaY=; b=CcrSw68HcZZcvwAZnBifJz/EV9
	gCnDDYfFeLDJ4Vs6UN3bYtcjKTnr4VHTFwp6NVbsS6tCZc3zwArzTqpEco+8NCprVLEAGPGW+QSFb
	Y3Tnt0BIkaZDphjnH+ZoEX7P/8Ks6FultnMVMm1uA9jddAXS5MuI8NYlMHaCu2dLsFWFefLApxrZp
	pmbAAKqjjndBuxO3w+q3NxkxLgR67WCFXDwqshArl9h45fb5gUiPTCGLe2jB0W2I5aa9pHgX6QKV9
	27iLfNaGW8GM9pGgPm+N6pNANKE0rhhuzGanTKf7EIn1Y8wQabQBtE1viBaJ64NYXFwWh8n2DAlRu
	MD4Kmc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5dB-000000044HT-3SdD;
	Tue, 07 Jan 2025 09:12:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XL-000000042W9-2bo6;
	Tue, 07 Jan 2025 09:06:12 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso27508613a12.3;
        Tue, 07 Jan 2025 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240765; x=1736845565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKIHos904u/55jjyV61JBBioSUFkR0jZBzN6/oqpIaY=;
        b=IkSSws9pSNODzjafKU+HI95Je8ABuPORPMObqiNjmZ6s3h47vL85952cShVkHGBjYX
         MI0T0AxChllc4qHlUz+lERAEqFiPuBgI7eOeX+r73mhdG9mAnvo1xxP1K6+e5TVweSUP
         XzupAbBHRHSJSPbTmBZZ1f0YOCSdgcf4JZFO62wsypSk6jyK67OG907A8BmW+wi/Bcfr
         T02B59Yvuf9P1O+INEemuMAcfC7kjfW8wr1PWen0HDV5nwSVxujuRtVEKxoMdt18TYKd
         pdM4LfLkYGg9D34cZh1Qjru2qTMq1NIIXEw+nIXNEP9hUwuJ3fqex5632RCebhVzhQIc
         IYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240765; x=1736845565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKIHos904u/55jjyV61JBBioSUFkR0jZBzN6/oqpIaY=;
        b=F6rxI6kb3jjNzdjZt/5PTNR4OUS/vzXxZ2wvfJezZxkZgFom4OMJQPSR0qGZMAdciZ
         Eord6nBs+2UHhzGTZvqJoB78Ze70MqzaYDqhEiLh1vjQvN1PqoSepiB6zXznlbCUtLOu
         jAIQ8MEMy9fPH7tZvtdKY+tvYKwPs6jsMh+wNIiSXKSWb5yEh3mWqCuXgUTiquMI3ro2
         888L+7u3U1Ys4CumT4l+bRdfibRuy/8tGbZPPTMG76O9PC0hJSyQVxvp5usb26arcb/8
         4vCNCqsdyUZbnA1yukDizJ2gZPW/MYn5rq4qOENFlJeYFSwSgYQFHI9gTCWz27K2uahK
         JYFg==
X-Forwarded-Encrypted: i=1; AJvYcCWfzXR67nFAP5YHNLbUZloxlG+J3A234smdle0Ol2hsYW3Py+axKVF2wWVsI62+KVAsKrsEM8exDpk0xj63ZI80@lists.infradead.org, AJvYcCXTwTVHEqzPjKFK83CZ3mLIa5cgpbUSZuR+Hhxj29dzNfdRccwvgzP9eooHkitBHmfgLQwt0RnhRdE1MfanO2g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqkUtEpRekdnzDjBVEz5x7EIZRjUC47OSaTMiwfIgC4oBg2cQV
	CGwShihLghVOSLQXFFP7cPuhc4IAcwbuLzYsO64i1dNstUASJd9J
X-Gm-Gg: ASbGncvLBq3YJ6LRi3qpidflG33grC4D0T093EJw8XjcXyMsktj2owXHuP+nbbiHhRQ
	Gncr5GzYweQAofS2DqcSOoT9wQ1CPU3Uol/pn0bRKEURtjW/9e5eQvZ5dW0SvLsylN2SJTs+uOw
	8niFf6akep/gzFCQgfQIHybwTubfJsTc+SXjEtJPnL7M4Pc/6afoc4Q9ls0pM9kmqIqxcQdVHkM
	d2mMWVTaPLtRnWCbMvzL2ZFECkPRBX3I7WJMMgrdCRpzIQGNEfAmSRGhbuyvQ3gqO0VwPtZGSRV
	7x1WtJTELcm1m4fVkBvid7xAGlsGzfN6E0p9qApukcgygtLxbjahs1ZJ1jWMpHTzsQSQiZXvCA=
	=
X-Google-Smtp-Source: AGHT+IF9Q6hAjeuuV+Dr+SGY25DZC7a14teg1xdkg9BFE9rkMwMad+u2nsuZglYNPKcORNXEsZ1PbA==
X-Received: by 2002:a05:6402:2315:b0:5d4:320:ee66 with SMTP id 4fb4d7f45d1cf-5d81de5d419mr44287641a12.31.1736240765137;
        Tue, 07 Jan 2025 01:06:05 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:04 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Ahern <dsahern@kernel.org>,
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
Subject: [PATCH v4 net-next 03/13] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Tue,  7 Jan 2025 10:05:20 +0100
Message-ID: <20250107090530.5035-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010607_660172_65C807E3 
X-CRM114-Status: GOOD (  12.29  )
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
index 7010541fcca6..91aa3fa43d31 100644
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


