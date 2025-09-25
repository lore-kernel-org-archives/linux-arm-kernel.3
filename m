Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA1CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 01:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cxPuru/dTauKIdCPPQWiFvPqh4TOSKalbOdFC9IPl8=; b=Pod19RncijzixjOQXMEHWwOOe5
	X7s85zIj8WHfiDSOmf6kED8pkR01h59yaOxh50qIN4TdBsUe1vZZvPuZq/n6ITIGZ6DaYg/n+HD+1
	c8ibJM3Tn6WNnxYjZWynzL4ScXpCbSDpAbriNAWtHGZOEuN5KQAum6hcNGf2V4fWTMoyhUGuz3+jK
	+bdSHtl4BKPmGpoKnCx0iaMXzcvl5eyB1Jp8mm50AQioBkHMRljC1blSULJoVEBGw1TMWJ19KCcus
	PPZ4fLVJZfnszphJzKLYn4bbZo0jg2mohYuA0qerhpN7LC7U5i3F9UkN/0NDTgw0+EJ9aPexxRh1W
	kzcWv2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1acn-00000005AbT-3cV2;
	Thu, 25 Sep 2025 01:18:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ack-00000005AZU-2z7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 01:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ACA241764;
	Thu, 25 Sep 2025 01:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAF6C4CEF8;
	Thu, 25 Sep 2025 01:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758763098;
	bh=C55DETOo2QRYteFXs2WfthXPbj+SvYWsU4QTXLEnsCU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=slfRqWTwJpfzLeFqfHeCLJlKBQBLQPGGb1ZUd9Y9kH/UQ97KoztYe1RwAEXhYwcfM
	 l3DFn8PtKpRUp8zcqpNyUeN1NcG8MPrYDSaFSquI9szHDmRX57I4nnU3cbWloaTAhv
	 PhJfSTbsJVnUuUAnnVbBeit9E07nZiVNw3gEwkrkslW3cNQ6e56qcAaOrsK2tb6DZz
	 ZrSScpuFUDxDKqdnBt088LhEBqMAi13ZZU4Ih8/YHLJ1T7gMWUOp+lYuzW/lS+q6ZC
	 9hSEyGKDvPZ5dI+N6IFJlVSbwiY0QAuRbj+1bqD/KuONDJDzq10Z/w87tDvQvUu1Yb
	 luQ7zCdkOrHLQ==
Date: Wed, 24 Sep 2025 20:18:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Alice Guo <alice.guo@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
In-Reply-To: <20250924-imx943-v1-0-0d32d7852ecb@oss.nxp.com>
References: <20250924-imx943-v1-0-0d32d7852ecb@oss.nxp.com>
Message-Id: <175876283151.3268828.13905899356593149136.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add i.MX94 OCOTP support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_181818_815195_E501AB53 
X-CRM114-Status: GOOD (  18.32  )
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


On Wed, 24 Sep 2025 18:06:22 +0800, Alice Guo (OSS) wrote:
> This patch series adds support for the OCOTP controller on the i.MX94
> SoC. The OCOTP controller provides access to eFuse regions.
> 
> Tested on an i.MX943 EVK board with successful NVMEM read access via
> sysfs.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
> Alice Guo (3):
>       dt-bindings: nvmem: imx-ocotp: Add binding for i.MX94
>       nvmem: imx-ocotp-ele: Add support for i.MX94 OCOTP
>       arm64: dts: imx94: Add OCOTP node
> 
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml         |  4 +++-
>  arch/arm64/boot/dts/freescale/imx94.dtsi             |  7 +++++++
>  drivers/nvmem/imx-ocotp-ele.c                        | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> ---
> base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
> change-id: 20250924-imx943-b27ad75d14fa
> 
> Best regards,
> --
> Alice Guo <alice.guo@oss.nxp.com>
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
 Base: using specified base-commit cec1e6e5d1ab33403b809f79cd20d6aff124ccfe

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250924-imx943-v1-0-0d32d7852ecb@oss.nxp.com:

arch/arm64/boot/dts/freescale/imx943-evk.dtb: efuse@47510000 (fsl,imx94-ocotp): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx94-ocotp'] is too short
	'fsl,imx94-ocotp' is not one of ['fsl,imx8mn-ocotp', 'fsl,imx8mp-ocotp']
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx943-evk.dtb: efuse@47510000 (fsl,imx94-ocotp): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#






