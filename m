Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02AEC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6ujPK3oqoYieaLzru+P26OZ+71jy/swBwK3fRNYuCw=; b=fLdPDy7VR2FoXphO0c7arKnZF0
	ZuwpEJbsiEi1C9Nq9oL8W0uVJOH+PZpcHM4Rg+qNlJZHPE0dmbnakGOC9V6nPNXLmf4ewSHAOHUKH
	liqNBqGdPREuVs1J0Ys0uvAGA2ERUjjYpfxLfYO8jpmQfdQpg097L4tYPq19bdeDEmikmwePpybuj
	cAJz2HHTHq3xdERkZic+H22n76TfrcdiCs6KX76lEKmvRQ9RZETC8Tw4y5iy+iGTkG2yleun71vEA
	subFxtJ0gLvVvbXuAlemqHnC9jtecJUwmvddQQxWKkzC4lwv1RO9iCq3VYiO40s5t9t02q2NAiBOp
	hE8ZGLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVX7-0000000D5aH-1Hoe;
	Mon, 24 Feb 2025 10:17:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVNw-0000000D3NQ-3jQA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:08:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883F51E7D;
	Mon, 24 Feb 2025 02:08:38 -0800 (PST)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20F143F673;
	Mon, 24 Feb 2025 02:08:20 -0800 (PST)
Message-ID: <58ee2a8d-d3c1-4bc2-92dd-6568f645b01f@arm.com>
Date: Mon, 24 Feb 2025 10:08:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] arm64: dts: Add Arm Morello support
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <Z7jL5wBUJNjOlg4r@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <Z7jL5wBUJNjOlg4r@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_020825_056339_37707FE8 
X-CRM114-Status: GOOD (  27.03  )
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

Hello Mark,

On 21/02/2025 18:54, Mark Rutland wrote:
> Hi Vincenzo,
> 
> On Fri, Feb 21, 2025 at 06:03:39PM +0000, Vincenzo Frascino wrote:
>> The Morello architecture is an experimental extension to Armv8.2-A,
>> which extends the AArch64 state with the principles proposed in
>> version 7 of the Capability Hardware Enhanced RISC Instructions
>> (CHERI) ISA [1].
> 
> None of the CHERI stuff is supported upstream, so from upstream's PoV
> this is a low-volume dev-board/SoC with an experimental ARMv8.2-A CPU.
>

Agreed, I have no plans to upstream Morello support beyond the device tree.

>> This series adds dts support for the Arm Morello System Development
>> Platform.
> 
> Do we actually need the dts for this board?
> 
> I have one on my desk; it boots vanilla Debian 12 via UEFI + ACPI just
> fine, with the Debian 6.1.0-13-arm64 kernel.
> 
> Is there something that we can only do with the DT? i.e. some
> functionality that isn't exposed via ACPI?
> 
> How do you expect this DT to be used?
> 

There are functionalities that are not exposed via ACPI, e.g. gpu, dpu, i2c for
the phy, etc. My aim to have upstream support for all the hardware exposed by
the platform.

Note: This series contains only the basic infrastructure, the plan is add
progressively more features in the future.

Vincenzo

> Mark.
> 
>>
>> [1] https://www.morello-project.org/
>>
>> To simplify the testing a linux tree rebased on 6.14-rc4 is accessible
>> at [2].
>>
>> [2] https://codeberg.org/vincenzo/linux/src/branch/morello/dts/v6
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org> 
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Jessica Clarke <jrtc27@jrtc27.com>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>
>> Changes
>> =======
>> v7:
>>   - Rebased on 6.14-rc4.
>>   - Added review info.
>> v6:
>>   - Introduce arm,morello.yml.
>>   - Split pmu patch.
>>   - Address review comments.
>> v5:
>>   - Add support for fvp.
>>   - Add support for pmu.
>>   - Address review comments.
>>   - Rebase on 6.14-rc1.
>> v4:
>>   - Add cache information.
>>   - Address review comments.
>> v3:
>>   - Address review comments.
>>   - Rebase on 6.13-rc5.
>> v2:
>>   - Addressed review comments.
>>   - Rebased on 6.13-rc4.
>>   - Renamed arm,morello to arm,morello-sdp for clarity.
>>
>> Vincenzo Frascino (10):
>>   arm64: Kconfig: Update description for CONFIG_ARCH_VEXPRESS
>>   dt-bindings: arm: Add Morello compatibility
>>   dt-bindings: arm: Add Morello fvp compatibility
>>   dt-bindings: arm: Add Rainier compatibility
>>   dt-bindings: arm-pmu: Add support for ARM Rainier PMU
>>   perf: arm_pmuv3: Add support for ARM Rainier PMU
>>   arm64: dts: morello: Add support for common functionalities
>>   arm64: dts: morello: Add support for soc dts
>>   arm64: dts: morello: Add support for fvp dts
>>   MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer
>>
>>  .../devicetree/bindings/arm/arm,morello.yaml  |  35 ++
>>  .../devicetree/bindings/arm/cpus.yaml         |   1 +
>>  .../devicetree/bindings/arm/pmu.yaml          |   1 +
>>  MAINTAINERS                                   |   7 +
>>  arch/arm64/Kconfig.platforms                  |   5 +-
>>  arch/arm64/boot/dts/arm/Makefile              |   1 +
>>  arch/arm64/boot/dts/arm/morello-fvp.dts       |  77 +++++
>>  arch/arm64/boot/dts/arm/morello-sdp.dts       | 157 +++++++++
>>  arch/arm64/boot/dts/arm/morello.dtsi          | 323 ++++++++++++++++++
>>  drivers/perf/arm_pmuv3.c                      |   2 +
>>  10 files changed, 606 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,morello.yaml
>>  create mode 100644 arch/arm64/boot/dts/arm/morello-fvp.dts
>>  create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
>>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
>>
>> -- 
>> 2.43.0
>>

-- 
Regards,
Vincenzo


