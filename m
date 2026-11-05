Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27508606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ApVQyOcy;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=I5ADHfhH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AcWI6/QUJ/izaMsGkOQtXKKH0FK9RMGEfWHWslE7U6g=; b=ApVQyOcy0uf4QL
	a8eILf9zx0sWylmYHtvyW6FmQySS8sncm36FDvAPhMuHJHC2GvFrqru3ZCO6wdSH+cw+q+6rydU28
	5D4hY7ctppNBTqv6Fs8IK1PpQTwnMPlNJsO8rLhXGyX8+0wkn4U/NdgHTFJWz+SP6UG0lVwsjViM0
	Y2swIEcFV72DTspyKdHyJ4xWn4qHdMqnHBZPqQqjVC0lUEZA6zXG/zOuCrwkPn6S6RX/IuTOBX60w
	E1lfo71ayH+nLpiR0o2Aa5HgmnEKeb+BEer9kbZH41+i+GihhBlQAm+JbUQdMTBVKt6G1h6eDX9Gt
	HmY4F28SsSYBKInppr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxy5-00000009BwL-0yRR;
	Thu, 05 Nov 2026 13:57:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxy-00000009Bmj-0fYB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793887041; x=1825423041;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Hk3SFlgySyh0ow7MIUHehXb2cnHctrFyYDxRW2Tux+M=;
  b=I5ADHfhHUgAL78CgTMx74Q0ZPb4kUtAWjYVM8TUkcynicHnl4ZQqRlQw
   d/QTwBdx5NVFwsIxQmlkW5TaWINPYQR6kQ+wPGSgfYMwmmVh0GqIx06n1
   EiFvuQ6YEhleHSOsS/2+q4HPuohX/GlllgNkc0WNExTjEHzbT+CQo7g/V
   Wm+3newugo4h5NkyI65Wb+rdp3WNmOowxCfZhCwmMR6zqJT5icJ3yuPTT
   MK/+GJKBErOo4RxJL72lzLaYf78LxmRtwTiXl7ooHvm0YOeaVAWIWON7E
   g7Rs068wNh6IYOzjmUhDazkF9SHQdmKw1Ic6PHFsCd6u9bU41/1OmtAy2
   A==;
X-CSE-ConnectionGUID: eo5FD9iiRBGGhsHcw/9+Ug==
X-CSE-MsgGUID: MGMpxZkYSxyFgoJcYuyJIw==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="65112465"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2026 06:57:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Nov 2026 06:57:20 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:57:18 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Nov 2026 14:56:43 +0100
Subject: [PATCH net-next 8/9] net: sparx5/lan969x: scale the TAS guard band
 with the MTU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-sparx5-mtu-change-v1-8-f27bab580463@microchip.com>
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
X-CRM114-CacheID: sfid-20261105_055722_317370_F04042D5 
X-CRM114-Status: GOOD (  22.38  )
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

The TAS guard band (QMAXSDU_VAL, in units of 64 bytes) is how long
before a gate closes the scheduler stops starting frames of a traffic
class, so that a frame started just before the close still finishes in
time. The driver leaves it at the reset value of 24 x 64 = 1536 bytes,
so with a larger MTU, a frame started inside the guard band would
overrun the gate close.

The MAC maximum frame length only limits the frames a port receives, so
a port can transmit frames of the largest MTU of all ports, for example
when forwarding from a port with a larger MTU. Therefore, size the guard
band of all ports for a frame of the largest MTU, plus the Ethernet
header, FCS and two VLAN tags, rounded up to 64 bytes. Add the
HSCH_TAS_QMAXSDU_CFG register, program the guard band at init, and add
sparx5_tas_gb_update() for use when the MTU changes.

With the default MTU of 1500 the guard band is unchanged. As the
scheduler does not start a frame inside the guard band, a gate window
shorter than the guard band at the link speed cannot transmit, as is
already the case for the default 1536 byte guard band.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  1 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 12 ++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_tas.c | 43 +++++++++++++++++++++-
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index ac3aa798ae303..d150a76fc917e 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -745,6 +745,7 @@ int sparx5_tas_enable(struct sparx5_port *port,
 		      struct tc_taprio_qopt_offload *qopt);
 int sparx5_tas_disable(struct sparx5_port *port);
 void sparx5_tas_speed(struct sparx5_port *port, int speed);
+void sparx5_tas_gb_update(struct sparx5 *sparx5);
 
 /* sparx5_mirror.c */
 int sparx5_mirror_add(struct sparx5_mall_entry *entry);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 5302c7686e207..8a6de30042b5d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -5424,6 +5424,18 @@ extern const struct sparx5_regs *regs;
 #define HSCH_TAS_STATEMACHINE_CFG_REVISIT_DLY_GET(x)\
 	FIELD_GET(HSCH_TAS_STATEMACHINE_CFG_REVISIT_DLY, x)
 
+/* HSCH:TAS_PROFILE_CFG:TAS_QMAXSDU_CFG */
+#define HSCH_TAS_QMAXSDU_CFG(g, r)                                             \
+	__REG(TARGET_HSCH, 0, 1, regs->gaddr[GA_HSCH_TAS_PROFILE_CFG], g,       \
+	      regs->gcnt[GC_HSCH_TAS_PROFILE_CFG],                              \
+	      regs->gsize[GW_HSCH_TAS_PROFILE_CFG], 0, r, 8, 4)
+
+#define HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL         GENMASK(7, 0)
+#define HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL_SET(x)\
+	FIELD_PREP(HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL, x)
+#define HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL_GET(x)\
+	FIELD_GET(HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL, x)
+
 /* HSCH:TAS_PROFILE_CFG:TAS_PROFILE_CONFIG */
 #define HSCH_TAS_PROFILE_CONFIG(g)                                             \
 	__REG(TARGET_HSCH, 0, 1, regs->gaddr[GA_HSCH_TAS_PROFILE_CFG], g,       \
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
index ec80bc69371ab..32e502bc4f18f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
@@ -29,6 +29,9 @@ enum sparx5_tas_link_speed {
 /* Maximum supported cycle time in nanoseconds */
 #define TAS_MAX_CYCLE_TIME_NS ((1 * NSEC_PER_SEC) - 1) /* 999.999.999 nsec */
 
+/* HSCH_TAS_QMAXSDU_CFG.QMAXSDU_VAL, the guard band, counts 64 byte units */
+#define TAS_QMAXSDU_UNIT 64
+
 /* STARTUP_TIME in units of 256 ns, must be non-zero for a list to start */
 #define TAS_STARTUP_TIME_DEFAULT 8
 
@@ -48,8 +51,8 @@ enum sparx5_tas_link_speed {
  * We use 1 TAS profile per port, shared by both of its lists:
  * index = portno;
  *
- * We do not yet support frame preemption and the default guard band
- * of 1536 bytes is always used on all queues.
+ * We do not yet support frame preemption. All queues of all ports use a
+ * guard band that fits the largest frame that can be forwarded.
  *
  * The gate mask of each entry is written as is to the port's 8 queues,
  * where bit n gates queue (QoS class) n. The mqprio parameters of the
@@ -718,6 +721,40 @@ int sparx5_tas_disable(struct sparx5_port *port)
 	return err;
 }
 
+/* Size the guard band of all ports for a frame of the largest MTU of all
+ * ports, as a port can transmit frames forwarded from any port.
+ */
+void sparx5_tas_gb_update(struct sparx5 *sparx5)
+{
+	u32 max_mtu = 0, gb;
+	int i, tc;
+
+	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
+		if (sparx5->ports[i])
+			max_mtu = max_t(u32, max_mtu,
+					READ_ONCE(sparx5->ports[i]->ndev->mtu));
+	}
+
+	gb = DIV_ROUND_UP(SPX5_HW_MTU(max_mtu) + 2 * VLAN_HLEN,
+			  TAS_QMAXSDU_UNIT);
+
+	mutex_lock(&sparx5->tas_lock);
+
+	/* Each port uses the TAS profile of its own number */
+	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
+		if (!sparx5->ports[i])
+			continue;
+
+		for (tc = 0; tc < SPX5_PRIOS; tc++)
+			spx5_rmw(HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL_SET(gb),
+				 HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL,
+				 sparx5,
+				 HSCH_TAS_QMAXSDU_CFG(i, tc));
+	}
+
+	mutex_unlock(&sparx5->tas_lock);
+}
+
 int sparx5_tas_init(struct sparx5 *sparx5)
 {
 	const struct sparx5_consts *consts = sparx5->data->consts;
@@ -764,6 +801,8 @@ int sparx5_tas_init(struct sparx5 *sparx5)
 		}
 	}
 
+	sparx5_tas_gb_update(sparx5);
+
 	return 0;
 }
 

-- 
2.34.1


