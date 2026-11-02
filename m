Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50931606D270
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l0dFxmCn;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=uKtgmZVe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J0rANoRyuKSy0ZjIVrTiCMH86C3H43yiAnxVDLnS47Q=; b=l0dFxmCn3LssV2
	cSIz4l1SupdkdEhgZDweUb9dIJN79f0VfPGvJmTAaAod4Wr0lqz/6IwpE+SifL+A46ZSoSymgOwSi
	hJLgZIGxKwU4wZ96DcvdOX1gWMAiZ9H/USRsYBnQX2l/bxAbe4hZl2azHNaZQHIIgM+VP5r1xn6Tw
	corYr8PQhMuN7GlwGWPbLQcukfoqBoeQdGBRURLpCnhvco8M5KBdnzG3cnkDwykyMUrmbka5Z3n/g
	LfkgTvDrEEXCkXiQVa5lBzujkZWba8catpAuZF5AQC54f51iAW5NQ8uvNF32sSnY6V++aoZvklnno
	Jk1sa4tFEdY4le54bsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2q-0000000GSf9-2CRq;
	Mon, 02 Nov 2026 12:21:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2l-0000000GSPi-2SWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793622103; x=1825158103;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=DzR/WcG18Lzs3fVFkqOEe50jzYkekyiez1z5HnVwevY=;
  b=uKtgmZVe9FtkDN2LxA3xgdEH2hK+ZRUihJJoGqKuQcrLvwdgvNrcepEc
   sDD+LH2R4PGJjaq+JjxCAG5jMGHdvtXAu996WDoKg3oW6hopzLByHutHB
   Myvs3u5lZC4ng02/Qe4MfeTDLB6KHE+aW5V3Up5f5fJaPZ9Na6mPmIOeI
   b4JC7a25PpOCUIZRYILb+HmKazzlt/gtoryABK0eBQDHObvcBOZlSXY0l
   ZdZflxGlP2Ur12voqW7NTn9tTIfVNolhVg/R0fnGNtt4jBnGnGpwcqZld
   bWQP42gk1/1PMnA4ooOlGFIa5tYQn8+7ycLs+5FZrlDYVe9VkF5EAts7y
   g==;
X-CSE-ConnectionGUID: E8AEfcniTAmGfcC9z3xeZw==
X-CSE-MsgGUID: qY1peQcPRt2HUtMCUEvYSA==
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="232950957"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:21:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 2 Nov 2026 05:21:42 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Nov 2026 05:21:40 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 2 Nov 2026 13:21:28 +0100
Subject: [PATCH net-next v2 5/5] net: sparx5: Offload tc port policers via
 matchall
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-5-3bd47ec1b227@microchip.com>
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
In-Reply-To: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_042143_687421_6516AB5A 
X-CRM114-Status: GOOD (  19.22  )
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


