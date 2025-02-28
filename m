Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F6FC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADjft9sIJBXUW7LiNylDurA6RPlyGDF8xbXsxbaW9C4=; b=DMIgsjra1bHMLMu/IkDn7lifLm
	b/NjrbhUjwRBkw5wEvgGTflbYBDI6UyhL4BSW/fhUIQfwTVHaVnOadZFP6/dy38I8qzsx0nxbhKK6
	ixk/5ObxWH0uabvMNt5GuCK1VQhu/srOaN+V1ypYqNSxp/jv0kbeUE3jUKO9ND/SB6KP7/hiynZa+
	MVslGPFRMTV1e/6tfr4qGRS8/iL91v5jjwcEbY1ywgNvi+jcD0XgpEgqcrxrQ758hcmQsDVv9/xMj
	1ggt4Bjw4M343ojeFaRND+N2vvHOBZKZ5EnygsdkaXQCZ676YGwm6Z/sMJze2BAjqRk5Q5NOJFcF0
	ZPCizZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to70N-0000000Cc7J-05vO;
	Fri, 28 Feb 2025 20:30:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6ma-0000000CYKo-1g7q;
	Fri, 28 Feb 2025 20:16:29 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abee54ae370so357731166b.3;
        Fri, 28 Feb 2025 12:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773787; x=1741378587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADjft9sIJBXUW7LiNylDurA6RPlyGDF8xbXsxbaW9C4=;
        b=K8o+vcIuB9JsEIn8G73miAslwIj2CwJxxY7Y0aUsY0kYuMoNoK9E4lU3KlPyH7uhgk
         YvB9TVNM8uOHRjK8c9nbYLlcPT1R38QZhUCc6y/72eVxZxKmaXYfvC0hiYV0iv3WZzZ2
         ua2M7aKH+YU9f4o9Ly+DW61nPQTdwfGT/d0An/igjABC59TF1zQMEFHkEZBj+Dgi0VYD
         OCac6KimOsxRcRXnJgn195EtMrKWDM2DIHv7m5PdfF5s426WRtJwTCz+Njl+DRGk4dwj
         yYxtT7SSbuuRF+HbsCFGuQy3xyn//6E96GucLsTeQzYfP0qjuJqWta5HvZx8TBBSS4mA
         LSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773787; x=1741378587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADjft9sIJBXUW7LiNylDurA6RPlyGDF8xbXsxbaW9C4=;
        b=go0rIHf9XkfSceTdVnBcrbR4QyJeNwTT5g1Sr29K2X5JSh8ksgPP5ljXKVJCg/TTuc
         Aq9i8fRvw0xRPcmVJMz85iCWzek9qURiMlSa2aGhvgjNZFXC578xT9+pB47NlL/VlloQ
         bHhy7jaPFqmCOyrWKCTEv8kTKlYbUYY4gUcrAHbYbpE83Di1L3B+cLIeCTpvEla2uADC
         kPwalHoNUurz6XJTAfo4H0tCl/vdHIShVs04xcS3RL2+RFE0LO4UM+UYB7LeOVy0T5Xr
         pQ2CcHyTCh9zNItxDQ7Zz+xWteja/BWqkl3/vsiGbMf5iVjn29kO/cmjQzA0xVI++jjp
         HGrw==
X-Forwarded-Encrypted: i=1; AJvYcCVBgVnqqzXnPpPSZdpdbBAr0j8ORxUtLZXhrLztMVgM3vt81rEbrvh+tPaTO2Iz9lEuzvzKj8XXx/0/k6HL6ga1@lists.infradead.org, AJvYcCWB573iYmxIM8b+uE4lvjhsDYkbqwiRs4LvsBlh7hmlqystNoANxVIsj0Dd79vOgs4bRc5GNFY2RnEWz0axQ0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzsBxyV+MaGQDbCvhkVF4tY+yfBywO8iLXD6DXnikN7kcCG+Lj
	oQRWyNO69TECnXWFC/jua4+yLRHAj8ItrFtR83cTWOgNoQ6EeQxo
X-Gm-Gg: ASbGncsVvgmt+TxnGs60V9O5SfhV1BfvhF+VlXY5qJ4jx+Yu/3r2Fpnjq26j5ijHZfC
	x85mSNmE3HpG9QVXrt8M5tBzqdrId4uhGrui/QZzZcb33MOHY4jHGPh4TCdjqI+cGVLAvuVnxqD
	FcZJn2DBZ9Pw2Lo1TiAlQrNnumrli0mXq7Zdx5ofUmbXkTU4yHvvwz42URgPFhUciyoTxPmeFW9
	MWZ2bmSyq6glNO1bK1DzOd4wBHlwCISnGc6rsQKgQrRtRxtSe0572/Jdxgxe3S1NWu1L3D8EQlU
	cS8689Dh7XMhMtT6FdSePvTsh0LjuT6HrkuiRNkAf+WDEBcjZFx38ea9muEA9IXiKnpjkbagwM2
	pR5X/ypVlq8OlBVgmrJMGjA3PR8yibzb7ZsTCf8ddU1s=
X-Google-Smtp-Source: AGHT+IHZr8MBH5e/es5RLH+VA5k1rbbZb9+gMcTnsziiL+DoKdJyx6FLpgBr4j4inN9U+45blgw9TQ==
X-Received: by 2002:a17:907:3e8b:b0:abf:1386:fcad with SMTP id a640c23a62f3a-abf261fba23mr582057466b.10.1740773786500;
        Fri, 28 Feb 2025 12:16:26 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:25 -0800 (PST)
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
Subject: [PATCH v8 net-next 07/15] net: core: dev: Add dev_fill_bridge_path()
Date: Fri, 28 Feb 2025 21:15:25 +0100
Message-ID: <20250228201533.23836-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121628_437796_4C31511D 
X-CRM114-Status: GOOD (  17.34  )
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

New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
It handles starting from a bridge port instead of the bridge master.
The structures ctx and nft_forward_info need to be already filled in with
the (vlan) encaps.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 66 +++++++++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 26a0c4e4d963..2ee53478d9f0 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3318,6 +3318,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index d6d68a2d2355..467f98f6ba51 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -714,44 +714,84 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
-			  struct net_device_path_stack *stack)
+static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
+					struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
-	stack->num_paths = 0;
-	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
-		last_dev = ctx.dev;
+	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
+		last_dev = ctx->dev;
 		path = dev_fwd_path(stack);
 		if (!path)
 			return -1;
 
 		memset(path, 0, sizeof(struct net_device_path));
-		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
+		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
 		if (ret < 0)
 			return -1;
 
-		if (WARN_ON_ONCE(last_dev == ctx.dev))
+		if (WARN_ON_ONCE(last_dev == ctx->dev))
 			return -1;
 	}
 
-	if (!ctx.dev)
+	if (!ctx->dev)
 		return ret;
 
 	path = dev_fwd_path(stack);
 	if (!path)
 		return -1;
 	path->type = DEV_PATH_ETHERNET;
-	path->dev = ctx.dev;
+	path->dev = ctx->dev;
 
 	return ret;
 }
+
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack)
+{
+	const struct net_device *last_dev, *br_dev;
+	struct net_device_path *path;
+
+	stack->num_paths = 0;
+
+	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
+		return -1;
+
+	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
+	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
+		return -1;
+
+	last_dev = ctx->dev;
+	path = dev_fwd_path(stack);
+	if (!path)
+		return -1;
+
+	memset(path, 0, sizeof(struct net_device_path));
+	if (br_dev->netdev_ops->ndo_fill_forward_path(ctx, path) < 0)
+		return -1;
+
+	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
+		return -1;
+
+	return dev_fill_forward_path_common(ctx, stack);
+}
+EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
+
+int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+			  struct net_device_path_stack *stack)
+{
+	struct net_device_path_ctx ctx = {
+		.dev	= dev,
+	};
+
+	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
+
+	stack->num_paths = 0;
+
+	return dev_fill_forward_path_common(&ctx, stack);
+}
 EXPORT_SYMBOL_GPL(dev_fill_forward_path);
 
 /* must be called under rcu_read_lock(), as we dont take a reference */
-- 
2.47.1


