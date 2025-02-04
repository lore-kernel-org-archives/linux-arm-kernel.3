Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C35C0219A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaTNlLcx8N/VOWeG8N/sMwOA19H7daJ4VH5LDcsIDAY=; b=KAfRwMikmpq4lWet04J5ZakIdc
	G/A81CuOgzZyYACOxk4/H9mKVAqBH8ComiJXjcHzmDZdtqGlkMd8h0irIT81qJNIzeEPqyP/2Phnw
	qOCmAJuLAPIl5KzoKgFkjYn6EZ3EEY9TnsGxsBQ4qeO+Q+W/A2JI+MJgM5EqdYinN7SYvF6dQjvOG
	ZIm8nMQHKGdfm+aK/swQfjO8xxqsdzzOStyeF3qqxy+lcQOmIPI/n0kp+IlLn6XJ4qgU9difWr70q
	+CJT8vBBYUQkaGcWSEphEzZVXF+vbNQanpGcBZz7I6EFzP/7iQN1vI95QIOvLO1f17Tuog+ZOurDn
	Bv0I8/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVc-00000001bMC-0RZz;
	Tue, 04 Feb 2025 21:31:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvo-00000001QLA-0NSm;
	Tue, 04 Feb 2025 19:50:01 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaecf50578eso49986666b.2;
        Tue, 04 Feb 2025 11:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698599; x=1739303399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaTNlLcx8N/VOWeG8N/sMwOA19H7daJ4VH5LDcsIDAY=;
        b=lA2DSYwe3R78G4LWE6WMNF+VrChlYrg2ZroQ4YOh3JSaXfrnFlRzfWmEdRErN0FVOB
         tnrkB5e/QTFtjQGbExqxDViNSOWeAC9rWCda5ATuw+S0TJC0A8mlzkgrhyGcNaNU2qGa
         cU311eiZ0+ca342kL9ehG69p5hxxX5bm4VODccWzrU92CNlcTMFyczlMq7GY1FY0qbkN
         bcNgtrFUHacNTL5Lx7F5vtn+lBuUwddsfGFGrJU8pAmPbl4hhrslSCek2T8Y1Y3QGozP
         03B3hf6bwI9HOsnBK3624N5kQgLWz+hQV7iis6FA0y6ZznaFO1hHgnY6I6AjLArCYPLE
         ULTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698599; x=1739303399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaTNlLcx8N/VOWeG8N/sMwOA19H7daJ4VH5LDcsIDAY=;
        b=fkRRtynEdBBnLQJXfCnfq8rfKaox/pxqX8g5S2XsP4yfJ1g7ByTOYg86xy/0j6fe7r
         rpZN3kPu86ekjydA8fcU+sETw/7foEaPuHUCmt8ydQvkPUugmuoAt4Nuy+Gx/rpRd8KL
         n6T+83VksfwlT+5e+ZRSAlzIyKUf6RS/oh5f01REnLo3NI4gkvTk9TysJSxc+h/DHLj1
         meo1YGxmSyyh6JVoFpouFJdAL6H+w/3MXXcHuTn5r6/FP2T/tFGncwjFYWr39+UNfGeX
         02z0vxP4gHH4f24CzLmcr3vB7YFxYdLDziRUY4+zewaDEgPXwJ9e9Nfe1ZCqd53SjWBf
         w1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFhBPS/i09clS0rkBfjvVGSHOFl+UcA0CIPOB0sRI79rvLN0+hPaF2xkDvorYdP7W5/Lv61nybRjfuQfY1OXo=@lists.infradead.org, AJvYcCWmuxlI6p2uELP3WI6iiva5UPz+5EWzg2VpgxNzmxZwRQTeW9ff3dLyLSWtCz7vC2VDUmO2s3jXrJ6BTYxpn6n0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9uy5tHk+Z9O/sPT6TKUueq5t618TpQuten0ELon//t4BkO0PN
	f7Z0FRsZmWqWRz2qVIrGe7dzmsRx7jpAFcGK86+VkxZnC/87X6SmxDrbEZ/k
X-Gm-Gg: ASbGncvLnjIJZvxynD2Yb+upvMcp7TsyyXapmw5xXNseQHFY+FjmrClcEZuhR6+S3hq
	vssdQf2d0dRjujtq8cE31JNbQAHLUMnOp5K+qzlmH6AIN/50xGBKND8jVr+NgBjqo3oCU+HO7Qt
	XX/U/4OoRiblauXgJSk5GHGPkRyrP9AYKYFsEtyC4oA9XSs8YxluXjqrq6PqPWn4FYJFasS+JqF
	JvssSKWNZ1BqT/eHtrf7qMqjWzu32+WMmwnvSrXIP0y/au4xe/Jo49qEAZ2wytOOAr9ZxS4wvHA
	r4a8bVM+1NAwb/2j1jCMm2IzSSQlbnduehL+5jp+Z5nnnfpV3Rv1gjJ9f/zdWFaKKZN1H3Xa9T9
	wwV6qxjvYf/jL8yskeHwCKcQQqLcwbgGp
X-Google-Smtp-Source: AGHT+IEn1JUbmSDDmV4FTAJZUTLPh7UPgcV8aDhV23EvUqrbyMWgBZiKGFEz4RZTiOX9pR12aKTGfQ==
X-Received: by 2002:a17:907:3f8f:b0:ab6:61cb:ced2 with SMTP id a640c23a62f3a-ab6cfcc6f27mr3006053266b.9.1738698598722;
        Tue, 04 Feb 2025 11:49:58 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:49:58 -0800 (PST)
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
Subject: [PATCH v5 net-next 06/14] net: core: dev: Add dev_fill_bridge_path()
Date: Tue,  4 Feb 2025 20:49:13 +0100
Message-ID: <20250204194921.46692-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115000_140614_977FC408 
X-CRM114-Status: GOOD (  17.76  )
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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 66 +++++++++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2a59034a5fa2..872235e30629 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3280,6 +3280,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index c0021cbd28fc..179f738f80d2 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -713,44 +713,84 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
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


