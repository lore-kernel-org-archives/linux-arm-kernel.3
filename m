Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E21C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21wGozzdg/kg90PQGRE5o7in49y5R5W2VgpxxyORYJo=; b=HAMTbvJr4Ep4Vu4GiliZu0k1+6
	MeDvvgOH6uulFLsum68xTmnO6FKdoGuRhpEiLBaFQQBIkn1agm7CN95942CSDbTati+QA0QMTnjHf
	xQo5a5FhBJ0rbEWl8N/PN6bYSdPlikucZJ4EoBsW+P4Zl3jupmW3FYlczcDyEbq3PhNOargso83k3
	v7k/Bu7WuuwtE8yWEk+huVBXOhOnu8f9qUgBSZoAYyNqTxcigOZGsLdYy4x3eSwwBb1cJxY/UXZtj
	ivZlDHioy+5POZlkkBVXecSDNJzcxpGydfYrNwbMPkrAno66EZIFnTb08la+ENLZJ+VxjG7MTAEEn
	2OdSaMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5VP-0000000Ek06-0HIU;
	Sun, 09 Feb 2025 11:29:43 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DO-0000000Egh8-3yYm;
	Sun, 09 Feb 2025 11:11:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7a4b40cc1so188369166b.0;
        Sun, 09 Feb 2025 03:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099465; x=1739704265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21wGozzdg/kg90PQGRE5o7in49y5R5W2VgpxxyORYJo=;
        b=YMentjWm+GqcYeBECQ39HTjaCod8Lc2ou7qsqWyjB9nnhiBjFoS1iXnpCbekT9fTp+
         JIyyht5YJs5iDWUvMoz7rlIWebZYjil7gLuVa8zrJ/kDXsxTlCkAWRx/IbYkPxSUAH/G
         d5d0u2e2rS7p5STlIgKx1V2rf9onMd4yED0Yq7S2MSF5ZKiKLJBTf8Ofl5Bpuzg3oCpG
         I0YNuhMViUGzMdVBNZGjgKVPMMF589Ms5kkHQkETr8sgZZH/xz7c4K/nLKkG2nmXz6nd
         SIJwfv4/S1VLdGwmFkrIZs1pp2iZxVJN0BOrNxaZGjzdMKk5Lx2ZeWxbwAuIuC0bMAMB
         s2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099465; x=1739704265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21wGozzdg/kg90PQGRE5o7in49y5R5W2VgpxxyORYJo=;
        b=gFYxL0ouADNqlQ/90DKPzS06hCM/ag4qTb/TRPUjxqC5lSCsfod8tVnWlP2882EqP6
         BkScjQPQPBBBgkza8fiXzRayfYi9SGT7/p1Aa5jMc8JXm8IwGm2eBz9nth8GG1/ycTQl
         lDK14x07rJVZ+G0pqDuMWJW5ppVAORVuNCgHSqWblhwBGWHyavTfCjtFW+rnN/ZgQ4jh
         RhL5754sxWp1MOtjvMCVOhVHpw+1vmccGqiwVn1GheTDWktqvO8manEJXE+f0IiGje9m
         CvjTr/L4nhLGZyHQvibEogBYnxgWap+gTfexPu89ZPJaw4PgkOdUgQQBrpufnvgYw7FT
         iRNw==
X-Forwarded-Encrypted: i=1; AJvYcCWc1wjhYdfKqQRs4edDkZh78Boegl+/dFFszeYYFTnjli7bFr7wPSd6Oqu50c4u6G5qsTsSN86wdgGq85Ivcalx@lists.infradead.org, AJvYcCXNKNu7deNT96L78NGSJ8PoIyYcoVOIQu9//AiR8DeZOJU400z3ECDj9WWcn623GqNjPiAHxhfRLl6iNIyUYm4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFZW7gTnV4M4q/iCOEZtUgLEWFEhtsDluhojzc3xPftQ1Fc+t/
	EgQOcRV3KelB+uhwvkweXCdtl2oLIclFF4N1BEE148I+TKM3zIKB
X-Gm-Gg: ASbGncvDybOXarmNhOe8xKOQtq9fhlxNH0E0cVYBdqQEcJ+4fK6TV/PWmteiTq8nZ3Q
	BeW3gLu3hvoiLB06AwDViyTlZSUAQifPMi+eAuk7+KqqrAkt8TAh6PV3oMGQPVJR/wCk6wqH10Z
	Tzx55I3Jc456a1W+l+uGSiCqIwKl5lBKLOPmAfcPx5Xmq/GogtmmYAo3vacLl7QZRVs12wimQNN
	cQz53L+2wIeZfjRqPPtHfEpNLNEf2m2tEK4d6kCGpC1kwZPrNLMQSztkGHSQAQ5/5xXByrzc1yY
	YfKRdWdKtoPP0ezSm1fG79R5gZakuqSif3/x0GbgU45mjPaf8TfnYGoLBHqFNvSt7iQZWePlu65
	88Y6dmkv2N+TCxDLxcCHnNXF1V7r0+CB3
X-Google-Smtp-Source: AGHT+IFCN56S7YNhxymBxkzw1XBWVzH4BKvgunr9+9DooHHAtJHeUPUaPpWkQeeGjmJ70qNtwfqBzw==
X-Received: by 2002:a17:907:60c9:b0:ab7:bf2f:422e with SMTP id a640c23a62f3a-ab7bf2f54cemr32650866b.27.1739099465160;
        Sun, 09 Feb 2025 03:11:05 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:11:04 -0800 (PST)
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
Subject: [PATCH v6 net-next 13/14] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Sun,  9 Feb 2025 12:10:33 +0100
Message-ID: <20250209111034.241571-14-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031106_994946_5C95B515 
X-CRM114-Status: GOOD (  15.36  )
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
index 9f925dc3d1d1..923dbfc589ba 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -869,6 +869,7 @@ struct net_device_path {
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


