Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78804606D24E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Arawabzu;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=RW0dmxKZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=azaQOzlj0RhM8KeJcyS6f9kkUk/eS0E3MUqrAk4Osro=; b=ArawabzuHlAKVs
	B9j+tBFvrWJR41nW6bZmxmy7EI0aGbfTd/y+UyaTdVrQNyBLhXlNftk+9BE5uo8oKj9mefq8E63rw
	I6OkC9Vmdbfxu6rehcv+49WT5T0FRF1X+z6i+Ia85l4dZGmip0GdJlpQZ3wnEkaQjdC09UqEXob0c
	EpuiL2b0mlg/WoOe3wiI88g+d27sKtEUKVT7L3SDLfrNb371930Z1fuwZUTQ8h2pa8ibqGeBDHlRF
	83QGJiisWYeemnFejD6KtvbYhkW7W5CvcOTPdvjRQh7/x/NWhQZwmTRWDYkFY04iFGiGKxIFbpJTs
	AqXGNWWNtwAMm9IOYU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2m-0000000GSZC-0S1w;
	Mon, 02 Nov 2026 12:21:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2g-0000000GSPi-3sW7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793622098; x=1825158098;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=/dxp1HNr4bOfre6BcTJskH3EOXgB0EOGaJbHHFAEC+Y=;
  b=RW0dmxKZTfHBCFQsHPWV+ESyTxCbtTxJ0t6riXa5vGLsIfuuHRHY6yWd
   24P80iRJOdrrnaof6fClhQuwyjvi/guE2cNRSuzvVzmgT6s2kIE0ninVr
   3JSmRd6/Vmhmi2kmsdFl8uq8AoijJsV8sA590Gnxw1w0XJ7MfFCEoiE16
   Z9HtApUiCSpzSPHuZrGnyCK8MAKzmAHnCn2j5GYvqmxiGIX1YH2XOpNF1
   nsdz7qtXptY8BfBaJT3sRSunwCJrp7EfcD16NslSBzVNvqBDafMF5KM+3
   NguSktnPcRlv+fSQnM7UUEGrDqLLP05bdyJULCBjvW4jwyWAbpNlROERm
   A==;
X-CSE-ConnectionGUID: g05f8bhRQVqXZs8wI2QhfA==
X-CSE-MsgGUID: kKn4VaGiQTGDVVPwOzQ2+A==
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="232950953"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:21:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 2 Nov 2026 05:21:38 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Nov 2026 05:21:36 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 2 Nov 2026 13:21:26 +0100
Subject: [PATCH net-next v2 3/5] net: sparx5: Track shared tc blocks and
 per-port policer state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-3-3bd47ec1b227@microchip.com>
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
X-CRM114-CacheID: sfid-20261102_042139_009871_F1AE3562 
X-CRM114-Status: GOOD (  16.86  )
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

A police action on a shared tc block applies one aggregate rate to all
ports bound to the block, which a per-port policer cannot implement.
The port policer offload therefore needs to know whether the ingress
block of a port is shared.

Add struct sparx5_port_tc to each port, holding a flag that records
whether the ingress block is shared, and the state of the four policers
of the port.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h | 16 ++++++++++++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_tc.c   | 14 ++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 8dc3a500c1c91..19217d443cc74 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -207,6 +207,21 @@ struct sparx5_port_config {
 	u32 sd_sgpio;
 };
 
+#define SPX5_POLICERS_PER_PORT 4 /* Number of ingress port policers */
+
+struct sparx5_port_policer {
+	struct flow_stats prev;
+	struct flow_stats stats;
+	/* Port policers hold the client reference (cookie) */
+	unsigned long policer;
+};
+
+struct sparx5_port_tc {
+	/* Ingress uses a shared filter block */
+	bool ingress_block_shared;
+	struct sparx5_port_policer port_policer[SPX5_POLICERS_PER_PORT];
+};
+
 struct sparx5_port {
 	struct net_device *ndev;
 	struct sparx5 *sparx5;
@@ -230,6 +245,7 @@ struct sparx5_port {
 	enum sparx5_vlan_port_type vlan_type;
 	u32 custom_etype;
 	bool vlan_aware;
+	struct sparx5_port_tc tc;
 	struct hrtimer inj_timer;
 	/* ptp */
 	u8 ptp_cmd;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c
index 30da5db57ef35..fd5a75aa09603 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc.c
@@ -47,7 +47,9 @@ static int sparx5_tc_block_cb_egress(enum tc_setup_type type,
 static int sparx5_tc_setup_block(struct net_device *ndev,
 				 struct flow_block_offload *fbo)
 {
+	struct sparx5_port *port = netdev_priv(ndev);
 	flow_setup_cb_t *cb;
+	int err;
 
 	if (fbo->binder_type == FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
 		cb = sparx5_tc_block_cb_ingress;
@@ -56,8 +58,16 @@ static int sparx5_tc_setup_block(struct net_device *ndev,
 	else
 		return -EOPNOTSUPP;
 
-	return flow_block_cb_setup_simple(fbo, &sparx5_block_cb_list,
-					  cb, ndev, ndev, false);
+	err = flow_block_cb_setup_simple(fbo, &sparx5_block_cb_list,
+					 cb, ndev, ndev, false);
+	if (err)
+		return err;
+
+	if (fbo->binder_type == FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
+		port->tc.ingress_block_shared =
+			fbo->command == FLOW_BLOCK_BIND && fbo->block_shared;
+
+	return 0;
 }
 
 static void sparx5_tc_get_layer_and_idx(struct sparx5 *sparx5, u32 parent,

-- 
2.34.1


