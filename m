Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C3AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI0fahHEF1T1mwIKEmhGEhAiiBGDW2rRhcySickPdOg=; b=b5OzDVMbdLEcl9SGAwckmZlfx/
	HS4ZdSKsToZG8eEGnTg9LHm8QJ3gxgmbK5t2fiuOhuksBpIt3ywBXZcJaUbbkyja2CVZ9o073lMVq
	iDXz1xD7x0kNH6+7DOzT/Yc737kDa+Ev0le1QdoMGE/Ha/w9Wk8K3CmzR2hb5duletxPKhRhpOerO
	/ZTHaO2U5eS4OY229c1rhMtLAVSrRH26c41lQa/D9HKTzSuQgU5TFbnJVanCKCW30wAviLDZ1KULg
	NLXAvKcxyh9HUnDH/GPVoWy7xLzYR6eT70DUee7quq1iv0pWmljksXiqdcXCTBSp1U/8qExXk3Pfe
	vnvl7jEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KwL-00000008Ynn-1PEK;
	Tue, 22 Apr 2025 21:14:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KuQ-00000008YXp-0qiQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 21:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52D2F5C5B05;
	Tue, 22 Apr 2025 21:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF2CC4CEE9;
	Tue, 22 Apr 2025 21:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745356321;
	bh=a+iAjVW0IeMpjbQu7NwvRRZqrycZH5ENMpNaHgWMREQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AEgv911C02EigsNMoUp6NufGhvVYQs2I8IsOtoL3aTkV4KABy3QiLI2nY6xD0hu7V
	 ziURLSP0nden4hAZXKh2BzEf4vlbITBySkTQfHxsODihbZy9/MXrk9705OCXWslwVe
	 paMSYmgycvG462rFvzJwL7OcRH69Cuc7xoPxwbOqE/5IlTO5mXFcRI231kh84izXNm
	 TGI/d+sW3OQdJOu+RpbABYiE++YwRCisV1WcifmPbbv6DGjj8Qf2netIIYe8XXkodC
	 xCs1xXn32nqV/bq6la6Ya3vRuP8ribwJiwuZI8yyFEeiG5ZK2irTgz4eyhgRk2MXo2
	 soRzaa0wJ/PVg==
Date: Tue, 22 Apr 2025 16:11:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Darren Etheridge <detheridge@ti.com>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Randolph Sapp <rs@ti.com>, 
 devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 Frank Binns <frank.binns@imgtec.com>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>, linux-kernel@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>
To: Matt Coster <matt.coster@imgtec.com>
In-Reply-To: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
References: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
Message-Id: <174535612207.2161287.6739865639684623809.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Imagination BXS-4-64 MC1 GPU support (DTS
 changes)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_141202_353186_7EE038CD 
X-CRM114-Status: GOOD (  18.58  )
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


On Tue, 22 Apr 2025 16:26:40 +0100, Matt Coster wrote:
> Now that the binding and driver changes to support the Imagination
> BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
> changes without the [DO NOT MERGE] tag.
> 
> This GPU is found in the TI AM68 family of SoCs, with initial support
> added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.
> 
> [1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com
> 
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> 
> ---
> Changes in v3:
> - Use assigned-clocks to pre-load the frequency of the core clock (P2)
> - Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com
> 
> Changes in v2:
> - Add details of the source of the interrupt index (P2)
> - Add Randolph's Rb
> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com
> 
> ---
> Matt Coster (2):
>       arm64: dts: ti: k3-am62: New GPU binding details
>       arm64: dts: ti: k3-j721s2: Add GPU node
> 
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> ---
> base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
> change-id: 20250415-bxs-4-64-dts-c984d0876556
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
 Base: base-commit dcbd5dcc956e2331414fd7020b4655df08deeb87 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-15-g1f326fb84a60 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com:

arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/gpu@4e20000000: failed to match any schema with compatible: ['ti,j721s2-gpu', 'img,img-bxs-4-64', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/gpu@4e20000000: failed to match any schema with compatible: ['ti,j721s2-gpu', 'img,img-bxs-4-64', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/gpu@4e20000000: failed to match any schema with compatible: ['ti,j721s2-gpu', 'img,img-bxs-4-64', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: gpu@fd00000 (ti,am62-gpu): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: gpu@fd00000 (ti,am62-gpu): compatible:1: 'img,img-axe' was expected
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: gpu@fd00000 (ti,am62-gpu): compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue'] is too long
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: /bus@f0000/gpu@fd00000: failed to match any schema with compatible: ['ti,am62-gpu', 'img,img-axe-1-16m', 'img,img-axe', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/gpu@4e20000000: failed to match any schema with compatible: ['ti,j721s2-gpu', 'img,img-bxs-4-64', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/gpu@4e20000000: failed to match any schema with compatible: ['ti,j721s2-gpu', 'img,img-bxs-4-64', 'img,img-rogue']
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/gpu@4e20000000: failed to match any schema with compatible: ['ti,j721s2-gpu', 'img,img-bxs-4-64', 'img,img-rogue']






