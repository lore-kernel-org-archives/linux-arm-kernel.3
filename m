Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DF7C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2oeCJos5+VWLjM6O6Ww7CfUdtvRNnO3dpetsG6O99c=; b=htZGa1OLX04BBX2fSRCVqOAnZt
	p+8hl4Q1FAAdxrItS61sEXETLjTmUF9FEw/eN+kVK5nH1tadWZIG6UomF2plFXUVJgEIepSp17UKz
	+GBAH/bZwC/WdrV7EYliLOB4Fmuz+DYtOY5WGnpNX8Fw5gNgrWyXnvlOWbb6fIz/EtWtCB4sm0yAq
	4J+jVBYt9BndUcONFfQNfgqJRvio3kDR+FBBDqMcWsZXe+T6fMilP58xKaxVYG7Jsn9kP+1kDEijk
	RWxqWgxULmswxESPljcET/fkQ9f2vO26j9VcKmQ1dd8wqImpeAl9GSOy2cqZPBYsyiBI0FKsXwGyj
	yRiVRV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7Ax-0000000Cdhj-2Dzh;
	Fri, 28 Feb 2025 20:41:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mj-0000000CYQ9-23TX;
	Fri, 28 Feb 2025 20:16:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso3976158a12.3;
        Fri, 28 Feb 2025 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773796; x=1741378596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2oeCJos5+VWLjM6O6Ww7CfUdtvRNnO3dpetsG6O99c=;
        b=FVt3B7lm3V9J93Tas0COhFcluqYEns3vYx1QVMJqTh+Dxx8UoeL+FOklxgNUViy6sz
         aaccdT2V7wmHhyQZJRmgr0itJyaMkbkv0ahQwhhmqdTTZpEkrNv39QRZq4W8iKweqi8Y
         MwdhpttJHy4i88tMOBjq9N0nJ0AJSeBfCnMyojb6LdNAxxm+5aFUTuOLk/t8i0vmeV3S
         dy/72pxEF+N0prr2eMT0qSvv11JGPLt57+5qZ699UBpicnilq3zytaDtWCSPNqjyi291
         1YgjGyPFHrnvA7WP2DBFpR97lVEATSkaCMRohTGYaa287mSg9l8ZZ0m+WRJ841hSjDoh
         f0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773796; x=1741378596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2oeCJos5+VWLjM6O6Ww7CfUdtvRNnO3dpetsG6O99c=;
        b=mskGfATQD+/z0BMuGkbX4Vx2p//ALC/Lo+GvgdMVLUELBySZht4A1TjGCa74XtU6Qp
         L29AkYV/mFoL8iunDqKyjDBLMbME7IUmr8sxGgDKAeevi1jrtqYdatIhiUu8mXwldPYW
         Ou/CHcj4kE9Dp0tNcDj5tVsk4jyWjw+WHbTKcACecJx2W8Nm/jlnCS8GANwq953gI7PE
         bxHYb2vyd3bXV3Ne5T10Ev/F4VUczN+BzYEjYqynhv/ThPX804ZhGsZxx+cBvsCJnftr
         m2WURsPBdGEXnvcO5nnxiZbSgyOmGyJq+fsA7yEYx1hBWhcthbSCwA5t2gGKay8wijVf
         Tnfw==
X-Forwarded-Encrypted: i=1; AJvYcCVG/jb7owmGQ/HxZkYi/WRiR9x01NeK1xEJJFevGrV3qNnzfKgUfrc2N7zlQ+K9/UOWV/pksPBLleq38zD89yk=@lists.infradead.org, AJvYcCWruoJML8Gx54a4Tr7hbG1bPLFGmPOGdTHHPWoG/RzTeLRI7nKrLfPt7kw30nbdvssqCneuBiD+kvofnr/YJ6Gb@lists.infradead.org
X-Gm-Message-State: AOJu0YyN40ymqApBn2VDhHGfl9416XD/soxAze/lFhlZ4m/h8ibhBTHN
	MpDf6qcbXwKMPiq59gV4Xrsrn395Qs/B0OjpfCniwqwzEWtj9SyU
X-Gm-Gg: ASbGncsy4vUsDnaIwLrjBSJBh9myumn5oR6rHG+luEKkQP/MBe1YeipPZT2JGdZ0grE
	Uf6aWfaDvKAhGZXLD+rlZ0R2JHOGMKMtV55gSV31L3H6S55WVC/L33kKIyOldserGHh7K5mEuOg
	JUZ6CDRu+eVq3zAkVAKBDiXxYEdS4rdCCxTxBkOJkM0RMpBiIisPynaGeX3uNhHHV4cfxDMuovu
	spMz0PPGvs5J+wSm/cSm7SDFXhVaeFIqbcHnBFv25JKTWECmjhBHYkX/3szHoWD8Da25H85KTv+
	4X3V+ami39D3m0Gi2RiRz/IhaDcvVu2Y/aJCBGQ1A1EgkPF/q9+DQrj3VPBafBa6x/oi+gjiGzN
	CiT4f/4Q2xcZu9ScwLnBMpqbhvobGY5dnzZ9jCtbBdZ0=
X-Google-Smtp-Source: AGHT+IGRd37BcugXvRzWetE0RiFp1sspn48cYfwa0XVMvCj+hDeBReablJgdaX0T/5erZICf63Pa2A==
X-Received: by 2002:a17:907:7f91:b0:ab7:c358:2fec with SMTP id a640c23a62f3a-abf25da05d8mr559746666b.5.1740773795955;
        Fri, 28 Feb 2025 12:16:35 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:35 -0800 (PST)
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
Subject: [PATCH v8 net-next 14/15] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Fri, 28 Feb 2025 21:15:32 +0100
Message-ID: <20250228201533.23836-15-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121637_529273_8E38D452 
X-CRM114-Status: GOOD (  15.37  )
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

This patch introduces DEV_PATH_BR_VLAN_KEEP_HW. It is needed in the
bridge fastpath for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.

It is similar to DEV_PATH_BR_VLAN_TAG, with the correcponding bit in
ingress_vlans set.

In the forward fastpath it is not needed.

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h        |  1 +
 net/bridge/br_device.c           |  4 ++++
 net/bridge/br_vlan.c             | 18 +++++++++++-------
 net/netfilter/nft_flow_offload.c |  3 +++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2ee53478d9f0..17d82e4632dd 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -887,6 +887,7 @@ struct net_device_path {
 				DEV_PATH_BR_VLAN_TAG,
 				DEV_PATH_BR_VLAN_UNTAG,
 				DEV_PATH_BR_VLAN_UNTAG_HW,
+				DEV_PATH_BR_VLAN_KEEP_HW,
 			}		vlan_mode;
 			u16		vlan_id;
 			__be16		vlan_proto;
diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index c7646afc8b96..112fd8556217 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -430,6 +430,10 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 	case DEV_PATH_BR_VLAN_UNTAG:
 		ctx->num_vlans--;
 		break;
+	case DEV_PATH_BR_VLAN_KEEP_HW:
+		if (!src)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+		break;
 	case DEV_PATH_BR_VLAN_KEEP:
 		break;
 	}
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index aea94d401a30..114d47d5f90f 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1494,13 +1494,17 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 	if (!(v->flags & BRIDGE_VLAN_INFO_UNTAGGED))
 		return 0;
 
-	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
-	else
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
-
+	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG) {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+	} else {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
+	}
 	return 0;
 }
 
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index c95fad495460..c0c310c569cd 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -148,6 +148,9 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_UNTAG_HW:
 				info->ingress_vlans |= BIT(info->num_encaps - 1);
 				break;
+			case DEV_PATH_BR_VLAN_KEEP_HW:
+				info->ingress_vlans |= BIT(info->num_encaps);
+				fallthrough;
 			case DEV_PATH_BR_VLAN_TAG:
 				info->encap[info->num_encaps].id = path->bridge.vlan_id;
 				info->encap[info->num_encaps].proto = path->bridge.vlan_proto;
-- 
2.47.1


