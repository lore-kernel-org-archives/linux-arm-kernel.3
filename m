Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81177C02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsPCevqpueBx6GSFI4rD1h7XgDDvXf62bnEByGQFocw=; b=nq64U4NHx68JYqbTxVuMmRqYXH
	83YH3aZNIjlGuoXxaP0vU0clsXtAecEXmKoRY2/frX6yFSMmkp+/kN12aCPb8l0U179PN8T309x1G
	ws/aGnJ/Qzu5gXrvgegMQyXokGX6CB+jENaqFGC9tt047jMasMJJa1t5cyCT0LM0VnLTZlLrhyxAb
	eBd/w5d7lgHp25gM+WhVUeKc7WsWpgunvJWOWIPaOvUzE1IclznjNECP8hUPyCLMDj3vKFaoicHB6
	uZBs1QCxdJmeOM3R98OT8kDV2s0B4fu0sXnL5VqyfTOJqQ0nXxzpo/mOgiLzNHM8c2P5rflg9zRS8
	E5H1KlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVb-00000001bLo-2Ppr;
	Tue, 04 Feb 2025 21:31:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvn-00000001QKi-0G1E;
	Tue, 04 Feb 2025 19:50:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so8346987a12.2;
        Tue, 04 Feb 2025 11:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698598; x=1739303398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsPCevqpueBx6GSFI4rD1h7XgDDvXf62bnEByGQFocw=;
        b=DLSenMxMjEKOYV/+qi/26Y9muHR0cFcHCpGjodn+ODDOEATMJUturcBgdF6FHTsXGx
         zbZP1mDCDZ6lVb7vQ3gPeWr+BTFw0meams4y37amntHgszvWl4TdrbvAIh6OOBOn/maR
         RrBTmWjlAH/x3+BI74ZudbtmvIjgzlVW7Gnx35MgjxbEzb3r9GJQSqOUOMu7JZzwuEHa
         ZOdPMNvNbktPaZHynwZ7AE5OOHuyfnQ9C2VygiDjH2SpI55cFpP7xImkASrg8QiQ8Kzx
         iwaX/ns/UNIPEsdG5eHvW75pSrvSNuw1svnqV7/4I0sDwg596ijbb8kF5Y+JR2AIgoZ4
         OOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698598; x=1739303398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsPCevqpueBx6GSFI4rD1h7XgDDvXf62bnEByGQFocw=;
        b=wYQNBQOiCW/M5UbXCAIzKFgOyYtZzAhwQTYVeoQTBb5hN/qv3v0td9mDgzAF6yYKqZ
         FmoqJFfN7vR+2L76wBkCDi6Wi7Qo/uEs54nngMT8y/sT0lxmZKlTINnobiPdAqEspevi
         o1S35/jkL3N8TLIWv5ttKJAhZyUQK81MwOO+klJuha2vMPkS4cPJc1XSFMWh9C8lhEXv
         BBz4efCSqxXjDO0OFQy8LTSSTw7YNfSZ4XCpNg0TS3ym8X2HspG/nnawkSN+GbxQytOH
         YpNJcyaCHc3yFcplU4DMcP7Fyjdfk93WjxN/3qZWpyWB6+CpSF666taZP+5ep3/RRC73
         37hA==
X-Forwarded-Encrypted: i=1; AJvYcCW8J6YbfgvQpd6n61eELM9ZIFaP5uaPeLMuzD9VnZD/p2NFolUqON3fjcUniJ9+A40wRLCf3QvNZXkjzOh43qo=@lists.infradead.org, AJvYcCWrvXbkjJyOjXzDlmAY0KsHC/mgO3juEQSZUl/LAA1c7h12CN00kjAbUXIa1ou+HR/0QNMtBFuhooKEsbTL1Bbm@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbHgLwUtjBTUVa0WIRgn0SWA9k4jV/7vUAMkTNGXTGUq111QO
	deZ4bSKsp4TD/EFPmTmO4OWDg4yaTpmhOm3bM890ExXu+8/pdi8n
X-Gm-Gg: ASbGnct0Ck5TZYdL0AT4lEtK4TvbMSrGkvUX0z4DBhRCBsRbu3owkvv17OTacurwdTA
	/3xTJuqzfaDICVSNvoflpsHNmV6+cEdCwJ398qpscmuuRUIm7MTIbc26f8e92PoBMWkchqVVflh
	v9v+7FpFDMciEbuJf68hkOSV4CtVm/iFLggEsYRW0l+qN4u9ry+VR/Ek7VuRkP2nI0fpf9bUXGo
	pEDnrSfcPIeSVmnMCCVe6j2lVjSY+1pyz7DQjXuSqrbu3jqnNaH2/PMD6x5JzHqFSAUO16MA/qh
	7NbfAJc+tG//dXSagxL10mI5INHmr2PDv7L1E3F2Ck/mfV9gqX8QidJoC4dOX2PgsD/GqdP3uga
	VKeUxVEQ/sN8aFjlcqiKgCSALYbzEUZNM
X-Google-Smtp-Source: AGHT+IGsvAO6yB125nXkOzzJQ5/yZRvVQfJ0zTUKb3SHTgAx94hlT9r32V6YfG08Gq0AwS0+7SB3aw==
X-Received: by 2002:a05:6402:42ca:b0:5dc:caab:9447 with SMTP id 4fb4d7f45d1cf-5dcdb7297ffmr798822a12.18.1738698597522;
        Tue, 04 Feb 2025 11:49:57 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:49:57 -0800 (PST)
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
Subject: [PATCH v5 net-next 05/14] bridge: Add filling forward path from port to port
Date: Tue,  4 Feb 2025 20:49:12 +0100
Message-ID: <20250204194921.46692-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114959_111433_099128F2 
X-CRM114-Status: GOOD (  16.68  )
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

If a port is passed as argument instead of the master, then:

At br_fill_forward_path(): find the master and use it to fill the
forward path.

At br_vlan_fill_forward_path_pvid(): lookup vlan group from port
instead.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_device.c  | 19 ++++++++++++++-----
 net/bridge/br_private.h |  2 ++
 net/bridge/br_vlan.c    |  6 +++++-
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 0ab4613aa07a..c7646afc8b96 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -383,16 +383,25 @@ static int br_del_slave(struct net_device *dev, struct net_device *slave_dev)
 static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 				struct net_device_path *path)
 {
+	struct net_bridge_port *src, *dst;
 	struct net_bridge_fdb_entry *f;
-	struct net_bridge_port *dst;
 	struct net_bridge *br;
 
-	if (netif_is_bridge_port(ctx->dev))
-		return -1;
+	if (netif_is_bridge_port(ctx->dev)) {
+		struct net_device *br_dev;
+
+		br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
+		if (!br_dev)
+			return -1;
 
-	br = netdev_priv(ctx->dev);
+		src = br_port_get_rcu(ctx->dev);
+		br = netdev_priv(br_dev);
+	} else {
+		src = NULL;
+		br = netdev_priv(ctx->dev);
+	}
 
-	br_vlan_fill_forward_path_pvid(br, ctx, path);
+	br_vlan_fill_forward_path_pvid(br, src, ctx, path);
 
 	f = br_fdb_find_rcu(br, ctx->daddr, path->bridge.vlan_id);
 	if (!f)
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 1054b8a88edc..a0b950390a16 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1584,6 +1584,7 @@ bool br_vlan_can_enter_range(const struct net_bridge_vlan *v_curr,
 			     const struct net_bridge_vlan *range_end);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path);
 int br_vlan_fill_forward_path_mode(struct net_bridge *br,
@@ -1753,6 +1754,7 @@ static inline int nbp_get_num_vlan_infos(struct net_bridge_port *p,
 }
 
 static inline void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+						  struct net_bridge_port *p,
 						  struct net_device_path_ctx *ctx,
 						  struct net_device_path *path)
 {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index d9a69ec9affe..07dae3655c26 100644
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
2.47.1


