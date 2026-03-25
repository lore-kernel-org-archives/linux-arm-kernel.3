Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70968109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xAQ9rZgy7hmGO6CfDwg0BdOmD6SYrZRwVcXnKBGZpP4=; b=dA+fXIdOeJwnLSSt/h1zKa0E+E
	KD0c6Gkpwy6imyymJrmOTSaG5CMDPzqXpR7wL81g9WVRacQwaMBxROjJ5PmvnG4TDBT+hDZF4Jo+p
	R+RpMMMANrRzhwxCk3Tq25p79hlEH8l2JDxX87d8760U6pbkXk5SbYWXMojKwHYaXN/YmVA/r/sxD
	OriOsX0OSBIexTbDROa9tjXUSS0XYAktCGYk/k28vUvqvI/2aWKHHpzsj2BBZacF5XmjfqXvxbUG4
	NuINd21yPIlEwjufKNxgJ0I4byHZSmZ4tv4kT1uyIJIi6EGJM9TtIVRSKLTCdgcX66vXg6MzUhr/a
	HE7Vm4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qev-00000003qEQ-0wVo;
	Wed, 25 Mar 2026 16:00:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qes-00000003qDg-2mfV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D92FC40859;
	Wed, 25 Mar 2026 16:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC95C4CEF7;
	Wed, 25 Mar 2026 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454437;
	bh=xQezrSndPPUacdy/MK97EgDqQ0wsautz6vO1I8UUloY=;
	h=From:To:Cc:Subject:Date:From;
	b=k4Lb8zAOP3bn7AOkVSEt1zFlpeVJUnYgPO0OQb4Wci9qG6Ed+P0ao6fZw0vnClJxN
	 rPUkclIVvRhx0J1B3dhwcCU1k9PsmioeY55+rJEoIHMegES3avd49FeZ8fRlKTJNAx
	 BkyMAUZvS2XyOFhn/G1oO61vkHCtwjk2FANwCTF+0mvJ0eDR1qWjCQCTSPRNB3/tkW
	 uhRwxCfo8SOmuEF18Bcwpa+6gw5TPQDtVC82GSJ528kdE0qHFdbnkIqt/Z/ek3ELlp
	 u2cN0qZfEbV/BSyIv+haoBV+vKd9yuhWlDIyFvjhGKGlblEy7ShFgR5raD/mdXuWEG
	 6p+dKX77sxqVQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno/fvp: Updates for v7.1
Date: Wed, 25 Mar 2026 16:00:21 +0000
Message-ID: <20260325160027.4115793-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_090038_801590_E451C863 
X-CRM114-Status: GOOD (  11.56  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.1

for you to fetch changes up to 87599f1843d3baa4083dc9dd01c95826b536de24:

  arm64: dts: arm/corstone1000: Add corstone-1000-a320 (2026-03-23 10:03:28 +0000)

----------------------------------------------------------------
Armv8 Juno/FVP/Vexpress updates for v7.1

1. The primary addition is initial support for Zena CSS that includes:
   a new binding compatibility, a shared `zena-css.dtsi` description, and
   an FVP device tree.

2. Extension of Corstone-1000 FVP platform support with binding updates
   to add the new `arm,corstone1000-a320-fvp` platform, and the
   `arm,corstone1000-ethos-u85` NPU integration.

Overall, this combines new platform enablement with some DTS layout
cleanup for Arm reference FVP based systems.

----------------------------------------------------------------
Debbie Horsfall (3):
      dt-bindings: arm: Add Zena CSS compatibility
      arm64: dts: zena: Add support for Zena CSS
      arm64: dts: zena: Move SRAM into SoC and memory node out of SoC

Rob Herring (Arm) (5):
      dt-bindings: arm,corstone1000: Add "arm,corstone1000-a320-fvp"
      dt-bindings: npu: arm,ethos: Add "arm,corstone1000-ethos-u85"
      arm64: dts: arm/corstone1000: Move cpu nodes
      arm64: dts: arm/corstone1000: Move FVP peripherals to separate .dtsi
      arm64: dts: arm/corstone1000: Add corstone-1000-a320

 .../devicetree/bindings/arm/arm,corstone1000.yaml  |  15 +-
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml |  10 +
 .../devicetree/bindings/npu/arm,ethos.yaml         |   2 +-
 arch/arm64/boot/dts/arm/Makefile                   |   2 +
 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts  |  15 +
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     |  91 +++
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       |  96 +--
 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi      |  44 ++
 arch/arm64/boot/dts/arm/corstone1000-mps3.dts      |  13 +
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |  13 -
 arch/arm64/boot/dts/arm/zena-css-fvp.dts           |  63 ++
 arch/arm64/boot/dts/arm/zena-css.dtsi              | 769 +++++++++++++++++++++
 12 files changed, 1054 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/zena-css-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/zena-css.dtsi

