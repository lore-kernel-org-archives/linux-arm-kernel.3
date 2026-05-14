Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D970CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0VxplqXo7KwodoVFRokARH6ngjpKYSLboSPOiip+Ho=; b=3LES7x9JNFzANFUj1ofo6coKiZ
	uHeu6vyDavxOXcZwgn+JDkcVghNAL/8XYQehN7ZhxXk5oeVtdWSeDu18yJOf8Uz0vn6dV91f69flm
	agbYM4TXCIh/Ozaz+0170JymFDlwZUtoONtXjl73pENTV+1LIVaLULClikw96O9xWIlnHDD1YqMOl
	VOctmrjuBwzxBYvvjeRelWGPFmyZfmTcrpUfGyOEJfM4I9SIaet2LIqb1Wg//3wkN7so2bnGUdADW
	gnvsqHd33cRBavIpadV7G0Mmfi9mOU6PLvXoBdiZcTc8fi0QIKrbValsYoYqsrvqGK3wRWGtt5+Ae
	H+cjDNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1N-00000006eNJ-0Tmi;
	Thu, 14 May 2026 21:55:09 +0000
Received: from acj35aaf124.lhr1.oracleemaildelivery.com ([130.35.116.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1H-00000006eIa-0oCD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=Y0VxplqXo7KwodoVFRokARH6ngjpKYSLboSPOiip+Ho=;
 b=GTFaoDXN6WjOeEWVUoIvbB3hT0iWfM+KEKEozzbcwfqvyQi5KnfxLoH+1saSui+8Er1nlLRVURL1
   wYlFky/MSGmMwSXOsZLketdxYPckfKCLvwcY6553CugttJhjpkKvEtSimKRVJ0cITuuPooyvjFXz
   yA4v6hMXF2Pm/k2K7sfDlTEYGxrqRlZvvMcvr6SVAdhrI4uPfI9nQFXrfDAIaPDAFr5/DamKo4Kf
   jgv9u74egehKGcKiJNxjipNplLRtr5cBaUI2lEZ5Lj5Wt+s22ePNekrYioq0CQmD4gl/oJfd1ZZA
   QC0MdSV4p2X3XZgG8bfYEZiJAU7RQwuM8oV1BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=Y0VxplqXo7KwodoVFRokARH6ngjpKYSLboSPOiip+Ho=;
 b=jLEEuD1qT2YIpedOpn4KeLz8SjBZwLIqx2a8xhltKSer5xLVXzUC+4vwKg1v9ZIfV83PVQ1hoYmh
   HNWvw7YCX9e2zvO5RsBFQrVzRpZQ2XR4z2q2du3lL6N1VxQeoIZkKRC5W0B8bWSmrf5Ua3ReiLO5
   +QLrzLpnPHLmlAlY2GE4Rkr0rgjxN/Qd80q+geg74mlp7Kt+nMeoO3RiqwGiUmQ5gyv+l/vyRyDl
   3Y38bKiUvqpFeiTn3kg3VObwnhHcdr0GJqoTcuHSAUD5Tm94MFVY369Eht5kZDQhqkg9CX6rLU7U
   pCs6qQoKu01UhkRGh/S2XOVpPoFhrsWRCGQ1Ug==
Received: by omta-ad1-fd3-1401-uk-london-1.omtaad1.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF105VCWRJO1H80@omta-ad1-fd3-1401-uk-london-1.omtaad1.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Thu, 14 May 2026 21:55:00 +0000 (GMT)
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
Subject: [PATCH net-next v2 0/3] net: macb: candidate fixes for silent TX stall
 on BCM2712/RP1
Date: Thu, 14 May 2026 22:54:56 +0100
Message-id: <20260514215459.36109-1-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <cover.1777064117.git.lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAHf+Z0YX8zBMsksb6gSGL9ZV3VCbo9am2PhbSO1iipMaVnbSZPP4U7YWpbXzRHK
 g669lhZ1JQctwueluqldYAuNG1sS6Qw9c21KnqmfGFGUFhGFDqaupwBJaYAnJbU7
 RiJimMiIBAzYDbBuaLmUvBPYeliuxxZU6sEfxPXNnFnGsPr02AN3OVvG8NiNdheX
 1pB/jzpViBpW5Y1/QQG5Aj1ZN+j4YZgiX9u0rh45FWoVZggovghdbJsuL6paGAFR
 /EMVzDAKfJpuMeTk9Ik+/tUdIhiGKlRLAg2i4OUlnI03sW2rgP501mQ9/dV5Cf1u
 0dJGSZY+aiiBTzVvkNFkkzrEO7OmzdfbhrlMO0vncPVjoPpya4/zednjFXOLym0h
 0CzLmYw/ixQ+BfHqTIJIDSSFyBNKZEoNvef/b/sOgSwgxbHY//6tbAKWH7UcCnFi xwjY91/O3Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_145503_237555_F35CFB24 
X-CRM114-Status: GOOD (  16.58  )
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

Hi netdev, Théo, Andrea, linux-rpi,

v2 of the silent TX stall series.  The v1 RFC sits at:

  https://lore.kernel.org/netdev/cover.1777064117.git.lukasz@raczylo.com/T/

Reframing first.  The v1 cover claimed "zero events post-patch";
that was true at the user-space watchdog visibility level only.
A dmesg sweep prompted by Andrea's review -- with patch 3's warn
made unconditional, per his ask -- revealed kernel-level evidence
that patches 1 and 2 are partial at best.  Patch 3 is empirically
the load-bearing fix on this platform: it caught and recovered a
real lost-TCOMP stall on pi-data-02 at 2026-05-05T13:24:09Z
(queue 0, tail=259564431 head=259564433 after ~260M TX, HW
ETHS tx_frames counter advancing through the event while driver
tx_tail did not) without user-space involvement.

So the v2 narrative reads:

  * Patch 1 (PCIe posted-write flush) and patch 2 (PCIe read
    barrier before descriptor check) close two specific
    candidate races in the TSTART / TX_USED paths.  Plausible
    and well-motivated, but I cannot prove either fires in
    isolation on this hardware -- my 1 Hz trace shows TX
    freezes, not which mechanism caused them.

  * Patch 3 (TX stall watchdog) is the safety net that
    empirically does the recovery work.  13 days of production
    runtime on 24 nodes since 2026-05-02 in the same form
    (anchored against the rpi-6.18.y vendor fork, in
    raspberrypi/linux#7340 -- merged 2026-05-08 after review
    feedback from pelwell that this v2 incorporates).

The v1 cover's "zero stalls in 95 node-hours of post-patch
uptime" framing was misleading.  Apologies for that.

## What changed in v2

Patch 1 (PCIe posted-write flush after TSTART doorbell):
  * Gates the readback behind a new MACB_CAPS_PCIE_POSTED_WRITES
    capability, set only on raspberrypi_rp1_config.  v1
    applied the readback to every macb variant; SoC-integrated
    parts (Atmel, Microchip, SiFive, Xilinx) have no posted-write
    fabric and were paying the readback latency for no benefit.
  * Commit message notes that the readback also flushes the
    preceding macb_tx_lpi_wake() NCR write on the same path --
    not just TSTART -- since it functions as a PCIe read barrier
    for all prior posted writes by the same requester.

Patch 2 (PCIe read barrier before TX completion descriptor check):
  * Dropped the ISR read.  v1 read ISR in macb_tx_poll() with
    `queue_readl(queue, ISR) & MACB_BIT(TCOMP)`; that's
    destructive on RP1 silicon (MACB_CAPS_ISR_CLEAR_ON_WRITE
    is not set on raspberrypi_rp1_config; the existing handler
    assumes read-clear semantics and processes every bit
    returned from queue_readl(queue, ISR) in one pass).  v1's
    masked-and-discarded read silently consumed any other bit
    set in ISR at that instant -- RCOMP being the worst case
    (RX completion never scheduled until the line re-asserts).
  * v2 substitutes `(void)queue_readl(queue, IMR)` -- IMR is
    the read-only interrupt mask mirror, no side effects, still
    flushes prior peripheral DMA writes via PCIe completion
    ordering.  Loses the "directly sample latched TCOMP" half
    of v1's claim; keeps the PCIe-barrier half, which is the
    half that addresses the documented race in the existing
    macb_tx_complete_pending() rmb() comment.

Patch 3 (TX stall watchdog):
  * Tail movement is tracked via a `bool tx_stall_tail_moved`
    set by macb_tx_complete() under tx_ptr_lock when tail
    advances, and cleared by the watchdog tick on the same lock.
    v1 snapshotted tx_tail and compared between ticks; while
    that worked correctly given tx_tail is free-running u32,
    the bool form is unambiguously cleaner, doesn't depend on
    counter behaviour, and is what pelwell asked for when he
    reviewed the same series on the rpi side
    (raspberrypi/linux#7340).
  * netif_carrier_ok() gate added at the top of the watchdog
    tick.  Eliminates the boot-time false positive seen in v1
    where, between macb_open() and link-autoneg-completion,
    queue->tx_head can advance from kernel-queued packets while
    tx_tail stays at 0 (no TCOMPs yet), tripping the snapshot
    check.  Observed 6 such fires during a 2026-05-02 fleet
    rolling reboot.
  * netdev_warn_once -> netdev_warn_ratelimited.  v1's
    netdev_warn_once made operational accounting impossible
    after the first fire on a given netdev; ratelimited keeps
    bounded log noise but lets operators count events.  Andrea
    asked for this directly.

Patches 1 and 3 are independently revertable.  Patch 2 v2 is a
two-line readback before an existing check; trivially revertable
in isolation, semantically dependent on the existing
macb_tx_complete_pending() recovery path that it strengthens.

## What I haven't done

  * TSO+SG-off canary.  rtheobald (cilium#43198 #4188846955)
    and the launchpad #2133877 commenter (#34) both report
    TSO+SG-off *together* mask the stall; my matrix has TSO+GSO
    tested off, not TSO+SG.  Happy to canary-test this on one
    node if reviewers want the data point before deciding which
    of patches 1/2 the SG path actually exercises.

  * Per-patch isolation testing.  All three deployed
    simultaneously on the 24-node fleet; I cannot independently
    prove patch 1 or patch 2 does anything on its own.  Patch 3
    has direct production evidence (lost-TCOMP recovery
    described above).  If reviewers want a bisection-style
    canary I can stagger one-patch / two-patch / three-patch
    nodes for >=1 week each.

## Status and testing

  * Mainline-anchored:  v2 builds clean against current net-next
    HEAD, applies cleanly.  Boot-tested and brief-sanity in a
    canary build before this send.
  * raspberrypi/linux rpi-6.18.y anchored equivalents:  in
    production on 24 nodes since 2026-05-02 (now 13 days); in
    raspberrypi/linux master since 2026-05-08 (6 days).
  * The v2 patch 2 IMR-barrier form was rolled to all 24 Pi
    nodes earlier today (2026-05-14, ~14:00 UTC) as a
    vendor-fork-anchored update.  ~120 cumulative node-hours
    of runtime since: zero mid-runtime TX stalls; zero user-space
    watchdog RECOVER events.  Cover-letter-thread reply with
    detail accompanies this series.

The series does not depend on any other in-flight work.  Happy
to split, rebase, drop, or restructure on feedback.

Lukasz Raczylo (3):
  net: macb: flush PCIe posted write after TSTART doorbell (PCIe-only)
  net: macb: insert PCIe read barrier before TX completion descriptor
    check
  net: macb: add TX stall watchdog to recover from lost TCOMP interrupts

 drivers/net/ethernet/cadence/macb.h      | 14 ++++
 drivers/net/ethernet/cadence/macb_main.c | 95 ++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

-- 
2.54.0


