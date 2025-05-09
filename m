Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBC4C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MazoqsTs3L+ELeHoAQPzdkbTg8W+dwUPmR9bqOktUfQ=; b=CLR7rhHWituMtKPg6AqFkO9ViR
	sYgxst+pNc2Glt0VuD9snAE03B83eWYFlpcvVcAPHGAH9n6hEvHrKWWjiNt1qklnPg6mjoYQhLPRL
	M4v7l8vS7IwURyMJATsXpNYvxV1HChr+eZJyx3xke8x/utuddRrkxlh/KPut+YTTpGYvNuPC88KCG
	TQAb3mG64Dw/y1QMZNm3h/NJYPP19jp6S/Pcmzovr6xfci9pG79g5hDpjoL7QmIxIUGXR6NVlqeZA
	Y/6xMF/eguHW93AgSVzgMZLmR7CGpgAqHjhK1I8lmBncjPSnD31QPeUyTrGzcxVdZeUD4HRoX+9y6
	N1NU1uAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQYk-00000004HJS-0nP0;
	Fri, 09 May 2025 16:26:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOX0-00000003v29-2ICB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0631C4A761;
	Fri,  9 May 2025 14:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99232C4CEE4;
	Fri,  9 May 2025 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800213;
	bh=uRHUJoqNa5K5mWMaXCiU/RiZB7ZiJa/lTWJxiEmFf94=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TXO7VzevGMh3xxBVC9HgXjoevh+cWjCoMJFLZOEl9OqNrT8y38ICVKegnJWrkYfiL
	 GdtKF/w1ArYeG/uWIGlVFYVJkzaFMrsNyGJP48QfyAH0kMkaUjScgmwAR4k/KxNjW5
	 jxwA2Jondq7N3GTCS3M/kUHhyg+paPcDea8a2v7AYUQgUhTpntQbBNfFC/ncIQbbeT
	 JranlvwfoqjcAKLmoanKcN7m0mB1bBPZ7JBkvev6aadCnRTRl2pnQXu9CFBe6Zgbu6
	 5ecSGbcO0EUeEV2z2MLfCaYpN7pk/dYtkwM/+5gBWwTk/VCd8SwkgaYQg2LHIwcocd
	 /6fZOTP7vA5mg==
Date: Fri, 09 May 2025 09:16:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tudor.ambarus@linaro.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, badhri@google.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, sre@kernel.org, conor+dt@kernel.org, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 dima.fedrau@gmail.com, linux-kernel@vger.kernel.org
To: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20250508050856.674782-1-amitsd@google.com>
References: <20250508050856.674782-1-amitsd@google.com>
Message-Id: <174679984823.3368214.18196649123277436565.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] Add graph connections between tcpc & fg for
 Pixel 6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_071654_623391_FF8F392A 
X-CRM114-Status: GOOD (  14.78  )
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


On Wed, 07 May 2025 22:08:50 -0700, Amit Sunil Dhamne wrote:
> max77759 Type-C controller supplies VBUS into & out of (depending on the
> charging mode) the battery in Pixel 6. In order to represent this
> relationship, we use graph to connect tcpc & fuel gauge.
> 
> Link to USB connector binding that this patchset uses:
>  - https://lore.kernel.org/all/20250507-batt_ops-v2-1-8d06130bffe6@google.com/
> 
> This patchset depends on the following:
>  - https://lore.kernel.org/all/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/
> 
> Amit Sunil Dhamne (2):
>   dt-bindings: power: supply: max17201: add port property
>   arm64: dts: exynos: gs101-pixel-common: add graph property to connect
>     tcpc & fg
> 
>  .../bindings/power/supply/maxim,max17201.yaml      |  5 +++++
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> 
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> prerequisite-patch-id: 74aa0a6fc4a5c56d870bb15375fad1fe41ffc1e9
> prerequisite-patch-id: 46f968300dcf5442e12d882ca23168494249d378
> prerequisite-patch-id: 3ad83a2782819bca215bb267d36a1ff04fe557b2
> prerequisite-patch-id: 86b5207d8f44255c36b1e600ecdf4f948c5da685
> prerequisite-patch-id: a15532888ff2572696d9fa6a14775e8ebf590391
> --
> 2.49.0.987.g0cc8ee98dc-goog
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
 Base: using specified base-commit 92a09c47464d040866cf2b4cd052bc60555185fb
 Deps: looking for dependencies matching 5 patch-ids
 Deps: Applying prerequisite patch: [PATCH v3 1/5] power: supply: correct capacity computation
 Deps: Applying prerequisite patch: [PATCH v3 2/5] power: supply: add support for max77759 fuel gauge
 Deps: Applying prerequisite patch: [PATCH v3 3/5] dt-bindings: power: supply: add max77759-fg flavor
 Deps: Applying prerequisite patch: [PATCH v3 4/5] arm64: defconfig: enable Maxim max1720x driver
 Deps: Applying prerequisite patch: [PATCH v3 5/5] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 fuel gauge

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250508050856.674782-1-amitsd@google.com:

arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: fuel-gauge@36 (maxim,max77759-fg): reg: [[54]] is too short
	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: fuel-gauge@36 (maxim,max77759-fg): reg-names: ['m5'] is too short
	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: fuel-gauge@36 (maxim,max77759-fg): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: fuel-gauge@36 (maxim,max77759-fg): reg: [[54]] is too short
	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: fuel-gauge@36 (maxim,max77759-fg): reg-names: ['m5'] is too short
	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: fuel-gauge@36 (maxim,max77759-fg): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#






