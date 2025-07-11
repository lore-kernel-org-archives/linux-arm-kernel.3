Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DE9C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AMJi9o82FvE5EJ+wjEkvx67ElhpfunLCk6WbSdHTFU=; b=sdiyqgSGqv1MGU0Z6/MRdI9WUZ
	+8L3gU2l4LWn+uvPatyEWpIyY2ANZ744zqibXwKtOcdeeHSYTSWNYvrQ1Q9mAXVtTpOqt9IvKuv7q
	+tHglNSS8SR16XmRN1dOomaGlKi2g9te0WhXKaMKB1hnRV6xiXS7UIpuUh8yEtxoVt6ZPh9akntMz
	ki3WjtIV6evsW99K6wxtYWtZ6ChmyurEoRvdAArXCmt4R/Y639kakBN8uxxBqCxPINwBV2PLkz8ib
	ibYCAJH2JuMO2FNQVeiSenhczI/1E5ZA3hDzS91xXA4JqCJmpVSRhkPUR2YHxIFN9wFhMYNIIOCGr
	W7Qa+Ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEso-0000000F2Yl-474r;
	Fri, 11 Jul 2025 14:37:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEqU-0000000F2H2-1v1z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF35261132;
	Fri, 11 Jul 2025 14:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55150C4CEED;
	Fri, 11 Jul 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752244525;
	bh=amm7W321RqlNSOOMK3AIvljgbJEPHpxcz13K2TgJvxM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aq2a76hszvNTrH+g/4o9TZaEYFQjht1aC9/vvtwP6fPjHhhPsUlre1wcC6BnYeISw
	 OhSQ7270f1Ei4PoJi4EcVNm/lfD3YZj+OnOpnvtzn1/HACl5YZ2wc476PE9Utze2cF
	 La08s6X/Wv8f28v4SBNY8FMcBDvRoTKoTKrC1rd0lCtPmW+jezem/qfoaREoI3TibU
	 OeA/0W1lSzC9G+EJ4GtCyRJTcJYVhOq99Su7J1n9yszEK8mjL6y4FmUW+iBOlN0ubh
	 oCDDiu+i+35dkrcLzzmr0LhpelPeqlxoIUXRB9HdaEvas+up/nWuLJC+KbQc1yBO6z
	 M25ec7cVqiU+A==
Date: Fri, 11 Jul 2025 09:35:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
Message-Id: <175224423523.783161.17907302929832941912.robh@kernel.org>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
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


On Thu, 10 Jul 2025 20:08:00 +0800, Peng Fan wrote:
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
> 
> In patch 2, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
> 
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Patchset was tested with below boot images when the patchset based on next-20250526:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
> 
> Patchset was tested again with rebase on next-20250623
> Patchset was tested again with rebase on next-20250710
> 
> Patchset is re-based on next-20250603.
> 
> Thanks for Daniel/Frank helping review the patchset before posting out to list.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Move the lmm permission check code to a separate
>   function(imx_rproc_sm_lmm_prepare) in patch 3.
> - Check return value of scmi_imx_cpu_started in patch 3
> - Rebased to next-20250710 and tested on i.MX95-19x19-EVK
> - Add R-b from Frank for patch 1-4 and A-b from Krzysztof for patch 1
> - Drop mu7 from patch 5, because mu7 status was already okay.
> - Link to v3: https://lore.kernel.org/r/20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com
> 
> Changes in v3:
> - Drop fsl,lmm-id and fsl,cpu-id for binding in patch 1
> - Add lmid and cpuid in driver patch 2.
> - Add i.MX95 lmid and cpuid in patch 3
> - Rebased to linux-next-6-23 and tested with this new rebased version
> - Add dtsi/dts patch 4,5 to give people a view on how it is used per Krzysztof
> - Daniel's R-b are still kept after talk with Daniel
> - Link to v2: https://lore.kernel.org/r/20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com
> 
> Changes in v2:
> - Typo fix in patch 2 commit message
> - Move the m7 address mapping array from patch 2 to patch 3
> - Add R-b from Daniel to patch 3
> - Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com
> 
> ---
> Peng Fan (5):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add support for System Manager API
>       remoteproc: imx_rproc: Add support for i.MX95
>       arm64: dts: imx95: Add SCMI LMM/CPU nodes
>       arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev related memory regions
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  41 ++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
>  drivers/remoteproc/imx_rproc.c                     | 147 ++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |   5 +
>  5 files changed, 199 insertions(+), 3 deletions(-)
> ---
> base-commit: 78863a3617803fcc11f7f7432efc9f74d4ca3105
> change-id: 20250525-imx95-rproc-1-20bb74ddc8af
> 
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
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
 Base: base-commit 78863a3617803fcc11f7f7432efc9f74d4ca3105 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250710 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#






