Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81232CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXS0eKh/VVk/d/f0orQHBDkXiphu1BMJyIAyjXg0tcY=; b=zUh4lHckr/YTgvMcXrOkrDLViV
	6FhwpAi3XNVKMz43m6LLBgs0YImK+RrVk8aVSGbJ111Sm/F7OTjKu8zzk3OdPAxlQV1/392+eR1IV
	LqjE220G4AcgLQXRW7Vbws/r0d+/Tcq3/OB0ktKRFSgJwU/9IhAr9vrSspQr9sCQ6e4qRRmrE3rJ8
	ePdiXxJ6BMziyObAEBEPR6Ht7qKiFofJSCsFl04ao7k6iBzFvTg+CGrcEZZBvGvvMFjw236vaSP8/
	YIfN7e0H25jURqx02FpahYZBKVcxIvBOag96MrnKpIy37J2Dw4vuNS95kYiIvInkBxUr82yqQFAiL
	8RuCE+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4zn-00000008QHv-1tfN;
	Mon, 18 Aug 2025 18:54:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4XF-00000008KJQ-1YtB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7E9C44437;
	Mon, 18 Aug 2025 18:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94013C4CEF1;
	Mon, 18 Aug 2025 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755541484;
	bh=4E7/tvM7UPMpgvdt/3bB3bqKVp91MTbvwZbxq37l81M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OMbzHIJsg1qjpEdG3Jr/e0aQcqLAvXk9Kn/YXnirekX8oFapce3DBgPubg0oyGz1W
	 64PzfeT4765uZq2JLRp8vn3E6GXf7kfs+VvmVn/BWs8YAGt4jU/ODpFNVLfu7IkxDu
	 noswaI4kYeV0gDWbQMBJugFJnpSjRJ4QpYCaxvIgFiCoPMtDIbEPP67uMe68cE1dMq
	 LtLESV0Aq3YiepfA3R2DwpeKkiFLiqjO8Ef7ykulfMwEih773+mwO8nNBVVss5B33C
	 MD7zH4OCsriwOlkqhr8LagHgA2JLc3IVqZpG7sm+HmWdnppJK++QX3A1uKV+2PAVOj
	 N2gFaY+8s4aew==
Date: Mon, 18 Aug 2025 13:24:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Luke Wang <ziniu.wang_1@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
 Joy Zou <joy.zou@nxp.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
References: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
Message-Id: <175554055785.1719742.4035330946121256179.robh@kernel.org>
Subject: Re: [PATCH v2 00/11] arm64: dts: imx95: various updates
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_112445_462959_6A7EC796 
X-CRM114-Status: GOOD (  20.18  )
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


On Mon, 18 Aug 2025 09:25:30 +0800, Peng Fan wrote:
> This patchset is to upstream various downstream changes.
> - Correct edma channel for lpuart7/8
> - Add System Counter, SCMI LMM/CPU, V2X MU, coresight nodes
> - Update alias
> - Add pca9632, pf09/pf53 thermal and etc.
> 
> dtbs_check will report a few failures, such as linux,code, db suffix.
> The failures are not related to this patchset.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Drop patch 8 because dt-bindings not ready, and patch 12
> - Per Frank's comments: Typo fixes, node name updates, sort properties
> - Add R-b from Frank
> - There is still dtbs_check error, but not related to this patchset, it
> is because https://lore.kernel.org/imx/20250718094723.3680482-1-peng.fan@nxp.com/
> not applied.
> - Link to v1: https://lore.kernel.org/r/20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com
> 
> ---
> Joy Zou (1):
>       arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid
> 
> Luke Wang (1):
>       arm64: dts: imx95-15x15-evk: Change pinctrl settings for usdhc2
> 
> Peng Fan (8):
>       arm64: dts: imx95: Add System Counter node
>       arm64: dts: imx95: Add LMM/CPU nodes
>       arm64: dts: imx95: Add more V2X MUs
>       arm64: dts: imx95: Add OCOTP node
>       arm64: dts: imx95: Add coresight nodes
>       arm64: dts: imx95-evk: Update alias
>       arm64: dts: imx95-19x19-evk: Add pca9632 node
>       arm64: dts: imx95-19x19-evk: Add pf09 and pf53 thermal zones
> 
> Richard Zhu (1):
>       arm64: dts: imx95-19x19-evk: Add Tsettle delay in m2 regulator
> 
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  29 +++-
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  94 ++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          | 165 +++++++++++++++++++++-
>  3 files changed, 280 insertions(+), 8 deletions(-)
> ---
> base-commit: ff837884a4642382a24d10fd503acf2c3a472f10
> change-id: 20250813-imx9-dts-664f7ba66ae7
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
 Base: base-commit ff837884a4642382a24d10fd503acf2c3a472f10 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250818 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#






