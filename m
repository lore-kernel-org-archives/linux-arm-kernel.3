Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1368DC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiV2XWtkfGXlde1QnvjR6tvTdGG2fr19IqREO8Jjig4=; b=MNgSKwnxtDIXwYis4sgKztmea9
	Jyk5jeX1+hVqi3Mb6lbYiOfIXYUhdMS57PgPiW991LqS80q5CtrrDlxiGDes9yX8YmfV43Q0RM2Os
	3agHrnukEcpr/EDJoQJrRc84UCkTz+Q3dNzpkfO9qQn2ZubJ2ezk3ynJLqMgkDMUCodfxFGk5UgYm
	hvFH2cHITMlIEyXZ2I3sHjMdVYIKeXnHKkjRMppIxZnVY0B02+rdDyiZStkHJuYKdn5dhhW7LxcMx
	zFu10lc8i6ob35uTEB/OE6MxhmG0Zs3CqEYT0RZAg86KHNRHcrShTNqbe2zCYjb/3D1ct+r+l+htD
	A5MQKSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5N0-0000000EisL-3Z7R;
	Sun, 09 Feb 2025 11:21:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DC-0000000EgaI-3Za6;
	Sun, 09 Feb 2025 11:10:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so2476804a12.3;
        Sun, 09 Feb 2025 03:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099453; x=1739704253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiV2XWtkfGXlde1QnvjR6tvTdGG2fr19IqREO8Jjig4=;
        b=Tv4IS6GJb361VWzI4x85Fd8heQX4YzYmzDzWr83Dl9e9mTBZC1Nh8a8lO5zwoEOani
         imZdxnI0j7OdXFb4kFFjoFQAm47wzWiJyZTDkWqc42605CnkQ+ARP5jAp2+YebokdpPD
         GvBbz9P+868pjHCKcEN03sxlul7yGCHtrGQ4axrEkfB4Z5L+M6XiiLEYeh97Ewm0XqsY
         P/x5WWRJH18AI3HSWBuCYQzT5Q8B5oFO3ZH4YA8SHsHVppoLYCuxt5xp0YUtP31zagqQ
         Y8G2ftIkcQ4nAGF/ohJD19C4vVdCvdjwfyqivGF4SHAxn4eXuxG2BYcu5ut2UL+cZERV
         u4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099453; x=1739704253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiV2XWtkfGXlde1QnvjR6tvTdGG2fr19IqREO8Jjig4=;
        b=fXzEseOiMpnHotd/DqO4abzvOh/RXy1UX6lzOr0gtt4zIncJJKDsDb3YAzQ4sym+4E
         lRsqPFgJxoJygc9Ic9ccH4+BrCfN+XQsekHoEm48n8uwqGrR/GVtQ45lXOaJSrXc/bXA
         GWnDnl9wVa9G9IA9kZG9yYlQJ7lXuu/BfkIkbXqY6Yu8k00LFSwmoaxGW1TFcjwOzIt5
         Ck6F3Hukb9Dv6euL8TocTA1XM8tF6Ts5FrErlHJanxVL9pRwftH5XP86/T93VMOPRE8O
         nEn07AaXFsuX6rb3L5FQeVa7m8Tm1o5ucskDJfxyVYX5qPRrC69HiVyH8kNMWwX5osW9
         ycoA==
X-Forwarded-Encrypted: i=1; AJvYcCW5bVEwiy64Z4kL8nYgJOsMMD36AaXNBUOUBGAOsa6ksMZ238CaESg5IgylA0iLi/h5EAjITBqUL0iTTKo9k/Cg@lists.infradead.org, AJvYcCWPHOoVSoPI2gDl891/nd3Vp8sbHl2OGNFetGzwdRYkFXrFmjRpQBVAMnOnAULqD5U1p7/d43vF2EH/u7dqVH4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp7yVjxRwOoWwenVNmaMfXF2BwyQqTYAM0GcdMvEDxlJmqsEca
	rht9CDZyj2aJB5Gaq/24dllMVuOlknLH6cqO+E5il1AbqXp4Dp6s
X-Gm-Gg: ASbGncu3I54axZpWSJvRA9t09+VFocfIpaL7aJeei/Uh8Jfd5GODmiA/81DVkVLcwMr
	CGPrMUU97oYD87r7Sl2SCekeB4o0mdRjXUTRfxL5092A1CVbN5RVhnlU371mcPGKBXGqhDQXdOd
	U+ECx0FeAqeF5Xx3fpqofQoIGgzP1+rRkyUbyNSz0L4yST8XVIcKxUfSIwyoHwb7netZYm9Phfh
	bxH5pmzpxAALuliQuw4CIt5IDb/XQIgsUwQOz89tqcXSV861nayL0hiBzETbjwnbfrPQKEuqn0x
	+U1H+zo0pUBqw9DqPUJ4es/MlwmmKjEn+XxzqfPSQ3vhc5zP5+KagvgTi0Vfnr0sgBk42WEj9U/
	P7b5dhwnCFc7+9ThL3+DnyadpYVoNqpvz
X-Google-Smtp-Source: AGHT+IEmLnqa0nGSLzn3hjiFdgZfX9hAmJ8z1fc9klOPfXuoZo6FdGrvL+huNkWGACzBiYRhNwKTyw==
X-Received: by 2002:a17:907:6d16:b0:ab7:3e27:ff04 with SMTP id a640c23a62f3a-ab789a9f58bmr979157866b.3.1739099452941;
        Sun, 09 Feb 2025 03:10:52 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:52 -0800 (PST)
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
Subject: [PATCH v6 net-next 06/14] net: core: dev: Add dev_fill_bridge_path()
Date: Sun,  9 Feb 2025 12:10:26 +0100
Message-ID: <20250209111034.241571-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031054_889850_644978CF 
X-CRM114-Status: GOOD (  17.43  )
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
index 5429581f2299..9f925dc3d1d1 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3281,6 +3281,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index d5ab9a4b318e..70d767cb8bc9 100644
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


