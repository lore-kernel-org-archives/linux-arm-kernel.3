Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3874FD60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNtMqpfiZ8j9VP8YeMgt8jDUBPMHbCQx5OGfeubdb70=; b=IxoRido9s695hbuTvRF/+36Ju1
	SNJ6Sx0Q6G8uJ8Km2d+prNqIcvkyVziQHF4h7M08ObaxmZ9+sMZLExgecNUSFIS4B8gF10iyOB6Li
	IzltNDibyu3mbd+svoDHIyuBs3s9FotZQ/kNBTgPfbawvpo31IDonqJVbQAMxyzOWNWW+Z/mHICLf
	Zqnvpt/MKcMSCVlQc5CblEVscs0DoepnARnqfyFmP3tR7sDPs55NY17fMZQH2QYPgkHf0wg0K+rhr
	pR1gkFdIPeYSBzdl0IbMqoqgQFmfQKNHwlw/hmnRutwcO3yY+fPhVcX/CHl6RJAbzpDhPWfz7EpR6
	/s7s3nkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLOw-0000000C2He-3zYR;
	Tue, 19 Nov 2024 10:24:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKQ-0000000C10B-24Zk;
	Tue, 19 Nov 2024 10:19:27 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so37921341fa.0;
        Tue, 19 Nov 2024 02:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011564; x=1732616364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNtMqpfiZ8j9VP8YeMgt8jDUBPMHbCQx5OGfeubdb70=;
        b=GBWLqRtwi7YuDiHjN86J5VUJW4tBTY8LpMP/xErtFbQJzyIZFenGvehPICDfl2d2Q2
         ASuKQBU52xt54UADH2ERZbrFptdgjxMm3KP0WurY77WKMI9Fjts3yBlGNvHCcnPUMt3u
         d2jBbRwJESAl0VOaeZhRxJnrVFxBIdqISd/RyIDdO3QSn1q6UiR2ZLcvnXDoYlx2Eegk
         zxvb4wOYcR3EXyiB3aufdfVZCdRL45/hMtfP8UZ+lSWgIP9wjtCwTITPwIN0V6U/XqSe
         e96YCoRQj1t7Y4+DlCywhwkM/QCl3Ua//TKi1cmoUFFAY4agzIBirQNj8Wy3GXz4Rkj5
         fRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011564; x=1732616364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNtMqpfiZ8j9VP8YeMgt8jDUBPMHbCQx5OGfeubdb70=;
        b=A9y15ymQFYm3G7eZk1FizmT7A5UferNFwF0zsCbrO/sz3DMbmMaUTWkJtfc6i4lLbb
         PmGLAs0lk1Jz6Xq9Mcp0OjWYu6nsd0v+clACkbr6fN5V1hgK9WOEWb2DgVv0aR53ksnB
         EjeVbeQ1/sOLS27SLA5RahenAjbR/bh1PrLxWnOJPW6VV3EEtx9g4sioHARQCZbCqvBM
         y5YszcXXF0+MScmn4TLnnlb6EPx9edM+P8t2UqB7p1aJi+c1+uv4OvRFf8e/O7kXWEDG
         1Txsipcw58L2nGAY96zOSPLFueX0DD+4kYBuhIsr8gjoeIkc/Ej25SDF1hUNxSZAnPQI
         yUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMMNkTQxrbCkP6G9uGbuPNjLQze8HDBgBiidiEVuNEAO7NfuDH6wDHZmeTsCt6uXFS7BWAijCUBwmvExVCixg=@lists.infradead.org, AJvYcCXzpnSAQtRfzie4IDQj+ejUqpINGxNZFcW61D86rbiejh3pV739+8wjRUJq8Ruw9VB30gk0Uh3P9PhcTz0IzAgY@lists.infradead.org
X-Gm-Message-State: AOJu0YwmWGUrfcIKglFOkLjeId5srODW8ZEATinKU4MAK8r5pQYYTu0O
	VAF65hpZCdsORCzTp9EV3RZ+z4CQ6efGM4zC+O7Ujd/NbkSDTdO2
X-Google-Smtp-Source: AGHT+IHPphanLQvn1smAWqmqpsVVY1N5Pj6CCsoY8pRu0n0GdFTRRvOQ87pUfg0ubCpmZuXrqQ7tJQ==
X-Received: by 2002:a2e:a9a9:0:b0:2fa:c0c2:d311 with SMTP id 38308e7fff4ca-2ff60610642mr89237351fa.5.1732011563899;
        Tue, 19 Nov 2024 02:19:23 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:23 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 04/14] bridge: br_vlan_fill_forward_path_pvid: Add port to port
Date: Tue, 19 Nov 2024 11:18:56 +0100
Message-ID: <20241119101906.862680-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021926_567415_5F871896 
X-CRM114-Status: GOOD (  13.78  )
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

Lookup vlan group from bridge port, if it is passed as argument.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_private.h | 2 ++
 net/bridge/br_vlan.c    | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 9853cfbb9d14..046d7b04771f 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1581,6 +1581,7 @@ bool br_vlan_can_enter_range(const struct net_bridge_vlan *v_curr,
 			     const struct net_bridge_vlan *range_end);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path);
 int br_vlan_fill_forward_path_mode(struct net_bridge *br,
@@ -1750,6 +1751,7 @@ static inline int nbp_get_num_vlan_infos(struct net_bridge_port *p,
 }
 
 static inline void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+						  struct net_bridge_port *p,
 						  struct net_device_path_ctx *ctx,
 						  struct net_device_path *path)
 {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 89f51ea4cabe..2ea1e2ff4676 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1441,6 +1441,7 @@ int br_vlan_get_pvid_rcu(const struct net_device *dev, u16 *p_pvid)
 EXPORT_SYMBOL_GPL(br_vlan_get_pvid_rcu);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path)
 {
@@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
 	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
 		return;
 
-	vg = br_vlan_group(br);
+	if (p)
+		vg = nbp_vlan_group(p);
+	else
+		vg = br_vlan_group(br);
 
 	if (idx >= 0 &&
 	    ctx->vlan[idx].proto == br->vlan_proto) {
-- 
2.45.2


