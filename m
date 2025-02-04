Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7DAC02199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=; b=Dp3DVpdAGWyDrxDxm1npZCBZO7
	aSVw01OjrzVEOFCB3/huL6tYR6KCgBYVa0Vsw0JSkqfdIKiPHnsMtGsJKmTeY3+/DNuAPTcCrUhTA
	fDF4nA0BwRZbSvhjriX6PeWVJufRNG7CQX3YbHmpI8hRXRrqMlU1VYj+hhcSTjBIC+ivHa92cyjy8
	O9ApYrcSpQFOqsM4auyA9LooS7fI4tIWqYUfYcneGJ+LoLsrhXrxQB7NGJ/CS/bPp0Z3nfbFdzdpH
	PCBWwfofTfrTWl9xxLKRhNFiApQozyLLejTNGl4vciVpQKX/QJgCsK1LdAMYDH2m7EhoV1ttK7/VS
	Ts8900Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVc-00000001bMn-2xly;
	Tue, 04 Feb 2025 21:31:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvq-00000001QM7-42xN;
	Tue, 04 Feb 2025 19:50:04 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa67ac42819so898324466b.0;
        Tue, 04 Feb 2025 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698601; x=1739303401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=;
        b=aoklQFXZERL06DXcK49GIGYW92oWq49943RkSowT0oFAw+ByKIgVtaBZW7v/UwlLrs
         UAQwScqgLl9vILysSs1D6pi2mB+1u7GtDLnxnm7Pv11k88jF+AYcdNS7WoNzeXkt0Kzk
         dC8jHpKpCrCUTYAyYkVy9hEVyIRNNPuLpxutpPmg0Ll0aZBerA8TeVg4nasOSffh0ZPj
         zjTqfJacD6cWqnc2KTw1Kc7GuXOlzT/KNA+gjbymL82AFDzfnYOUsvecvji98BxKrqmt
         xCYNlGLEhzcyh2eT69XSw4p9aWhPo1/KB61O4ayucaFQm7GxIcqheSTARp+mLTNREtDT
         PRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698601; x=1739303401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=;
        b=DanH5jZfqJ6NJopQ95azyigLq2VbrJ7MLsoBiALZ8NDn5RbEDKfWmL3T3lkZvtGQgb
         fCzI0FnHojZ/QxpMBl2Dg7uA2/HS7R+sio+MKYJgnlGx/OdupH6dW29uofK1+kNwYG/p
         rJc5tNNvoQ3JaTpVWak6c58NZVTC7ddYs2uAIbc8sXiR/P/0RuzrB60CmIUtQaXpOO53
         xxFAWt+sgTtSS5MDa4wwZb7RqR1py+NlKtTbX2zLrbtGPDIx+eqU2XvHXuUutc8GkbxP
         u/5wZfiB9P38AT/5Q7HIewjJKbbGKYVyFZ5RQUq4rxJxFuBpBnqlSiQ2HlOWk2SRb+OB
         D5WA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Cgbqs60o9OZKPDHy3lPNmJE6rgm+a7QpaALbl7E3RCbjLQYRF+ZCc8GQvQ1CaUpntWvByNDJ/xkTyRWc4e0=@lists.infradead.org, AJvYcCV8RLhLgpXsL98/SL+0hjjTtHiox6vgc/LbbFVFRgcMFju450iTuKH4Bas98UcyUbxu8H2WxXkJUH6fDrShOYx4@lists.infradead.org
X-Gm-Message-State: AOJu0YzTGlLWGaOrku4TYFBSwCC9huDlIksutVLPrXKQDAnN5KY6ewG7
	bCYMLEi/KT84bPQMtpKJSgg7YkMc59KyHFoFcNhUA28jtv7NK5ns
X-Gm-Gg: ASbGncv4Fn6o7H/Pl/SU9TRrjOxawLTf15HFHDOkGFvaK2DY+QBlVHK3U1nm4CwR+Xs
	pwVrtbK4IUVPt9ja3WqGeAdMCfLBHlXmqHrR/vAfY/HMaQMrHigLrLdWV+SXVP0hJqszQRyLDk5
	3PVhN3UpcSnMuMeizAmuDnsmcO1h7GfvTyaa5fXSUiWVJmbNQURQ7ylFx/GuCnQdFV/LvtkC/r0
	Jga7m02niWNs32QzQGa9JHD6z41M2x5ds8zWgQvue+8wLSs8B63cGaJhREiOiJMrS37Hknt0C/k
	pEVlcq1a06q5GOwJYMQqTkbiwzhgga44wtyJQn8uJJonmaClosukS2k+8wmC12U6mHxNJQd/qow
	nT2jqJYOdpL7QQUuGgHAtp49dYB4uZdSf
X-Google-Smtp-Source: AGHT+IEajcS3ZyEn4iy3BF71r5OWuaA3wC0VPy1tuH9m7gdyTO3QjqxLaSnyY8eDmuFb6ii+jRnHzw==
X-Received: by 2002:a17:907:3f11:b0:ab2:d721:ed92 with SMTP id a640c23a62f3a-ab6cfdbe5a4mr2881889066b.45.1738698601046;
        Tue, 04 Feb 2025 11:50:01 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:50:00 -0800 (PST)
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
Subject: [PATCH v5 net-next 08/14] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Tue,  4 Feb 2025 20:49:15 +0100
Message-ID: <20250204194921.46692-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115003_004956_0D2F89E1 
X-CRM114-Status: GOOD (  12.07  )
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

This will allow a flowtable to be added to the nft bridge family.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nf_flow_table_inet.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_inet.c b/net/netfilter/nf_flow_table_inet.c
index b0f199171932..80b238196f29 100644
--- a/net/netfilter/nf_flow_table_inet.c
+++ b/net/netfilter/nf_flow_table_inet.c
@@ -65,6 +65,16 @@ static int nf_flow_rule_route_inet(struct net *net,
 	return err;
 }
 
+static struct nf_flowtable_type flowtable_bridge = {
+	.family		= NFPROTO_BRIDGE,
+	.init		= nf_flow_table_init,
+	.setup		= nf_flow_table_offload_setup,
+	.action		= nf_flow_rule_bridge,
+	.free		= nf_flow_table_free,
+	.hook		= nf_flow_offload_inet_hook,
+	.owner		= THIS_MODULE,
+};
+
 static struct nf_flowtable_type flowtable_inet = {
 	.family		= NFPROTO_INET,
 	.init		= nf_flow_table_init,
@@ -97,6 +107,7 @@ static struct nf_flowtable_type flowtable_ipv6 = {
 
 static int __init nf_flow_inet_module_init(void)
 {
+	nft_register_flowtable_type(&flowtable_bridge);
 	nft_register_flowtable_type(&flowtable_ipv4);
 	nft_register_flowtable_type(&flowtable_ipv6);
 	nft_register_flowtable_type(&flowtable_inet);
@@ -109,6 +120,7 @@ static void __exit nf_flow_inet_module_exit(void)
 	nft_unregister_flowtable_type(&flowtable_inet);
 	nft_unregister_flowtable_type(&flowtable_ipv6);
 	nft_unregister_flowtable_type(&flowtable_ipv4);
+	nft_unregister_flowtable_type(&flowtable_bridge);
 }
 
 module_init(nf_flow_inet_module_init);
@@ -118,5 +130,6 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Pablo Neira Ayuso <pablo@netfilter.org>");
 MODULE_ALIAS_NF_FLOWTABLE(AF_INET);
 MODULE_ALIAS_NF_FLOWTABLE(AF_INET6);
+MODULE_ALIAS_NF_FLOWTABLE(AF_BRIDGE);
 MODULE_ALIAS_NF_FLOWTABLE(1); /* NFPROTO_INET */
 MODULE_DESCRIPTION("Netfilter flow table mixed IPv4/IPv6 module");
-- 
2.47.1


