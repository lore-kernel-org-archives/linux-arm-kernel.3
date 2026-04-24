Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A08EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfGUtghlNG4rWJUxLiL6IFhhntR3JqJG5WwNQAV3PoQ=; b=MJmHjQXBnmjA5UdflNGpD+5jQK
	74nty5XtrnF4oW+3wYUqwap1DHefm6tR6EDRgufRv61qE31nUoPyEbJtNjDtmEW5jrZz7Pz4TJ4Rv
	CRzDkwlco8sDSdLed5ZuuO7Kotfu0HhlG+hg8kzl23Ub/B/4/vmW1MM2+BsPletRJX9tqcfiLgzLR
	558UqQ7ii3oXg42/Hh7mWzLaeFzEwcm54EqAqV0KL2qxmUKVUjJHWTvzSeEgff0cg6YeZlMosLv4d
	GFyV5u+A2xkXCENOtTsyKA8lAnH3E5v66L13zoHEYirEZGDN7mvJwiZqYBH3Syiajkw0LerHcjq0z
	+4NPoutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAi-0000000Dp2G-1wKn;
	Fri, 24 Apr 2026 22:38:52 +0000
Received: from acj35aaf84.lhr1.oracleemaildelivery.com ([130.35.116.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAW-0000000Dox9-1GIA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=lfGUtghlNG4rWJUxLiL6IFhhntR3JqJG5WwNQAV3PoQ=;
 b=FjPJJiAaZTRPdTeVcZ6tSI9OpVmw4h63+XIb2J1MATKgiLrXB6T3c5dtiM6h9e84DrNJLaB1vm1K
   bdwiI1EX0wjyEYlt8ONKFQbD4qAoNd5XUuEcEJjZmyJvBxrrnomgdB6BxDyWmJA7sH/fGoKT/ybW
   gWna3787lfs3PoXbE4ChW8H+r26hPyfjRy5EhwrNPiGaxadmaIVT86nipu951fpJozBlrGDaDw5T
   q8pDhv1cf/sztZnrv8Rxc97Pklf3C1zzNIOI4HXjnEhAAOt6May8cy42KcMuC8WxQbIugtODCuIL
   gtVk+EUACf2JnGO1Bw6JzrAss0IxMKGzp30rLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=lfGUtghlNG4rWJUxLiL6IFhhntR3JqJG5WwNQAV3PoQ=;
 b=2VgKFgXC93vq3+mC+Rat8jL0RxHRhQZ+55oqVY1B0vwQURseEVUA7vsq1lGf2R4BKfIDxRtw4YO6
   qru4LuI3uCSF35kdyMZP2E2FoQFHehw5Ljq/ksPmwfLHRYVsJ62zGNKfdPfIJxWseNrGplrOyG9j
   mI6f0iZUIWC2vUDLxeDBAn+NsM9lTGyGh+8CjIUlUPLORnSpR+bHaUW1RnvaczK03NorR33LcB/M
   s7UFZ445tcoorE+mwOtUoVJy21n0acWTUWS0nLY2AiIVV94cGxydEg+cH+WzJrYBnpteSZaT0uqK
   hG82uHgqewTMN8j4LdDwfQJPFRzWun3OO5CRkw==
Received: by omta-ad1-fd2-402-uk-london-1.omtaad1.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TE0008OKS8AMZ50@omta-ad1-fd2-402-uk-london-1.omtaad1.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Fri, 24 Apr 2026 22:38:34 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: [RFC PATCH net-next 2/3] net: macb: re-check ISR after IER re-enable
 in macb_tx_poll
Date: Fri, 24 Apr 2026 23:38:32 +0100
Message-id: <18740f04225a1778e6938ab5ecfe82087d66eb27.1777064117.git.lukasz@raczylo.com>
X-Mailer: git-send-email 2.53.0
In-reply-to: <cover.1777064117.git.lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFzDiYTuS9jvqSCDQoXiqVnkU2yDl7DFh57yZB8VktRLO86c1eFyO5ekvNWCLwV
 PHyd9gw8WA5srfV/TRAJ0XPcqN0ckK5QcJKY/BvNSp9YM04VJVDtt2a6z/Rk79Vb
 ylhtgg+o/UOdidk/bn7MxjqL2Vg6bDT8+SHGDE519MsNZnpXAHHTFxGDkzfd0Ajf
 jj2AwrkKG9vwfy1hnyZVwuUXHDhXaJvcpJ5+v6WcTYGXKwBgnU+u0UgtZ+GhVDLs
 LPoiUlEGJ2ZEkCB/a5vF44KoIUmBaUgeHjvWkSy3/gwYgjcKJ4p5josO6WXAwyNL
 AT/MXB/rXr2VI/lNGIWzG3WwRgg8sI0dcULsssWc/fCRY1ZHIFIZJaYNn4QxKY0V
 TYTws4tT+sfVPGkDctmaPglRu9tmNDpTjcXty6AHFLy7das6vC6JXEe5e7bMUrhJ OTBGvqSwqw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_153841_385835_1E6C5D07 
X-CRM114-Status: GOOD (  22.61  )
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

macb_tx_poll() runs with TCOMP masked, drains the TX ring, then
calls napi_complete_done() and re-enables TCOMP via IER.  An
existing comment in the function notes:

	/* Packet completions only seem to propagate to raise
	 * interrupts when interrupts are enabled at the time, so if
	 * packets were sent while interrupts were disabled,
	 * they will not cause another interrupt to be generated when
	 * interrupts are re-enabled.
	 */

and mitigates this by calling macb_tx_complete_pending(), which
inspects driver-visible ring state (descriptor->ctrl, after rmb())
and reschedules NAPI if a completion is observable in memory.

On PCIe-attached parts (BCM2712 + RP1 on Raspberry Pi 5 is the
setup we have in front of us), the descriptor DMA write that sets
TX_USED may not have retired to system memory at the point
macb_tx_complete_pending() runs.  The rmb() synchronises the CPU
view of earlier CPU writes; it is not sufficient to retire an
in-flight peripheral DMA write.  Under that ordering the in-memory
descriptor can still read TX_USED=0 when the hardware has in fact
completed the frame; the check returns false; NAPI exits; the
quirk above prevents the re-enabled IER from re-firing; the ring
goes quiescent.

Add an explicit ISR read after the IER write.  The MMIO read
serves two independent purposes:

  (1) It is an architected PCIe read barrier for earlier
      peripheral-originated DMA writes on the same path, so a
      subsequent macb_tx_complete_pending() observes any TX_USED
      write that was in flight at the time of the barrier.

  (2) It samples the hardware ISR directly, so a TCOMP bit that
      the hardware set while TCOMP was masked is visible here,
      independently of whether the descriptor DMA has retired.

If either signal indicates pending work, reschedule NAPI via the
same path as the existing check.

This patch addresses one of three candidate races for the silent
TX stall described in the cover letter.  Whether it is sufficient
by itself, or whether it requires the PCIe posted-write flush in
patch 1/3 to cover the observed behaviour, we have not yet
verified at runtime.

Link: https://github.com/cilium/cilium/issues/43198
Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 28 +++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b6cca55ad..ea231b1c5 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1973,17 +1973,25 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
 	if (work_done < budget && napi_complete_done(napi, work_done)) {
 		queue_writel(queue, IER, MACB_BIT(TCOMP));
 
-		/* Packet completions only seem to propagate to raise
-		 * interrupts when interrupts are enabled at the time, so if
-		 * packets were sent while interrupts were disabled,
-		 * they will not cause another interrupt to be generated when
-		 * interrupts are re-enabled.
-		 * Check for this case here to avoid losing a wakeup. This can
-		 * potentially race with the interrupt handler doing the same
-		 * actions if an interrupt is raised just after enabling them,
-		 * but this should be harmless.
+		/*
+		 * TCOMP events that fire while the interrupt is masked do
+		 * not re-fire when IER is re-enabled.  Catch this two ways
+		 * to avoid losing a wakeup:
+		 *
+		 *   (1) Read ISR -- catches completions the hardware flagged
+		 *       but that we did not see as an interrupt.  The MMIO
+		 *       read doubles as a PCIe read barrier, flushing any
+		 *       in-flight descriptor TX_USED DMA writes into memory.
+		 *   (2) macb_tx_complete_pending() inspects the ring after
+		 *       that flush, catching a descriptor whose TX_USED is
+		 *       now visible as a result of the barrier.
+		 *
+		 * This can race with the interrupt handler taking the same
+		 * path if an interrupt fires just after the IER write;
+		 * rescheduling NAPI in that case is harmless.
 		 */
-		if (macb_tx_complete_pending(queue)) {
+		if ((queue_readl(queue, ISR) & MACB_BIT(TCOMP)) ||
+		    macb_tx_complete_pending(queue)) {
 			queue_writel(queue, IDR, MACB_BIT(TCOMP));
 			macb_queue_isr_clear(bp, queue, MACB_BIT(TCOMP));
 			netdev_vdbg(bp->dev, "TX poll: packets pending, reschedule\n");
-- 
2.53.0


