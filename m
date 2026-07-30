Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97D2C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=50Uuu8XRCWJ9Vy+dK1JJTg4ciK2N8RX5LL7SNEvVIBo=; b=WJvu9cmVhP2PXj
	P9atv+VzGptN4ss3t/2u+YMtmYAWgG1ZZQ1jN1g0EHxADyBwXgLZQPGdAjeqQqiJ+o2KByaHcVWvc
	EEH3h12T0Qnv4GLWP5k8JkA0GmuEuPKGqLFLQ/605SPVrEYmrtonZXjLuHysD1DVZkcH2M1Qt10WE
	wHbGUrlFIOGbBwEWC40V6nqKf8AC6oHJV9sMLGR5I1euAZJFvry1ZVgQ1+II89NespFnIal1FHgTB
	+B6pogeYiAqrYlWT5ziP5E/n2sUlZ05HEXp0vBiDFUaCJ+JZNgdXW0bg8YshtxVr8cUkd+PtqcRn7
	R00fxUWA6cFUSGOqWSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNkQ-0000000A9Mm-0TzP;
	Thu, 30 Jul 2026 10:12:18 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNkB-0000000A9GV-43Sw;
	Thu, 30 Jul 2026 10:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785406319; bh=50Uuu8XRCWJ9Vy+dK1JJTg4ciK2N8RX5LL7SNEvVIBo=;
	h=From:Subject:Date:To:Cc;
	b=m1J3sPTqzrR/2SMAf0cB1VRH9c0pEUQ5RjwdVLWCNAczFxQJpNUuRGlJi1W0j45/8
	 51JaMK2DXTFQ9iBjZCNyznMYkBfgeRxa2nTAHNaTFyaozy64kka3MaCY5ZL08EDfWu
	 YLVArGMXOtFUORWVtSB0ZeRFRg45xEkFO1YA1tNo=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2F88CE83; Thu, 30 Jul 2026 18:11:56 +0800
X-QQ-mid: xmsmtpt1785406316t819daiix
Message-ID: <tencent_D802EB485A801362BF9F54130C0D990C6206@qq.com>
X-QQ-XMAILINFO: MzFuFcyvqEEC9szwZ9kMTGfyNdRPPkfxv5BDpdOB9GDen2MKLeIrqCPAXkATWp
	 mGTueUIR4jsE1OKmhEFYyviZSsta8Ywo3r9foqbZnyDX7rQgBrg4LrKTl30iPptNOGfHuOU0lKo7
	 KqEqJnuglqZf7leSe65Z44Rs+WRiUW4GJuz9pB7VKj+GHG6NJugnjKfRm37eGiLlXLsDtr5McVX3
	 fZlUxV9zyzwRwAHAFqLkyiPWLQX5XcURMX1nnqTS9rFNMO/qaDMrBYJURn6J2Ao+He88PP0o9HGm
	 ViYSY4GxBuy/wBNf4Rkh8cFC1JrKRi35u33CeGV2QbUuk43KIrwbAdiGh9bxyKiGapIC7Ij+cd4T
	 xTP8TK4wxAvd1AGIssPYUpLyzPgM2G6xjrqnM+bE+WbVI+BTWlk9h9TxU/lNblMe/eddG6AXjyXc
	 Bt16d/OCTuChyWmgwbvcumh97uRQjJldCYkK0iiUG8PcYSGO7mYEb9RNdEExEWUbk5S8uAxUkD4T
	 BUxEWPUUkgBsGZZ/IKuOJ7xMlefNmRRn9nF1+x1obt/4CQwgyj1x3dwm3OQ8GpyTQoA3HvPY+34T
	 W3cqaW7Nemvp9LtGmBWPHwPMi0aKHyeLjLeoxUyccoJfOT31mGtr86kiUXX/ESb7MWxTCiRj5WkM
	 dRk4gdXAoREQ3ZbwvUtRDMrUMC+i6Fj8tyhXxtdLckC4aTq1hfVOM+CmOALFbUA+weYgVlHVlVPl
	 peBZazK78V8YpWwxV2lFXz4oFDcPn2QX8+Y9CaJeeuhsADlXi+Pw96JnXKz8/rn51EK47GZ7g38i
	 AsRphK8GgFypPiBA9c+fmSSY8L5hmUh7IVZ6NeTkDPs1+mI3lJ4WiH2wSqtwBVIUhj7NWPxBVlhB
	 eGaxTpSeBx5mnpmac2T2HIit13ac01w9P1gkru1fBxv+KhSLKvWAndcFwg3Bzg+CzGCZMs323xQ6
	 peayOdqeObeeuv1Gijfh8sw9UoQEfi4KDbf85aQGvx59teGGK41mDF5aIrRy097d+oiBwnhgCoRl
	 CeWbgwFsWuZ2X5dzgZPnsDK62chrsL9r//si8f13zlni50FTplTSBxA/d02JlOBTlfC4qQJkLJwD
	 pMpKvWK3PBBjCuwVWfGrkxy3w4+c2L8bAB3cWwzyWbDDHQXiZtnTUh2E1OlFQtTkpvD+hEuKZ0+5
	 aJr9Vuzie1FG1eFg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v2 0/3] can: rockchip_canfd: fix TX stalls and races
Date: Thu, 30 Jul 2026 18:11:45 +0800
X-OQ-MSGID: <20260730-master-v2-0-572974052400@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEja2oC/2WNQQ6CMBBFr0JmbU0LFKMr72FYlHYqYwJIpxIN4
 e62uHT5kvffX4ExEDJcihUCLsQ0jQnKQwG2N+MdBbnEUMqykadKisFwxCCM6nTdVdZrIyHJz4C
 e3nvo1v6YX90DbczrbPTEcQqf/WlR2fuLLkpI0Zxr7Z2rvfT+Os9HOw3Qbtv2BWuNG1CrAAAA
X-Change-ID: 20260730-master-a1b54b3cf5a0
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_031204_336820_5104D730 
X-CRM114-Status: GOOD (  12.03  )
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

While running CAN traffic on an RK3588 system, the driver repeatedly
reported an inconsistent TX echo state:

  rockchip_canfd fea60000.can can0: rkcanfd_tx_tail_is_eff:
  echo_skb[0]=NULL tx_head=0x00060f7d tx_tail=0x00060f7c

The Rockchip CAN-FD driver completes transmissions by matching
self-received frames with entries in the echo skb ring. The warning above
is emitted when the driver sees a pending transmission but finds no skb in
the corresponding echo slot.

The immediate cause is a race between the transmit and completion paths.
The completion path removes an echo skb before advancing tx_tail, while
the transmit path reads tx_head, tx_tail and that echo slot without common
synchronization. It can therefore observe a partially updated state,
dereference an skb which has been queued for NAPI, or stop the TX queue
without a later completion to wake it.

Two additional TX stall paths were found. The transmit path submits a
frame and advances tx_head even if installing its echo skb fails. In
addition, the erratum 6 retry path selects tx_head, which denotes the next
free buffer with a two-entry FIFO, instead of retrying the outstanding
buffer at tx_tail.

Review also identified that the erratum 12 MODE/CMD/MODE sequence can be
interleaved between the transmit softirq and the RX interrupt retry path.
The interrupt can restore the default MODE before the softirq issues CMD,
bypassing the SPACE_RX_MODE workaround.

This series makes echo skb setup failure abort the transmission, retries
the correct hardware buffer, and uses a spinlock to serialize the TX head,
tail, echo ring and command register sequence.

The final series was tested on an RK3588 rev2.2 at 1 Mbit/s with 100,000
extended CAN frames. The run triggered 138 erratum 6 retries and completed
without drops, queue stalls or driver warnings. RK3588 does not enable
erratum 12, so this test does not exercise that hardware workaround.

All three patches pass scripts/checkpatch.pl --strict. The Rockchip CAN-FD
module also builds cleanly with W=1.

---
Changes in v2:
- Document that the TX lock also serializes the erratum 12 MODE/CMD/MODE
  sequence.
- Add the erratum 12 commit to the Fixes tags of patch 3.
- Add RK3588 extended-frame stress-test results.
- Link to v1:
  https://lore.kernel.org/linux-can/tencent_0E5C2332F801372DD0D4CB4C25B88C18040A@qq.com

---
Cunhao Lu (3):
      can: rockchip_canfd: prevent TX stall on echo skb failure
      can: rockchip_canfd: retry the outstanding TX buffer
      can: rockchip_canfd: serialize TX state and command writes

 drivers/net/can/rockchip/rockchip_canfd-core.c |  1 +
 drivers/net/can/rockchip/rockchip_canfd-rx.c   | 31 +++++++++++++-----
 drivers/net/can/rockchip/rockchip_canfd-tx.c   | 44 ++++++++++++++++++++++----
 drivers/net/can/rockchip/rockchip_canfd.h      |  4 ++-
 4 files changed, 64 insertions(+), 16 deletions(-)
---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260730-master-a1b54b3cf5a0

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


