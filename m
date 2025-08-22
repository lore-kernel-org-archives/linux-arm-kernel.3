Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNSSjZ503+7Whcqnwm1i1/7OWFm+wsrQw0bRcTzZw/A=; b=l1iJBDw2rCF6lgk+KJisvODNuv
	2oNqKuoIVsLiRt6l6ADO27/qwODk5PbMw0yFEijiXG09gdsXBrAF8V7cB2oOFsVs+1Zn+iuciWHof
	sOj5codTNLR8l1++bUcFP0aAoZzSV119vsw7mCQ9bi0JalBhssGeMxw3SSKgvw+vb9Bbl1emxF/cR
	ZnZzc/a6rWXmbHeiJ0s6KgCQa/mu7xNGpWdV1F4GozQpIYMdCsZjbmzcUvTS8ZtjPqh9zpLRIxA+u
	mBcXZdthy4nMhODBBWXG8xjwzbaKFrp4DoC7KXVCyt7B0izqjemdadCw/T9ebK534RrxPCN8bTpQ2
	z4Vt6c5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUY-00000004MqD-1keW;
	Sat, 23 Aug 2025 08:20:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZIR-00000003Uy7-1j2k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 21:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D22D45C5862;
	Fri, 22 Aug 2025 21:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00515C4CEED;
	Fri, 22 Aug 2025 21:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755898058;
	bh=nkuC/QN2afmhmsTiI8HvmEF61S+v7E9xYf8SQ5cRt6M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=E3/tgXbpRMu3Jcn/e6bgT7QiCHcfx2wM4TCrsGb/8gZv5JDfPWyxwDMZ5ppT0xNvK
	 u4djSFIuLPt2BvQoIzHYeGHUMcDffld2eS2waOSvuesBgujMfAVOjT/ccIVv5zNjz/
	 tC0no6QO9MV1LSH35dzDZfgoMCYbZN1GPZs+M0VJJ2GcUZsCSVJepwXWj2brfUVP0h
	 PTynPT6mvCVuv0hvUBZzhsJED8Hl6OhWEo7SAPxlSCzSVS+MN/u3M4Hf9DNIfQObEq
	 GC5L4y733QqJF22tvgJMI6eF8rno+tO9NvO29zcimkkkP2RQvkVcZRoswmmDMJ0fzN
	 +7VxZ9LFNK17w==
Date: Fri, 22 Aug 2025 16:27:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-hwmon@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Message-Id: <175589786195.518444.15005080125108403794.robh@kernel.org>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_142739_562241_B89DA6C7 
X-CRM114-Status: GOOD (  22.48  )
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


On Fri, 22 Aug 2025 15:15:24 +0200, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
> 
> I'm aware that there is a patch [1] which moves the sl28cpld MFD
> schema to a different directory. Once that patch is merged, I'll
> repost this series. But I already want to get some early feedback.
> 
> [1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowski@linaro.org/
> 
> Michael Walle (7):
>   dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
>   dt-bindings: mfd: sl28cpld: add sa67mcu compatible
>   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
>   dt-bindings: watchdog: add SMARC-sAM67 support
>   dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
>   hwmon: sl28cpld: add SMARC-sAM67 support
>   arm64: dts: ti: Add support for Kontron SMARC-sAM67
> 
>  .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
>  .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
>  .../bindings/mfd/kontron,sl28cpld.yaml        |    7 +-
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
>  .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
>  arch/arm64/boot/dts/ti/Makefile               |    6 +
>  .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
>  .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
>  .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
>  drivers/hwmon/sl28cpld-hwmon.c                |   76 +-
>  10 files changed, 1234 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> 
> --
> 2.39.5
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250822 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250822131531.1366437-1-mwalle@kernel.org:

arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: pmic@44 (ti,tps652g1): 'gpio-line-names' does not match any of the regexes: '^buck([1-5]|12|34|123|1234)-supply$', '^ldo[1-4]-supply$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#






