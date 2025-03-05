Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3473C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM1kXQjhThZXDzCIWTKLQoY0aGhS2pSnBiHrFmA8ll0=; b=tb0TIthMrXLP6x3+qFCooqYNYF
	zg2nD+inoxLssvVMDxoPxOZ9GYZzGhCsWrHsvtjcFJE8bsZEvSMs4y2rLMyOqrb6z9YsAkz/fN8JE
	hnRAuOZhUgnysBRPhVmSUtEz38leOrHLCdd/mENR3VtkI9fvFVzKLGeKvsWuPLiOaIL4j6qa/ZKBW
	DRIsYQxOf++RttQq/xHLHUktBn/ux2Cv7phZ/Pb3Oho1kEuHdbuWT+yrj1epfBdByU0/QA6wypYx4
	PkHspc7vWKHSStmflM1f2a/POppPyL94qtnL4w1D2hj1u3YqlkBUXZwdHzk5KQKb9rSgTUmuzYy0l
	HajoC4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmgv-00000007oxL-3T0v;
	Wed, 05 Mar 2025 11:13:33 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0z-00000007gS5-0qb9;
	Wed, 05 Mar 2025 10:30:14 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab744d5e567so121603766b.1;
        Wed, 05 Mar 2025 02:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170611; x=1741775411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM1kXQjhThZXDzCIWTKLQoY0aGhS2pSnBiHrFmA8ll0=;
        b=gQJnojnjoU9XTltkLd3u3YV71NIVXu3Q6TjiF6HOPpjkr2EnzpbgUw2YIBuI/9se0b
         uSpiWgMykW4CcoQSCdupZmd/7DAKjXUo5kBfdTBcqFJM/tDI1EEGYo1icWSZrmremCy0
         Ms1ctH1dDVLN2PVqwittNQxqcD13GXyB9b+Q8lUTI+vQKoJ2OfKA8iIQB+2lEkds1hIC
         tDdDQGInuKO9jQAe5UfkwbFQ17VGeRg46vUwlSfRlDjDRmPVdfZ9pLciBYu0hxo2cczU
         ydu0pvw2E4AhLk7XmifG7a0EWaI+CsgE3r7/R/44y42AYy3qZsW4Hx9nUDq+G/kwuyBL
         5GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170611; x=1741775411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM1kXQjhThZXDzCIWTKLQoY0aGhS2pSnBiHrFmA8ll0=;
        b=tBIwEadE678KepcsmpS7U1QIqXhuSnDM0TyFYdWx1yYyXXfelZn/Eu0v4ey8ecjX4l
         zjVaE05U0hOChFKRTiz5CBG2hUWvzWtX7CVDAHTh4szbw/KcvQwqMOZyiNz35y0YgzLE
         3LG2HP3lAnwMA0BTkEV+rxkO++a0AjCa1D4vM9Bfga08UJo8yZOkz9ae1b1inxhGEFn/
         nLTCo1kIhuEbD+NuyDYfqcIv9jkd/21+9VoOjXC0rzygiHb73gz5YrNS7ggh6FE3+M9y
         U1d2d4u/WhE7s9bV4JfdN2UMzsxCvXyP+a+oN5Gf2ah/5ISwlLjEvikl2/uy/DqpEdty
         2mTg==
X-Forwarded-Encrypted: i=1; AJvYcCUN5gSyVqGnZOeNkfOuJ0ArzHHvdwDUZlhaSC8suqOUw1UwSk59+lKOw1fN7IakgNflMJhYGTzyUKlM+v6kyLI=@lists.infradead.org, AJvYcCUhezU6qkdCh4ydYeIyIM065k24t9JlC8FSf9nFr5OoAvP041TZCeXHKmk2cpUKRHWAFVLqAtb68SEsaGgYCZML@lists.infradead.org
X-Gm-Message-State: AOJu0YyAI34swKyg0PMX4HeNnw8MQslNHUz3yjpOT/elkqHezAYKZExB
	0zaX9+nj+zNBtblTN2rKNTb63GB0ps2f1NCYjki46LVtv/t/R3aI
X-Gm-Gg: ASbGncvHn5bfk4NU4o1mbXZs3k/HMYvYGUthqkVNE53sIehGk2W2I7492PCSyca2DUv
	7S7jg/OauLucalAGg5f0dTz2tmi/FiS+nVhXVdfi8zuyfBrVGF5NEx97xbokBs60Z4L2NbuJtC7
	X+V+Il4CT3jWnfr+8jEXxe97VLxEDR22X7bdDBkietl/x18t3PnrkyPUMLxCrCfcTsKFVtCIDNy
	C8DSDTNNIgieG2H3ha6O83ZUFHH2AalUhJZWocvbVbG5rJd3ECLfMteLqAeK/YLAz49RgDG2hHP
	ZCLBPlzlhLSdBLi0KZQ9455QMFFxTJ28sWq/w06fBGR1Xh0YIrNRhE3qnnnSbgloIy9v+fumvt6
	+7TD5+Yxb61VSAbmxK3zZLvJUdZQIAYVDcEA+nytLCStvpgsNEPm1AWmbQcAvYw==
X-Google-Smtp-Source: AGHT+IGUiR/Ewb64RsvjGNeJXBn0Ed+9S8empXfVW8h4ZmJBkjiI9NUn/Px8AChfgHjCFcCWMHNHpA==
X-Received: by 2002:a17:907:3f9c:b0:ac1:e08c:6ac8 with SMTP id a640c23a62f3a-ac20ecf947emr220727966b.2.1741170610822;
        Wed, 05 Mar 2025 02:30:10 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:10 -0800 (PST)
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
Subject: [PATCH v9 nf 06/15] bridge: Add filling forward path from port to port
Date: Wed,  5 Mar 2025 11:29:40 +0100
Message-ID: <20250305102949.16370-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023013_250973_E3C444C3 
X-CRM114-Status: GOOD (  16.62  )
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

Changed call to br_vlan_group() into br_vlan_group_rcu() while at it.

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_device.c  | 19 ++++++++++++++-----
 net/bridge/br_private.h |  2 ++
 net/bridge/br_vlan.c    |  6 +++++-
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 9d8c72ed01ab..02eb23e8aab8 100644
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
index d9a69ec9affe..a18c7da12ebd 100644
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
+		vg = nbp_vlan_group_rcu(p);
+	else
+		vg = br_vlan_group_rcu(br);
 
 	if (idx >= 0 &&
 	    ctx->vlan[idx].proto == br->vlan_proto) {
-- 
2.47.1


