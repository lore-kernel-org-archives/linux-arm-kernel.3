Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEABC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkdYUObDFXs55OTobITIFrNCSL4wC5QGhUNmOKBDa8A=; b=4dE0RqWF7v4dnBZiVE3NTvcnn/
	/p94sX9NOo5wGeSSi+pAF7/X7O+0HWXcKd4kwvPgnkkaYY+AUiwBBKu83duQCTLFms8M6BJrBzkcL
	ylZHFNSNnSkfe8HHvA8hjMalWYfrpTy5WKXHC7RJtcJjquLHKGFzDpyN236+Y74eKIcRGOskFUj8/
	qjSc4X80bM2yxTPFN1lzNPJ4IR8w3IfpQVMhzJJ+cHawWMpy9fOgOOljIzZp9kCx1czgzpY7/K/J0
	9ytloDBt5BVkxhf5ovzgv9zajLG4vE9RWJdeeoP+Nl39fdJ67Ph0W/C4TaUFRy1Sjow7ycRabNFpw
	HDVut8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWcc-00000000Vlx-2b0f;
	Mon, 10 Feb 2025 16:26:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWYV-00000000Upi-3apk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96B7CA4197B;
	Mon, 10 Feb 2025 16:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9480BC4CEE9;
	Mon, 10 Feb 2025 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204562;
	bh=Y1OOCtRvUNohjRycrQGn3/19JARUQT+ztyHsw66KdYU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MT53VQ63spjltB3IjE28c+jp5XYU5yyjmOq/2XWN6kNxuPSrycJdosq4l9xGt+pyS
	 RaKJQlQeXnS3rHYyk+pua3uZDvHLcTAz3D2WE7TNnx7JgdgeCTBvEDDDkLpSHnA8XE
	 BvASKbClyz5cwfK0Z+/5LngpaN1cinqMpYDzcstAyhMs4Z7DVRL4zHLHKKUC5LkLpX
	 TTRv5M3yf/9f6lvxldzHUAMzIElRa6fW9LzKJ0gl5KcFKrub05ooecGZZqzBTo/umv
	 ofRzkBszwaDsKzAAA/hTp6pIsmAfGru6kNcFd8tbrBsVvJ0w98dpy4o7rU+dgGP67N
	 wnNaayei6oANg==
Date: Mon, 10 Feb 2025 10:22:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173920411901.476943.11749535762195189252.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode
 constants
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_082244_020154_C41748E9 
X-CRM114-Status: GOOD (  13.26  )
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


On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
> Patch picked from [1] and rebased on linux-next
> 
> [1] https://lore.kernel.org/all/20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com/
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>  .../dts/exynos/google/gs101-pixel-common.dtsi |  4 +-
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>  5 files changed, 35 insertions(+), 35 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com:

Error: arch/arm64/boot/dts/exynos/exynos850.dtsi:654.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos850-e850-96.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynosautov920.dtsi:309.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov920-sadk.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynosautov9.dtsi:445.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov9-sadk.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:828.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
make[3]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/google/gs101-oriole.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.






