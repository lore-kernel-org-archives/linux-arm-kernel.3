Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//RthvClo4JzPeEnG1PywSOoZnVfBt6m8pYgKggGTpU=; b=4MFLycFJQ20oVQ0/4AmXmSVUvZ
	6caExmcQRVbGQ5iWTjLigU9FiqUbJHVvbAVZNrrn5Osi3j7TP37S7rzpISaa1wAvRGI8jS0FMRPgZ
	So1GPk6ECFEwDqoOs+7PdPfCW9kWombeBbz5vTf5Q1nJU6ncJomvSN0w2fup5V6//9kYGZKY6w12A
	UB4JHIdfchmDDykWrgY934OALTNNclMYVG/PwLt/J4oBg8Z2KhLxSlVGV7hKwWHDV6HdWdBHcLgmn
	SYn1gkIQzVxpI/qAfDsj8hwFrsZwZ6vlaU7B5cS57eYCPn5qKEJA3hq3jclaLzBfhMRZrgdG4Vohx
	cAg35VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPH6-00000001Uzn-4765;
	Tue, 04 Feb 2025 20:12:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvy-00000001QOx-2Jvu;
	Tue, 04 Feb 2025 19:50:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so248541866b.3;
        Tue, 04 Feb 2025 11:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698609; x=1739303409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//RthvClo4JzPeEnG1PywSOoZnVfBt6m8pYgKggGTpU=;
        b=j9VFE5eAW8wrJhE/sAUOmqDC7UcsuBMlgtzDh6cjtsVIYBhugxIF/+1v7jv/RZjwOf
         i7ll4DgZaPgmVHYW95g8DHrx8bCdYdyv+XpC5NyYz+MvteCX29LW0xE97OgRB+Ew+8xu
         Qr0smIECokheXjQ+EkU4bGedZW3ITP3siYy03g8tvYFgOURGNhQJYxCoxiw7Ugs9mH/a
         wFaNmMVQSWpyR8xoEPv87AQl4Ar95+MdrFFKYgT/ywnVhowHLPMKtUlAGMZRquU67t6j
         GpzAembJS/0G5Uh4l6fSF7QRRR4kYd5rAhHDJo6mh7e3flm9v3572HFtcpRkFHKkzUwl
         MQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698609; x=1739303409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//RthvClo4JzPeEnG1PywSOoZnVfBt6m8pYgKggGTpU=;
        b=DfSkkxbHzgWelRB6HIYe1R4VvaRmPA5W26sMwBoEKa97MXxYw5hvzKhClLE8ctCZmY
         JXK4uK9v1KNToJnpegBonOn/6dFyq4jAjl3M6S/C/YthHyNBBiQY8qgmrLmb2mgEUxgl
         0pXoNVMFIGMXvCixg6mFFphf/Q+GovJWFIoDGL9OEt1qGRR6rGEZs290BzErDpQLaOop
         SdPb6UO2yUeFtlTpznevg1ph3AtMnZjYjegAn1kqwe4qV31A1a7CxjrE+O58U50LCa17
         vjplCxyLKgTfhqbdSPXZXfK9JdOWlbxwk73K/NYe9fsbdaN0UptbzXiuSZBJyVXhxtbR
         H6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs1a5kxIsWUitog9yzCD21u2/ulA0De/+58G6pK5loo8Njr/W5FfQHwGd7d4/2B4GvVzreJviFWWpXkBIQ2MX9@lists.infradead.org, AJvYcCV4PQh3x5jePocaxBlhZ3SRiwjzb8eCpLUgo9zkNsKTKJKVPN0HFr0D1Cjy9Cf6BwQu46zhbLS919deFt5NPLs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyabySTvErSOf9LZhW5IpOewrD3frqh2zNmG9DbXgCcnL/rh+50
	AD8T2QqtCJ+23YFeTfBr+k8pPSm10AW+kHzcYa/3FF9p2gCd2c0e
X-Gm-Gg: ASbGncspdDuSHfR7nPeJmgPHLTpCqoAm5dL4JBX9tRdSFASBn1fuvKiSb4ZVzaGLRY5
	ZqUkVdtkmPSXd3vbh6SZb/FxtuiM5SXLBnNgsooWK0Esa3tCZh0vP3NbaxX4t4oB4gA2k/xRfUk
	u/yERpqC5wzrTKAQjYeg2zBZ8V1pxq4SgwFQeodHyM/llgt3ReaKlVcQu+OL/Tovy4uMKK7c0si
	X0qDecuwh6S5SMOxAoSZbZmgre6vGKtZ7S9OGR0X6N41nnaIt5CoCTj7swDte0dXPzaYhBh56gW
	dCQGU78XwudT6UGECcFk8tYptRhTC8+iK0vKxHEQn2+qWlL8Uvs/KtJmr0TWpUC7rPj6bY6X0N3
	xLO8dRxtmjxGeP/fKZmppY2XjQbvc7y88
X-Google-Smtp-Source: AGHT+IGt/6VgWu/uR4UpsMkru0toFiQ+1d3xhaiHmAvPsdOeeBceqic1mQLjOAWdzpkUw3jzvfdFrQ==
X-Received: by 2002:a17:907:9714:b0:ab6:621e:7587 with SMTP id a640c23a62f3a-ab6cfcb3a0amr3155424666b.4.1738698608664;
        Tue, 04 Feb 2025 11:50:08 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:50:08 -0800 (PST)
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
Subject: [PATCH v5 net-next 13/14] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Tue,  4 Feb 2025 20:49:20 +0100
Message-ID: <20250204194921.46692-14-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115010_645210_39DD92B8 
X-CRM114-Status: GOOD (  15.41  )
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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h        |  1 +
 net/bridge/br_device.c           |  4 ++++
 net/bridge/br_vlan.c             | 18 +++++++++++-------
 net/netfilter/nft_flow_offload.c |  3 +++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 872235e30629..5a7b0843dfad 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -868,6 +868,7 @@ struct net_device_path {
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
index 3e50adaf8e1b..8ac1a7a22b2e 100644
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


