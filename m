Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=; b=SB6rKrazHt2es/VaG72twkg8gt
	VKGYMFpaOVlwIaRC3aiXPxGZYDk42HZs2mbS/MZ1vbNM2X/1K3oDUqgWmia8ePAqidONxeOli0v0c
	nCJHhb117p/PwSiV9xNhxFXU/jiSzEWk8hNJ8I8Ff368KPkkwKJwJwilhSPbJPeGkU6bqFrCom9J7
	zvivurACuJ/27J14iowt21rlDMcsG5QosDYL7EU/dM22NHdnYnyWwZ1frmXrMnGyL4+9NBRrf3Peg
	SEkBnEi5vs4oICZKjjN/wytdHOMUgYdnh3yzCS5rQQqo98geKSvWwjIIJBPAT7M6lENhOVhI2iSPC
	HfGxM2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQF-0000000G35P-2wUo;
	Tue, 30 Jun 2026 06:58:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ8-0000000G2zr-391J
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=; b=Xk5wDZ1GV/+1tSySE34OLz85fl
	x0RYvPQVwYYiKWeBcB/FEFL3T/bPrYxN6CQwHUSX9brb2SQB5iiMNxQ3nGpy3KOHE25zCVBD1L3CF
	GE8oZyxkBmCgazqtGFTgtETeB47jBX8mzFDYWXXwhRX4gRpUF9Jas/IZvFd4tXaJoGzIbL/dGIoDN
	1WPWx0V0pMCOguSTHms1Xji1unTMe30s2Paaj0szXeNZD9fuFbqT6oheFhpAUBTly8Yz2wXPrYObA
	i9vqLNtCLfHJoOxLZkrHRaGHwigPwLc7SP64hwVvoPxys1GgzgfrFoCZrC/CaccJjZNwU4/nyfGE1
	FuBqymfA==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weSPw-00000001aG2-2Lf9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso4228825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802678; x=1783407478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=ZFuaEO9Pt6PvJctUH0dnIyOG/zbNudo5Auzu3WTZ88LGD+yFjRsNNrRwhHbQyxAC10
         IQgiCCvlApUqtofaD9VcazQK8FuC6BdCiGxUqDhRlxy5UbS7x5SSSRgxg0K9CzLdlNg7
         /3hEzrIIZ8sYciYm3XXESx4T83G2lRTw2hex77ZrZqsIpFF/CneaN/Ji+Uh+1va/gE1u
         mxKHiQPrL9+wZHQmDNax6erBoEbY2sk/N6nFtVPypyuUmC+L76Vr3QUyC69UMUU9EZFN
         bBO2Li6tm5I5JCGP4qQTu+coHlhGi/88klhR2z+hI4GspNpO2J+f4ruZGcZ1DnrzSBNI
         wgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802678; x=1783407478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=JQpNGFClD6pqPSvhpFCNJecNdBhEB+uIBpZ0hP7mP/p/nxzpvOfuHldHh0fr5ELNFq
         E1rHH+96EchrrNrsk0i5LlAanmIgSLoAfhcJw9c+s85d7tUGaZgiB58UO4raWsN2Myuy
         tJVHB3XoFGq5P57oK6rPhgfGO99ygV93Kv3WTFrdKLlQdczp/+1bVPHQ/CYcnRd/dbAo
         YG8Lja6p17Y1aD7jzGl6bs/TuytECSqK8ECVsY6Bj/ClEWCta/eKejTzEL2ieZxjUcB5
         DN+3DvKu8L/YERWiaZ7mXKrWItUKHma26U8Y3V/syEvKPhvRDG61bV8vAh0wlA14K8VP
         JN/A==
X-Forwarded-Encrypted: i=1; AFNElJ9xd2awuIV/edanhDiYYM0LFU8plQcHOygQ0alRglP+ZNNVmwwdF9AM1VPCcnc5MH9kv0FrwR2dSXhPRe7iaqBP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8hqW1SqHle/Xf1V+n85yswYvpvhUSaP1lK/MjjqmprCb2+0Q5
	H1NnwubogUaP69OSv4OH6ToaRN/zNCO4ABuL17eAmpiAYsDTsTVay1L8
X-Gm-Gg: AfdE7ckWeFIG4k/QlT5+Etn/B/VC6Yoj8iuCwjQtx7af2J5N6+Lm1dX6/LjU5ic03k3
	F16JBNwmheZacfjHRVMK+FZ6lwvztXRTDviy9nn6zP0OG95NUY1vmSXXOn1UGsMZ+cQfpNmhuDJ
	T+6kE+yT5JsryNA8J1Mzc1BPh29nOEX2lJoQQBjxrG0777zixwAuGCpRPNV5onY3arrT+8v8vrD
	3tSklO1CocQHP3g2Fpxj0BvKbCld5Sjx+VoQdcXP70CHi428CK6iFIl5AiNs+VaR5/9EwnFG2RM
	M3YyTgpQoQQa+irJQVO+LjRQwPdYfxMyzFOchJv4os8XGq8feKgt0DdKVeHdAClyboOIzOHfsMl
	/g3LVK1lkft+4Jko+q+iEMhZZd5wLyL71qARrrJgMEMyd2UOHTHhgdpRZftVsqFIQyhem3jtmH1
	fPFazRZns=
X-Received: by 2002:a05:600c:c4a8:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-493b82b556emr34781705e9.28.1782802678147;
        Mon, 29 Jun 2026 23:57:58 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:57:57 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 1/5] net: export __dev_fill_forward_path
Date: Tue, 30 Jun 2026 08:57:31 +0200
Message-ID: <20260630065735.3341614-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075809_433359_0BA4A11C 
X-CRM114-Status: GOOD (  15.53  )
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

From: Ryan Chen <rchen14b@gmail.com>

Export __dev_fill_forward_path() which accepts a caller-supplied
net_device_path_ctx, allowing callers to pre-populate context (e.g.
VLAN state) before the forward path walk. The existing
dev_fill_forward_path() is refactored to call it.

This is a prerequisite for nft_flow_offload bridge offload, which needs
to supply a pre-populated ctx for bridge port devices.

Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 32 ++++++++++++++++++++------------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9981d637f8b5..c1d0b897de95 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3422,6 +3422,8 @@ int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
+int __dev_fill_forward_path(struct net_device_path_ctx *ctx, const u8 *daddr,
+			    struct net_device_path_stack *stack);
 struct net_device *dev_get_by_name(struct net *net, const char *name);
 struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
 struct net_device *__dev_get_by_name(struct net *net, const char *name);
diff --git a/net/core/dev.c b/net/core/dev.c
index 4b3d5cfdf6e0..62f1d0b64c76 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -750,44 +750,52 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
-			  struct net_device_path_stack *stack)
+int __dev_fill_forward_path(struct net_device_path_ctx *ctx, const u8 *daddr,
+			    struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
+	memcpy(ctx->daddr, daddr, sizeof(ctx->daddr));
 	stack->num_paths = 0;
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
+EXPORT_SYMBOL_GPL(__dev_fill_forward_path);
+
+int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+			  struct net_device_path_stack *stack)
+{
+	struct net_device_path_ctx ctx = {
+		.dev	= dev,
+	};
+
+	return __dev_fill_forward_path(&ctx, daddr, stack);
+}
 EXPORT_SYMBOL_GPL(dev_fill_forward_path);
 
 /* must be called under rcu_read_lock(), as we dont take a reference */
-- 
2.54.0


