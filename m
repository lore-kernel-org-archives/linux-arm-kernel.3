Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D95CC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2SUmOk2wcYG094HhwrGjwm8pDy5WOfF1RZik1Ao6jk=; b=X6n2ichFeSv3258xmGngJp8Mr3
	j6K3RLRPPPPQzMR+pjB1XWakac/U+unOPiGoQiOmQ2L8jqzooWcSrrVGkPuelUviuJ4pB5Kq3J37p
	DUH++hdy58jCyyluk7DtISHDUmlHjUa4NvayHWBfpFeyXN9l0FbdC0qSrnN2sD/wqQqcq2T+gJDHo
	3z3Ae20OpMJ8ayakCwmWtDCalJSfPlXezF8oLB6TllAk2/Cn6WUyIdLuHChmBgDuOzsTv8YChF7KC
	9VQ6JgIrd8X2Q6xdZINMFw/0nGjKH/hAYtBvdEseZdnMS+ng/gi0BmE4hxIzmYEiifkrD4kdUXXBY
	Uw0U2YjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxAx-00000007hKT-0TqS;
	Mon, 05 May 2025 14:52:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx3D-00000007fPO-1pQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 14:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11DDE61165;
	Mon,  5 May 2025 14:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B871C4CEEE;
	Mon,  5 May 2025 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456250;
	bh=MHUgGt1nhsM9ZnWIPLv79iXt4OuzDKXXjKrP4H9Te88=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NsdTpeWjRmMQtp6tHqzYk+nT6BZS2qpPKZfhXnkTK5pX/64nAoXk1wCTO5HKltF6B
	 wqjvQaWizl7Q/q39dmZHo7j2jPYCq5U/n48PQ5TgdicXhRUYvT9dJjJACDRm0obadp
	 r09HrfuwbvNeJiXkW2dxgTbGwAZljUIBAcWxldJk+WlZiFl/hAui9M9+Dsd328RSEB
	 AXmjfw76T38THEsx93IGTr0FNNHWR8wvkrXWcLPoaCK4BibMKd2o0omUINW83nJn82
	 E7kVq8quo28Gokl6h/4ZkFg/YTiyhJVqoJWImPlSBRiI0Utn+/hAig+Gi4Gqd4yNHJ
	 Bg3k2WLQVQWPQ==
Date: Mon, 05 May 2025 09:44:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <174645594263.1246703.7109407640870369437.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
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


On Sun, 04 May 2025 17:59:03 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
> 
> [1] is a dependancy on the aforementioned series for the usb phy drivers
> and bindings.
> 
> Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
> (r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
> including psci, pmu, chipid, architecture timer and mct, pinctrl,
> clocks and usb.
> 
> The devices using this SoC suffer from an issue caused by the stock
> Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
> needed to hardcode the adequate frequency in the timer node,
> otherwise the kernel panics.
> 
> Another issue is that cpu2 and cpu3 fail to come up consistently, which
> leads to a hang later in the boot process. As A510 cores are clustered
> by two, it makes sense for both of these cpus to fail if there is a
> power issue. Disable them until the problem is figured out.
> 
> Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
> 2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
> 1080x2340 Dynamic AMOLED display.
> 
> Further platform support will be added over time.
> 
> Best regards,
> Ivaylo
> 
> Changes in v4:
> - account for compatible changes in usb phy patches
> - use status fail instead of deleting cpu nodes
> - add a-b tag in the 1/4 patch
> 
> Changes in v3:
> - account for the usbdrd changes in the exynos2200 soc dtsi
> - drop usbcon driver from the MAINTAINERS patch
> 
> Changes in v2:
> - mention the board codename in the first patch's commit message
> - make all reg values hex in device trees
> - reorder usb_con above usb_dwc3
> - drop regulators for usb_con
> - remodel usb_con_phy to take usb_hsphy phandle
> - include MAINTAINERS patch in this patchset
> 
> [1] https://lore.kernel.org/all/20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com/
> 
> Ivaylo Ivanov (4):
>   dt-bindings: arm: samsung: document g0s board binding
>   arm64: dts: exynos: add initial support for exynos2200 SoC
>   arm64: dts: exynos: add initial support for Samsung Galaxy S22+
>   MAINTAINERS: add entry for Samsung Exynos2200 SoC
> 
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  MAINTAINERS                                   |   10 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  169 ++
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
>  6 files changed, 2512 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc4-309-g2696c4a950d5 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com:

arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/phy@10aa0000: failed to match any schema with compatible: ['samsung,exynos2200-usb32drd-phy']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/phy@10ab0000: failed to match any schema with compatible: ['samsung,exynos2200-eusb2-phy']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usb@10b00000: failed to match any schema with compatible: ['samsung,exynos2200-dwusb3']






