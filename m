Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F6FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AGKTcaraS2qPYJXdEMirPqtRDKbRpXz3vOKdl0AcVF4=; b=3aAkxSDaT/kcgUrLDTnyqTr5Jx
	7UYD/ihMgEtoxBpArOOJbCJI9pi4USWLEWVuhWGaLYML5a+ewDo2H0cKz5aqNO0VWhm7hVab8gabj
	oBheZ/hTOLrdNJhbz0q+PtKC6Q5X4oD0SPQJXc+QaPJnJU2dQtzyAVC992ZvqiHf9rNi5IeOMbAlV
	aChqrGC11EixTQXuEb2H4gSh6TP4s2YrzfwHKZNJoHlZNU4IhAeeazyFeG4rtM1Pth2RO3mdmqF5L
	ztz0m0zFNFvuhZBJxzKpFeoSIQtNPk9AQDubGEcW7hOB58Pzlh3bIwjPcOQnSeLbD+XlRreY7+mTE
	G2rOR3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Du-00000003bAf-2zP4;
	Mon, 15 Sep 2025 10:14:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Dt-00000003b9y-422J
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AGKTcaraS2qPYJXdEMirPqtRDKbRpXz3vOKdl0AcVF4=; b=Pkx469S/6lqo7AQtVNYTq0RrZ3
	e3LY91J4IiBBvz7C+hZkxY9BgaZyaUs51Zak1M+2Cd2pFyDS6w80yRk/vRUPEVdGoZnDO/ugT1IqF
	qiNQ7KK19rSEtmg1kLFsCCkB346LgTsw9+opjqOuI9lRkCJXjHBC3Kt++l81mrYNsUPpe+IKjO+Lo
	ev+FxUw8bQQj6Sz+FLbsdx8VDX/IeyEV7E1oqOeyuhvNr4aH5JPmGYKI5V4icZ/VLPTl4bhSin/JK
	DU5deuk1aF6sLGT4zX3Rhr634poMeR7CL0bK75SRoB1UPLqVf0kIsxMYGbinQVwABjdUNOPDpotQW
	wMbD60kg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Dq-00000006uih-3HvM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:14:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A2112FC;
	Mon, 15 Sep 2025 03:13:59 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A6383F66E;
	Mon, 15 Sep 2025 03:14:06 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.18
Date: Mon, 15 Sep 2025 11:13:41 +0100
Message-Id: <20250915101341.2987516-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_111411_255624_C4D9240C 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.18

for you to fetch changes up to 2f86054cc1a6792f0812d5f23f271a83848edabb:

  firmware: arm_scmi: Simplify printks with pOF format (2025-09-12 11:32:21 +0100)

----------------------------------------------------------------
Arm SCMI updates/fixes for v6.18

These SCMI changes bring a mix of improvements, fixes, and cleanups:

1. Device Tree bindings - allow multiple SCMI instances by suffixing
   node names (Nikunj Kela).
2. Code hardening - constify both scmi_{transport,voltage_proto}_ops
   so they reside in read-only memory (Christophe JAILLET).
3. VirtIO transport initialization - set DRIVER_OK before SCMI probing
   to prevent potential stalls; while recent rework removes the practical
   risk, this ensures correctness (Junnan Wu).
4. Quirk handling - fix a critical bug by preventing writes to string
   constants, avoiding faults in read-only memory (Johan Hovold).
5. i.MX SCMI MISC protocol - extend support to discover board info,
   retrieve configuration and build data, and document the new
   MISC_BOARD_INFO command; all handled gracefully if unsupported (Peng Fan).
6. Logging cleanup - simplify device tree node name logging by using
   the %pOF format to print full paths (Krzysztof Kozlowski).

----------------------------------------------------------------
Christophe JAILLET (2):
      firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
      firmware: arm_scmi: Constify struct scmi_transport_ops

Johan Hovold (1):
      firmware: arm_scmi: quirk: Prevent writes to string constants

Junnan Wu (1):
      firmware: arm_scmi: Mark VirtIO ready before registering scmi_virtio_driver

Krzysztof Kozlowski (1):
      firmware: arm_scmi: Simplify printks with pOF format

Nikunj Kela (1):
      dt-bindings: firmware: arm,scmi: Allow multiple instances

Peng Fan (5):
      firmware: arm_scmi: Fix function name typo in scmi_perf_proto_ops struct
      firmware: arm_scmi: imx: Add documentation for MISC_BOARD_INFO
      firmware: arm_scmi: imx: Discover MISC build info from the system manager
      firmware: arm_scmi: imx: Support retrieving MISC protocol configuration info
      firmware: arm_scmi: imx: Discover MISC board info from the system manager

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   2 +-
 drivers/firmware/arm_scmi/bus.c                    |  13 ++-
 drivers/firmware/arm_scmi/quirks.c                 |  15 ++-
 drivers/firmware/arm_scmi/transports/mailbox.c     |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c       |   2 +-
 drivers/firmware/arm_scmi/transports/virtio.c      |   3 +
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 111 +++++++++++++++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    |  25 +++++
 drivers/firmware/arm_scmi/voltage.c                |   2 +-
 include/linux/scmi_protocol.h                      |   2 +-
 10 files changed, 162 insertions(+), 20 deletions(-)

