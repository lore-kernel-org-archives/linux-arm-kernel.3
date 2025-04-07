Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D916C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ce07kUX/ygxAUIieyEbRPsWLl55YaiOEIOTL6MIVy1I=; b=yq1FSg7yKSMVNvzfP43lzSTyzo
	7AXdXIcsQUAx7BRQyP27Z4X5SXEtYsR8Y9YegJ3bpwKJODzGESFOCslOkHjYzZsDyLUjl4peibCut
	bQu7NqAM+WShmrtM3LphILGOsRNimz9opHDl18HICey/wILBtzh2W+nv5eX8/cy+UptroevIyCaLS
	m8N/CNiFwRl6STml0WKamsjN2rherxQjCJJ311IqB23D4foiunPoKICg4HxHCEY05lZjPBIC/YTlc
	1KDC47vFNzKW9ZD2d5GayCTq4C0yxpIn9hcKB6pwdjAG8ldCHX0FyNu+C1o3KO2wRBWevQQIMmlIn
	AcKc8AoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jiX-0000000HNYr-1NRi;
	Mon, 07 Apr 2025 10:28:37 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jgl-0000000HMzF-3DJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 10:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ce07kUX/ygxAUIieyEbRPsWLl55YaiOEIOTL6MIVy1I=; b=cdAI356ivw6EKaVUk2M6IhZ5ol
	vnzPyTcABPoYG4+TjwVADf7x76+R6VJlA2o2zCVDP5dGSEcrYDTjRQ4GKlSdZqD33iSqwMp1sj9L+
	3dMC/nOInrhdQcRj62VAGV/45uQGSNbJLdFlDyGApro7JGBy7Afn9rlkjjhdej1HOtwrPTMpR1MoM
	Q8sjg02vGCqvxz0ABhwi/ChUcKxWIUkcI2hKybMoCUCITnMZ6v4HwmQMamnrmHbG7h+e9dDszpRlt
	xqY+kkPsJxY5aL3cu0sxobF9sGFc6qduTE4ZG9XSgO2dnp7zfYAJpi2Y/XuWirfv0QodVg7zdq5c8
	ECOeNf+w==;
Received: from [122.175.9.182] (port=29724 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u1jg0-000000001VV-1TZ9;
	Mon, 07 Apr 2025 15:56:00 +0530
From: Parvathi Pudi <parvathi@couthit.com>
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
	glaroque@baylibre.com,
	schnelle@linux.ibm.com,
	m-karicheri2@ti.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	basharath@couthit.com,
	parvathi@couthit.com,
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
Subject: [PATCH net-next v4 00/11] PRU-ICSSM Ethernet Driver
Date: Mon,  7 Apr 2025 15:55:17 +0530
Message-Id: <20250407102528.1048589-1-parvathi@couthit.com>
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
X-CRM114-CacheID: sfid-20250407_032647_825482_694E2533 
X-CRM114-Status: GOOD (  15.90  )
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
and introduces changes to support the Dual-EMAC using ICSSM on the TI AM57xx,
AM437x and AM335x devices.

AM335x, AM437x and AM57xx devices may have either one or two PRU-ICSS instances
with two 32-bit RISC PRU cores. Each PRU core has (a) dedicated Ethernet interface
(MII, MDIO), timers, capture modules, and serial communication interfaces, and
(b) dedicated data and instruction RAM as well as shared RAM for inter PRU
communication within the PRU-ICSS.

These patches add support for the following features:
- RX and TX over PRU Ethernet ports in Dual-EMAC mode
- Full duplex with 100 Mbps link speed.
- VLAN Filtering
- Multicast Filtering
- Promiscuous mode
- Storm prevention
- Interrupt coalescing
- Linux PTP (ptp4l) Ordinary clock

Further, note that these are the first set of patches for a single instance of
PRU-ICSS Ethernet. Switch mode support for AM335x, AM437x and AM57x along with
support for a second instance of PRU-ICSS on AM57x will be posted subsequently.

The patches presented in this series have gone through the patch verification
tools and no warnings or errors are reported. Sample test logs obtained from AM33x,
AM43x and AM57x verifying the functionality on Linux next kernel are available here:

[Interface up Testing](https://gist.github.com/ParvathiPudi/18dbbd143e43c66a7e427a8e63ef7cf8)

[Ping Testing](https://gist.github.com/ParvathiPudi/cc0b05c902e27e98eeabf20ac0cf7eff)

[Iperf Testing](https://gist.github.com/ParvathiPudi/8794e524d4257fb63205bc05678b23c5)

[1] https://lore.kernel.org/all/20230106121046.886863-1-danishanwar@ti.com/
[2] https://lore.kernel.org/all/20250108125937.10604-1-basharath@couthit.com/

This is the v4 of the patch series [v1]. This version of the patchset
addresses the comments made on [v3] of the series.

Changes from v3 to v4 :

*) Added support for AM33x and AM43x platforms.
*) Removed SOC patch [2] and its dependencies.
*) Addressed Jakub Kicinski, MD Danish Anwar and Nishanth Menon comments on cover
   letter of the series.
*) Addressed Rob Herring comments on patch 1 of the series.
*) Addressed Ratheesh Kannoth comments on patch 2 of the series.
*) Addressed Maxime Chevallier comments on patch 4 of the series.
*) Rebased the series on latest net-next.

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
[v3] https://lore.kernel.org/all/20250214054702.1073139-1-parvathi@couthit.com/


Thanks and Regards,
Parvathi.

Murali Karicheri (1):
  net: ti: prueth: Adds support for RX interrupt coalescing/pacing

Parvathi Pudi (1):
  dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for
    AM57xx, AM43xx and AM33xx SOCs

Roger Quadros (9):
  net: ti: prueth: Adds ICSSM Ethernet driver
  net: ti: prueth: Adds PRUETH HW and SW configuration
  net: ti: prueth: Adds link detection, RX and TX support.
  net: ti: prueth: Adds ethtool support for ICSSM PRUETH Driver
  net: ti: prueth: Adds HW timestamping support for PTP using PRU-ICSS
    IEP module
  net: ti: prueth: Adds support for network filters for traffic control
    supported by PRU-ICSS
  net: ti: prueth: Adds power management support for PRU-ICSS
  net: ti: prueth: Adds support for PRUETH on AM33x and AM43x SOCs
  net: ti: prueth: Adds PTP OC Support for AM335x and AM437x

 .../devicetree/bindings/net/ti,icss-iep.yaml  |   10 +-
 .../bindings/net/ti,icssm-prueth.yaml         |  233 ++
 .../bindings/net/ti,pruss-ecap.yaml           |   32 +
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |    9 +
 drivers/net/ethernet/ti/Kconfig               |   24 +
 drivers/net/ethernet/ti/Makefile              |    5 +
 drivers/net/ethernet/ti/icssg/icss_iep.c      |  258 +-
 drivers/net/ethernet/ti/icssg/icss_iep.h      |   11 +
 drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  357 +++
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 2483 +++++++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  447 +++
 .../net/ethernet/ti/icssm/icssm_prueth_dos.c  |  225 ++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.c |  312 +++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.h |   47 +
 .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |   85 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |  285 ++
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   |  120 +
 17 files changed, 4939 insertions(+), 4 deletions(-)
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


