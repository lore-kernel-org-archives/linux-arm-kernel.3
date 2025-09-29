Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9A3CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+adMNBQQ46Q15D+cExi+t8AUMiYDPgGyOTzXNqgJms=; b=h5Ldm4fmX69EWB4XGIxYhF80fo
	7qYU7HfT7dw3MnQn+RBfQjzZ1SBMALSP0XAmGWvh4UNCoq+uBdiLmJ9UTJHF3dZK389VoJjyWGd2K
	RIZl0X053d0vTrPNR2okHUaJYgc0T3p1ht1UJwcmk+ClxDTCVBwT6lSuICmKiJLMh1Q+IyD4CkViB
	lGfyqn1M+uUc74tcvTfyYnuFw7TkRQtep3i/hEPhab1xUxmVch5W2cqmhqEPpJpEMZ+n+KvWchiK0
	lPPwGyn0nUNgf5C+O9NHavhMrbOADciS/Am4jIMgQj/xsGQw/yV7ssGBPIno25uOIlkfD9mXqfuqA
	oVu825Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FoE-00000002n5F-1z2Z;
	Mon, 29 Sep 2025 15:29:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FoD-00000002n58-1464
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 130C5625BD;
	Mon, 29 Sep 2025 15:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D72C116B1;
	Mon, 29 Sep 2025 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759159739;
	bh=zz+GUmVsy2vB+3ANMPWPbJpVcNFY2jQbjEDvoTACVOw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LieiEkf/My5IzhSHvnx4xacBLRykPFVF30XNtrgPaxvt2XruntfGF75FreaDo5sBd
	 7xIR+u+UDMeWUdKANsMbUYIezK3qC+eBLGFYhBfbwlCZp/dWe7mpLGu1lF2BWlcHIk
	 A8SYBu5x4+tJ2dvEy1iXzJO04Slrd60iufQ0d5V7EBMv6kxh/iPMaOxV/+77aJZzuC
	 d61H5tM8BVpft6iJid+miAYFAIBLgkso9EXESl+Cv0Z6HtLz35zjtQ7vjNe/9Yl4ix
	 4pKSEvUXKrIQLuwqjrlKISh9VE34TmD2amQ3kMZBmQ/MdXd6yUGUQSxnUFTxjndsRh
	 dvSafSW63W2JA==
Date: Mon, 29 Sep 2025 10:28:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, 
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>
To: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
Message-Id: <175915953199.54406.1457670691076635405.robh@kernel.org>
Subject: Re: [PATCH V2 0/4] Add tegra264 audio device tree support
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


On Mon, 29 Sep 2025 16:29:26 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Add device tree support for tegra264 audio subsystem including:
> - Binding update for
>   - 64-channel ADMA controller
>   - 32 RX/TX ADMAIF channels
>   - tegra264-agic binding for arm,gic
> - Add device tree nodes for
>   - APE subsystem (ACONNECT, AGIC, ADMA, AHUB and children (ADMAIF, I2S,
>     DMIC, DSPK, MVC, SFC, ASRC, AMX, ADX, OPE and Mixer) nodes
>   - HDA controller
>   - sound
> 
> Note:
>  The change is dependent on https://patchwork.ozlabs.org/project/linux-tegra/patch/20250818135241.3407180-1-thierry.reding@gmail.com/
> 
> ...
> Changes in V2:
>  - Update the allOf condition in Patch 2/4.
> 
> sheetal (4):
>   dt-bindings: dma: Update ADMA bindings for tegra264
>   dt-bindings: sound: Update ADMAIF bindings for tegra264
>   dt-bindings: interrupt-controller: arm,gic: Add tegra264-agic
>   arm64: tegra: Add tegra264 audio support
> 
>  .../bindings/dma/nvidia,tegra210-adma.yaml    |   15 +-
>  .../interrupt-controller/arm,gic.yaml         |    1 +
>  .../sound/nvidia,tegra210-admaif.yaml         |  106 +-
>  .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  106 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 3190 +++++++++++++++++
>  5 files changed, 3377 insertions(+), 41 deletions(-)
> 
> --
> 2.34.1
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
 Base: tags/v6.17-rc1-57-g635ae6f0a3ad (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250929105930.1767294-1-sheetal@nvidia.com:

In file included from arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi:3,
                 from arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi:3,
                 from arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts:5:
arch/arm64/boot/dts/nvidia/tegra264.dtsi:8:10: fatal error: dt-bindings/power/nvidia,tegra264-powergate.h: No such file or directory
    8 | #include <dt-bindings/power/nvidia,tegra264-powergate.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/nvidia] Error 2
make[2]: Target 'arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: nvidia/tegra264-p3971-0089+p3834-0008.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'nvidia/tegra210-p2371-2180.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p3450-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3737-0000+p3701-0008.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3740-0002+p3701-0008.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3737-0000+p3701-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra186-p2771-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p2371-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra194-p3509-0000+p3668-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3768-0000+p3767-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-sim-vdk.dtb' not remade because of errors.
make: Target 'nvidia/tegra186-p3509-0000+p3636-0001.dtb' not remade because of errors.
make: Target 'nvidia/tegra194-p2972-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-smaug.dtb' not remade because of errors.
make: Target 'nvidia/tegra194-p3509-0000+p3668-0001.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3768-0000+p3767-0005.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p2571.dtb' not remade because of errors.
make: Target 'nvidia/tegra264-p3971-0089+p3834-0008.dtb' not remade because of errors.
make: Target 'nvidia/tegra132-norrin.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p2894-0050-a08.dtb' not remade because of errors.






