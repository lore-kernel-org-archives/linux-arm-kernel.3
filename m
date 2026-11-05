Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4384F606D81A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=os0dNxEo;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=h1iYVdZ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IIrB2zW6G1njS+6WzfNMxOfb8hovKHeQTbSyLKp4WRA=; b=os0dNxEonh1yPM
	atPUaNW+6Rs3uFctppSQjVVWz3npAMkV5KDpHi9Siiymw7fMAMXc5BddJRv/Or3gen4GE5jitbJnw
	N+h7/RcpsQwk8t3lIu00Iba9pGYKD71W766jJXtUy43YYxAuAHUBy3XBUJZN7D+dLrDZ33dd10Kge
	buV4YIai+4uCnz2T10J8eowxK0zK7xqRZ0hQKHHc8fUvaGH+DzVONrqjJK2MSmCe2aAT9FkQ/kjcM
	QH10wbRlmrW1EZMI0xeraHpD8kFiSqd09mCTrX123ladCQNRSyp0kHRaIvPY68QiX5FtIuCiKdTdU
	1AUAzyi01lw3knFCIowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxy2-00000009Bt0-2v9v;
	Thu, 05 Nov 2026 13:57:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxv-00000009Bbx-1aoZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793887039; x=1825423039;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=mI9QbFDlAEa0T5BzOWSl+KeLHZ2MeGMOTuYCkJS+JgE=;
  b=h1iYVdZ+tUSXdmFAU2FcI4mCfj94ehqBMG9SMvisxCe9s092kYty69Ti
   fKMNhVNp4zXilxAI9nFilL+mBWfn+itSYNLtuzzOsemf9ZOibOJIHMRPk
   kSuzbg/vzaLWR56r/b7jWvAdt/Wxb3jT5w4iW3UcE92mCJaKLI7/vK1m/
   zuYIQ4D+JpofqMVhax6goZfNu5lEu2mYK3yp7hV51wbfLFK0vDTJLOzoF
   i2q6AmbqXapiAXIai14hF2FpOlhHo2vJIa9rkoEhbAIKBbXG+q8yZg/3s
   HfdVZz6b0ihAN8fbQGDONeQOWd7WlbPVtu9mYRmPdkGTSo0D4RhvR9XaZ
   A==;
X-CSE-ConnectionGUID: 6vgoOKrAT8KnnDdryEZG+w==
X-CSE-MsgGUID: dGPvfDdzQWqWeV7FCED47g==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="297500454"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:57:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 06:57:18 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:57:15 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Nov 2026 14:56:42 +0100
Subject: [PATCH net-next 7/9] net: sparx5/lan969x: scale the queue
 watermarks with the MTU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-sparx5-mtu-change-v1-7-f27bab580463@microchip.com>
References: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
In-Reply-To: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055719_458210_4F9C3D14 
X-CRM114-Status: GOOD (  20.63  )
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

The queue system of a port has pause watermarks (PAUSE_START and
PAUSE_STOP), which control when pause frames are sent if TX pause is
enabled, and a tail drop watermark (ATOP), above which frames received
on the port are dropped. They are set in units of buffer cells, and are
currently fixed multiples of a 1518 byte frame. With a larger MTU, a
single frame can exceed PAUSE_START, so with TX pause enabled, a pause
frame would be sent for every received frame.

Instead, compute the watermarks from the MTU of the port, plus the
Ethernet header, FCS and two VLAN tags, rounded up to whole buffer
cells. Program them at port init and when pause is resolved, and add
sparx5_port_wm_update() for use when the MTU changes. As the MTU and
phylink paths can run concurrently, protect the watermarks and the
resolved pause mode with a per-port lock.

The top bit of the watermark fields is a x16 multiplier, so take its
position from the field width, which is 11 bits on lan969x and 12 bits
on Sparx5.

With the default MTU of 1500, the watermarks grow from 8 to 9 cells per
frame, as the frame length is now rounded up instead of down.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  1 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  2 +
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 73 ++++++++++++++--------
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |  1 +
 4 files changed, 51 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index cf9cdd494674f..8161685c652b5 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -340,6 +340,7 @@ static int sparx5_create_port(struct sparx5 *sparx5,
 	spx5_port->phylink_pcs.ops = &sparx5_phylink_pcs_ops;
 	spx5_port->is_mrouter = false;
 	INIT_LIST_HEAD(&spx5_port->tc_templates);
+	mutex_init(&spx5_port->wm_lock);
 	sparx5->ports[config->portno] = spx5_port;
 
 	err = sparx5_port_init(sparx5, spx5_port, &config->conf);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 7bf5bdbc2ee1b..ac3aa798ae303 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -214,6 +214,8 @@ struct sparx5_port {
 	struct device_node *of_node;
 	struct phy *serdes;
 	struct sparx5_port_config conf;
+	struct mutex wm_lock; /* Protects the QSYS watermarks and wm_pause */
+	u8 wm_pause;
 	struct phylink_config phylink_config;
 	struct phylink *phylink;
 	struct phylink_pcs phylink_pcs;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 701d310df0ba6..87aa0b7841359 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -373,11 +373,14 @@ static int sparx5_port_disable(struct sparx5 *sparx5, struct sparx5_port *port,
 		 sparx5,
 		 HSCH_PORT_MODE(port->portno));
 
-	/* 5: Disable Flowcontrol */
+	/* 5: Disable Flowcontrol, and keep an MTU change from re-enabling it */
+	mutex_lock(&port->wm_lock);
+	port->wm_pause = 0;
 	spx5_rmw(QSYS_PAUSE_CFG_PAUSE_STOP_SET(0xFFF - 1),
 		 QSYS_PAUSE_CFG_PAUSE_STOP,
 		 sparx5,
 		 QSYS_PAUSE_CFG(port->portno));
+	mutex_unlock(&port->wm_lock);
 
 	spd_prm = spd == SPEED_10 ? 1000 : spd == SPEED_100 ? 100 : 10;
 	/* 6: Wait while the last frame is exiting the queues */
@@ -676,24 +679,53 @@ int sparx5_port_fwd_urg(struct sparx5 *sparx5, u32 speed)
 	return urg / clk_period_ps - 1;
 }
 
+/* The top bit of the watermark field is a x16 multiplier */
 static u16 sparx5_wm_enc(u16 value)
 {
-	if (value >= 2048)
-		return 2048 + value / 16;
+	u16 mult = BIT(regs->fsize[FW_QSYS_ATOP_ATOP] - 1);
+
+	if (value >= mult)
+		return mult + value / 16;
 
 	return value;
 }
 
+/* Pause start/stop and tail drop at 6/4/20 frames of the port MTU */
+static void sparx5_port_wm_set(struct sparx5 *sparx5, struct sparx5_port *port,
+			       u8 pause)
+{
+	u32 len = SPX5_HW_MTU(READ_ONCE(port->ndev->mtu)) + 2 * VLAN_HLEN;
+	u32 cells = DIV_ROUND_UP(len, SPX5_BUFFER_CELL_SZ);
+	u32 pause_stop = 0xFFF - 1; /* FC gen disabled */
+
+	if (pause & MLO_PAUSE_TX)
+		pause_stop = sparx5_wm_enc(4 * cells);
+
+	spx5_rmw(QSYS_PAUSE_CFG_PAUSE_START_SET(sparx5_wm_enc(6 * cells)) |
+		 QSYS_PAUSE_CFG_PAUSE_STOP_SET(pause_stop),
+		 QSYS_PAUSE_CFG_PAUSE_START |
+		 QSYS_PAUSE_CFG_PAUSE_STOP,
+		 sparx5,
+		 QSYS_PAUSE_CFG(port->portno));
+
+	/* Port ATOP. Frames are tail dropped when this WM is hit */
+	spx5_wr(QSYS_ATOP_ATOP_SET(sparx5_wm_enc(20 * cells)),
+		sparx5,
+		QSYS_ATOP(port->portno));
+}
+
+void sparx5_port_wm_update(struct sparx5 *sparx5, struct sparx5_port *port)
+{
+	mutex_lock(&port->wm_lock);
+	sparx5_port_wm_set(sparx5, port, port->wm_pause);
+	mutex_unlock(&port->wm_lock);
+}
+
 static int sparx5_port_fc_setup(struct sparx5 *sparx5,
 				struct sparx5_port *port,
 				struct sparx5_port_config *conf)
 {
 	bool fc_obey = conf->pause & MLO_PAUSE_RX ? 1 : 0;
-	u32 pause_stop = 0xFFF - 1; /* FC gen disabled */
-
-	if (conf->pause & MLO_PAUSE_TX)
-		pause_stop = sparx5_wm_enc(4  * (ETH_MAXLEN /
-						 SPX5_BUFFER_CELL_SZ));
 
 	/* Set HDX flowcontrol */
 	spx5_rmw(DSM_MAC_CFG_HDX_BACKPREASSURE_SET(conf->duplex == DUPLEX_HALF),
@@ -714,10 +746,10 @@ static int sparx5_port_fc_setup(struct sparx5 *sparx5,
 		 QSYS_FWD_PRESSURE(port->portno));
 
 	/* Generate pause frames */
-	spx5_rmw(QSYS_PAUSE_CFG_PAUSE_STOP_SET(pause_stop),
-		 QSYS_PAUSE_CFG_PAUSE_STOP,
-		 sparx5,
-		 QSYS_PAUSE_CFG(port->portno));
+	mutex_lock(&port->wm_lock);
+	port->wm_pause = conf->pause;
+	sparx5_port_wm_set(sparx5, port, conf->pause);
+	mutex_unlock(&port->wm_lock);
 
 	return 0;
 }
@@ -1101,15 +1133,12 @@ int sparx5_port_init(struct sparx5 *sparx5,
 		     struct sparx5_port *port,
 		     struct sparx5_port_config *conf)
 {
-	u32 pause_start = sparx5_wm_enc(6  * (ETH_MAXLEN / SPX5_BUFFER_CELL_SZ));
-	u32 atop = sparx5_wm_enc(20 * (ETH_MAXLEN / SPX5_BUFFER_CELL_SZ));
 	const struct sparx5_ops *ops = sparx5->data->ops;
 	u32 pix = sparx5_port_dev_index(sparx5, port->portno);
 	u32 pcs = sparx5_to_pcs_dev(sparx5, port->portno);
 	bool sd_pol = port->signd_active_high;
 	bool sd_sel = !port->signd_internal;
 	bool sd_ena = port->signd_enable;
-	u32 pause_stop = 0xFFF - 1; /* FC generate disabled */
 	void __iomem *pcsinst;
 	int err;
 
@@ -1120,21 +1149,13 @@ int sparx5_port_init(struct sparx5 *sparx5,
 	if (err)
 		return err;
 
-	/* Set Pause WM hysteresis */
-	spx5_rmw(QSYS_PAUSE_CFG_PAUSE_START_SET(pause_start) |
-		 QSYS_PAUSE_CFG_PAUSE_STOP_SET(pause_stop) |
-		 QSYS_PAUSE_CFG_PAUSE_ENA_SET(1),
-		 QSYS_PAUSE_CFG_PAUSE_START |
-		 QSYS_PAUSE_CFG_PAUSE_STOP |
+	/* Set Pause WM hysteresis and ATOP, FC generate disabled */
+	sparx5_port_wm_set(sparx5, port, 0);
+	spx5_rmw(QSYS_PAUSE_CFG_PAUSE_ENA_SET(1),
 		 QSYS_PAUSE_CFG_PAUSE_ENA,
 		 sparx5,
 		 QSYS_PAUSE_CFG(port->portno));
 
-	/* Port ATOP. Frames are tail dropped when this WM is hit */
-	spx5_wr(QSYS_ATOP_ATOP_SET(atop),
-		sparx5,
-		QSYS_ATOP(port->portno));
-
 	/* Discard pause frame 01-80-C2-00-00-01 */
 	spx5_wr(PAUSE_DISCARD, sparx5, ANA_CL_CAPTURE_BPDU_CFG(port->portno));
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
index 912f97a506768..06d2becfd9aac 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
@@ -91,6 +91,7 @@ int sparx5_port_init(struct sparx5 *sparx5,
 void sparx5_port_max_len_set(struct sparx5 *sparx5,
 			     struct sparx5_port *port,
 			     u32 len);
+void sparx5_port_wm_update(struct sparx5 *sparx5, struct sparx5_port *port);
 
 int sparx5_port_config(struct sparx5 *sparx5,
 		       struct sparx5_port *spx5_port,

-- 
2.34.1


