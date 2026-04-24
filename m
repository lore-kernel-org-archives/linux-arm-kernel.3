Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D07FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:Message-id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PuNCSuhDY3aqUFt5mHJ3ZpNiytDxGYxQFnYjsTy8j+M=; b=cYROVkyRkyDO1iWes8dsLFg1Jb
	pYPs9A219F5+3taNgFu1lTBhbCnr1mbYSZiNBSS42yiJ4sE68+9L5w4ybJCwvmTwjYiD6x6Dz4YTt
	XMwS1sHDn7UYhL+ttK+gWEnqxSCQHspz34dD4zxYtLhXUN35aUnHwRtEMtiZS4N6CCA+esb6rYf9J
	jcOjRuPp65fvcDub1w1LnQWwtvt7EYjRvBLEIEr2g1rnbliBPI82mLv+pMwAM1WP16nvf7M3+Ok5A
	q+H/d7NIkK/EFAMg7iQNmyybTt0b17NdXKz1mb9FPaA8sWFC0ULwnM7cBW38k1aO0f3MiPgtUIIZq
	dOszV58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAa-0000000DozU-415L;
	Fri, 24 Apr 2026 22:38:44 +0000
Received: from acj35aaf127.lhr1.oracleemaildelivery.com ([130.35.116.127])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAW-0000000Dox4-3QqC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=PuNCSuhDY3aqUFt5mHJ3ZpNiytDxGYxQFnYjsTy8j+M=;
 b=M18F5BvUEwzKBLGJZU0io9sP+yZuw4c0sOYEum3t/NmnrWVru+yWSSJqE7p6zqk+g4++iCSt4iDq
   t3GfnpQbro9TDTJwmJhCCpBtF0PVEXkiKQlzzwbgSBr/YkLGXrtiBPZn9Fzfz0fhhCaOCaA9olCy
   TpPhJ+yYChkboumFmUJQB5JHkzmgHwSygTniUaz3cHMtz7zDK3Ohml0NOHDRsrJOF0xDqhqEZfjB
   7C+GtO3hGBePAzmAiZVwBq2mlt1dpY+VU6CD6RZBhkm7z7ijyV/LDtYXYDbnYpRyUigPxvVcXf7U
   6EmTMnKKHRMBji01aRzCme053IXd+aITMbj44g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=PuNCSuhDY3aqUFt5mHJ3ZpNiytDxGYxQFnYjsTy8j+M=;
 b=yc8n6H502MIkc6eeNOT2ij7l7WUFNO5O40b8XquHMzMphCNcN+uoaCWU37S43gzmcs6bopLRzsBd
   llKvwFH7ISwpE7YYjLiHe+0SGqYBNKC1aKGBBPQrov7ZDbbGK1UkkfnPEhqCd6dYqAAFwMHFaGhE
   2jBlK0wAyVeuJRN7r4wmu/vTj3Qbj2G0FPjGsmjtVaruep/xWjVz/+TPzQwCbE4ch4uVAF0cLfv0
   7AO4NyCvC//vH2shbYO/3OuPS8FNlYiVinvI204Czv+LmllRYgzOIvB1NT/Pga34SPdqGXuq0yk/
   DsrEriTZtUHMmoVPQ8r3+CTrDsqak/0/sFdkZA==
Received: by omta-ad1-fd1-401-uk-london-1.omtaad1.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TE000GM9S8ATKE0@omta-ad1-fd1-401-uk-london-1.omtaad1.vcndplhr.oraclevcn.com> for
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
Subject: [RFC PATCH net-next 0/3] net: macb: candidate fixes for silent TX
 stall on BCM2712/RP1
Date: Fri, 24 Apr 2026 23:38:30 +0100
Message-id: <cover.1777064117.git.lukasz@raczylo.com>
X-Mailer: git-send-email 2.53.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFzDiYTuS9jvqSCDQoXiqVnkU2yDl7DFh57yZB8VktRLO86c1eFyO5ekvNWCLwV
 PHyd9gw8WA5srfV/TRDz0HPcqN0ckK5QcJLGNRG4cjCQ32stu6Pr+z05azan5l7g
 ACfAZIRLx5MhSYhhiCoMPIW1oAg52r5A6nAbVoGAXyXwn9Rim1uNmmKWWao08MDQ
 8XDHq3AQ77lApNIg3wD2Lqew3/uHxnohKFdd1UXY0C+FAWnnaXiUcJAWNHOBpSB/
 /tVI+zdhPyc7KI8CacZfiLBR3A8l6IjaFGjg8h2/ipUYxyygA7bhS1T/cTED1AxC
 NeG8ROFcTfGrHvHzfKF5Zsccb4TRCNvk9q2w+ciZ7fBcIbJSsIIk9Sxbej3eWUKS
 i0UeApU/gx2L5xm8jkwRFIHaO9x4ZDbxWITMOmMUXyMw3OjRKLbFD0niOJevkCov gQz/RNXi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_153841_382933_F29F4A7E 
X-CRM114-Status: GOOD (  20.64  )
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

Hi netdev, Nicolas, Claudiu, linux-rpi,

This series proposes three candidate fixes for the silent TX stall
observed on Raspberry Pi 5 (BCM2712 SoC, Cadence GEM via RP1 PCIe
south bridge).  The bug has been reported, with reproducers, at:

  * https://github.com/cilium/cilium/issues/43198
  * https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877

Cilium #43198 reports reproduction on linux-raspi 6.17.0-1004, and
explicitly notes reproduction with both Cilium/eBPF and
Calico/nftables dataplanes (i.e. not CNI-specific).  We observe the
same failure mode on kernel 6.18.24 built from raspberrypi/linux
rpi-6.18.y @ f2f68e79f16f, across a 24-node Raspberry Pi 5 fleet.
The 6.17/6.18 commonality and the two-CNI reproduction together
put the root cause below the packet-scheduling layer, in the macb
driver or the RP1 PCIe path.

Observed symptoms (our side, 6.18.24; consistent with the linked
reports):

  * queue->tx_tail stops advancing at a single second;
  * /sys/class/net/<iface>/statistics/tx_packets stops incrementing;
  * qdisc backlog grows past zero; netif_stop_subqueue() is called;
  * RX counters continue advancing; the MAC IRQ line continues to
    fire (RX completions are handled);
  * no kernel log line is produced for the duration of the stall;
  * dev_watchdog does not fire: macb_netdev_ops has no
    .ndo_tx_timeout, and our reading is that trans_start is kept
    fresh by successful xmit prior to the ring filling;
  * recovery on our side has required `ip link set <iface> down/up`
    via an out-of-band watchdog DaemonSet.

Reading the current driver we identified three plausible races
between driver and hardware, each of which could independently
produce the observed behaviour.  We did not determine which is the
actual root cause -- that likely requires either BCM2712/RP1
documentation we do not have, or dynamic tracing of the driver
during an in-situ stall.  The series therefore attempts to close
all three, with each commit message stating which specific race
that patch is targeting.

  Patch 1/3 -- flush PCIe posted write after TSTART doorbell.
  Writes to NCR are posted PCIe writes and may not reach the MAC
  before the driver returns.  If the TSTART doorbell is lost, no
  TX starts, no TCOMP arrives, and the ring goes quiescent.  A
  read-back of NCR after the write is a standard read-after-write
  PCIe flush.

  Patch 2/3 -- re-check ISR after IER re-enable in macb_tx_poll().
  An existing comment in macb_tx_poll() notes that completions
  raised while TCOMP is masked do not re-fire when IER is
  re-enabled, and mitigates the window with macb_tx_complete_pending(),
  which inspects driver-visible ring state only (after rmb()).  On
  PCIe-attached parts the descriptor DMA write that sets TX_USED
  can remain in flight when that check runs; the rmb() orders CPU
  writes but does not retire peripheral DMA.  Reading ISR directly
  after IER re-enable addresses this in two ways: (a) the MMIO read
  is an architected PCIe read barrier for prior DMA writes, so a
  subsequent macb_tx_complete_pending() sees up-to-date TX_USED
  state; (b) it directly observes a pending TCOMP bit if the
  hardware has one set.  Either signal reschedules NAPI.

  Patch 3/3 -- TX stall watchdog.  Defence-in-depth.  If patches
  1 and 2 close the races we identified, this patch performs a
  single spin_lock_irqsave/unlock and a branch per queue per
  second with no other effect.  If a further race remains that we
  have not identified, it invokes the driver's own existing
  macb_tx_restart(), which already verifies that TBQP is behind
  tx_head before re-asserting TSTART.  We include this patch
  because we have empirically observed multi-minute stalls on this
  hardware; we are willing to drop it if the preference is for
  1 and 2 to stand alone.

Status and testing:

  * Apply-tested against Linux net-next HEAD (this series is
    generated from it) and against raspberrypi/linux rpi-6.18.y @
    f2f68e79f16f (the fork our fleet runs): all three apply
    cleanly on net-next; the rpi fork carries an additional local
    `bool tx_pending` field on `struct macb_queue` that is not in
    mainline, so we maintain a small rebased patch 3 hunk for it.
  * Build-tested: the series compiles cleanly as part of our Talos
    image build pipeline on arm64.
  * Runtime-tested, early signal: ~4 h 20 min of post-patch uptime
    on the canary node, ~3 h 15 min on the slowest (last master to
    upgrade), ~95 node-hours cumulative across the 24-node fleet at
    the time this cover letter was written.  During that window the
    fleet-wide counts are zero RECOVER events, zero `[tx-stall]`
    partial markers (an out-of-band userspace detector that records
    even transient one-second freezes that recover before the
    3-second threshold), and zero ping-failure markers.  Pre-patch
    reference window (2026-04-24 14:00-18:10 UTC, when proper
    monitoring was in place) observed multiple stalls per hour at
    fleet level; at that rate we would expect on the order of 50
    stalls in 95 node-hours, actual is zero.  We will follow up
    with a 24 h and a 1-week data point as the same observability
    runs forward; the direction so far is consistent with patches
    1 and 2 closing the underlying race(s) and patch 3 correctly
    being a no-op on healthy hardware.

The series does not depend on any other in-flight work we are
aware of.  Happy to split, rebase, or drop individual patches on
feedback.  All three are independently revertable.

Lukasz Raczylo (3):
  net: macb: flush PCIe posted write after TSTART doorbell
  net: macb: re-check ISR after IER re-enable in macb_tx_poll
  net: macb: add TX stall watchdog as defence-in-depth safety net

 drivers/net/ethernet/cadence/macb.h      |  5 ++
 drivers/net/ethernet/cadence/macb_main.c | 99 +++++++++++++++++++++---
 2 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.53.0


