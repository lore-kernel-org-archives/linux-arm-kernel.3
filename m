Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F197C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xodhZBnx6jfLH4JD+1UDx5RRMPDpkbVj69WOZYwA5Z0=; b=UZJ5K5daPkoVP8
	aI9RIGJsAC55PgGHFmVVyIcwsrFzm/tAOwONsn0GeeqHaxrutHX+ESxbik8FP8hxbVERxTIN109/Z
	mdqUS6X3GKcQJ8tAcufWmiBV0tGRb62MPHPLwOCk3HvAk+DRSTNbqw5hICsFBpOYqRqJdFrdthA/4
	DXnjIDkeIJMQHpNscLa0Ii/L+xRR4f5ihFKWRyxdjhoK44BwHb1UQTOVKY5RE7nBwOl/WH6ZKzBVw
	OQJy35MiudrnK6SoYNi8L0iDVtkaX1B0EU5rXOzeufj+OBdrFZUp1o8tr87rY+dBi2ID8pTDlPJYm
	fpmJ9SuV5FZt8M33/sPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK02-00000009aKG-2UWT;
	Thu, 30 Jul 2026 06:12:10 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJza-00000009a6L-1JOM;
	Thu, 30 Jul 2026 06:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785391893; bh=xodhZBnx6jfLH4JD+1UDx5RRMPDpkbVj69WOZYwA5Z0=;
	h=From:Subject:Date:To:Cc;
	b=h61xOVkpqR8MfvoA3hILcz34EW4h3t11XkbssOfYI5r8sTsnSfvgm9drG2bVLCDtQ
	 uknWWHxgykIQwXNryg/LGEzsAV4FNFTKlYfH6WZNCoO48StQD2FPGCOnXcZBjjPmBl
	 3UqFz1Vm++2/3gXHlxNN8XBxiyb/vq2Vwlp8t7qk=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2DF15055; Thu, 30 Jul 2026 14:11:31 +0800
X-QQ-mid: xmsmtpt1785391891t5q15582x
Message-ID: <tencent_0E5C2332F801372DD0D4CB4C25B88C18040A@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoegJq/HghpgMeM/vEcKqPce/AHIJU6n+h4wmheiLkpGNDuLapRTp
	 hbZ5/z0BGn20avs+kCt0XScYUpVszTPZ1ZaP8Am33dxwSRnSuUtQ+RMHDAfolnof66caTPvzHy+r
	 z7BDAhDFuasiFYuCxCStGC+NlZWGHDdKOLWohgOmzeYkcR+nqQFN+zv04AUnY3/ezQtxHlU+u7gZ
	 ZRqEjiZxRR8Oa9UHhZuTdxDdjwDXNuGl8VrdvZqYtmEUsNcyax6sgDNy96L12YitmAoD/UdolvKN
	 kDc2/Jke6qRflU7GqPtA9jK8xCu5+1POVqJj39J78zuj6vEtDbmewIjrqXDyb0lwF8xyzznWEuSr
	 gO3FbQw0cjK7ZsyF3PE+5Q0egqVdRQcmzAlMeyD01cIl7ENz89E7u98qlhIp3W99Amwu9qmFNq//
	 kqV9+Lmjq9nBHRXBfaW8U98eHUBnMbZvPJZdAAXGT52ZUdsFRvraXOO1e5GvVHgfom69x1HbdM7Y
	 dVmUfUORA1N/bWeBOwjM4y0P7T1sp5xBl+zZ4jmqcIk+30TeDbTKYVNmo36QcKe26LSWUbRFb5ta
	 iD/AeK5e10YcdsHfnggxYTBbOantVUcYWUHzhS8Bb0NFl0IfI93/75OLkDCelkYvM9Xasf+BOh41
	 w9cqGvXAh3s/7GCeZchFVFEKrQTHb8b6QaHVkoVA+DSv6C9WePrh+SQFyjdtIi0dJdmmdkZZQ3fj
	 1oP1/mVY2Io9mO3kTt70KOHm8HguBl+iZ5EDvVbwOjH/9SlsuB1x3VB3cMKQqFAG46XQOxQ1YFkE
	 UX4y8I1ZTQYnKazpkfrHGtBT11d6NvreEU/cagX1R0TuMEGUTfiGDYb9X7Ddd5epl7QEBBrOmwow
	 McJw/DnyRGRt4MW3IcWZGo6LNwVFeUX4JRbO6zbc/bTC82a4xvMhb16hYWVQf/WrhvjhdyGM/sz+
	 +02QLHtVQCjIUjKKNoQHQABr4LV0AKKjnPZrRpVp5K/0Pe9eH9O2qnZgWhzof9bD7zD0mAQKdF9D
	 ctQ2N6aiFunfzTXf5x5nNi7GTE153Dl1VPPLq8HOqeO7pmX/JTId5vQC0I7e79oYrifHyfTJiElH
	 EXutGIJ+0BRfpbi9BCiWZJw/6cqgzzxPwVbmHQY3yj1Y4LIlePjIirFn0HdQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH 0/3] can: rockchip_canfd: fix TX stalls and echo skb races
Date: Thu, 30 Jul 2026 14:11:21 +0800
X-OQ-MSGID: <20260730-master-v1-0-6945fdd4f0ff@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnramoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc2MD3dzE4pLUIt1EwyRTkyTj5DTTRAMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0A/PjexmoAAAA=
X-Change-ID: 20260730-master-a1b54b3cf5a0
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231142_665749_E9CFAB11 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
report the warning and stop the TX queue without a later completion to
wake it.

While investigating the warning, two additional ways for the TX state to
become inconsistent were found. The transmit path submits a frame and
advances tx_head even if installing its echo skb fails. In addition, the
erratum 6 retry path selects tx_head, which denotes the next free buffer
with a two-entry FIFO, instead of retrying the outstanding buffer at
tx_tail.

This series makes echo skb setup failure abort the transmission, retries
the correct hardware buffer, and serializes the TX head, tail and echo
ring updates with a spinlock.

All three patches pass scripts/checkpatch.pl.

---
Cunhao Lu (3):
      can: rockchip_canfd: prevent TX stall on echo skb failure
      can: rockchip_canfd: retry the outstanding TX buffer
      can: rockchip_canfd: fix TX echo skb race

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


