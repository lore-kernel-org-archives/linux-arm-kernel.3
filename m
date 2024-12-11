Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F81E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GDppejLaa2XltUMCQQh1EJUzuGSneKUtpC+cgVutZ4=; b=Ia9ExV+OlfBTPdiW++bxYRLA6t
	eSkgbKKAZwzEtlQcTSvBUwK39hzTs+/b+1c+aeDQcTOp+/yBkUUlCU9fPgwHfhgJ2Y56YRsx3UtmD
	hKFUDv6Z2VJVPLo14TcoHpy4+VGs2YKP8ifiif208/9IScutjm1QrFdUd8kPD3cukpgIzssO4vAOt
	Cy/l+nWKPbhhWcKyTDpuJ7LW2BaA+kJBTtSAHxVrQIqTap9TpgrDWjXKAcxrmw17laBucv80aoXCt
	NViBRSkucNWL7irqQrWEHOnnt15Glg7L01hZpmZZLoNS7qgDb0hviHw2hrVvkMKrFkl9OwMcUfcqv
	IZW1K1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP6P-0000000FMLQ-28SK;
	Wed, 11 Dec 2024 15:58:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP30-0000000FLSv-0fPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24374A40CA5;
	Wed, 11 Dec 2024 15:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A3CC4CED4;
	Wed, 11 Dec 2024 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733932485;
	bh=fAtpFU5o1h8YJcA6IRudumE4PM0E6ftZoO/iy29wxhs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aD4w8jRIi5OxX3I7JaG5HNrTi7cZ86UlXSCIeMWi56us7kfrgQXGR21qKlLLZlN8B
	 BaF4Fv+I9qAMl9qycu8PLBXFwR/ViNMo0jC3v7pVPQMVFgR4m5p2qMn0XgsVN1hhCg
	 dox1hXfIBlE/djXlGOVaPrmO8xKNUvn/+BeMUOvBkiee9zI3VPYzfac/37iZy2ki92
	 XnA90BNTCDLMNcd7nL7c/tBw/corbCM1wO6ILKR8P9+Gli48mDcNzN7r7+saycF4tT
	 BQuks1MCZ+PfFYxQJCDSlr6jNy754ivvaaBD7yUQuue6Ma/uuXZV5be0YiOg07rSid
	 5z9lf23U/zbxg==
Date: Wed, 11 Dec 2024 09:54:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
 michal.simek@xilinx.com, monstr@monstr.eu, git@xilinx.com
To: Michal Simek <michal.simek@amd.com>
In-Reply-To: <cover.1733920873.git.michal.simek@amd.com>
References: <cover.1733920873.git.michal.simek@amd.com>
Message-Id: <173393224728.3091150.11085112233542602601.robh@kernel.org>
Subject: Re: [PATCH 00/15] ARM: zynq: Sync DTs with U-Boot
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_075446_323750_6BDE1A20 
X-CRM114-Status: GOOD (  16.07  )
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


On Wed, 11 Dec 2024 13:41:19 +0100, Michal Simek wrote:
> Hi,
> 
> over years there were some changes pushed to U-Boot which were never merged
> back to Linux. U-Boot introduced new option OF_UPSTREAM and start to sync
> up DTs from Linux back to U-Boot.
> This series is addressing differences.
> There are still 3 more differences but they should be addressed separately.
> 
> Thanks,
> Michal
> 
> 
> Michal Simek (14):
>   ARM: zynq: Remove deprecated device_type property
>   ARM: zynq: DT: List OCM memory for all platforms
>   ARM: zynq: Mark boot-phase-specific device nodes
>   ARM: zynq: Do not define address/size-cells for nand-controller
>   ARM: zynq: Wire smcc with nand/nor memories on zc770 platform
>   ARM: zynq: Add ethernet phy reset information to DT(zc702)
>   ARM: zynq: Define u-boot bootscrip addr via DT
>   ARM: zynq: Point via nvmem0 alias to eeprom on zc702/zc706
>   ARM: zynq: Define rtc alias on zc702/zc706
>   ARM: zynq: Rename i2c?-gpio to i2c?-gpio-grp
>   ARM: zynq: Fix fpga region DT nodes name
>   ARM: zynq: Enable QSPIs on platforms
>   ARM: zynq: Add sdhci to alias node
>   ARM: zynq: Remove ethernet0 alias from Microzed
> 
> Sai Krishna Potthuri (1):
>   ARM: zynq: Replace 'io-standard' with 'power-source' property
> 
>  arch/arm/boot/dts/xilinx/zynq-7000.dtsi       | 33 ++++++-
>  arch/arm/boot/dts/xilinx/zynq-cc108.dts       | 41 ++++++++-
>  arch/arm/boot/dts/xilinx/zynq-microzed.dts    | 10 ++-
>  arch/arm/boot/dts/xilinx/zynq-parallella.dts  |  1 -
>  arch/arm/boot/dts/xilinx/zynq-zc702.dts       | 87 +++++++++++++------
>  arch/arm/boot/dts/xilinx/zynq-zc706.dts       | 67 +++++++++++---
>  arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts | 39 ++++++++-
>  arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts | 31 +++++++
>  arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts | 35 ++++++++
>  arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts | 41 ++++++++-
>  arch/arm/boot/dts/xilinx/zynq-zed.dts         | 43 ++++++++-
>  .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  8 ++
>  arch/arm/boot/dts/xilinx/zynq-zybo-z7.dts     | 10 ++-
>  arch/arm/boot/dts/xilinx/zynq-zybo.dts        |  9 +-
>  14 files changed, 404 insertions(+), 51 deletions(-)
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y xilinx/zynq-cc108.dtb xilinx/zynq-microzed.dtb xilinx/zynq-parallella.dtb xilinx/zynq-zc702.dtb xilinx/zynq-zc706.dtb xilinx/zynq-zc770-xm010.dtb xilinx/zynq-zc770-xm011.dtb xilinx/zynq-zc770-xm012.dtb xilinx/zynq-zc770-xm013.dtb xilinx/zynq-zed.dtb xilinx/zynq-zybo-z7.dtb xilinx/zynq-zybo.dtb' for cover.1733920873.git.michal.simek@amd.com:

arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000: ethernet-phy@0: Unevaluated properties are not allowed ('marvell,reg-init' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
arch/arm/boot/dts/xilinx/zynq-zc702.dtb: ethernet@e000b000: Unevaluated properties are not allowed ('phy-reset-active-low', 'phy-reset-gpio' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#






