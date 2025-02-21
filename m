Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B78C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzzQhbdw+OtfMMAf3OxtRqDCOMPGW/efjlK8+P+97AU=; b=tBXXQ6PjMrowS/RZGA/QhRhwkd
	xk+eMuPaiCDPvxu5LMB2n5C8kECjEA0WB5JyN0GxVraEsnRgglBiwmmBtHYTsRlhCnVw/QD3cKUbq
	8U39j13eeeWSxVuvQ04PJxe0SloZOBVYRQ0hArPFzvGdMloHhtOIz6pw5pXDKzwGaQoZKjpjPoWQ4
	P1Mod62mu07WVKZ2+NycqtZNgyvAlFt4k9fBvQAI6kp8Z0pN+9j1wNeHg+ld9xSeI9ikLPay3AhTT
	9Su/QA+XSNrd7b+MRp4IwVXgvMMhy7e8vTi0vGP/FwJux+UB74VIOEZSh2pjCEXWh/Q5IGVcM/UaU
	qElCI6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYC4-00000006Zxj-17e9;
	Fri, 21 Feb 2025 18:56:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYAa-00000006Zlm-2niU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:54:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CE6E169C;
	Fri, 21 Feb 2025 10:54:55 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D780E3F59E;
	Fri, 21 Feb 2025 10:54:35 -0800 (PST)
Date: Fri, 21 Feb 2025 18:54:31 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 00/10] arm64: dts: Add Arm Morello support
Message-ID: <Z7jL5wBUJNjOlg4r@J2N7QTR9R3.cambridge.arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_105440_804028_9931090F 
X-CRM114-Status: GOOD (  23.25  )
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

Hi Vincenzo,

On Fri, Feb 21, 2025 at 06:03:39PM +0000, Vincenzo Frascino wrote:
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA [1].

None of the CHERI stuff is supported upstream, so from upstream's PoV
this is a low-volume dev-board/SoC with an experimental ARMv8.2-A CPU.

> This series adds dts support for the Arm Morello System Development
> Platform.

Do we actually need the dts for this board?

I have one on my desk; it boots vanilla Debian 12 via UEFI + ACPI just
fine, with the Debian 6.1.0-13-arm64 kernel.

Is there something that we can only do with the DT? i.e. some
functionality that isn't exposed via ACPI?

How do you expect this DT to be used?

Mark.

> 
> [1] https://www.morello-project.org/
> 
> To simplify the testing a linux tree rebased on 6.14-rc4 is accessible
> at [2].
> 
> [2] https://codeberg.org/vincenzo/linux/src/branch/morello/dts/v6
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jessica Clarke <jrtc27@jrtc27.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> 
> Changes
> =======
> v7:
>   - Rebased on 6.14-rc4.
>   - Added review info.
> v6:
>   - Introduce arm,morello.yml.
>   - Split pmu patch.
>   - Address review comments.
> v5:
>   - Add support for fvp.
>   - Add support for pmu.
>   - Address review comments.
>   - Rebase on 6.14-rc1.
> v4:
>   - Add cache information.
>   - Address review comments.
> v3:
>   - Address review comments.
>   - Rebase on 6.13-rc5.
> v2:
>   - Addressed review comments.
>   - Rebased on 6.13-rc4.
>   - Renamed arm,morello to arm,morello-sdp for clarity.
> 
> Vincenzo Frascino (10):
>   arm64: Kconfig: Update description for CONFIG_ARCH_VEXPRESS
>   dt-bindings: arm: Add Morello compatibility
>   dt-bindings: arm: Add Morello fvp compatibility
>   dt-bindings: arm: Add Rainier compatibility
>   dt-bindings: arm-pmu: Add support for ARM Rainier PMU
>   perf: arm_pmuv3: Add support for ARM Rainier PMU
>   arm64: dts: morello: Add support for common functionalities
>   arm64: dts: morello: Add support for soc dts
>   arm64: dts: morello: Add support for fvp dts
>   MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer
> 
>  .../devicetree/bindings/arm/arm,morello.yaml  |  35 ++
>  .../devicetree/bindings/arm/cpus.yaml         |   1 +
>  .../devicetree/bindings/arm/pmu.yaml          |   1 +
>  MAINTAINERS                                   |   7 +
>  arch/arm64/Kconfig.platforms                  |   5 +-
>  arch/arm64/boot/dts/arm/Makefile              |   1 +
>  arch/arm64/boot/dts/arm/morello-fvp.dts       |  77 +++++
>  arch/arm64/boot/dts/arm/morello-sdp.dts       | 157 +++++++++
>  arch/arm64/boot/dts/arm/morello.dtsi          | 323 ++++++++++++++++++
>  drivers/perf/arm_pmuv3.c                      |   2 +
>  10 files changed, 606 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,morello.yaml
>  create mode 100644 arch/arm64/boot/dts/arm/morello-fvp.dts
>  create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
> 
> -- 
> 2.43.0
> 

