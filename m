Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C8606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SyxtMJRy;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dBA03H4/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NBv0HOgJZibkv//LT99ipQy0RsGlURxEEWeod0u4kVU=; b=SyxtMJRyC61i333lnduY+LmmPe
	sfNYdWGEx4fqPbjJO7rUGAo8lQRzygitAyaSqZciec4g4N0RVD6RE+/0fdc/IGKSFrmygYFTJd1W4
	EQnOu0M1gghf2bb1cv+R2hNayRIDE/vlfHuRdwo/S5L41osSmy8y1lTGpNprwPG5Njrx8G9d5c47E
	miKUE3iI/SXEQdumL53vO6AobIF8IkE3WwfEFMdlRxZ19H0s0oSZ8zxRWji3jBL0Kqz2VdfkRW+Pn
	aFjE+vGYnzwKbHgp2L/jEjvbL4vTi3fIovDiNwxyQY5xqflNPAWxu7sF7iPeTGnevrAilR+gaPlmg
	4ICcn0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMw8u-0000000Cjyw-2o8M;
	Fri, 30 Oct 2026 23:36:16 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMw8r-0000000Cjya-3LOe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 23:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793403373; x=1824939373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NBv0HOgJZibkv//LT99ipQy0RsGlURxEEWeod0u4kVU=;
  b=dBA03H4/Q45EH7yTJJgPgsDLYaKPPs13RlFl9OpSOZ6MVdE1sgGOkA2a
   1w6sC/hol3YPOxQbuGMp3kOiP+iOnSW2bywSnGnpEMJrxIINW6imPqizr
   56HlWGTQu9BOrOLDKK634tKHNru29ZWJN+u+UT1wqHGD7ZhOWVnEOdq+p
   uy7Su9brBGQMOYl0ekjvkOrVTMZuY60fTqVNDtBOcU6LgKHXMY3v6s/hG
   14D0X+O6umEaxqc4UV4qgRd8soU9Tjn5puyey+2ZZWKtuJMtWBAyxkKre
   4N58QIo+0jvTvwl6QrmLyEaZNjJd4PecOf2GqWev4OcdnJJXuzNtP1pFm
   w==;
X-CSE-ConnectionGUID: A856wVPWS6W2dwswXKgxYg==
X-CSE-MsgGUID: l/CCTQEoTnuwJXeOq+karw==
X-IronPort-AV: E=Sophos;i="6.27,186,1787011200"; 
   d="scan'208";a="32490535"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 23:36:11 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:14081]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.18.155:2525] with esmtp (Farcaster)
 id 166e25ea-92ed-4526-8b4a-e4b57d1b931a; Fri, 30 Oct 2026 23:36:11 +0000 (UTC)
X-Farcaster-Flow-ID: 166e25ea-92ed-4526-8b4a-e4b57d1b931a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 23:36:10 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 30 Oct 2026
 23:36:10 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>
CC: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] can: ifi_canfd: enable NAPI before starting the controller
Date: Fri, 30 Oct 2026 23:33:30 +0000
Message-ID: <20261030233330.3483988-4-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261030233330.3483988-1-patrzhan@amazon.com>
References: <20261030233330.3483988-1-patrzhan@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_163614_158646_34563F01 
X-CRM114-Status: GOOD (  19.86  )
X-Spam-Score: -11.9 (-----------)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ifi_canfd_open() calls ifi_canfd_start(), which unmasks the interrupts
in IFI_CANFD_IRQMASK and then enables the controller through
IFI_CANFD_STCMD, and only then calls napi_enable(). A frame that
arrives in that window raises RXFIFO_NEMPTY. ifi_canfd_isr() masks all
interrupts with ifi_canfd_irq_enable(ndev, 0) and calls
napi_schedule(). NAPI is still disabled, so napi_schedule_prep() finds
NAPI_STATE_SCHED set and the schedule is dropped. Only ifi_canfd_poll()
unmasks the interrupts again, and it never runs. From then on the
interface receives nothing. ifi_canfd_start_xmit() stops the queue
after every frame and relies on the TX FIFO interrupt to wake it, and
that interrupt is masked too, so transmit stops after the next frame.
The stall lasts until the next close. Every re-open runs the same race
again.

Enable NAPI before the controller starts, so that an early RX interrupt
can schedule the poll. ifi_canfd_start() cannot fail, so no error path
changes.

NAPI must not be enabled before the IP has been reset, though. The
handler is registered with IRQF_SHARED and acts on the raw
IFI_CANFD_INTERRUPT status, and nothing resets the IP before the first
open, so stale status could schedule a poll that runs while
ifi_canfd_start() resets and programs the IP. Split the reset,
configuration and status clear out of ifi_canfd_start() into
ifi_canfd_reset_config(), and enable NAPI between the two. Before
enabling NAPI, wait with synchronize_irq() for any handler that read
the stale status before the reset, so that its schedule is still
dropped, as before. The controller stays disabled until
ifi_canfd_start() unmasks the interrupts and enables it. The bus-off
restart path calls both halves in sequence, so its register writes do
not change.

This is the same race as in "can: ctucanfd: enable NAPI before starting
the controller" and "can: xilinx_can: enable NAPI before starting the
controller". I do not have IFI CAN FD hardware, so this change is
compile tested only and the failure sequence is taken from the code.

Fixes: 0c4d9c94a130 ("can: ifi: Add IFI CANFD IP support")
Assisted-by: LLM
Signed-off-by: Patrick Zhang <patrzhan@amazon.com>
---

Notes:
    v2:
    - Split the reset, configuration and status clear out of
      ifi_canfd_start() into ifi_canfd_reset_config(), and enable NAPI
      between the two, so the poll cannot race with the reset when the
      shared handler sees stale status (reported by the netdev AI review)
    - This replaces the ifi_canfd_stop() call I proposed in reply to the
      review: ifi_canfd_stop() writes ~0 to IFI_CANFD_IRQMASK, and I cannot
      confirm from the driver alone that this masks the interrupts, while
      the split does not depend on it
    - Call synchronize_irq() before napi_enable(), so a handler that read
      stale status before the reset cannot schedule the poll afterwards
    - Explain the ordering in the commit message, and name the ctucanfd
      and xilinx_can fixes by subject instead of "the previous patches"
    - A poll can still overlap the interrupt unmask and error-counter writes
      at the end of ifi_canfd_start(), the same as on the existing bus-off
      restart path. I have not reordered those writes, because I cannot
      test the effect on hardware.
    - v1: https://lore.kernel.org/r/20261021205924.2538511-4-patrzhan@amazon.com

 drivers/net/can/ifi_canfd/ifi_canfd.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/ifi_canfd/ifi_canfd.c b/drivers/net/can/ifi_canfd/ifi_canfd.c
index 0f83335e4..0ff766c7e 100644
--- a/drivers/net/can/ifi_canfd/ifi_canfd.c
+++ b/drivers/net/can/ifi_canfd/ifi_canfd.c
@@ -734,10 +734,9 @@ static void ifi_canfd_set_filters(struct net_device *ndev)
 			     IFI_CANFD_FILTER_IDENT_IDE);
 }
 
-static void ifi_canfd_start(struct net_device *ndev)
+static void ifi_canfd_reset_config(struct net_device *ndev)
 {
 	struct ifi_canfd_priv *priv = netdev_priv(ndev);
-	u32 stcmd;
 
 	/* Reset the IP */
 	writel(IFI_CANFD_STCMD_HARDRESET, priv->base + IFI_CANFD_STCMD);
@@ -760,6 +759,12 @@ static void ifi_canfd_start(struct net_device *ndev)
 	/* Clear all pending interrupts */
 	writel((u32)(~IFI_CANFD_INTERRUPT_SET_IRQ),
 	       priv->base + IFI_CANFD_INTERRUPT);
+}
+
+static void ifi_canfd_start(struct net_device *ndev)
+{
+	struct ifi_canfd_priv *priv = netdev_priv(ndev);
+	u32 stcmd;
 
 	stcmd = IFI_CANFD_STCMD_ENABLE | IFI_CANFD_STCMD_NORMAL_MODE |
 		IFI_CANFD_STCMD_ENABLE_7_9_8_8_TIMING;
@@ -817,6 +822,7 @@ static int ifi_canfd_set_mode(struct net_device *ndev, enum can_mode mode)
 {
 	switch (mode) {
 	case CAN_MODE_START:
+		ifi_canfd_reset_config(ndev);
 		ifi_canfd_start(ndev);
 		netif_wake_queue(ndev);
 		break;
@@ -846,9 +852,14 @@ static int ifi_canfd_open(struct net_device *ndev)
 		goto err_irq;
 	}
 
+	ifi_canfd_reset_config(ndev);
+	synchronize_irq(ndev->irq);
+	/* Keep between the reset and ifi_canfd_start(): the ISR masks the
+	 * interrupts and only the poll unmasks them.
+	 */
+	napi_enable(&priv->napi);
 	ifi_canfd_start(ndev);
 
-	napi_enable(&priv->napi);
 	netif_start_queue(ndev);
 
 	return 0;
-- 
2.50.1


