Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0SzJuOIEPCOqv51XjL/0EjgYjY+plcmS0tb3ijkM+A=; b=IK0tFucb8w0ulZMtjtcfuUqs1R
	HvTggimYeQLKWoPOZ6MMQAtvL3lhSdoE8sS9UO3wOPL9AJoMlU5tpBC/mB6spnu+reAWrLYUK9gqP
	7lA7+TUfsbTmQa9FsTutErf5PvN142nn04ePKbEpxigorH1Xi9i41qT9fWNsxuC7jOh5ZAuP+GBsE
	s1q5zeNcDkNZM7SLKBlb6KiAm2y8DPaSObExAwajriEPTftROR7fcZqT4mppn33xVIRCX4rTD+ESU
	HuotKLM+4fwwWSVNJeoG4q1UbwnvkV394f/L333GOkkjrbSU+NsvHdPglzHx5NsGefUL+fGgFlVER
	W62fk9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4y-00000004Woy-18qb;
	Tue, 04 Mar 2025 12:08:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPzK-00000004Ixw-2DZi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:59:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85823FEC;
	Tue,  4 Mar 2025 02:59:15 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A7183F5A1;
	Tue,  4 Mar 2025 02:59:00 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [GIT PULL] arm64: dts: juno/vexpress: Updates for v6.15
Date: Tue,  4 Mar 2025 10:58:56 +0000
Message-Id: <20250304105856.432848-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025902_656161_D9ECD39B 
X-CRM114-Status: GOOD (  13.29  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-6.15

for you to fetch changes up to 21b9f56cec8f8918b5bbb900d6d86eaf06d54537:

  arm64: dts: corstone1000: Add definitions for secondary CPU cores (2025-03-03 17:07:15 +0000)

----------------------------------------------------------------
Armv8 FVP/Vexpress/Juno updates for v6.15

The main and bulk of the addition this time is the support for the Arm
reference Morello System Development Platform (SDP).

The Morello architecture is an experimental extension to Armv8.2-A,
enhancing the AArch64 execution state with capabilities for fine-grained
memory protection and scalable software compartmentalization. However
these changes doesn't add any of the support for security enhancements.
This is mainly adding device tree support for Morello SDP.

The platform iteslf is shipped with ACPI firmware. However, since the
ACPI bindings for GPU, DPU, I2C, I2S,..etc are not well defined or not
provided in the shipped ACPI firmware, there is a need for the device
tree as alternative for the developers focusing on those features.

The CPU is called rainier, the architecture is Morello and the platform
is Morello SDP board. There is FVP equivalent of the same though they
are not completely in feature parity with the real hardware.

These changes provide the initial support for Morello SDP and FVP
platforms.

Apart from this, we have an update to add support for secondary cores
on Corstone1000 FVP platform.

----------------------------------------------------------------
Hugues KAMBA MPIANA (1):
      arm64: dts: corstone1000: Add definitions for secondary CPU cores

Vincenzo Frascino (9):
      arm64: Kconfig: Update description for CONFIG_ARCH_VEXPRESS
      dt-bindings: arm: Add Morello compatibility
      dt-bindings: arm: Add Morello fvp compatibility
      dt-bindings: arm: Add Rainier compatibility
      dt-bindings: arm-pmu: Add support for ARM Rainier PMU
      arm64: dts: morello: Add support for common functionalities
      arm64: dts: morello: Add support for soc dts
      arm64: dts: morello: Add support for fvp dts
      MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer

 .../devicetree/bindings/arm/arm,morello.yaml       |  35 +++
 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/pmu.yaml     |   1 +
 MAINTAINERS                                        |   7 +
 arch/arm64/Kconfig.platforms                       |   5 +-
 arch/arm64/boot/dts/arm/Makefile                   |   1 +
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       |  26 ++
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |   3 +-
 arch/arm64/boot/dts/arm/morello-fvp.dts            |  77 +++++
 arch/arm64/boot/dts/arm/morello-sdp.dts            | 157 ++++++++++
 arch/arm64/boot/dts/arm/morello.dtsi               | 323 +++++++++++++++++++++
 11 files changed, 632 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,morello.yaml
 create mode 100644 arch/arm64/boot/dts/arm/morello-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
 create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi

