Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E1CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smWgeBLrKEAp2KK4S3OqKK8DM/oliifs3eH0Sf9WdDo=; b=lLBVKcBkND839BeFb4fZyp40s5
	HvxlX7wSHqjHp3ovL4vMVFP2IMhV7qjc1R8OZryYfsYE2hFjBfuQhAxhIF5DazQj5JJ03rHrNhtlo
	mztTZgxD174tMVW62OyX4qsyFeUX8Gk7lybAthLphUULS6XZm/zfBELX97X57C/syO73sDtPXrw5Z
	zVvlt/a0gHUoekkanlE5yX5CWC5Yq68IKQdRbFSIlj5GdG3CQIiObTC9TQJC2Jm/wiBfcfl+mq9AA
	XUY/1ahwD402cCAQJKvFjBPZsjGMVjbUWD1YMshL23Rmav4F7wNDgKOsQKO43nKR26GE7OQ5NJkqT
	u+Q3DNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYdV-0000000A4dW-0OVb;
	Wed, 25 Jun 2025 22:30:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWgJ-00000009pj9-3o6t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 20:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A480C42B8B;
	Wed, 25 Jun 2025 20:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E348C4CEF2;
	Wed, 25 Jun 2025 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750883119;
	bh=TziOv0cm8azgsxSTr1XbfSHXohOwDnljw555dksH0d0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BbWsS7TvvcQOXUDiR1RQKIoUGhBretA5etFDHMA/VgYxIUwUe0h5CUh71IQNJun9a
	 kO5WbZmvPC3d43pDdg01pdyGTPNkcK27IUD4fc+Ug5I/YB27ssZfWWPtd3nbE6h39w
	 srb6lW5QC8V6HS33obz5sKGX9uXI/xlb7EJjGnSSm1LimV5lKhaa/22zY+Ln5wH6BD
	 GCF7fL0drw6+h1RY3tXBNkuqTIBVN/J0axjzYafv/yNXnTjvXvVlBpzWaTWmb/+3+l
	 NNr5cTYwjLhdKGz1ceGRS099s2+U04cg3dK4PCKx+y9HxQ8+WFIpqvPih+wXk82xmi
	 4/MX9h+cz6qRw==
Date: Wed, 25 Jun 2025 15:25:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
Message-Id: <175088289381.2146689.9089577049350520635.robh@kernel.org>
Subject: Re: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_132520_009750_50EBDFCF 
X-CRM114-Status: GOOD (  29.68  )
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


On Wed, 25 Jun 2025 10:23:26 +0800, Peng Fan (OSS) wrote:
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
> 
> Patchset is re-based on next-20250603.
> 
> Thanks for Daniel/Frank helping review the patchset before posting out to list.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
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
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  45 +++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
>  drivers/remoteproc/imx_rproc.c                     | 138 ++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |   5 +
>  5 files changed, 195 insertions(+), 2 deletions(-)
> ---
> base-commit: fda740558acb4303fcf377e5cf9139f795b1d85b
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
 Base: base-commit fda740558acb4303fcf377e5cf9139f795b1d85b not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250625 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#






