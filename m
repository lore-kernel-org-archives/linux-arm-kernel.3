Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A67C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5XHNe8oOB0gsqQQ8On08cayA7EoMhm1xoXWTH+FmOe8=; b=XcDlfTNWSTXu3olVUlc6nBe8ca
	16SiJrvH7VUbLJIE1+TdX6FIHwzEnsy2U3fJjdYI0I68N9CRLEGSdQPAqfA3QEgU/2Dp9HJwqH/He
	5vi1gjh5nUhlFuoWziDakXMyzUyvrqoRJnlDWddkQFAxXvAWHJ9KjZ97nP9X4n4BXnqUhqKaMAMdL
	Dwn5G3uMQd6qtokBw+ZtaByBlV+di+k3Lr7/fXN6/i6n9PCCQYkKLErOPoJJlNkWUGw5xWSFyPcGs
	D5yGE4vRhHwJdW1UXDMzmdyCJsZaeAm8mLSXVn2PH9yaCMn8dWfGpvHJBigU1Q51zHBpePEuuIw/B
	O92cwMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbImB-0000000EeVt-1eRT;
	Fri, 24 Jan 2025 12:27:07 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIkp-0000000Ee6X-2ogG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 12:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5XHNe8oOB0gsqQQ8On08cayA7EoMhm1xoXWTH+FmOe8=; b=hgzYnOzCr4YeL9Tzu7W+m7Zidz
	kmGKFkiB9ooHwSYLwy6Jnugh+X24Lxsq9YVpHKZ1yUH7+GHt6/c2xAlXZh8aDIXu3Xdws0+j7/oeV
	4Vob0lvo/T77ci3bVZrRONQCjQulCUlp/7ehtTpW5RZWYAq6OL7bYhizye8b4/os/PpAT7Vi7JX1s
	qawalLt2Z3jsl11KuoVR4ylkuhbMtFe2+ndBxY2KGju57YZh+hMsLokDtedvI2c8moM0UK37IRa79
	x+ZdflVngTq7kjokWQOQBwOfOavuh3W8E7RpDszYjFLE3V3N/x5oNjI0r87iJZF0/X8bxX6Xw2xMq
	BpRzA7Jw==;
Received: from [122.175.9.182] (port=47173 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tbIk3-0004DJ-28;
	Fri, 24 Jan 2025 17:54:56 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
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
	tony@atomide.com,
	richardcochran@gmail.com,
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	rdunlap@infradead.org,
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
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [RFC v2 PATCH 00/10] PRU-ICSSM Ethernet Driver
Date: Fri, 24 Jan 2025 17:53:43 +0530
Message-Id: <20250124122353.1457174-1-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_042543_737710_82AF73AC 
X-CRM114-Status: GOOD (  15.79  )
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
Linux kernel. The current RFC patch series builds on top of these components
and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
the TI AM57xx devices.


TI AM57xx series of devices have two identical PRU-ICSS instances (PRU-ICSS1
and PRU-ICSS2), each with two 32-bit RISC PRU cores. Each PRU core has
(a) dedicated Ethernet interface (MII, MDIO), timers, capture modules, and
serial communication interfaces, and (b) dedicated data and instruction RAM as
well as shared RAM for inter PRU communication within the PRU-ICSS.

This set of patches is a follow-up to [2] yet to merged. These patches add
support for the following features::
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

These changes are validated on top of Linux next kernel by reverting a recent
commit [3]. This commit is breaking the Ethernet functionality on TI AM57xx
due to zero block size allocation in SRAM during initialization. 

The patches presented in this series have gone through the patch verification
tools and no warnings or errors are reported. Sample test logs verifying the
functionality on Linux next kernel are available here:

[Interface up Testing](https://gist.github.com/basharath-cit/7fbdd48dec77e3eb3afee0eac4b5bc14)

[Ping Testing](https://gist.github.com/basharath-cit/edd75dedf0a69888ad8f1211540380b8)

[Iperf Testing](https://gist.github.com/basharath-cit/8e20dfdfbae5d14ccbbc5b76d8b90e73)

[1] https://lore.kernel.org/all/20230106121046.886863-1-danishanwar@ti.com/
[2] https://lore.kernel.org/all/20250108125937.10604-1-basharath@couthit.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.13-rc5&id=1a52a094c2f0821860d9ce15fffe01103a146f1f


This is the v2 of the patch series [v1]. This version of the patchset
addresses the comments made on [v1] of the series.

Changes from v1 to v2 :

*) Addressed Andrew Lunn, Rob Herring comments on patch 1 of the series.
*) Addressed Andrew Lunn comments on patch 2, 3, and 4 of the series.
*) Addressed Richard Cochran, Jason Xing comments on patch 6 of the series.
*) Rebased patchset on next-202401xx linux-next.

[v1] https://lore.kernel.org/all/20250109105600.41297-1-basharath@couthit.com/

Thanks & Best Regards,
Basharath


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
  arm: dts: ti: Adds device tree nodes for PRU Cores, IEP and eCAP
    modules of PRU-ICSS2 Instance.

 .../devicetree/bindings/net/ti,icss-iep.yaml  |    5 +
 .../bindings/net/ti,icssm-prueth.yaml         |  147 +
 .../bindings/net/ti,pruss-ecap.yaml           |   32 +
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |    9 +
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi     |   11 +
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |    8 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts      |   10 +-
 arch/arm/boot/dts/ti/omap/am574x-idk.dts      |   10 +-
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   |   61 +
 drivers/net/ethernet/ti/Kconfig               |   24 +
 drivers/net/ethernet/ti/Makefile              |    5 +
 drivers/net/ethernet/ti/icssg/icss_iep.c      |   42 +
 drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  303 +++
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 2396 +++++++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  428 +++
 .../net/ethernet/ti/icssm/icssm_prueth_dos.c  |  225 ++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.c |  312 +++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.h |   47 +
 .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |   85 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |  285 ++
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   |  120 +
 21 files changed, 4556 insertions(+), 9 deletions(-)
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


