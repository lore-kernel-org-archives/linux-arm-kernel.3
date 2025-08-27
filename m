Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB47ECA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 00:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srn4f5wKHajETfLs095JEyQwrHU4jhL+bb9+4uAhjnU=; b=hU2goFWhCDDZCm0Zy1Z03R3kpa
	2bDgNiRid228w8rgHmvyEesCzfhVvFSZ2HrBd3ijsRB771EZTg9DvbOjtkHw/dSNoq5y6RBewq42W
	us0ehhuHdQTg/2QGwA8tmxhFfxzLmzkmjl4ush3s04V1r4y2MdCUiFWToiJ523jz4yapiL2IqQ34w
	vuXKPE0hm93Bg/Qko9lU+CS96A5j6ls0F/+5tfWbmDPwtJ+C/JtDLDGxxc8am7Wro2DHb09CE/XZv
	Y5fOrRhDDh0mUjA2TE89LJJaCOwWXqGM4iG1PDZOPTKUBrvQgncQjzWH/5JKYegQp9WGdfnYbvzRF
	BPsWmF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQQe-0000000HLom-36Dj;
	Thu, 28 Aug 2025 00:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urPPq-0000000HEQ3-1DSD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 23:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FAC143BE7;
	Wed, 27 Aug 2025 23:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09407C4CEEB;
	Wed, 27 Aug 2025 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756336733;
	bh=P3Gwl+lAuDqgDiDkyAWigr2MsRQaffh+XaK4v35OqV8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QtsKBq+nK77vpdMFc6YGd0q5ra4VwIImjBUpJ0wanHju86ppAa4o2o8ZskSAHDAn5
	 K/L4DUPu4hpuDj4Ej9tr8/J2HI2KwOuDSWO0mozMmhfJ86HxZjRKjtx7IxheFYDdCh
	 VFbflN5sVkBAgdK/7Lz9xlBdpPvGdY6ztcOwLOp5kS+oqLt1wbXlISuwIqHKYulNnE
	 ZLQSYDE/QA1MDIjmyFznQjlK8nPXGHkAgwi3hJ0ECfu+wORP9tezj3h3O27+M0SDZN
	 e87vU25vIIWGsM18VZf8pDHLZxFVuJsa+asDFI9xpRYzYH+owC77b+Oc2mQgtkDhDW
	 WbZuFrCywF33A==
Date: Wed, 27 Aug 2025 18:18:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
To: Kisung Lee <kiisung.lee@samsung.com>
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
References: <CGME20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7@epcas2p2.samsung.com>
 <20250827044720.3751272-1-kiisung.lee@samsung.com>
Message-Id: <175633664976.3746763.8435177839932085825.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add DT bindings and driver code for Scaler
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_161854_369995_76CF600C 
X-CRM114-Status: GOOD (  17.61  )
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


On Wed, 27 Aug 2025 04:47:16 +0000, Kisung Lee wrote:
> This patch series adds device tree bindings and driver support
> for the ExynosAuto scaler hardware. It adds YAML binding docs,
> updates Kconfig and Makefile, and provides initial driver
> code to register the Scaler device as a V4L2 video node for
> video processing.
> 
> Kisung Lee (4):
>   dt-bindings: soc: samsung: scaler: exynos: Add ExynosAutov920
>     compatible
>   media: samsung: scaler: add scaler driver code
>   arm64: dts: exynosautov920: enable support for scaler device
>   media: samsung: scaler: Add Kconfig and Makefile
> 
>  .../bindings/gpu/samsung-scaler.yaml          |    1 +
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |   22 +
>  drivers/media/platform/samsung/Kconfig        |    1 +
>  drivers/media/platform/samsung/Makefile       |    1 +
>  .../platform/samsung/v920-scaler/Kconfig      |   17 +
>  .../platform/samsung/v920-scaler/Makefile     |    9 +
>  .../samsung/v920-scaler/scaler-core.c         | 3640 +++++++++++++++++
>  .../samsung/v920-scaler/scaler-regs.c         |  744 ++++
>  .../samsung/v920-scaler/scaler-regs.h         |  406 ++
>  .../platform/samsung/v920-scaler/scaler.h     |  621 +++
>  .../v920-scaler/videodev2_exynos_media.h      |  162 +
>  11 files changed, 5624 insertions(+)
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/Kconfig
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/Makefile
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-core.c
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.c
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.h
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler.h
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h
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
 Base: tags/next-20250825 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250827044720.3751272-1-kiisung.lee@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: scaler@1A830000 (samsung,exynos5-scaler): 'mscl_ppc_table', 'mscl_qos_table' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/samsung-scaler.yaml#






