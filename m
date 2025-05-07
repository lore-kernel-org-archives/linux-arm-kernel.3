Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45EFC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXts61m3iUtZ1pnLwWrOD+67TS3SnyVASHtQHmsR5aw=; b=UNO23+J2n4/ofRMkpGIFVJcbqQ
	khEhAlOhQAAS7sQLbNxc388erHVuBgwN3fdSlAvFtjfUxlBOJWybU+6Eo7n5pJYWyAQs6vMwVHk+1
	QJ/XxxRiKaQKhTaFBXv55HjyFUeQVO/V3bOJtR5lbA0OuTv4698yPgIBQql9oulxxqXZfKwmsK+Ns
	3ukC8q6oSiEOoeqf3W5YKt0EaaJYs517zE5y67yORltjnQT2yXYBpxGDQJv6e8pT8kfcaadG9VZgZ
	eiZDkVFRsr2Rk2dilYKE+y3ZZ/uv/QnVB2ULcv/0RkFu0AsnEyp6LKblqEoTewMHdvilNf1UXeZcw
	ETPSr4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWb-0000000GHxs-1gmX;
	Wed, 07 May 2025 17:25:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCguI-0000000G0uR-0DGd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E0FDA4D977;
	Wed,  7 May 2025 15:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF742C4CEE2;
	Wed,  7 May 2025 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632521;
	bh=NCun+NhTWH48hbEa1EuIT6DCqQ2vujaGUcGfgfPDYNY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ayKxudTyJcemB7oHNmsFytdZuHFwII5dxe9hw71MFdX6RFZfnqI7hoW/oeJZ/+s6k
	 y2r1mzFoeZ7y+wVeQgCiXzAHinHNjme4Fv85kDtClkWiR+PBulywwOzGUTwno9IsCh
	 wyZx7ffJtIwiDDNxTMlc5zAzoxCmdGdBcB13tXlh6eB4Qy4ezREtGFTbkpzv7Orv7p
	 1+jxID5G7BYRYp+bg8GTlYqUPp2Gqjk7acNRtI+QeJB9lHl2JkKYe1pmdXhnyJCJfL
	 CdymfmqRxNZO2fU8s9/5PQdBhjgVKM2LTRB5c8/ANA4ycRpc5MLEJcgqYVG6oPQ/aC
	 ZTWONnpz2AElQ==
Date: Wed, 07 May 2025 10:41:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, w.egorov@phytec.de, 
 linux-arm-kernel@lists.infradead.org, kristo@kernel.org, 
 devicetree@vger.kernel.org, upstream@lists.phytec.de, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
Message-Id: <174663232992.1557549.10416633655094198343.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv
 device nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084202_227526_D30A212C 
X-CRM114-Status: GOOD (  14.86  )
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


On Wed, 07 May 2025 00:00:04 -0700, Daniel Schultz wrote:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 
> Changes in v2:
>   * Rebased to latest master branch.
> 
> Changes in v3:
>   * Added Reviewed-by
>   * Merged mboxes items for c7x and wkup+mcu rf5 nodes.
> 
> Daniel Schultz (4):
>   arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
>   arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
>   arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
>   arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
> 
>  .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  35 +++++-
>  .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 106 +++++++++++++++++-
>  2 files changed, 129 insertions(+), 12 deletions(-)
> 
> --
> 2.25.1
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
 Base: tags/v6.15-rc1-35-gd16e7d34352c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250507070008.1231611-1-d.schultz@phytec.de:

Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:203.1-7 Label or path c7x_0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:392.1-12 Label or path mcu_r5fss0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:396.1-18 Label or path mcu_r5fss0_core0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:431.1-13 Label or path wkup_r5fss0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:435.1-19 Label or path wkup_r5fss0_core0 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 2
Error: arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:403.1-13 Label or path wkup_r5fss0 not found
Error: arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:407.1-19 Label or path wkup_r5fss0_core0 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am625-phyboard-lyra-rdk.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'ti/k3-am625-verdin-wifi-ivy.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-dahlia.dtb' not remade because of errors.
make: Target 'ti/k3-j721e-common-proc-board.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-dev.dtb' not remade because of errors.
make: Target 'ti/k3-am642-evm.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-mallow.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-dahlia.dtb' not remade because of errors.
make: Target 'ti/k3-j742s2-evm.dtb' not remade because of errors.
make: Target 'ti/k3-am642-hummingboard-t.dtb' not remade because of errors.
make: Target 'ti/k3-am625-beagleplay.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-yavia.dtb' not remade because of errors.
make: Target 'ti/k3-am6528-iot2050-basic-pg2.dtb' not remade because of errors.
make: Target 'ti/k3-am68-sk-base-board.dtb' not remade because of errors.
make: Target 'ti/k3-am62p5-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am6528-iot2050-basic.dtb' not remade because of errors.
make: Target 'ti/k3-am62-pocketbeagle2.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced-m2.dtb' not remade because of errors.
make: Target 'ti/k3-am654-base-board.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced.dtb' not remade because of errors.
make: Target 'ti/k3-am62a7-phyboard-lyra-rdk.dtb' not remade because of errors.
make: Target 'ti/k3-am62a7-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-dev.dtb' not remade because of errors.
make: Target 'ti/k3-j722s-evm.dtb' not remade because of errors.
make: Target 'ti/k3-j721e-beagleboneai64.dtb' not remade because of errors.
make: Target 'ti/k3-am642-phyboard-electra-rdk.dtb' not remade because of errors.
make: Target 'ti/k3-am69-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced-pg2.dtb' not remade because of errors.
make: Target 'ti/k3-am68-phyboard-izar.dtb' not remade because of errors.
make: Target 'ti/k3-am642-hummingboard-t-pcie.dtb' not remade because of errors.
make: Target 'ti/k3-j7200-common-proc-board.dtb' not remade because of errors.
make: Target 'ti/k3-am62-lp-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-yavia.dtb' not remade because of errors.
make: Target 'ti/k3-j721s2-common-proc-board.dtb' not remade because of errors.
make: Target 'ti/k3-am642-tqma64xxl-mbax4xxl.dtb' not remade because of errors.
make: Target 'ti/k3-am67a-beagley-ai.dtb' not remade because of errors.
make: Target 'ti/k3-am642-hummingboard-t-usb3.dtb' not remade because of errors.
make: Target 'ti/k3-am642-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced-sm.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-mallow.dtb' not remade because of errors.
make: Target 'ti/k3-am625-phyboard-lyra-rdk.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-ivy.dtb' not remade because of errors.
make: Target 'ti/k3-j784s4-evm.dtb' not remade because of errors.
make: Target 'ti/k3-am625-sk.dtb' not remade because of errors.
make: Target 'ti/k3-j721e-sk.dtb' not remade because of errors.






