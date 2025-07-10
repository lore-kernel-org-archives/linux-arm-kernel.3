Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B87C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 02:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlDE4wwLQyBXuyazT1zKH8F0r5gpcY8WDUNcSQCf19I=; b=RozT1kyR8OfRCn+Fn0hqHEFytb
	pRFIoMIJCDCfinUl/mCtw/TQKQNq3ev3yNRr91SMmrLu/IZDEl2vsIZ/jvDUbsLWm0wjVeCdBpF39
	iOS9El263T+yNoQ3iW7CRB7unkgJIn+mCj2rpMszybymuNqHYQAM6c3gPD/2B1wJ9iAW2I84N4ru7
	RrkFQ8uOUAov5frexXzI5nqUtaQgoHMn8AGfTTERVbgsUFaAGdQJ+jKnvvEIOssUISJLIfCtSodTO
	tS9LMw/wsMlfAyvQkGa5UZeeJTZuIzf16xiq1mDIIepE44LeYtZvyGPLyBFaK+PznT92JJSdzHbAg
	ID0bY76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhKT-0000000AWCw-3e9E;
	Thu, 10 Jul 2025 02:48:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhI6-0000000AVxN-1fw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 02:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D33C5C56A2;
	Thu, 10 Jul 2025 02:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A30C4CEEF;
	Thu, 10 Jul 2025 02:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752115541;
	bh=eUk6e7AZRF7cb9xdrd8ekZHvFdTxe6DSM8C/y5EDFAY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BZOBh7svNUr5nkT1+RXSjYuoZH7nlJwIM+KWR8RJI9SvR0VxfDG0HLPCEiE+4B0LP
	 axNwWtnxHl8RlEnzcWK/7R5pQqfTlncrvEZyv9kW9XukMFKNvt/1tI5Pye+H/ScYjm
	 FFyFJ6sOG1bGKm6CTiZFnsp0F8zNySScSFC7X7Wj8lXmyIAQbb8VlMi7Ca7P47k/bs
	 g8Ei3n5qYqsj8EVBGW8EyQqAO/sK4UFfxYVr/1H3+GSfxK6d/1ozh4voOE0ACNIazJ
	 b9n+R4x9a9YcFVkRAE2S7PI9IJI+lXoM5nkCJyc9MvbUfKLfhwZqykM0g86uikQ4tU
	 E0fpNeCeVyZ8g==
Date: Wed, 09 Jul 2025 21:45:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
Message-Id: <175211539720.410893.5566510176831399738.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: tegra: Add Tegra264 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_194542_523831_897F3E43 
X-CRM114-Status: GOOD (  18.74  )
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


On Thu, 10 Jul 2025 01:13:57 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This adds support for the Tegra264 SoC as well as the engineering
> reference platform that goes with it. There isn't too much here yet, but
> it should enable users to boot into an initial ramdisk. Patches to
> enable access to the root filesystem are in the works but not quite
> ready yet.
> 
> Thierry
> 
> Thierry Reding (4):
>   arm64: tegra: Add Tegra264 support
>   arm64: tegra: Add p3971-0089+p3834-0008 support
>   arm64: tegra: Add memory controller on Tegra264
>   arm64: defconfig: Enable Tegra241 and Tegra264
> 
>  arch/arm64/boot/dts/nvidia/Makefile           |   2 +
>  .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |   7 +
>  .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  30 ++
>  .../nvidia/tegra264-p3971-0089+p3834-0008.dts |  11 +
>  .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
>  .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |   3 +
>  .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |   4 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 415 ++++++++++++++++++
>  arch/arm64/configs/defconfig                  |   2 +
>  9 files changed, 488 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
> 
> --
> 2.50.0
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
 Base: tags/next-20250709 (best guess, 1/2 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250709231401.3767130-1-thierry.reding@gmail.com:

In file included from arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi:3,
                 from arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi:3,
                 from arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts:5:
arch/arm64/boot/dts/nvidia/tegra264.dtsi:3:10: fatal error: dt-bindings/clock/nvidia,tegra264.h: No such file or directory
    3 | #include <dt-bindings/clock/nvidia,tegra264.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb] Error 1
make[2]: *** [scripts/Makefile.build:554: arch/arm64/boot/dts/nvidia] Error 2
make[2]: Target 'arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: nvidia/tegra264-p3971-0089+p3834-0008.dtb] Error 2
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






