Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB00CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4ozHVcOqt/iZHojtGeuVSx2GbW78Ml/7CqGJpmtouM=; b=JmnYsbUY0KhpYe
	5vTsritViu8JmFA2opjRErJgYmR/YyqKdxveq3d2Vdo1xVZfukjmA98x3Gsqt8mYBAtudAPpUPFZN
	ttkgRrUlqmgxdjADsoASE7oO0o6MGDZItf6QlUtGCdvspbvO8Y9WNNFSByw478Ag26yafjyJgOSo5
	fk2JWJ3ZBohI/iz8oGU17h1mDxSlrL433Be7fsnMM4uo3xw1Y2Yp3ho7dbCP9hWU80yi1A1kpBbH1
	k1wZxmP+szSWGtnQIs3xaqLjnYL+rOVhM4At6LgSAionHN5ElUNv65g7EYJPO+jOJdrN9i4dMPDe3
	EC7/jFEY4TFCGu3EYiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8g-0000000EOgT-2HRt;
	Wed, 14 Oct 2026 02:54:46 +0000
Received: from out203-205-221-202.mail.qq.com ([203.205.221.202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8Z-0000000EOdy-0v4X;
	Wed, 14 Oct 2026 02:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791946474; bh=b4ozHVcOqt/iZHojtGeuVSx2GbW78Ml/7CqGJpmtouM=;
	h=From:Subject:Date:To:Cc;
	b=OuSOOJ2CC8hsla+HQIGLA93Yg2ExXwvhtoL0Ev0zPLwOKV8YdcfeoBK1TPxM9u44D
	 Wrmdy1Zxa8OZr2RYlOIjBMgOSTF+IvXwn0hrw452MUBhoKeUhq6u0WCMzk9pBQavQk
	 hNn88Q7/9SucHLOQQJj3iKaTANwwbrGFkRSdGYc4=
Received: from ubuntu2204.localdomain ([2409:8d20:7f:35d:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id D9F194D5; Wed, 14 Oct 2026 10:54:31 +0800
X-QQ-mid: xmsmtpt1791946471tymorsemr
Message-ID: <tencent_82C93561D200C84C24608C80049C23EEF80A@qq.com>
X-QQ-XMAILINFO: NuWMYPidmbsncYYUfCbx+ODYZ/B1/OTdioH5b776hHOjXOZMZC9zLzZ5YqNiNw
	 XRWM0gmUvZbNHzcwOLcPF+OL0O85cD0Fs/+oU4zYEGrdXGUxPJRpaO3EElFstEiKIp2Jls3iKBfE
	 ia66a68XGFPZ1lxie5yR4plhLadb+WFaO0pKaz8V3ZpaH7Z/WjfcuGUjLeLlFdbLznsxqFxqUWAx
	 fzwD4RtCoN9pS05hmBw63ATq6zS/sFjheexFVNydZSqCHl/eTXeNPWrWtE+JCasyORGEREr/W74m
	 HP2CeyUfYscTuKYiTDE6lrcWG9BoJ1HMO4AF4h5yhUDAsb4S5iejDvM/zB8bqclHemu4drh52c+6
	 SCzAFUM1Z/m9wLUJfZDPvBAsxHHvmcB+gLSIQXc7F7pn07+jgYcL18OSI4tMFOlAtOKEoaWDO8b1
	 2M5hAM9GCxElFgjYeNGnyDjNslhYlaazoxFjsH+TWAIM9aiyO4neqXrm0CAePgkU2Uas2Oz0Hra1
	 x4HeIqjIpDWqzWh+3vPMJHyGYszuLgY38ZH1Cm3+ClTxYn2Gy9N60Hn8iboZoi3/pMYn/dTXwrzA
	 VlzqU5S2Oz3mhOFk2nDnzWLWQrYJEO/tNWZORY33ToB971ukRe9P+aCGG5JpCF3aii0qe/weDO+t
	 0xfwikpUrEh/HWn7j2YbdZEG83nmiYOf6f+YLynHCdhlPWptsX/BNyGyIVYrBhSbld/lQC8n7Tyf
	 lDRw1zKRdZsy5M6YgotQ9N0oDmvptFDVecZeLvLicyTuqlsz+IGr29cRggM3AXRyLh/XRpP2pZN9
	 1nOUciMeCA7Y5wSb2p+w8jx4oljQjOyX9nDT895oYsOTv/9fhx9vLpySpMNEhmVYnDIEZxM8j/qo
	 sgtsox/D3BGloq0GWjbFMpQUYL3jLlbA3xX/XBaQ/bBG5K9MNS+jEF4Utc8aibygRuiTsl8REACm
	 ObI3UWehNkLilUywJHdUbvU85tW3L0T24Pq5YLNOgEh+v+SVkQO0Efs2OcPZLW9L6eu0eSl6R3e/
	 XpCc7sJsv38SWowzXP4PVx2ASWQ/dbGPfjrQ7kiHo7ZmPxFF84lsJN8zKGjcPHst8wjLYxJRZFIg
	 jIjIf8naxwz2oWud1Eiem690fHeMS1PzJDwUMxVy/G1diOjze3ZE2E+PIbRzzTSoP0FF4iDXTOzs
	 STbweT82I06IUhoKAeUA+qXfORR3pNCvWqDqmD9dXKa/RsCrD7FEhh3BPy6agbDf/1GHWvIIuj6v
	 Xq3zAW95YWgzyM
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH net v2 0/3] can: fix bus-off restart during device close
Date: Wed, 14 Oct 2026 10:54:21 +0800
X-OQ-MSGID: <20261014-rockchip-canfd-restart-close-v2-0-c8fbdfad1803@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3uzmoC/42OTQ6CMBCFr0Jm7RhaQIMr72FYlOlU6k8LbSUaw
 t0FvIDL9/Lle2+CyMFyhFM2QeDRRuvdEuQuA+qUuzJavWSQuTyIXBQYPN2psz2SckZj4JhUSEg
 PHxm51VzVVWlEa2BR9IGNfW/6CzhO0PzK+GpvTGkVr1hnY/Lhs50YxQb/tzcKFHiUpKg0dSHJn
 IdhT/4JzTzPX7F9js7cAAAA
X-Change-ID: 20261013-rockchip-canfd-restart-close-ebde5954f1bf
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_195441_523862_E65183C6 
X-CRM114-Status: GOOD (  19.85  )
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

This work started from a real failure on a production robot using a
LubanCat-5IO with an RK3588. RX continued, but the TX queue remained
stopped and subsequent sends returned ENOBUFS. The interface still
reported ERROR-ACTIVE, and the hardware indicated neither a bus-off
condition nor a pending TX request.

While testing the echo-loss fix with fault injection, I discovered a
separate race between bus-off restart and device close. This series fixes
that race; the fix for the original TX stall will follow separately.

When automatic bus-off recovery is enabled, bringing the interface down
can race with a pending or running restart. The Rockchip driver currently
relies on close_candev() to cancel restart_work, but calls it only after
freeing the IRQ, disabling RX offload, and stopping the controller. A
restart in that interval can re-enable the controller and its interrupts
after IRQ teardown, and requeue timestamp work after it has been stopped.
That work can subsequently access registers after runtime suspend
disables the controller clocks.

The networking core clears the running flag before calling ndo_stop().
The first patch uses that flag to avoid scheduling or starting bus-off
recovery once the interface is observed to be no longer running. The
second patch adds close_candev_cancel_restart_sync() so drivers can wait
for recovery separately from the echo cleanup in close_candev(). The
third patch uses this helper at the start of the Rockchip close path.

The running-state checks do not replace synchronization with a restart
that has already passed the check. Rockchip waits for that work before
tearing down its resources, and keeps close_candev() at the end for the
final cancellation and echo cleanup. IRQ exclusion during hardware
reinitialization is retained; the shared IRQ is not disabled while the
close path waits for restart work.

I tested v2 on a LubanCat-5IO running a PREEMPT_RT kernel, using the same
setup and procedure as v1. The 1 Mbit/s CAN bus was connected to four
CANopen motors operating at 100 Hz and four sensors operating at 20 Hz.
A bitrate mismatch forced bus-off with automatic restart set to 100 ms.
The v2 campaign completed 380 valid bus-off iterations, covering automatic
recovery, close while recovery was pending, close near three delay points,
200 randomized stress iterations, manual recovery, and reopen after close.
All 380 iterations reached bus-off and scheduled recovery.

---
Changes in v2:
- Split the series into the common checks, the cancellation helper, and
  its use in Rockchip.
- Check netif_running() after the do_set_mode capability check and before
  the restart notification, echo cleanup, and carrier update.
- Only queue automatic recovery for a running interface; keep reporting
  bus-off and make the log message match the scheduling decision.
- Add close_candev_cancel_restart_sync() in linux/can/dev.h and use it in
  close_candev() without changing the existing cleanup order.
- Replace the Rockchip mutex and closing flag with an early call to the
  helper. Drop the extra close-path IRQ synchronization and mask readback.
- Retain IRQ exclusion around hardware reinitialization in the restart
  callback.
- Link to v1:
  https://lore.kernel.org/linux-can/tencent_5802EE88434010229EDF7A53084D994C6106@qq.com/

To: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: "David S. Miller" <davem@davemloft.net>
To: Wolfgang Grandegger <wg@grandegger.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>
To: kernel@pengutronix.de
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

---
Cunhao Lu (3):
      can: dev: prevent bus-off recovery when the interface is not running
      can: dev: add close_candev_cancel_restart_sync()
      can: rockchip_canfd: cancel bus-off restart before closing the device

 drivers/net/can/dev/dev.c                      | 12 +++++++-----
 drivers/net/can/rockchip/rockchip_canfd-core.c |  3 +++
 include/linux/can/dev.h                        | 12 ++++++++++++
 3 files changed, 22 insertions(+), 5 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-rockchip-canfd-restart-close-ebde5954f1bf

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


