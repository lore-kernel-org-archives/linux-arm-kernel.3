Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D5C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jab6KuCWruT72etqqSOAa0u1EaK0juKuMul/e2tmtj4=; b=W0DxISHJyJu0TJ1Ap9RzH4jmBl
	YZ8h4KEDKK8qDMIfCQU5F1mMq0yt/ESiJPJeTFh936rngjuixDv8oxT2Nm+u9h4jCchBBZSacYj3q
	F0e+kuvQcaive3PByFMcDlQMwOUQ3R9LwWouqHPpXPTtFLZsx89l76MxllBRSnzpNAQ+TI/PJwsw/
	xd/zD6jPdDma+CPdXubHNAyO37f6UWhKQr2seAtRJxud4xopnyM1nc2LltpFuHQiR5XBtijnh370d
	8C4pjOb0+GUN98N9B7/Ev8oJ+pXMCe59/Uw6CBVeS49/ImuCv2dBfyPLlpjMKF69CiMV5wQRApoye
	gq30GoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqon-0000000CdhW-47Dw;
	Tue, 13 May 2025 14:41:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqmF-0000000CdLz-0mNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:38:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C93E113E;
	Tue, 13 May 2025 07:38:27 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12ADC3F63F;
	Tue, 13 May 2025 07:38:36 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno/fvp: Updates for v6.16
Date: Tue, 13 May 2025 15:38:27 +0100
Message-Id: <20250513143827.3606686-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_073839_270889_FBB9353A 
X-CRM114-Status: GOOD (  11.14  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-6.16

for you to fetch changes up to 6332351622db251b97639817a0e9ebc6f2394f87:

  arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model (2025-05-12 18:52:08 +0100)

----------------------------------------------------------------
Armv8 Juno/FVP updates for v6.16

Few updates to the Arm FVP(Fixed Virtual Platform) device tree, enhancing
support for system tracing, power management, and firmware coexistence:

1. ETE and TRBE support
   Adds CoreSight ETE and TRBE nodes for the FVP Rev C model. These are
   disabled by default as they need to be enabled explicitly via model
   parameters.

2. CPU idle states and system timer for idle broadcast
   Introduces CPU idle state definitions but disabled by default due to
   potential performance impact on the model. Also adds a system-level
   broadcast timer for use when CPUs enter deep idle states where local
   timers stop.

3. Firmware memory reservation
   Reserves 64MB at the end of the first DRAM bank to prevent conflicts
   with FF-A firmware or similar configurations that rely on this region.

4. Drop the unnecessary clock-frequency property in the timer nodes
   The boot/secure firmware must configure the timer clock frequency and
   the non-secure OS must be able to read the same. The clock-frequency is
   generally used when the firmware is broken which is not the case on
   most of the fast models and Juno platform.

As noted above some of the changes are disabled by default where applicable
to ensure backward compatibility and avoid unintended performance impact
on platforms using default model parameters.

----------------------------------------------------------------
Leo Yan (1):
      arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model

Sudeep Holla (4):
      arm64: dts: fvp: Add system timer for broadcast during CPU idle
      arm64: dts: fvp: Add CPU idle states for Rev C model
      arm64: dts: fvp: Reserve 64MB for the FF-A firmware in memory map
      arm64: dts: arm: Drop the clock-frequency property from timer nodes

 arch/arm64/boot/dts/arm/corstone1000.dtsi  |   1 -
 arch/arm64/boot/dts/arm/foundation-v8.dtsi |   1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts  | 101 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/arm/juno-base.dtsi     |   1 -
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts |   1 -
 5 files changed, 100 insertions(+), 5 deletions(-)

