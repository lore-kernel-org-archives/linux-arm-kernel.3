Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CC2C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7VFLRFHtBlCRBBgO408HcjRv3FMIlmldqwuImTQhXI=; b=Vpm+3AsY0/zObLsgS8cMdwqr3m
	FqDWcOTiemZcUe8HEyLT1te568UzfTqBtZbVP4FGVAqndzszBuPLznP/ZZrlW8rIO2jNMPvpbM2EI
	Xi32WRH4bCaUpUmhVizLcuJfDuwUJeJIZD9fZPR9n55gVTJc7SCm+eWKJBWGoB7tha9J1l6ZPFz8t
	VfPvcHT+o4FibDawKHdtbEr0VEJ4xSunq6k8ZjyEUqAKa/CRRrNPBq9A2W93lUPEcDIyxNJHBVsND
	1ObQevQU7Zed1VlFxdhkZDvRB/WqYTgxllf0Y2Z1Y/mi66NL9cYEe+QIPXoZ7bi0T5cIYLvkpj9px
	qTk2Fadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4t-00000009bom-3k3e;
	Wed, 09 Jul 2025 19:03:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVLX-00000008svg-1ZUj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BA8743A33;
	Wed,  9 Jul 2025 14:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8A6C4CEEF;
	Wed,  9 Jul 2025 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752069626;
	bh=J5gFOJygzZbOqjQq3B0bcOtL5rvp4e6QlwCd4fMhZRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l6TttmSthsVbAFS4ZMnLJxgMwQ5k+tvu1X346JYTBya/qber1UFbCrgVe0t8YkARn
	 UGX/Azl/pePjEafUfbHiuwl2/mhdZYPAKc3l700E4hME664m2xgUurbPkxYmoB+G7G
	 o2+H3AiYyu2mgBgQb2Nv2474x/CLsWZuqAaFhvd2m54YBlkXBnge6TOIcKXWwUNLob
	 Xez7tDb1eok4lw1MpxyOFAgyV6r5efwfpJO0gYyZ/Ij26svJugrf3XGMUx2vCxrKKV
	 dKxJof7qztNJCKxXlBcGPHJGnWEPrqzEkKnyBCG3xX+WkVB63RXfCsPNJXU7VS/X0x
	 kdGbanfe0NiYw==
Date: Wed, 09 Jul 2025 09:00:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 alim.akhtar@samsung.com
To: ew kim <ew.kim@samsung.com>
In-Reply-To: <20250709001210.379418-1-ew.kim@samsung.com>
References: <CGME20250709002408epcas2p25248bf1a397fc308d91ffef3889c41d5@epcas2p2.samsung.com>
 <20250709001210.379418-1-ew.kim@samsung.com>
Message-Id: <175206957118.3267462.9769889827847502379.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: add abox generic for
 ExynosAutov920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_070027_429509_1E136A2B 
X-CRM114-Status: GOOD (  13.78  )
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


On Wed, 09 Jul 2025 09:12:10 +0900, ew kim wrote:
> Add a node for Abox generic. This driver, exynosautov920, connects to
> the SoC and allows you to configure a sound card.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../boot/dts/exynos/exynosautov920-audio.dtsi | 20 +++++++++++++++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250709001210.379418-1-ew.kim@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:18.3-10: Warning (ranges_format): /abox_generic@generic:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: / (samsung,exynosautov920-sadk): 'abox_generic@generic' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /abox_generic@generic: failed to match any schema with compatible: ['samsung,abox_generic']






