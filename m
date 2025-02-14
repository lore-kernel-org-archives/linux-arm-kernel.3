Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A37C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 05:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnKTlw39qH8JSpFApJ+4dgvKkZCH/SzyZ+KIEqkl59c=; b=l6xzyvumLa6Zm/GMaL+R2A83ud
	XkzALFgmwjY/ZOt+unKzW+ptXSXr+pMcJB63a3u4l4bvZw2SIajzId1pZ1oWSydI3q1BCkJsl926B
	+XvnScPucDWpN6PzmA32FnCdYDtoi9S4XO9iIZeze4MP8gLqllBeVTiCE66N2c49pyZh0AbrjeQKY
	9Q9uA+2evzaEYaWolXXz+gMUFJG3oooiEIOUKb8vlOyrXVuwNnAG9QUnPt+qs5ovcpq5v+OEgA+Xy
	bwsB9UzxDrYi5b74w8+4Qrvc7sBr9i1tEVTVkpUkvUjxJlriw7LAAFJWR1qy+nCtsnMVJBLTA2rR6
	YC7iunuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tioa9-0000000Djqa-2qWp;
	Fri, 14 Feb 2025 05:49:45 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tioYi-0000000DjYC-27l4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 05:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MnKTlw39qH8JSpFApJ+4dgvKkZCH/SzyZ+KIEqkl59c=; b=Mw2L+2sluXcjYqn5M4hXah2CNk
	gJ4H5NH0obxWcyxmz4a17eNR+1YkkM7aQjqC5Zk2RWrUEgKKxr8TOFDPDULm4EvF2sQaNhPWTwvXh
	FNFznwJ9GjFV3wUAS3xL8Fke61wN8z9qvY/DYeIXuF2T/6ALiaZj+jxltUkvieE0Ik7n6j7pm8EFc
	55+s+csnGZ+AyC+2okDY0ZPfc6zo4TnWv/kpPaIOHfR7kcXR3yfOXfn49YNAAslrLaFqM54XkpHaW
	4BsTlA9QnousLDeK+HCtZ4X2dFSox9bBhu9mujdXtQze931fvQooPSTg7tSB1d+YzfVVHrpt1yIA3
	ptNj0svg==;
Received: from [122.175.9.182] (port=5380 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <parvathi@couthit.com>)
	id 1tioXy-0001hH-1G;
	Fri, 14 Feb 2025 11:17:30 +0530
From: parvathi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	richardcochran@gmail.com,
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	diogo.ivo@siemens.com,
	m-karicheri2@ti.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
Date: Fri, 14 Feb 2025 11:16:52 +0530
Message-Id: <20250214054702.1073139-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_214816_568345_001A4DDE 
X-CRM114-Status: GOOD (  16.60  )
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

Hi,

The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
Megabit ICSS (ICSSM).

Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
fundamental components/drivers such as PRUSS driver, Remoteproc driver,
PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
Linux kernel. The current set of patch series builds on top of these components
and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
the TI AM57xx devices.

TI AM57xx series of devices have two identical PRU-ICSS instances (PRU-ICSS1
and PRU-ICSS2), each with two 32-bit RISC PRU cores. Each PRU core has
(a) dedicated Ethernet interface (MII, MDIO), timers, capture modules, and
serial communication interfaces, and (b) dedicated data and instruction RAM as
well as shared RAM for inter PRU communication within the PRU-ICSS.

These patches have a dependency on an SOC patch, which we are including at the
end of this series for reference. The SOC patch has been submitted in a separate
thread [2] and we are awaiting for it to be merged.

These patches add support for the following features:
- RX and TX over PRU Ethernet ports in Dual-EMAC mode
- Full duplex with 100 Mbps link speed.
- VLAN Filtering
- Multicast Filtering
- Promiscuous mode
- Storm prevention
- Interrupt coalescing
- Linux PTP (ptp4l) Ordinary clock

Further, note that these are the first set of patches for PRU-ICSS2 Ethernet.
Switch mode support, PRU-ICSS1 support, PRU Ethernet for AM437x and AM335x in
Dual-EMAC and Switch mode support with full feature set changes will be posted
subsequently.

The patches presented in this series have gone through the patch verification
tools and no warnings or errors are reported. Sample test logs verifying the
functionality on Linux next kernel are available here:

[Interface up Testing](https://gist.github.com/ParvathiPudi/f481837cc6994e400284cb4b58972804)

[Ping Testing](https://gist.github.com/ParvathiPudi/a121aad402defcef389e93f303d79317)

[Iperf Testing](https://gist.github.com/ParvathiPudi/581db46b0e9814ddb5903bdfee73fc6f)

[1] https://lore.kernel.org/all/20230106121046.886863-1-danishanwar@ti.com/
[2] https://lore.kernel.org/all/20250108125937.10604-1-basharath@couthit.com/


This is the v3 of the patch series [v1]. This version of the patchset
addresses the comments made on [v2] of the series.

Changes from v2 to v3 :

*) Addressed Conor Dooley comments on patch 1 of the series.
*) Addressed Simon Horman comments on patch 2, 3, 4, 5 and 6 of the series.
*) Addressed Joe Damato comments on patch 4 of the series.
*) Rebased the series on latest net-next.

Changes from v1 to v2 :

*) Addressed Andrew Lunn, Rob Herring comments on patch 1 of the series.
*) Addressed Andrew Lunn comments on patch 2, 3, and 4 of the series.
*) Addressed Richard Cochran, Jason Xing comments on patch 6 of the series.
*) Rebased patchset on next-202401xx linux-next.

[v1] https://lore.kernel.org/all/20250109105600.41297-1-basharath@couthit.com/
[v2] https://lore.kernel.org/all/20250124122353.1457174-1-basharath@couthit.com/

Thanks and Regards,
Parvathi.

Murali Karicheri (1):
  net: ti: prueth: Adds support for RX interrupt coalescing/pacing

Parvathi Pudi (1):
  dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for
    AM57xx SOCs

Roger Quadros (8):
  net: ti: prueth: Adds ICSSM Ethernet driver
  net: ti: prueth: Adds PRUETH HW and SW configuration
  net: ti: prueth: Adds link detection, RX and TX support.
  net: ti: prueth: Adds ethtool support for ICSSM PRUETH Driver
  net: ti: prueth: Adds HW timestamping support for PTP using PRU-ICSS
    IEP module
  net: ti: prueth: Adds support for network filters for traffic control
    supported by PRU-ICSS
  net: ti: prueth: Adds power management support for PRU-ICSS
  soc: ti: PRUSS OCP configuration

 .../devicetree/bindings/net/ti,icss-iep.yaml  |    4 +-
 .../bindings/net/ti,icssm-prueth.yaml         |  147 +
 .../bindings/net/ti,pruss-ecap.yaml           |   32 +
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |    9 +
 drivers/net/ethernet/ti/Kconfig               |   24 +
 drivers/net/ethernet/ti/Makefile              |    5 +
 drivers/net/ethernet/ti/icssg/icss_iep.c      |   42 +
 drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  357 +++
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 2418 +++++++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  437 +++
 .../net/ethernet/ti/icssm/icssm_prueth_dos.c  |  225 ++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.c |  312 +++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.h |   47 +
 .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |   85 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |  285 ++
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   |  120 +
 drivers/soc/ti/pruss.c                        |   77 +-
 include/linux/pruss_driver.h                  |    6 +
 18 files changed, 4630 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_ethtool.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ecap.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ecap.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switch.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h

-- 
2.34.1


