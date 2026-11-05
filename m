Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A9E606D81B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdeY/QLN;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=H/gUkPrs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J0rANoRyuKSy0ZjIVrTiCMH86C3H43yiAnxVDLnS47Q=; b=JdeY/QLN0VFoYy
	pZfWDo2e1j9rYDcOsKR0qZNa+JWD4Q2FYgv4v1XJ1DzxH+df5QKgPvpJNwuhfbChLrLzrSxpl7jmP
	HpLYqsBVdJrEVkx4ioAhl2pK6IBC0dQhAmnoZ8Oo6MBlk8ncb8MxfEuuWxHphyjoBVwiIKtLFlZPt
	usnccE/FH7TDLj4bMZImuqKRkNpoKyD0Ulp7q0FZxPhUJlr6JU6FWtEm2QUMaoNPfrsVMkWAh6tOs
	VW3q4Vz5tp/bfT9fPlFLCJMqHSwAP90KO+BItX9Cu7hEn8GJcBdsR1GlZvSGZtgXzj1MMxxbFxaR8
	YawlWjVU9Jo+aBXW5m1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxNq-0000000963Q-06dW;
	Thu, 05 Nov 2026 13:20:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxNn-0000000961P-45e5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793884799; x=1825420799;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=DzR/WcG18Lzs3fVFkqOEe50jzYkekyiez1z5HnVwevY=;
  b=H/gUkPrsR+LtGLxYj1NEj43tQDxAIuyPQIu7u3sZnOrKPQLNR5kTOHaN
   VLSD5G63YUwh/4MAGHbzmj7EUtRC2hdGlVbljmHHX6vY2eULiJMwRA4uc
   zSrr/B/oJcOZB2e5jm44WzmBOZ0006TgvM33SVcLEG26x5XoRKfYwXcle
   OdnzQ+fRjs2IhRCxaoyWWK1kLs06OnCp5AfaRwJxeWBW5ivFcdkcKvcSi
   m3mZE5Ribd+UIJ0dO2nhKdZObJRe9bbmzeQ3IxPVdrNwCBLXWUv94XrCq
   SlZiZShb0U3NDrZ9CyXCIdtGY7Q3Ipy/6/9JRKLMheDVwPvnjIRAwOVCA
   Q==;
X-CSE-ConnectionGUID: 5rQMe2bRRwK7SQqSGDXjDg==
X-CSE-MsgGUID: H+FDRaKVRRe26M/XP2jYGw==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="66319303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:19:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 06:19:58 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:19:56 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Nov 2026 14:19:39 +0100
Subject: [PATCH net-next v3 5/5] net: sparx5: Offload tc port policers via
 matchall
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-5-b45a3a26bed5@microchip.com>
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_052000_096537_C067A9F4 
X-CRM114-Status: GOOD (  18.36  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Offload a tc matchall filter with a police action to the port policer:

  tc qdisc add dev <eth> clsact
  tc filter add dev <eth> ingress matchall skip_sw \
      action police rate <bps> burst <bytes> conform-exceed drop

The port policer meters all ingress frames on the port, so offload the
filter only on ingress, on chain 0, with protocol all, and on a block
that is not shared. Only drop is supported as the exceed action, and
only one policer per port. A police action shared between ports is a
single bucket in software, which the per-port policers cannot express,
so reject a police action that is already offloaded as a port policer on
another port. Report the pass and drop counts through the matchall
stats.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  3 ++
 .../net/ethernet/microchip/sparx5/sparx5_police.c  | 27 +++++++++++++++
 .../ethernet/microchip/sparx5/sparx5_tc_matchall.c | 39 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 93df90a62a9c8..ad29db91ce91e 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -218,6 +218,8 @@ struct sparx5_port_policer {
 	struct flow_stats prev;
 	/* Port policers hold the client reference (cookie) */
 	unsigned long policer;
+	/* tc police action, the same for every filter bound to it */
+	unsigned long act_cookie;
 };
 
 struct sparx5_port_tc {
@@ -304,6 +306,7 @@ struct sparx5_mall_mirror_entry {
 
 struct sparx5_mall_port_policer_entry {
 	struct flow_action_police police;
+	unsigned long act_cookie;
 };
 
 struct sparx5_mall_entry {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_police.c b/drivers/net/ethernet/microchip/sparx5/sparx5_police.c
index 0fb1003e1b189..a635b95a7bd73 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_police.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_police.c
@@ -301,6 +301,25 @@ int sparx5_update_port_policer_stats(struct net_device *ndev,
 	return 0;
 }
 
+static bool sparx5_port_policer_act_in_use(struct sparx5_port *port,
+					   unsigned long act_cookie)
+{
+	struct sparx5 *sparx5 = port->sparx5;
+	struct sparx5_port *other;
+	int i;
+
+	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
+		other = sparx5->ports[i];
+		if (!other || other == port)
+			continue;
+		if (other->tc.port_policer[0].policer &&
+		    other->tc.port_policer[0].act_cookie == act_cookie)
+			return true;
+	}
+
+	return false;
+}
+
 int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
 			    struct netlink_ext_ack *extack)
 {
@@ -322,6 +341,13 @@ int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
 		return -EOPNOTSUPP;
 	}
 
+	if (sparx5_port_policer_act_in_use(port,
+					   entry->port_policer.act_cookie)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Police action shared between ports is not supported");
+		return -EOPNOTSUPP;
+	}
+
 	if (police->exceed.act_id != FLOW_ACTION_DROP) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Policer parameters are not supported");
@@ -388,6 +414,7 @@ int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
 		return err;
 
 	port->tc.port_policer[idx].policer = entry->cookie;
+	port->tc.port_policer[idx].act_cookie = entry->port_policer.act_cookie;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
index 146d7f28e8f3d..4961b49fe1831 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
@@ -43,6 +43,14 @@ sparx5_tc_matchall_parse_mirror_action(struct sparx5_mall_entry *entry,
 	entry->mirror.port = netdev_priv(action->dev);
 }
 
+static void
+sparx5_tc_matchall_parse_port_policer_action(struct sparx5_mall_entry *entry,
+					     struct flow_action_entry *action)
+{
+	entry->port_policer.police = action->police;
+	entry->port_policer.act_cookie = action->cookie;
+}
+
 static int sparx5_tc_matchall_replace(struct net_device *ndev,
 				      struct tc_cls_matchall_offload *tmo,
 				      bool ingress)
@@ -98,6 +106,30 @@ static int sparx5_tc_matchall_replace(struct net_device *ndev,
 		}
 		/* Get baseline stats for this port */
 		sparx5_mirror_stats(mall_entry, &tmo->stats);
+		break;
+	case FLOW_ACTION_POLICE:
+		if (tmo->common.protocol != htons(ETH_P_ALL)) {
+			NL_SET_ERR_MSG_MOD(tmo->common.extack,
+					   "Policer is only supported with protocol all");
+			kfree(mall_entry);
+			return -EOPNOTSUPP;
+		}
+
+		if (tmo->common.chain_index) {
+			NL_SET_ERR_MSG_MOD(tmo->common.extack,
+					   "Policer is only supported on chain 0");
+			kfree(mall_entry);
+			return -EOPNOTSUPP;
+		}
+
+		sparx5_tc_matchall_parse_port_policer_action(mall_entry,
+							     action);
+		err = sparx5_add_port_policer(mall_entry, tmo->common.extack);
+		if (err) {
+			kfree(mall_entry);
+			return err;
+		}
+
 		break;
 	case FLOW_ACTION_GOTO:
 		err = vcap_enable_lookups(sparx5->vcap_ctrl, ndev,
@@ -151,6 +183,11 @@ static int sparx5_tc_matchall_destroy(struct net_device *ndev,
 
 	if (entry->type == FLOW_ACTION_MIRRED) {
 		sparx5_mirror_del(entry);
+	} else if (entry->type == FLOW_ACTION_POLICE) {
+		err = sparx5_delete_port_policer(entry);
+		if (err)
+			NL_SET_ERR_MSG_MOD(tmo->common.extack,
+					   "Could not delete port policer");
 	} else if (entry->type == FLOW_ACTION_GOTO) {
 		err = vcap_enable_lookups(sparx5->vcap_ctrl, ndev,
 					  0, 0, tmo->cookie, false);
@@ -180,6 +217,8 @@ static int sparx5_tc_matchall_stats(struct net_device *ndev,
 
 	if (entry->type == FLOW_ACTION_MIRRED) {
 		sparx5_mirror_stats(entry, &tmo->stats);
+	} else if (entry->type == FLOW_ACTION_POLICE) {
+		sparx5_update_port_policer_stats(ndev, tmo);
 	} else {
 		NL_SET_ERR_MSG_MOD(tmo->common.extack, "Unsupported action");
 		return -EOPNOTSUPP;

-- 
2.34.1


