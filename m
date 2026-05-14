Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179B3CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zytAQkalIZDBrKG7HNFd87+dd8k5KjA5x/4SFOlRADY=; b=PuvLSB8fwYE/LHnLIv+7YG1KZq
	1bCZpw1MCUf9PW7NrxVYOe7eGnn/nPUm43HvMq65nF8BUEFCdP48WQDfp7l4Z2aAYiSPQ1dbK/qvq
	zrrEAn5r9fvE6FWICA5WtAoTOWM4RvbnJviZubHA3PShvm6eIUrJPaAq2wArQ+PsoAhWNwzuvz9/6
	4DK0/We95A68CwGbAOoN9zaiwIy4Wdh7v2qX0m38yb4UhgJXzTUFC0KzDfwtG76mMaXl5yXyuyHH5
	S4j6zCQ1x3/OJeRXlDTibv7IvtzpIHXz5PydRGOuGAuTedyA4gb7+UsvGLLT+yuiYo4D2x41k8ANv
	223lbJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdy0-00000006dmZ-2X6S;
	Thu, 14 May 2026 21:51:40 +0000
Received: from acj35aaf123.lhr1.oracleemaildelivery.com ([130.35.116.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdxw-00000006dl0-3sDx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=zytAQkalIZDBrKG7HNFd87+dd8k5KjA5x/4SFOlRADY=;
 b=hxZ+9xzf0kAQllVdc9jXABa8UTJN2ZsqEuU9DIwgrHPRCxFb9MJq49HG37oqDGyf5LN5Oy+Siwra
   pbZ2WmY1kmJAJUrFp8ukvPAyQsICpSIPfbYSorybF/lmBPUKL4Xn721N1rKIWQ1ShYBequ9fYRtN
   DxVbPL0uMKk+hG4nAHYkn8EsNZNcnx6kAaoHJsybaw2VuIHJBgyO9aOhDaoK4kS97HvrahdA2OmG
   9bbjNHsSj563x8Ryr5TMCAAdLcF7b66uluJzmRgLgJeWtx5MLlhC58T5FmlgijpBhiHfE4AyHYyS
   dcyMPW6twzFkPOZEDpdEdWSiqjpu9Nx9CJze6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=zytAQkalIZDBrKG7HNFd87+dd8k5KjA5x/4SFOlRADY=;
 b=xijZHh1K0Ll0m3dP7tbHU39uBsvxI5yE6mmmsoFXrt25cLTtUhCgRWoUAmZflGyE5znS753IPNfy
   gvjxlTImBqqiXFaodT0iTBWoF+QCzAoXsjcfePk4ICazD84qtBTsHTxZjghjZn2HVoLqG+DF++td
   dMJlTDUHCog+PIJS5PzZJJD2wLQ8G3sHVLjlf45edN9BMKJX8UNVkHZ9J61e3OT3gyXPMrabsJq9
   4udHIwaNcfaVJhY1x7/VbHBgwGHZpZeT4P/UvT1UJHj4sUqRs+eZFhprd1T8J9uoxPlp61x/jF4+
   mtIYoqMvqClWvlG7GURo5x4B+Kw2m+28i6sAdA==
Received: by omta-ad2-fd1-1401-uk-london-1.omtaad2.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF116P2LRDVOV90@omta-ad2-fd1-1401-uk-london-1.omtaad2.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Thu, 14 May 2026 21:51:31 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: Re: [RFC PATCH net-next 0/3] net: macb: candidate fixes for silent TX
 stall on BCM2712/RP1
Date: Thu, 14 May 2026 22:51:29 +0100
Message-id: <20260514215129.33559-1-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <cover.1777064117.git.lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAF8Kp2gGUnFKGIyrDw9wVbSVsYvduq9aPUjTQJs1LwRIXNFCb2jTFY/DkgZ45l6
 wryQXW8fC4CLX28S2PcGVvYYdB9UgtQ5lsJ0Sz576SSQMVgWg+c5hUHojrr2auvr
 qsHqp3TE5w2TxO/UIzKI0ARkFP10Gj5Hr63Isi9CLw+5Yrss3yCJqt3HX5eVfZ5R
 2BprxBpMRm2HPbgnm8zuvPdNyQnWcrrVioa26TsMbKrN515ZB0qgX1dKLyr2XtlO
 F9K7ukv4BcqMN9P4qHsreZlHmmjeI+/oBQws13cv/QAa7e/HS6snF5U12grPOOsw
 lR2vnYV2TuIsoBxo628PZyY9JxpBy6Xa/nYGG3AEHfHfTfWkUDIfOb+jV4SA0TvH
 gdFZhLzi3YNM3j+TUGhUVT4t/LDv5yr7t9Bgh9Adq3pDrzowZ6fh2TFHJzrm6RjB RSpm900CQg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_145138_118800_A4B01A3C 
X-CRM114-Status: GOOD (  19.63  )
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

Andrea, Théo --

Thanks both.  Replying to multiple points in one mail since they
intersect.

First a correction to the v1 cover: the "zero events post-patch"
claim was true only at the user-space watchdog visibility level.
With patch 3's warn made unconditional (which is what Andrea's
review re-tested with on v6.19.10), kernel-level evidence on my
side now matches what Andrea saw -- patches 1 and 2 are partial,
patch 3 is empirically the load-bearing fix on this platform.
The v2 cover acknowledges this and reframes.


## Andrea -- patches 1 and 3

Concrete data from a dmesg sweep across the 24-node fleet
(macb-v2 image, 2026-05-02 to 2026-05-05, 6.18.24 + this series
with netdev_warn_once swapped to netdev_warn):

  * 1 mid-runtime real stall, pi-data-02 2026-05-05T13:24:09Z,
    queue 0, tail=259564431 head=259564433 (2 stuck descriptors
    after ~260M TX).  HW ETHS tx_frames counter advanced through
    the event (~1535 fps mid-stall); driver tx_tail did not.
    Patch 3 watchdog re-kicked TSTART; user-space watchdog
    logged zero RECOVER events for that window -- kernel-level
    recovery completed before user-space noticed.  Consistent
    with the lost-TCOMP pattern.

  * 6 boot-time false positives during the 2026-05-02 rolling
    reboot, all tail=0 head=5-7.  Patch 3 v1 has a real bug:
    tx_stall_last_tail is initialised to tx_tail (=0) at
    macb_open(), first tick fires at +1000 ms; if autoneg
    hasn't completed by then, tail is still 0 from no-TCOMPs
    while head moves from kernel-queued packets, false stall
    fires.  v2 fixes this (details below).


## Théo -- the four questions on the cover

Welcome to macb maintenance.  Quick answers; raw 1 Hz traces,
dmesg dumps, and event logs available on request for any of
these.

  1. Tx-only or Tx+Rx broken?

     Tx-only at the MAC counter level.  Per-node 1 Hz trace
     captures the same signature on every wedge:
     /sys/class/net/end0/statistics/tx_packets freezes at a
     single second, rx_packets continues to grow, MAC IRQ
     counter (on the assigned CPU) continues to advance,
     NET_RX softirq counter continues to advance.  The
     "broken Tx & Rx" reports (lexfrei et al on cilium#43198)
     are the user-space symptom: TX dead -> TCP can't ACK ->
     nothing comes back -> looks bidirectionally dead from
     applications.  At the MAC counters the asymmetry is
     unambiguous.

  2. Recovery: link down/up vs module reload vs power cycle?

     On any system that's still otherwise responsive, link
     down/up suffices and is the lightest known recovery.  My
     user-space watchdog has run that primitive on 24 nodes
     for ~3 weeks; ~6-10 s wedge-to-Ready, every time.
     `modprobe -r macb && modprobe macb` (rtheobald) is a
     heavier-weight equivalent of the same thing -- works but
     unnecessary if link-toggle alone fixes the silicon state.
     "Power cycle only" (lexfrei) was on Ubuntu raspi 6.17 with
     the ondemand governor + frequent RCU stalls preceding the
     wedge (per launchpad bug body's "KEY OBSERVATION" section);
     my read is that case escalated past clean NIC freeze into
     kernel-wide unresponsiveness, so a NIC-level recovery
     couldn't reach it.

  3. TSO / SG / EEE disabling helped some reporters?

     Mixed picture, with one gap in my matrix.

     Tested fleet-wide since 2026-04-24 as baseline before this
     series:
       * EEE off (--set-eee end0 eee off + advertise 0x0)
       * TSO off (-K tso off)
       * GSO off (-K gso off)
       * RX/TX rings 4096/2048 (default 512)
       * IRQ affinity moved off CPU0 to CPU3
       * CPU governor schedutil (default) -- earlier tested
         performance, no change
       * qdisc fq -> pfifo_fast

     With all of those, the stall still fires.  Pre-patch
     fleet rate was multiple per hour with these knobs already
     applied.

     Untested by me: TSO + SG (scatter-gather, NETIF_F_SG) off
     *together*.  That is the specific combination rtheobald
     (cilium#43198 comment 4188846955) and the launchpad
     commenter (#34) report as masking the stall -- "must be
     both, not just one".  I tested TSO + GSO, not TSO + SG.

     Both patch 1 (PCIe-fabric race on TSTART) and patch 2
     (peripheral DMA retirement race on TX_USED) are
     consistent with descriptor-fragment-path interactions
     that SG-off would mask, so the workaround being real
     isn't surprising.  Closing the race rather than masking
     it should still be the right thing for mainline.  Happy
     to canary-test TSO+SG-off on one node if you want the
     data point before v2 review.

  4. cdns,*-max-pipe DT props -- lead dead?

     Yes, dead, per the commenter who pursued it (launchpad
     #2133877 comment #30, April 2026): they patched mainline
     6.18.18 to add the device_property_read calls for
     cdns,ar2r-max-pipe / cdns,aw2w-max-pipe / cdns,use-aw2b-fill
     *and* added those properties to bcm2712-rpi-5-b.dts; ran
     a few hours; their own follow-up: "this is a dud" -- node
     hung anyway.

     For reference, my build (raspberrypi/linux rpi-6.18.y @
     f2f68e79f16f) has the driver-side reads present but the
     DTS does not set the properties, so the AMP register
     defaults are in effect on my fleet and the bug still
     fires.  Two independent confirmations the DT props are
     not the fix.


## My own audit -- two issues v2 fixes

Worth disclosing before someone else catches them.

  * Patch 2 (v1) reads ISR in macb_tx_poll(), masks off
    everything except TCOMP, and discards the rest.
    raspberrypi_rp1_config does not set
    MACB_CAPS_ISR_CLEAR_ON_WRITE -- the driver assumes
    read-clear ISR semantics on RP1, and macb_interrupt()
    relies on processing every bit it reads in one pass for
    that case to be correct.  My v1 patch breaks that contract:
    any RCOMP / ROVR / TXUBR / etc. set in ISR at the moment of
    my read is silently consumed and never processed.  RCOMP
    being lost is the worst case (RX completion never scheduled
    until something else asserts the line).  Race window is
    ~200-500 ns per macb_tx_poll completion; significant at
    moderate-to-heavy RX load on a level-triggered IRQ where
    the consumed bit drops the line before GIC delivery.

    v2 patch 2 drops the ISR read entirely and substitutes
    (void)queue_readl(queue, IMR).  IMR is the read-only mask
    mirror, no side effects, still flushes prior peripheral
    DMA writes via PCIe ordering.  Loses the "directly sample
    latched TCOMP" half of v1's claim; keeps the PCIe-barrier
    half (which is the half that actually addresses the
    documented race in the existing macb_tx_complete_pending()
    rmb() comment).

  * Patch 3 (v1) boot-time false positive described above to
    Andrea.  v2 fixes:

      - netif_carrier_ok() gate -- no carrier, no completion is
        possible, don't fire.

      - tracks tail movement via a bool tx_stall_tail_moved set
        by macb_tx_complete() under tx_ptr_lock when tail
        advances, cleared by the watchdog tick on the same
        lock.  Form suggested by pelwell when he reviewed the
        same series anchored against rpi-6.18.y at
        raspberrypi/linux#7340 (merged 2026-05-08); 13 days of
        fleet runtime in this form since 2026-05-02 across 24
        nodes.  Folded into mainline v2 patch 3 directly rather
        than carried as a fix-up.

      - netdev_warn_once -> netdev_warn_ratelimited per
        Andrea's ask -- operator visibility doesn't disappear
        after the first fire.


## v2 follows

Sending [PATCH net-next v2 0/3] threaded under the v1 cover
shortly.  Plan to drop "RFC" from the subject prefix (~3 weeks
production runtime + the rpi in-tree merge tip the balance
toward a regular PATCH); happy to revert to RFC if you'd
prefer the iterative-review cadence.

Tested-on context for v2:
  * mainline-anchored:  builds clean against current net-next
    HEAD, applies cleanly.  Boot-tested in a canary build of
    my Talos image before this reply.
  * rpi-6.18.y-anchored equivalents:  in production on 24 nodes
    since 2026-05-02; in raspberrypi/linux master tip since
    2026-05-08.
  * The v2 patch 2 IMR-barrier form (the one that fixes the
    destructive ISR-read regression described above) was rolled
    to all 24 Pi nodes earlier today (2026-05-14, ~14:00 UTC) as
    a vendor-fork-anchored update.  ~120 cumulative node-hours
    of runtime since:  zero mid-runtime TX stalls; zero user-space
    watchdog RECOVER events; the 5 dmesg "TX stall detected" lines
    are all boot-time false positives of the form `tail=0 head=N`
    that the new `netif_carrier_ok()` gate in patch 3 eliminates.
    Pre-patch baseline rate (~0.5 stall/node-hour at fleet level)
    would have predicted on the order of 60 mid-runtime stalls in
    that window; observed is 0.

Thanks again to both for the review.

--
Lukasz Raczylo

