Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hB3P3QeC;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=dONcuITV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OatRvA2g2ft3qrMPP2PToIR4b5mZwUWsvSN9SYAtqFs=; b=hB3P3QeC17LU5X7LgN8HTqEvhF
	oSIjQ5wqKspDufH5bPwb9YjDzSlNdL20Qu+fPloluMgdpzYkMPlOKWJZ2WLWj2U9441zX0ZsHHrE1
	x3Mpm2XgR8HLwvF36tlt0schm0E6oDBaJDOKLIn7NmIDP0/mSLQKpPzW7yyO1kLad02VXIL+89uwr
	i1Ws+aHIBAIlcHpYGtKGiPVTNk3J+bLRnAGQNNyuevOWMNXhi+5pemKi9VV0iapjztc2G7pzh2Qg3
	JVc+k1PQTUlrUdFQ9sz2oCdvkIqV1xvVu49bJuDTQAHUj/rCs+INXPVfCNZzk4oedYM+mH+kIBteu
	UIhkGxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5gB-00000009FOh-26re;
	Tue, 20 Oct 2026 08:58:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5g9-00000009FNk-212I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792486721; x=1824022721;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=o4RlZx6NY4ZXP1UWTvwYZ3cQmizRyKcWC1/bfyI80oE=;
  b=dONcuITVNkCV0aS0ERcycyf5SFacy7g7wSP9gneuyKNAQsrSI7IED1pX
   ymkmd6uGZZI6du15KTbqzqOylcpvQDD1HSM77yevcsivNQMaR4H6pKSMq
   5T1mW8pSPjYp2o75TVJUOu4c2EZa3nTmoPiZAKgcSwbDSaafpk+AU5db8
   0uaWrnD9px48gSuf+2yOx9tO8Qyxzya/xwyjy3QLFSZFrBbpd+xn9BIQS
   rcIjif11ZmB9lclWO2ow1774fs7VmvkLiOkGChEhNkNtTcJRXl2k1vO8V
   O5G1Zb52WWIqyoEmx79/28jHJhuKGOiGw4ANRLcG8KNszeLQ7ASU9IMrz
   Q==;
X-CSE-ConnectionGUID: vF/0hLSBSY6Ft+BMIv4DiA==
X-CSE-MsgGUID: WyYidqJgRvOfgo1a1o0pAg==
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="64343655"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:58:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 20 Oct 2026 01:58:40 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Oct 2026 01:58:38 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 20 Oct 2026 10:58:35 +0200
Subject: [PATCH net] net: lan969x: fix DSM calendar for empty taxis
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-lan969x-dsm-empty-taxi-v1-1-14790f1e7430@microchip.com>
X-B4-Tracking: v=1; b=H4sIADot12oC/x3MQQqAIBBA0avErBsYWyR2lWghOtVAWaiEEd09a
 fkW/z+QOAonGJoHIl+S5AgVqm3ArTYsjOKroaOuV6QMbjaY3hT0aUfez3xjtkWQHGlPdtbaO6j
 xGXmW8o9HCJxhet8Pryu3FG0AAAA=
X-Change-ID: 20261019-lan969x-dsm-empty-taxi-0c07d0af77dc
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_015841_594803_8C892A87 
X-CRM114-Status: GOOD (  13.90  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lan969x_dsm_calendar_calc() computes the DSM calendar schedule of one
taxi. sparx5_config_dsm_calendar() calls it for each taxi, reusing the
same sparx5_calendar_data.

Before this patch, the schedule is only cleared after the n_devs == 0
early return. For a taxi with no active ports, the function writes
SPX5_DSM_CAL_EMPTY only to schedule[0] and leaves the remaining slots
at whatever they held before. For the first taxi that is zero from
kzalloc(), so sparx5_dsm_cal_len() returns a bogus length and
sparx5_dsm_calendar_check() fails, which fails the probe:

  Port 0: distance 20 above limit 0

A later empty taxi inherits the previous taxi's schedule instead, which
passes the check, so only an empty taxi 0 triggers the failure.

Clear the full schedule up front on every path, and on the empty path
place a single idle marker (SPX5_DSM_CAL_MAX_DEVS_PER_TAXI) in slot 0,
so the update step sees a calendar length of one and programs one idle
slot into the hardware, matching what sparx5_dsm_calendar_calc() does.

Reported by a customer whose DT enables none of the ports in a taxi.
Reproduced on lan969x by disabling all taxi 0 ports in the DT.

Fixes: 5d2ba3941016 ("net: lan969x: add function for calculating the DSM calendar")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_calendar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_calendar.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_calendar.c
index e857640df185..4442c0c1a957 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_calendar.c
@@ -82,6 +82,9 @@ int lan969x_dsm_calendar_calc(struct sparx5 *sparx5, u32 taxi,
 	struct lan969x_dsm_cal_dev_speed *speed;
 	int err;
 
+	for (u32 i = 0; i < SPX5_DSM_CAL_LEN; i++)
+		data->schedule[i] = SPX5_DSM_CAL_EMPTY;
+
 	/* Maximum bandwidth for this taxi */
 	taxi_bw = (128 * 1000000) / sparx5_clk_period(sparx5->coreclock);
 
@@ -125,7 +128,7 @@ int lan969x_dsm_calendar_calc(struct sparx5 *sparx5, u32 taxi,
 	}
 
 	if (n_devs == 0) {
-		data->schedule[0] = SPX5_DSM_CAL_EMPTY;
+		data->schedule[0] = SPX5_DSM_CAL_MAX_DEVS_PER_TAXI;
 		return 0;
 	}
 
@@ -167,9 +170,6 @@ int lan969x_dsm_calendar_calc(struct sparx5 *sparx5, u32 taxi,
 		return -EINVAL;
 	}
 
-	for (u32 i = 0; i < SPX5_DSM_CAL_LEN; i++)
-		data->schedule[i] = SPX5_DSM_CAL_EMPTY;
-
 	/* Place the remaining devices */
 	for (u32 i = 0; i < DSM_CAL_DEV_MAX; i++) {
 		speed = &dev_speeds[i];

---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-lan969x-dsm-empty-taxi-0c07d0af77dc

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


