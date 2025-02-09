Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC29C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=; b=gkLsTTB/qPtBraKNd0CzQd24D2
	CtHqm/S6u2RZMYZxoB20LorViqr9q4eNXD6Q1xuCQslUKhicLteFq7qKDthqmtlIiogkgF1M2+9+z
	+T+/uCS5s5/xGuOe+9BHlg/b/DwlQG5qe79nqYLSS2kljOKOW+lFAx4jQdsSuJbNN7ysh/gbIfrZP
	DzNlndmXo83S+Agc39YdcAwS2kBijknNZ6ZuEZYASHQ+ViNSdWmuoQufFs3yc3twh842iBjx7zAI2
	1RPDlyzWyGDOFogiiGm90xGXCc4S0e7IeB43KpmH4+EjOkZGjFcNBDZ9mIWHzExh8HCpwcyOmvHWh
	sSLKyxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5Pj-0000000EjJq-1R8I;
	Sun, 09 Feb 2025 11:23:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DF-0000000Egbq-42Bq;
	Sun, 09 Feb 2025 11:10:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaecf50578eso684496666b.2;
        Sun, 09 Feb 2025 03:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099456; x=1739704256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=W0PKTWIRheYk6+WTBtkvoILPtC4D+YmR2CLz8wOxkXYU0bN9nW17Vo7k19s3G8F/Eo
         ci5WN83YhYA7SkEENSgrNgWfw+5m+iBW7Qv/eU0Nzg9XQ+cU99GxfmGs811/aIOZyro/
         yd7u4RBZMLrr1cmyP3rWzbg96NJ+lm3Aw8jA+kdt9JzzKFpQLfTJ4yYul4gT0DMfaUjl
         bvv9QOVVlQsiuKWD2rTptzReYXrkXAhnsVeNhoFXbLC+9U2FMP7HEISUwZEanWnqlkKO
         58vWSnS15TSUFjb84KJ0ot9eFPbm9Ms+/3IOx6/gsGnGrsEHwko6p41g6/iTJZoL/sni
         IfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099456; x=1739704256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=MuIhE7PtHPFHI3N2kXYGoRHjwN2W9cs07OqzFmrGGZWRUwhhC837g57/gjS9uLG6PH
         0mbMzmGvFGR+rW2bM4IIMY9TO/3IIXdgUqw+ZszhhaFcU73gHbpfEQFWD13njQvxleB9
         fw/ul98UzmFj7si+jiYW42Amd4plT9k9/0rtmkXdRL47/qK+WsOFjxfi4fdsotudEWgh
         3Yil8ut0CDu5OlCvjhCFsrlWivvp45lFT32llS7GsTTrwYlPYaUgqpds5E581R3IWUS+
         1kuycbhG2RIf1hpJtHMitvQkyrdcZl6hActGQ0ZlhFbtO1Rcm8TIoo3S6usSoF1pIPhF
         yJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgWkgYeVrStf0oF4KAOAyF2vzFdfLSJNFMwV4QXLZq0KlLZLLKfycysyFOSLw9c6IsJ99/0Z6KZ1Kpw7vvOBH+@lists.infradead.org, AJvYcCVmsgFEpulLEJt4STGdaAyBdZSWO2lROx954uTUvNlIMAexj/Xm0kd25l6aQg4Uz1a0L9BT2+VIOU1gaEnPPyM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqs35bwDFD9VBBxMWjqeTLqbD/aaDDjWI8pflBMIbpHF6QfvE2
	42xtcrl1Ife+82BwReJSrUonhGfRwI3iK9cnYLE6GFjbblgIfa+W
X-Gm-Gg: ASbGncunJiRsphyp/bVzPoav40Gb5GvevBPvPh6ndf2IabT9RBxW5eWob5w9ZMNsPLm
	UQm4gGpIi3AzB1a1tcg0ceMhhIZlQQq1oZmn/vYLtQkC+IVaACz7qoCUhLRsL3c7LaI3dhU9kDG
	wP14eX5F+FAHufIyDejDOkEilsYHKSbQCXfFLuuCRCdGcD8A3o7DSjxy6VDxmjIzeyQpwEHiyDo
	5c3G1MQA40aT+9Cz69u2QeGA1z2CIknsaPPl7CSDjPPoRm4GE/wT+n8aWSWRdrJvyLS1G//DREZ
	SdwX9V84L23AXg95vMdHDPaKib83+OLnHxeFbtTzGlJnlZvTumjM+KQ62eoqn+4bGDN+qtiYEhD
	1lZ4iiWcoN2iNXOC2n/TnLeslxZzHuRkj
X-Google-Smtp-Source: AGHT+IF7fuTwyISchVVytHDMJeeoIfh3ZpQJUt8rRdvlwIphExmlssHSJ85LTIMEOJAJqtrSBebVEg==
X-Received: by 2002:a17:906:31cf:b0:ab7:8fcd:1f1b with SMTP id a640c23a62f3a-ab78fcd2196mr966938266b.7.1739099456462;
        Sun, 09 Feb 2025 03:10:56 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:56 -0800 (PST)
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
Subject: [PATCH v6 net-next 08/14] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Sun,  9 Feb 2025 12:10:28 +0100
Message-ID: <20250209111034.241571-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031057_998173_D554FBC1 
X-CRM114-Status: GOOD (  12.10  )
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

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
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


