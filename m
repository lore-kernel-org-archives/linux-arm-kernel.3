Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457CFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgoFmDyh649W9h+YBPkv6yrA7+NNYSN1cIWKOFI/X0A=; b=E8ItkUuhe2Sjhnh6uUAo41EQhQ
	L1BWP2MQsqn+LinnsAb+2RJa7TgQQLgT6ZPq5PAOr//QGvx+jYcCJRLQylRPXq6hf9NbGEWtw1Dpa
	CUv19Pt1ggPcgOmHCa9PzCipaGdu8n/AW37U8cqmq6xoJ5yPsh9Tpdgcq4UUfQzVv+gL6yb5ALXw+
	NCwYVxQbFOYKPFHqSRr+h8Tun9M9pt5ae26HID+GL74nxhPRLbvKhHqIyhNIM/+/1U4MlWZz8cq0K
	Y4e6JKJ8M5ooiVZzc4GW2lm4zKKcCZupmr6Uz5UuPwl/iIdfUBX6SyXDScqoDUlFmUDC5KQRdDaGE
	ahJxMWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWa-0000000GHxO-3Jgh;
	Wed, 07 May 2025 17:25:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCguG-0000000G0ts-1wlp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98462A4DA4C;
	Wed,  7 May 2025 15:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A014C4CEE2;
	Wed,  7 May 2025 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632519;
	bh=V499VMv+rPex1wvscWee8vau59a5tTXRvhSZFocwZ3E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eTV07ZyLYysTTRFH5wy8M0Lo9JSlivRghPHy5tjGP8qJSAZJm7GP6MKpMuW54FCbV
	 PjHS+VFoQOAbVhrqtrFVIy3LSPw78UCySupjxCMTfVafeGD1DiammW+4IKZogrUYB3
	 h34qbfMbIp5yNhyeR1+Woc7wfhHd9VP36wM9lHfXYIbiXB5wizPwTIdr4fgtLUOsqb
	 ln2Zc5Anun9B6RDd0KeiDxOfJCt4bSg4aywKioxwhLSlaf16szGuGkP48EuzjPKh60
	 08F9O82Aa2tVq8Mhssf4EwsRAX2U+u8UiibCv7Wg/a0WZ40zjmae3sUjxGIEUbSboq
	 7j2mV9ltnvqSA==
Date: Wed, 07 May 2025 10:41:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de, 
 devicetree@vger.kernel.org, robertcnelson@gmail.com, kristo@kernel.org, 
 vigneshr@ti.com, w.egorov@phytec.de, nm@ti.com, 
 francesco.dolcini@toradex.com, linux-kernel@vger.kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250507050847.912756-1-d.schultz@phytec.de>
References: <20250507050847.912756-1-d.schultz@phytec.de>
Message-Id: <174663232933.1557435.12503360883036162870.robh@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-thermal: Add Files for
 each Temp. Grade
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084200_635313_6A673260 
X-CRM114-Status: GOOD (  15.71  )
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


On Tue, 06 May 2025 22:08:44 -0700, Daniel Schultz wrote:
> The AM62x SoC supports three temperature ranges:
> * A: -40 to 105C - Extended Industrial
> * H:   0 to  95C - Commercial
> * I: -40 to 125C - Automotive
> 
> Add device tree include files to adjust the alert and critical trip
> points in k3-am62-thermal based on the temperature grade.
> 
> Passive trip points are always set 10C below critical.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  .../dts/ti/k3-am62-thermal-automotive.dtsi    | 20 +++++++++++++++++++
>  .../dts/ti/k3-am62-thermal-commercial.dtsi    | 20 +++++++++++++++++++
>  .../dts/ti/k3-am62-thermal-industrial.dtsi    | 20 +++++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi
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
 Base: tags/v6.15-rc1-6-gf1aff4bc199c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250507050847.912756-1-d.schultz@phytec.de:

Error: arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi:6.1-13 Label or path main0_alert not found
Error: arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi:14.1-13 Label or path main1_alert not found
Error: arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi:22.1-13 Label or path main2_alert not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 2
arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:14:10: fatal error: k3-am62a-thermal-automative.dtsi: No such file or directory
   14 | #include "k3-am62a-thermal-automative.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am62a7-sk.dtb] Error 2
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






