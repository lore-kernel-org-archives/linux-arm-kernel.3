Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E50BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTEfFUG9TC2l0LTeh0eSGozglj5eBUV7cTFGwbsrmow=; b=u1NT7UmtSrJbFt/cVGwyVlG2vM
	Rw66Yz7C/bC1mMcaOrhzWVbNsOB6288fm/HkhvEIp4rW3t/sDIqIp5PuCTnsyJ9BPeE/wdhTh1QET
	F9Q0KHYSFR3m7UWO+9iLK4x5WVaANlZm1BZqzdmFfiRRS4b6jyMuk+6V9Ka+LDKV674rHPsnrEldc
	DT0CLCOgWPYV3EkWZQebXI1WHV+fLaDJ+4KWfPdm63tbKnb0Rtpg0E965EUL1Elcel2wLZctzQUIL
	/lITpv9KZaQDIQa0qwVizoSnfcYD/JiEgFcpVreTdm0GXbcdUvOCLAjOlUSlRfYeHyaPD2Hx3vKke
	86lvvO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Qn-000000067Qi-0DhX;
	Tue, 11 Mar 2025 15:22:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1OD-0000000670g-2NpJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB29FA44286;
	Tue, 11 Mar 2025 15:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4908AC4CEEA;
	Tue, 11 Mar 2025 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741706368;
	bh=m5y+8WWCkr2bdf4DjUDmOPPTjTgljzQzDitsJbpFa30=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XG/jtD/q5EJBxWC3SLv4srOZdrXtQUzrMuV7xCsfWahJCZc5a34y8F3EFE426msYP
	 S3rLD9c988gUVZaxVOLmmT3Kzxxkjiq1hWgy+YkAlwxN7G7zpImfnUMIbt+CPxuFjB
	 nYhFYCWfN1LSH5sxrugoEauAzwyOTbcgNBC7GunQ65s0vA49ZrJxISs4jifXCJxnlj
	 0y46EbZnZ3DVLcUVSiOLrp8S8+NZ83Uq6SjR/CvgR0VgFJTuIzMAoUDXD4/yD6DhKk
	 3+GTd8vDovZ+h/b/Cq745WjYqok8zised262Ai5kHswq4q8g9g4tzGDwh8KgBGMrOL
	 dhiEECYN/3gJg==
Date: Tue, 11 Mar 2025 10:19:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 devicetree@vger.kernel.org, Darren Etheridge <detheridge@ti.com>, 
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, Vignesh Raghavendra <vigneshr@ti.com>, 
 Frank Binns <frank.binns@imgtec.com>, Tero Kristo <kristo@kernel.org>, 
 Randolph Sapp <rs@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>, Nishanth Menon <nm@ti.com>
To: Matt Coster <matt.coster@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
Message-Id: <174170613791.3566312.1327920809474076624.robh@kernel.org>
Subject: Re: [PATCH v3 00/18] Imagination BXS-4-64 MC1 GPU support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_081929_737663_F2F2E1B9 
X-CRM114-Status: GOOD (  27.60  )
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


On Mon, 10 Mar 2025 13:10:24 +0000, Matt Coster wrote:
> This GPU is found in the TI AM68 family of SoCs, with initial support
> added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.
> 
> A suitable firmware binary can currently be found in the IMG
> linux-firmware repository[1] as powervr/rogue_36.53.104.796_v1.fw.
> 
> No new UAPI will be necessary for this platform as it is sufficiently
> similar to the already supported AXE-1-16M.
> 
> UMD support is close to being complete. We're now able to pass >90% of
> Vulkan conformance on our Mesa development branch. The compiler has been
> undergoing a significant rework needed to accomodate the BXS-4-64, as
> well as to make it more flexible to support additional Rogue GPUs going
> forward. The first part of this rework landed in Mesa in [2], and more
> MRs will follow in the coming weeks.
> 
> There are several dt-bindings changes at the beginning of this series.
> We expect the result to be versatile enough to handle all Imagination
> Rogue GPUs while being a strong foundation to build bindings for the
> newer Volcanic architecture (for which we're currently developing
> support).
> 
> The DTS changes at the end of the series are marked [DO NOT MERGE]. Once
> the series is reviewed, we will request these be taken through the
> relevant tree.
> 
> [1]: https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
> [3]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32258
> 
> ---
> Changes in v3:
> - Reorder some patches to ensure the proper sequencing
> - Update status of UMD support (cover)
> - Don't use more specific compatible strings when not required (P1)
> - Avoid ABI break by limiting new required properties to new compatible
>   strings (P2)
> - Move power domain changes to the patch in which they're used (P2/P5)
> - Update register definitions (P3) [Thanks, Alessio!]
> - Don't use more specific compatible strings when not required (P4)
> - Enhanced commit messages (P4)
> - Remove unnecessary example (P5)
> - Add proper fixes for threaded IRQs (P6) [Thanks, Alessio!]
> - Include fix for a separate IRQ issue (P7) [Thanks, Alessio!]
> - Don't enable firmware debug module (was P13 in v2, also in P14)
> - Change from a workaround to a regular codepath (P15)
> - Drop platform overrides framework (was P18 in v2, also in P16)
> - Mark DTS changes [DO NOT MERGE] (P17/P18)
> - Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com
> 
> Changes in v2:
> - Clarified justification for compatible strings (P1)
> - Simplified clocks constraints (P2)
> - Simplified power-domains constraints (P3/P4)
> - Use normal reg syntax for 64-bit values (P8/P21)
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com
> 
> ---
> Alessio Belle (3):
>       drm/imagination: Update register defs for newer GPUs
>       drm/imagination: Mask GPU IRQs in threaded handler
>       drm/imagination: Handle Rogue safety event IRQs
> 
> Matt Coster (14):
>       dt-bindings: gpu: img: Future-proofing enhancements
>       dt-bindings: gpu: img: Add BXS-4-64 devicetree bindings
>       drm/imagination: Use new generic compatible string
>       drm/imagination: Add power domain control
>       drm/imagination: Remove firmware enable_reg
>       drm/imagination: Rename event_mask -> status_mask
>       drm/imagination: Make has_fixed_data_addr a value
>       drm/imagination: Use a lookup table for fw defs
>       drm/imagination: Use callbacks for fw irq handling
>       drm/imagination: Move ELF fw utils to common file
>       drm/imagination: Use cached memory with dma_coherent
>       drm/imagination: Add support for TI AM68 GPU
>       [DO NOT MERGE] arm64: dts: ti: k3-am62: New GPU binding details
>       [DO NOT MERGE] arm64: dts: ti: k3-j721s2: Add GPU node
> 
> Sarah Walker (1):
>       drm/imagination: Add RISC-V firmware processor support
> 
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  77 +++++++++-
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   3 +-
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  12 ++
>  drivers/gpu/drm/imagination/Makefile               |   2 +
>  drivers/gpu/drm/imagination/pvr_device.c           | 124 ++++++++++++++--
>  drivers/gpu/drm/imagination/pvr_device.h           |  31 +++-
>  drivers/gpu/drm/imagination/pvr_drv.c              |  16 ++
>  drivers/gpu/drm/imagination/pvr_fw.c               |  28 +++-
>  drivers/gpu/drm/imagination/pvr_fw.h               |  85 +++++------
>  drivers/gpu/drm/imagination/pvr_fw_meta.c          |  23 +--
>  drivers/gpu/drm/imagination/pvr_fw_mips.c          |  82 ++---------
>  drivers/gpu/drm/imagination/pvr_fw_riscv.c         | 163 +++++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  17 +++
>  drivers/gpu/drm/imagination/pvr_fw_util.c          |  67 +++++++++
>  drivers/gpu/drm/imagination/pvr_gem.c              |  10 +-
>  drivers/gpu/drm/imagination/pvr_gem.h              |   6 +-
>  drivers/gpu/drm/imagination/pvr_mmu.c              |   8 +-
>  drivers/gpu/drm/imagination/pvr_power.c            | 114 ++++++++++++++
>  drivers/gpu/drm/imagination/pvr_power.h            |   3 +
>  drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 153 ++++++++++++++++---
>  drivers/gpu/drm/imagination/pvr_rogue_riscv.h      |  41 ++++++
>  21 files changed, 886 insertions(+), 179 deletions(-)
> ---
> base-commit: 10232dac98d3803ec4fcc0cd8a4d1bd2a09b3e18
> change-id: 20241021-sets-bxs-4-64-patch-v1-44cdf9cc555f
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com:

arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: gpu@fd00000: power-domain-names: ['a'] is too short
	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#






