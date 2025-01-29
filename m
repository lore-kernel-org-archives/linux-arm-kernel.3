Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC7C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c/rjT8Ud/j5DsPfJQDlhsuOy0F/nVIExfssE5V9zeo=; b=Eo1ryaV4hp5N+RR+JPym0zzaI8
	ZVqvYbDq7+jeCWdl8uuvsOKwwf36TX5+2Yq7MoaQCBZiPQoCKt3EzGGwvo0i7t1RVBGuDwgXSvFOx
	uzaQKzBnrQACnEGSalsH/JlJRrDiYt/CqbmcVrYIKPEqsl0y0ptBH9CE710ZjXrytlQATXfHv+N3B
	ZUzJDMKKOiRdH5WSVxDvh6aNRb6Qn/4Kw3CF2XwfCMvq047SINCSdOkZ+5BAGThZtxwg6AHY9PazG
	Znh7eN3FOUMKOWIGO6v9CmnEWT1qzH6+UQI/XwZFusvDo6hDnbYBhDSpEGVmAGSiwFLjNxt6rzg+S
	udJjTLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9H5-000000079ou-02XQ;
	Wed, 29 Jan 2025 14:42:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9DN-000000079C3-2aFk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:38:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E25935C5D16;
	Wed, 29 Jan 2025 14:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8323BC4CED1;
	Wed, 29 Jan 2025 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738161528;
	bh=OkCNQkU+YeRWADPSOxaPGMR7ew+ooErLA1y3kpUQjsU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kTxGkEiWjGvG8nn7UZEVujOkbYJKjBW9KEENtD9+tYn/LFofSyKGhsX6vh2Xsxtvf
	 37PaVhsKBijrxaaujhpVYyL7jkKygQaX8yl4RoRLlltZjmht0IfmM+gvgN8BV+QRAt
	 AC/LtIZkoAAjdAgFrPbsFDVg2ZLn/Mjc9wbWey7vQQ3njivCJzc669zDawXM94Hjku
	 Xs0U6rCpoD/l9yP+DA2SNkgPDxvJhEW3vZ0d/69M8ehPVEmUYifJwdArtJKPk4kPfT
	 pR5q2/pxfO88QeApw3+ywuMxtTTzw/Hchr7eg3CeE4oHbEt9RL81UMVeMA0jCJt+2J
	 +CbA4n+QsTzAw==
Date: Wed, 29 Jan 2025 08:38:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, hongxing.zhu@nxp.com, 
 Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250128211559.1582598-1-Frank.Li@nxp.com>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
Message-Id: <173816122537.2059289.17775029103516660947.robh@kernel.org>
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: fix indentation in pcie
 node
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_063849_758614_400505A1 
X-CRM114-Status: GOOD (  11.41  )
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


On Tue, 28 Jan 2025 16:15:55 -0500, Frank Li wrote:
> Fix indentation in pcie node.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250128211559.1582598-1-Frank.Li@nxp.com:

arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.2.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.2.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [61, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [61, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vpcie-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [61, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [61, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vpcie-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@5f000000/pcie-ep@5f000000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']
arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@5f000000/pcie-ep@5f010000: failed to match any schema with compatible: ['fsl,imx8q-pcie-ep']






