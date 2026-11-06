Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GVZ7zknc;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Y8yAKBqS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ihjTP8I3htqnJgIhiSUJ0Vd2SIi4kE6EBRN89fsT23s=; b=GVZ7zkncInWntjXJzt/MSgRYne
	uZBa4sZAVuAn+STpCGeCpIFnDpp+mxBxy4S/P9B/KxUTZIQPMVU3Ygsfd/uJgZqdigIvAO4jR2+aB
	kv28fXOxtjD6fEk1wvMZ6O6J/SwfcidzJDjCjvHaNWWHGhjopUdujVRt0WKteyRhb4YK6dq97MabB
	Ba7jERCRCbDh8QPwlB92UuWV/D12RyNE4WCmdjPA4Yu2o12V5NGC8UV54VDUGlqh92xutZIMhbX6I
	rMiwo89Cv6f6hu9uYJxew9tliVdBd8jJPh03zXjt8mMEm0AMtY+tv0Drm1IXLdSjPNaWPiBVKajyU
	mHBFIqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIYn-0000000CEcC-3QSf;
	Fri, 06 Nov 2026 11:56:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIYk-0000000CEbd-48BR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:56:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0251516;
	Fri,  6 Nov 2026 03:56:37 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 918F83F628;
	Fri,  6 Nov 2026 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793966200; bh=bHab+W8Gj9+SVMJoJzjGMQ753t78qTCaRIbeWQq/ZnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8yAKBqSY2sNJpxn7TyMkCfE95ubrErpMeN7E6kXsj+EmsCOln4+EoUnNbbMNKxRN
	 drPQ02+I32yJZky2paz/P1A2vrc0kupgrMQPfVEpXg32+v1KJme8d8G1nhL6whM25k
	 uB9Pc9UFHu1YnY3/rDAP6VqT9tGW50wmXCLlvWWA=
Date: Fri, 6 Nov 2026 11:56:36 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Arnd Bergmann <arnd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2] firmware: arm: Group interface drivers under arm/
Message-ID: <au3AdN19j8sFJjyn@e129823.arm.com>
References: <20261106115046.62344-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106115046.62344-1-sudeep.holla@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035643_191540_37ED488E 
X-CRM114-Status: GOOD (  22.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM. Thanks!

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Fri, Nov 06, 2026 at 11:50:45AM +0000, Sudeep Holla wrote:
> Arm firmware interface drivers currently live directly under
> drivers/firmware/. Some use an arm_ prefix while others use generic
> names. More Arm firmware interface drivers, such as:
> 
> 1. Live Firmware Activation (LFA) [1]
> 2. Firmware Interfaces for Realm Management Extension (FIRME) [2]
> 
> expected soon, which would further crowd the top-level directory.
> 
> There are couple of other possible arm specific firmware interfaces
> that may need to reside there.
> 
> Create drivers/firmware/arm/ as the common home for Arm firmware
> interface drivers. Move FF-A, PSCI, RMM, SCMI, SCPI, SDEI, and SMCCC
> under it, drop the redundant arm_ prefix from the some directory/file
> names. Update the Kconfig, Kbuild, maintainer and documentation paths.
> 
> The resulting hierarchy provides room for upcoming interfaces without
> continuing to add Arm-specific directories at the firmware root.
> 
> [1] https://lore.kernel.org/all/20261102165421.3651202-1-andre.przywara@arm.com/
> [2] https://lore.kernel.org/all/20261019-firme_interface-v1-0-27895c9cebaa@arm.com/
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
> 
> v1[1]->v2:
>  - Rebased on v7.4-rc1
>  - Fixed missing rmm folder movement in Kconfig and Makefile
> 
>  [1] https://lore.kernel.org/all/20261022090003.3083557-1-sudeep.holla@kernel.org/
> 
>  Documentation/tee/ts-tee.rst                  |  2 +-
>  MAINTAINERS                                   | 18 +++---
>  drivers/firmware/Kconfig                      | 55 +-----------------
>  drivers/firmware/Makefile                     |  9 +--
>  drivers/firmware/arm/Kconfig                  | 56 +++++++++++++++++++
>  drivers/firmware/arm/Makefile                 | 11 ++++
>  drivers/firmware/{arm_ffa => arm/ffa}/Kconfig |  0
>  .../firmware/{arm_ffa => arm/ffa}/Makefile    |  0
>  drivers/firmware/{arm_ffa => arm/ffa}/bus.c   |  0
>  .../firmware/{arm_ffa => arm/ffa}/common.h    |  0
>  .../firmware/{arm_ffa => arm/ffa}/driver.c    |  0
>  drivers/firmware/{arm_ffa => arm/ffa}/smccc.c |  0
>  drivers/firmware/{ => arm}/psci/Kconfig       |  0
>  drivers/firmware/{ => arm}/psci/Makefile      |  0
>  drivers/firmware/{ => arm}/psci/psci.c        |  0
>  .../firmware/{ => arm}/psci/psci_checker.c    |  0
>  drivers/firmware/{arm_rmm => arm/rmm}/Kconfig |  0
>  .../firmware/{arm_rmm => arm/rmm}/Makefile    |  0
>  drivers/firmware/{arm_rmm => arm/rmm}/rmi.c   |  0
>  drivers/firmware/{arm_rmm => arm/rmm}/rsi.c   |  0
>  .../firmware/{arm_scmi => arm/scmi}/Kconfig   |  4 +-
>  .../firmware/{arm_scmi => arm/scmi}/Makefile  |  0
>  .../firmware/{arm_scmi => arm/scmi}/base.c    |  0
>  drivers/firmware/{arm_scmi => arm/scmi}/bus.c |  0
>  .../firmware/{arm_scmi => arm/scmi}/clock.c   |  0
>  .../firmware/{arm_scmi => arm/scmi}/common.h  |  0
>  .../firmware/{arm_scmi => arm/scmi}/driver.c  |  0
>  drivers/firmware/{arm_scmi => arm/scmi}/msg.c |  0
>  .../firmware/{arm_scmi => arm/scmi}/notify.c  |  0
>  .../firmware/{arm_scmi => arm/scmi}/notify.h  |  0
>  .../firmware/{arm_scmi => arm/scmi}/perf.c    |  0
>  .../firmware/{arm_scmi => arm/scmi}/pinctrl.c |  0
>  .../firmware/{arm_scmi => arm/scmi}/power.c   |  0
>  .../{arm_scmi => arm/scmi}/powercap.c         |  0
>  .../{arm_scmi => arm/scmi}/protocols.h        |  0
>  .../firmware/{arm_scmi => arm/scmi}/quirks.c  |  0
>  .../firmware/{arm_scmi => arm/scmi}/quirks.h  |  0
>  .../{arm_scmi => arm/scmi}/raw_mode.c         |  0
>  .../{arm_scmi => arm/scmi}/raw_mode.h         |  0
>  .../firmware/{arm_scmi => arm/scmi}/reset.c   |  0
>  .../scmi}/scmi_power_control.c                |  0
>  .../firmware/{arm_scmi => arm/scmi}/sensors.c |  0
>  .../firmware/{arm_scmi => arm/scmi}/shmem.c   |  0
>  .../firmware/{arm_scmi => arm/scmi}/system.c  |  0
>  .../{arm_scmi => arm/scmi}/transports/Kconfig |  0
>  .../scmi}/transports/Makefile                 |  0
>  .../scmi}/transports/mailbox.c                |  0
>  .../{arm_scmi => arm/scmi}/transports/optee.c |  0
>  .../{arm_scmi => arm/scmi}/transports/pcc.c   |  0
>  .../{arm_scmi => arm/scmi}/transports/smc.c   |  0
>  .../scmi}/transports/virtio.c                 |  0
>  .../scmi}/vendors/imx/Kconfig                 |  0
>  .../scmi}/vendors/imx/Makefile                |  0
>  .../scmi}/vendors/imx/imx-sm-bbm.c            |  0
>  .../scmi}/vendors/imx/imx-sm-cpu.c            |  0
>  .../scmi}/vendors/imx/imx-sm-lmm.c            |  0
>  .../scmi}/vendors/imx/imx-sm-misc.c           |  0
>  .../scmi}/vendors/imx/imx95.rst               |  0
>  .../firmware/{arm_scmi => arm/scmi}/voltage.c |  0
>  drivers/firmware/{arm_scpi.c => arm/scpi.c}   |  0
>  drivers/firmware/{arm_sdei.c => arm/sdei.c}   |  0
>  .../{arm_sdei_nmi.c => arm/sdei_nmi.c}        |  0
>  drivers/firmware/{ => arm}/smccc/Kconfig      |  0
>  drivers/firmware/{ => arm}/smccc/Makefile     |  0
>  drivers/firmware/{ => arm}/smccc/bus.c        |  0
>  drivers/firmware/{ => arm}/smccc/kvm_guest.c  |  0
>  drivers/firmware/{ => arm}/smccc/smccc.c      |  0
>  drivers/firmware/{ => arm}/smccc/soc_id.c     |  0
>  68 files changed, 81 insertions(+), 74 deletions(-)
>  create mode 100644 drivers/firmware/arm/Kconfig
>  create mode 100644 drivers/firmware/arm/Makefile
>  rename drivers/firmware/{arm_ffa => arm/ffa}/Kconfig (100%)
>  rename drivers/firmware/{arm_ffa => arm/ffa}/Makefile (100%)
>  rename drivers/firmware/{arm_ffa => arm/ffa}/bus.c (100%)
>  rename drivers/firmware/{arm_ffa => arm/ffa}/common.h (100%)
>  rename drivers/firmware/{arm_ffa => arm/ffa}/driver.c (100%)
>  rename drivers/firmware/{arm_ffa => arm/ffa}/smccc.c (100%)
>  rename drivers/firmware/{ => arm}/psci/Kconfig (100%)
>  rename drivers/firmware/{ => arm}/psci/Makefile (100%)
>  rename drivers/firmware/{ => arm}/psci/psci.c (100%)
>  rename drivers/firmware/{ => arm}/psci/psci_checker.c (100%)
>  rename drivers/firmware/{arm_rmm => arm/rmm}/Kconfig (100%)
>  rename drivers/firmware/{arm_rmm => arm/rmm}/Makefile (100%)
>  rename drivers/firmware/{arm_rmm => arm/rmm}/rmi.c (100%)
>  rename drivers/firmware/{arm_rmm => arm/rmm}/rsi.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/Kconfig (97%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/Makefile (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/base.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/bus.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/clock.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/common.h (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/driver.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/msg.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/notify.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/notify.h (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/perf.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/pinctrl.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/power.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/powercap.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/protocols.h (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/quirks.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/quirks.h (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.h (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/reset.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/scmi_power_control.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/sensors.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/shmem.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/system.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/Kconfig (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/Makefile (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/mailbox.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/optee.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/pcc.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/smc.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/transports/virtio.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/Kconfig (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/Makefile (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-bbm.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-cpu.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-lmm.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-misc.c (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx95.rst (100%)
>  rename drivers/firmware/{arm_scmi => arm/scmi}/voltage.c (100%)
>  rename drivers/firmware/{arm_scpi.c => arm/scpi.c} (100%)
>  rename drivers/firmware/{arm_sdei.c => arm/sdei.c} (100%)
>  rename drivers/firmware/{arm_sdei_nmi.c => arm/sdei_nmi.c} (100%)
>  rename drivers/firmware/{ => arm}/smccc/Kconfig (100%)
>  rename drivers/firmware/{ => arm}/smccc/Makefile (100%)
>  rename drivers/firmware/{ => arm}/smccc/bus.c (100%)
>  rename drivers/firmware/{ => arm}/smccc/kvm_guest.c (100%)
>  rename drivers/firmware/{ => arm}/smccc/smccc.c (100%)
>  rename drivers/firmware/{ => arm}/smccc/soc_id.c (100%)
> 
> diff --git a/Documentation/tee/ts-tee.rst b/Documentation/tee/ts-tee.rst
> index 843e34422648..0999d0e0d859 100644
> --- a/Documentation/tee/ts-tee.rst
> +++ b/Documentation/tee/ts-tee.rst
> @@ -62,7 +62,7 @@ References
>  
>  [3] https://www.arm.com/architecture/security-features/platform-security
>  
> -[4] drivers/firmware/arm_ffa/
> +[4] drivers/firmware/arm/ffa/
>  
>  [5] https://trusted-services.readthedocs.io/en/v1.0.0/developer/service-access-protocols.html#abi
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..550863200d44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4040,7 +4040,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>  F:	Documentation/ABI/testing/sysfs-firmware-cca
>  F:	Documentation/arch/arm64/
>  F:	arch/arm64/
> -F:	drivers/firmware/arm_rmm/
> +F:	drivers/firmware/arm/rmm/
>  F:	drivers/virt/coco/arm-cca-guest/
>  F:	drivers/virt/coco/pkvm-guest/
>  F:	include/linux/arm-rmi-cmds.h
> @@ -10462,7 +10462,7 @@ FIRMWARE FRAMEWORK FOR ARMV8-A
>  M:	Sudeep Holla <sudeep.holla@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	drivers/firmware/arm_ffa/
> +F:	drivers/firmware/arm/ffa/
>  F:	include/linux/arm_ffa.h
>  
>  FIRMWARE LOADER (request_firmware)
> @@ -22265,7 +22265,7 @@ M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
> -F:	drivers/firmware/psci/
> +F:	drivers/firmware/arm/psci/
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>  
> @@ -25374,9 +25374,9 @@ M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
>  M:	Sudeep Holla <sudeep.holla@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	drivers/firmware/smccc/
> -F:	include/linux/arm-smccc-bus.h
> +F:	drivers/firmware/arm/smccc/
>  F:	include/linux/arm-smccc.h
> +F:	include/linux/arm-smccc-bus.h
>  F:	include/linux/device-id/arm_smccc.h
>  
>  SECURITY CONTACT
> @@ -26000,7 +26000,7 @@ M:	James Morse <james.morse@arm.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/firmware/sdei.txt
> -F:	drivers/firmware/arm_sdei*
> +F:	drivers/firmware/arm/sdei*
>  F:	include/linux/arm_sdei.h
>  F:	include/uapi/linux/arm_sdei.h
>  
> @@ -27262,8 +27262,8 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
>  F:	drivers/clk/clk-sc[mp]i.c
>  F:	drivers/cpufreq/sc[mp]i-cpufreq.c
> -F:	drivers/firmware/arm_scmi/
> -F:	drivers/firmware/arm_scpi.c
> +F:	drivers/firmware/arm/scmi/
> +F:	drivers/firmware/arm/scpi.c
>  F:	drivers/hwmon/scmi-hwmon.c
>  F:	drivers/pinctrl/pinctrl-scmi.c
>  F:	drivers/pmdomain/arm/
> @@ -27282,7 +27282,7 @@ L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
> -F:	drivers/firmware/arm_scmi/vendors/imx/
> +F:	drivers/firmware/arm/scmi/vendors/imx/
>  
>  SYSTEM RESET/SHUTDOWN DRIVERS
>  M:	Sebastian Reichel <sre@kernel.org>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 43e2e2a64594..2097547850e7 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -6,60 +6,11 @@
>  
>  menu "Firmware Drivers"
>  
> -source "drivers/firmware/arm_scmi/Kconfig"
> +source "drivers/firmware/arm/Kconfig"
>  
>  config FW_ATTR_CLASS
>  	tristate
>  
> -config ARM_SCPI_PROTOCOL
> -	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
> -	depends on ARM || ARM64 || COMPILE_TEST
> -	depends on MAILBOX
> -	help
> -	  System Control and Power Interface (SCPI) Message Protocol is
> -	  defined for the purpose of communication between the Application
> -	  Cores(AP) and the System Control Processor(SCP). The MHU peripheral
> -	  provides a mechanism for inter-processor communication between SCP
> -	  and AP.
> -
> -	  SCP controls most of the power management on the Application
> -	  Processors. It offers control and management of: the core/cluster
> -	  power states, various power domain DVFS including the core/cluster,
> -	  certain system clocks configuration, thermal sensors and many
> -	  others.
> -
> -	  This protocol library provides interface for all the client drivers
> -	  making use of the features offered by the SCP.
> -
> -config ARM_SDE_INTERFACE
> -	bool "ARM Software Delegated Exception Interface (SDEI)"
> -	depends on ARM64
> -	help
> -	  The Software Delegated Exception Interface (SDEI) is an ARM
> -	  standard for registering callbacks from the platform firmware
> -	  into the OS. This is typically used to implement RAS notifications.
> -
> -config ARM_SDEI_NMI
> -	bool "SDEI-based cross-CPU NMI service (arm64)"
> -	depends on ARM_SDE_INTERFACE
> -	help
> -	  Provides SDEI-based cross-CPU NMI delivery for hooks that need
> -	  to reach interrupt-masked CPUs on silicon that lacks FEAT_NMI:
> -
> -	    - arch_trigger_cpumask_backtrace()  (sysrq-l, RCU stalls,
> -	      hardlockup_all_cpu_backtrace, soft-lockup secondary dumps,
> -	      hung-task auxiliary dumps)
> -	    - smp_send_stop() escalation         (reboot/halt and the
> -	      panic / kdump crash stop)
> -
> -	  The driver registers a handler for the SDEI software-signalled
> -	  event (event 0) and reaches a target CPU by signalling it with
> -	  SDEI_EVENT_SIGNAL. Firmware delivers the event out of EL3
> -	  regardless of the target's PSTATE.DAIF -- forced delivery into a
> -	  CPU wedged with interrupts locally masked.
> -
> -	  If unsure, say N.
> -
>  config EDD
>  	tristate "BIOS Enhanced Disk Drive calls determine boot disk"
>  	depends on X86
> @@ -299,8 +250,6 @@ config TURRIS_MOX_RWTM_KEYCTL
>  
>  endif # TURRIS_MOX_RWTM
>  
> -source "drivers/firmware/arm_ffa/Kconfig"
> -source "drivers/firmware/arm_rmm/Kconfig"
>  source "drivers/firmware/broadcom/Kconfig"
>  source "drivers/firmware/cirrus/Kconfig"
>  source "drivers/firmware/coreboot/Kconfig"
> @@ -308,10 +257,8 @@ source "drivers/firmware/efi/Kconfig"
>  source "drivers/firmware/imx/Kconfig"
>  source "drivers/firmware/meson/Kconfig"
>  source "drivers/firmware/microchip/Kconfig"
> -source "drivers/firmware/psci/Kconfig"
>  source "drivers/firmware/qcom/Kconfig"
>  source "drivers/firmware/samsung/Kconfig"
> -source "drivers/firmware/smccc/Kconfig"
>  source "drivers/firmware/tegra/Kconfig"
>  source "drivers/firmware/xilinx/Kconfig"
>  
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 50b338313152..f347328e0a0c 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -2,9 +2,6 @@
>  #
>  # Makefile for the linux kernel.
>  #
> -obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
> -obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
> -obj-$(CONFIG_ARM_SDEI_NMI)	+= arm_sdei_nmi.o
>  obj-$(CONFIG_DMI)		+= dmi_scan.o
>  obj-$(CONFIG_DMI_SYSFS)		+= dmi-sysfs.o
>  obj-$(CONFIG_EDD)		+= edd.o
> @@ -25,9 +22,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
>  obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
>  obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
>  
> -obj-y				+= arm_ffa/
> -obj-y				+= arm_rmm/
> -obj-y				+= arm_scmi/
> +obj-y				+= arm/
>  obj-y				+= broadcom/
>  obj-y				+= cirrus/
>  obj-y				+= meson/
> @@ -35,9 +30,7 @@ obj-y				+= microchip/
>  obj-$(CONFIG_COREBOOT_FIRMWARE)	+= coreboot/
>  obj-y				+= efi/
>  obj-y				+= imx/
> -obj-y				+= psci/
>  obj-y				+= qcom/
>  obj-y				+= samsung/
> -obj-y				+= smccc/
>  obj-y				+= tegra/
>  obj-y				+= xilinx/
> diff --git a/drivers/firmware/arm/Kconfig b/drivers/firmware/arm/Kconfig
> new file mode 100644
> index 000000000000..c980a847f233
> --- /dev/null
> +++ b/drivers/firmware/arm/Kconfig
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +source "drivers/firmware/arm/ffa/Kconfig"
> +source "drivers/firmware/arm/psci/Kconfig"
> +source "drivers/firmware/arm/rmm/Kconfig"
> +source "drivers/firmware/arm/scmi/Kconfig"
> +source "drivers/firmware/arm/smccc/Kconfig"
> +
> +config ARM_SCPI_PROTOCOL
> +	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
> +	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on MAILBOX
> +	help
> +	  System Control and Power Interface (SCPI) Message Protocol is
> +	  defined for the purpose of communication between the Application
> +	  Cores(AP) and the System Control Processor(SCP). The MHU peripheral
> +	  provides a mechanism for inter-processor communication between SCP
> +	  and AP.
> +
> +	  SCP controls most of the power management on the Application
> +	  Processors. It offers control and management of: the core/cluster
> +	  power states, various power domain DVFS including the core/cluster,
> +	  certain system clocks configuration, thermal sensors and many
> +	  others.
> +
> +	  This protocol library provides interface for all the client drivers
> +	  making use of the features offered by the SCP.
> +
> +config ARM_SDE_INTERFACE
> +	bool "ARM Software Delegated Exception Interface (SDEI)"
> +	depends on ARM64
> +	help
> +	  The Software Delegated Exception Interface (SDEI) is an ARM
> +	  standard for registering callbacks from the platform firmware
> +	  into the OS. This is typically used to implement RAS notifications.
> +
> +config ARM_SDEI_NMI
> +	bool "SDEI-based cross-CPU NMI service (arm64)"
> +	depends on ARM_SDE_INTERFACE
> +	help
> +	  Provides SDEI-based cross-CPU NMI delivery for hooks that need
> +	  to reach interrupt-masked CPUs on silicon that lacks FEAT_NMI:
> +
> +	    - arch_trigger_cpumask_backtrace()  (sysrq-l, RCU stalls,
> +	      hardlockup_all_cpu_backtrace, soft-lockup secondary dumps,
> +	      hung-task auxiliary dumps)
> +	    - smp_send_stop() escalation         (reboot/halt and the
> +	      panic / kdump crash stop)
> +
> +	  The driver registers a handler for the SDEI software-signalled
> +	  event (event 0) and reaches a target CPU by signalling it with
> +	  SDEI_EVENT_SIGNAL. Firmware delivers the event out of EL3
> +	  regardless of the target's PSTATE.DAIF -- forced delivery into a
> +	  CPU wedged with interrupts locally masked.
> +
> +	  If unsure, say N.
> diff --git a/drivers/firmware/arm/Makefile b/drivers/firmware/arm/Makefile
> new file mode 100644
> index 000000000000..5e90380a0666
> --- /dev/null
> +++ b/drivers/firmware/arm/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= scpi.o
> +obj-$(CONFIG_ARM_SDE_INTERFACE)	+= sdei.o
> +obj-$(CONFIG_ARM_SDEI_NMI)	+= sdei_nmi.o
> +
> +obj-y				+= ffa/
> +obj-y				+= psci/
> +obj-y				+= rmm/
> +obj-y				+= scmi/
> +obj-y				+= smccc/
> diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm/ffa/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_ffa/Kconfig
> rename to drivers/firmware/arm/ffa/Kconfig
> diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm/ffa/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_ffa/Makefile
> rename to drivers/firmware/arm/ffa/Makefile
> diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm/ffa/bus.c
> similarity index 100%
> rename from drivers/firmware/arm_ffa/bus.c
> rename to drivers/firmware/arm/ffa/bus.c
> diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm/ffa/common.h
> similarity index 100%
> rename from drivers/firmware/arm_ffa/common.h
> rename to drivers/firmware/arm/ffa/common.h
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm/ffa/driver.c
> similarity index 100%
> rename from drivers/firmware/arm_ffa/driver.c
> rename to drivers/firmware/arm/ffa/driver.c
> diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm/ffa/smccc.c
> similarity index 100%
> rename from drivers/firmware/arm_ffa/smccc.c
> rename to drivers/firmware/arm/ffa/smccc.c
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/arm/psci/Kconfig
> similarity index 100%
> rename from drivers/firmware/psci/Kconfig
> rename to drivers/firmware/arm/psci/Kconfig
> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/arm/psci/Makefile
> similarity index 100%
> rename from drivers/firmware/psci/Makefile
> rename to drivers/firmware/arm/psci/Makefile
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/arm/psci/psci.c
> similarity index 100%
> rename from drivers/firmware/psci/psci.c
> rename to drivers/firmware/arm/psci/psci.c
> diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/arm/psci/psci_checker.c
> similarity index 100%
> rename from drivers/firmware/psci/psci_checker.c
> rename to drivers/firmware/arm/psci/psci_checker.c
> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm/rmm/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_rmm/Kconfig
> rename to drivers/firmware/arm/rmm/Kconfig
> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm/rmm/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_rmm/Makefile
> rename to drivers/firmware/arm/rmm/Makefile
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm/rmm/rmi.c
> similarity index 100%
> rename from drivers/firmware/arm_rmm/rmi.c
> rename to drivers/firmware/arm/rmm/rmi.c
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm/rmm/rsi.c
> similarity index 100%
> rename from drivers/firmware/arm_rmm/rsi.c
> rename to drivers/firmware/arm/rmm/rsi.c
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm/scmi/Kconfig
> similarity index 97%
> rename from drivers/firmware/arm_scmi/Kconfig
> rename to drivers/firmware/arm/scmi/Kconfig
> index 9f6241efd592..2b62679598ea 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm/scmi/Kconfig
> @@ -82,8 +82,8 @@ config ARM_SCMI_QUIRKS
>  	  depending on the SCMI firmware advertised versions and/or machine
>  	  compatibles.
>  
> -source "drivers/firmware/arm_scmi/transports/Kconfig"
> -source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
> +source "drivers/firmware/arm/scmi/transports/Kconfig"
> +source "drivers/firmware/arm/scmi/vendors/imx/Kconfig"
>  
>  endif #ARM_SCMI_PROTOCOL
>  
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm/scmi/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/Makefile
> rename to drivers/firmware/arm/scmi/Makefile
> diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm/scmi/base.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/base.c
> rename to drivers/firmware/arm/scmi/base.c
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm/scmi/bus.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/bus.c
> rename to drivers/firmware/arm/scmi/bus.c
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm/scmi/clock.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/clock.c
> rename to drivers/firmware/arm/scmi/clock.c
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm/scmi/common.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/common.h
> rename to drivers/firmware/arm/scmi/common.h
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm/scmi/driver.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/driver.c
> rename to drivers/firmware/arm/scmi/driver.c
> diff --git a/drivers/firmware/arm_scmi/msg.c b/drivers/firmware/arm/scmi/msg.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/msg.c
> rename to drivers/firmware/arm/scmi/msg.c
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm/scmi/notify.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.c
> rename to drivers/firmware/arm/scmi/notify.c
> diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm/scmi/notify.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.h
> rename to drivers/firmware/arm/scmi/notify.h
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm/scmi/perf.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/perf.c
> rename to drivers/firmware/arm/scmi/perf.c
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/pinctrl.c
> rename to drivers/firmware/arm/scmi/pinctrl.c
> diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm/scmi/power.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/power.c
> rename to drivers/firmware/arm/scmi/power.c
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm/scmi/powercap.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/powercap.c
> rename to drivers/firmware/arm/scmi/powercap.c
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm/scmi/protocols.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/protocols.h
> rename to drivers/firmware/arm/scmi/protocols.h
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm/scmi/quirks.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.c
> rename to drivers/firmware/arm/scmi/quirks.c
> diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm/scmi/quirks.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.h
> rename to drivers/firmware/arm/scmi/quirks.h
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm/scmi/raw_mode.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.c
> rename to drivers/firmware/arm/scmi/raw_mode.c
> diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/arm/scmi/raw_mode.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.h
> rename to drivers/firmware/arm/scmi/raw_mode.h
> diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm/scmi/reset.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/reset.c
> rename to drivers/firmware/arm/scmi/reset.c
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm/scmi/scmi_power_control.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/scmi_power_control.c
> rename to drivers/firmware/arm/scmi/scmi_power_control.c
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm/scmi/sensors.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/sensors.c
> rename to drivers/firmware/arm/scmi/sensors.c
> diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm/scmi/shmem.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/shmem.c
> rename to drivers/firmware/arm/scmi/shmem.c
> diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/arm/scmi/system.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/system.c
> rename to drivers/firmware/arm/scmi/system.c
> diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm/scmi/transports/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Kconfig
> rename to drivers/firmware/arm/scmi/transports/Kconfig
> diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firmware/arm/scmi/transports/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Makefile
> rename to drivers/firmware/arm/scmi/transports/Makefile
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm/scmi/transports/mailbox.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/mailbox.c
> rename to drivers/firmware/arm/scmi/transports/mailbox.c
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm/scmi/transports/optee.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/optee.c
> rename to drivers/firmware/arm/scmi/transports/optee.c
> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm/scmi/transports/pcc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/pcc.c
> rename to drivers/firmware/arm/scmi/transports/pcc.c
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm/scmi/transports/smc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/smc.c
> rename to drivers/firmware/arm/scmi/transports/smc.c
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm/scmi/transports/virtio.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/virtio.c
> rename to drivers/firmware/arm/scmi/transports/virtio.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm/scmi/vendors/imx/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Kconfig
> rename to drivers/firmware/arm/scmi/vendors/imx/Kconfig
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm/scmi/vendors/imx/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Makefile
> rename to drivers/firmware/arm/scmi/vendors/imx/Makefile
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-bbm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-bbm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-cpu.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-cpu.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-lmm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-lmm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-misc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-misc.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm/scmi/vendors/imx/imx95.rst
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> rename to drivers/firmware/arm/scmi/vendors/imx/imx95.rst
> diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm/scmi/voltage.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/voltage.c
> rename to drivers/firmware/arm/scmi/voltage.c
> diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm/scpi.c
> similarity index 100%
> rename from drivers/firmware/arm_scpi.c
> rename to drivers/firmware/arm/scpi.c
> diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm/sdei.c
> similarity index 100%
> rename from drivers/firmware/arm_sdei.c
> rename to drivers/firmware/arm/sdei.c
> diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm/sdei_nmi.c
> similarity index 100%
> rename from drivers/firmware/arm_sdei_nmi.c
> rename to drivers/firmware/arm/sdei_nmi.c
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/arm/smccc/Kconfig
> similarity index 100%
> rename from drivers/firmware/smccc/Kconfig
> rename to drivers/firmware/arm/smccc/Kconfig
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/arm/smccc/Makefile
> similarity index 100%
> rename from drivers/firmware/smccc/Makefile
> rename to drivers/firmware/arm/smccc/Makefile
> diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/arm/smccc/bus.c
> similarity index 100%
> rename from drivers/firmware/smccc/bus.c
> rename to drivers/firmware/arm/smccc/bus.c
> diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/arm/smccc/kvm_guest.c
> similarity index 100%
> rename from drivers/firmware/smccc/kvm_guest.c
> rename to drivers/firmware/arm/smccc/kvm_guest.c
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/arm/smccc/smccc.c
> similarity index 100%
> rename from drivers/firmware/smccc/smccc.c
> rename to drivers/firmware/arm/smccc/smccc.c
> diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/arm/smccc/soc_id.c
> similarity index 100%
> rename from drivers/firmware/smccc/soc_id.c
> rename to drivers/firmware/arm/smccc/soc_id.c
> -- 
> 2.43.0
> 

-- 
Sincerely,
Yeoreum Yun

