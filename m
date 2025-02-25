Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB349C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glD7coNk2GO9/l1adKLN+uo1Xfh2D3YWudU7CjoMsSA=; b=R53HNHkpBIScQud1CdlV0TNE3h
	xTg1eYRdgoRo1+MTavsKOxx4mrJUJysZECzIHiSWTucYo+LaJdMa2dLucBpIkbPQU63fba4Zt4SJg
	lP6gqGlfGh/0/UYfdyXshRRX1r25+D25z7LEqEf2f82+Pp2Qxd3ItWzIdMFM0YFo2Q+dWwTRpeAqj
	XYw8xPcN+CdKgi2hFTIlHE19aeZRGWGB1oWeZ9Nx7G5BTBOLe14cruVB7DaWQ0EQLpfeeh+R2zE2+
	UXWWzg0rF7k6aySsRjxaNIL8SEnUQj+gFon0TKEyoYSWIcG8+Ss9ZlYNv6A5IfR1gOAJt6j8WtR4M
	8LMHneYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1ta-00000001R9w-3Imo;
	Tue, 25 Feb 2025 20:51:14 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M1-00000001KeC-25Oc;
	Tue, 25 Feb 2025 20:16:34 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb81285d33so40104266b.0;
        Tue, 25 Feb 2025 12:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514592; x=1741119392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glD7coNk2GO9/l1adKLN+uo1Xfh2D3YWudU7CjoMsSA=;
        b=BrEPxAvnADjMEynAkJHcjtRfL2FbVE9Ot9fu0t7CiU6oJHfqqMEYwh1LMpXbZidzvm
         qXIMF14+b8y3PAzxDD5V4s9xO/NmUlbkzOUY05qC+1UoL7jhX4mTYW/mPgCyflTnazlG
         ldhBOp8Fdx0HKzB5jdnt5TfrJ6JzVb3vgqqTCZIRa1S6RfW6h9M/HVLvjFvzmBXnnzmq
         FhYSKkAbgmRhcBc5oArBF8PWpVXQaw2Jcj8S+s+hAs4IDSPDicE+cxrfBe6nM67tA2rz
         vKt+RNi2mgEixFyWM237s6B4xBeiRCu68KawdYdDoE/ooAlL23xKSTtF/dP/DKiQbdoB
         HJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514592; x=1741119392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glD7coNk2GO9/l1adKLN+uo1Xfh2D3YWudU7CjoMsSA=;
        b=h3ftvnZysFN6woImVnuaWdblQJkhXefJ90xyHMKVcfo3Z8UxL4QyB32EMxVjgDbzzo
         6TaYBksPbvdmIz19K242eemglBTk5HkmcfhyxFtEGIciRxIDfULKD2swC+/Q3/ZiZjFO
         nlV2yLmKF10rIOkHwW+VFMgEpImLrtz/lm4Y2RRJni7/XRWA7grE5uzFXg5lM4CDMj3P
         6BE8lEOYESzyZceKyL85zu+HzP9IU3ng68AI1sjiYLMCFFMBYaQ/bPkregj8kxrSf7Ot
         /IBxdc7/42xb/Hshg5+OBJCZZ2+qq9kYFdd2jrtUGklcADeF5wBi7KhItIghWD9VUXkN
         JC4w==
X-Forwarded-Encrypted: i=1; AJvYcCVz70pAskrqV92n5q+tp3BdpyjOhv5a2c+ZP/hR+01v8mlKANDbA9Iz8LvUg/H2LhtZxLiRtLIIXVv1PFLhKLM=@lists.infradead.org, AJvYcCX2ICrcMV+LeKCiJCal+/rZVRsVQRk31m+3oWLm6mB7Kd6egaabM2qyZnzflvgy/TgXaUpMQQEMemapcD6FYfc+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+ELbMsynjM8j/w19Z8/ncopfx3mSyZ+H5YtD+CB5LSg9nXhFL
	02QTiCgxa+TD5T2JrMSdYGLQfTvs+qV4Rxi2OSC4A+/eYJxB2pZP
X-Gm-Gg: ASbGncsxM6w6SIGz1DPfy6abFCwbF+6rPuIuLPylhbyADlxWiW8wWxK5LqbZfOVzpN9
	/MDs/Xxg3gfhIpadgtPXiE4svTWjzoB/2VWH8WLHuxOEaJjKl3Bpj7MviqnDUOnif++rAx/mHTE
	knmMrugKz13hDB8FskTJGGCavtzl2zwavkiBx9znVCdkCu2liq83TY0wwwJt5bA8+40K3yWRqB2
	JandVn1GsgPz3HR+ywf+qGU91IyGkOgx2JP1EqQM4KMhTXOUlYFsA0GBUagp+XekmaOr2pGVwrP
	m52poefENHfqfPRTNug4kIsRMexYJPFhYvcYJlEC4BYMVkNl5nNTY+chnxWEyrlMC4yysuHd0mW
	QGNwPFmch0K8/XAtOvqjDU0/wu10nAGTm95+mRxWbhks=
X-Google-Smtp-Source: AGHT+IEjvw2ycbh6O1a2xVehSVYNCqn405b5ejvhuSsYBKJJvxe4gk715VpktRuefN5csP8lyNYY2Q==
X-Received: by 2002:a17:907:3da7:b0:ab7:98e8:dcd4 with SMTP id a640c23a62f3a-abc09a097c7mr1694058566b.20.1740514591509;
        Tue, 25 Feb 2025 12:16:31 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:31 -0800 (PST)
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
Subject: [PATCH v7 net-next 05/14] bridge: Add filling forward path from port to port
Date: Tue, 25 Feb 2025 21:16:07 +0100
Message-ID: <20250225201616.21114-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121633_533993_61938147 
X-CRM114-Status: GOOD (  16.81  )
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


