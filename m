Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48782C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZH8NbU6Pjk6keXGAJ73rI0VCvSsVgApqc8JqdUGKRA=; b=RTHtM7H3bDsM42cJg9uMHUJJqN
	zk4yu9BQ65yGU0FOXgw2lUPag2ZfnXCvqqDHfKMQMj8F3+xaps3dkkYTAL6xUMmxPtWga1DPg0H5z
	GRvmaSmkWjt/GvUM0fXuoP6/daynQgVixxjP+Y1lZOcwXtBQWYSw/OHoZT+G2wGn/xbBC0hqHqjMI
	2bMVYWmEH/u0VuIIjO9IxwgqFHerychrwUjhf4A9hYhRhrZpYfea+wHeTQePrs2ph+TI+PVoXnns/
	i4RdZTFefhuYJT6gtbV7Fjnj8XSyqSFVKtBRJuIJPgoM9u6Hj4wqXc50MPLpMH9AoeU/pzxefdquQ
	eT0Titlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkq3w-00000003HBX-0Y21;
	Fri, 17 Jul 2026 21:25:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkq3v-00000003HBM-13Xu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 21:25:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE99C40B3D;
	Fri, 17 Jul 2026 21:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E8F1F00A3A;
	Fri, 17 Jul 2026 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784323538;
	bh=QZH8NbU6Pjk6keXGAJ73rI0VCvSsVgApqc8JqdUGKRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=daIMHzfCeyc+1NhwDFp2eN/v/EtUrBeyqQcKZ/Bp5AL+omM1fSTL14slLwR/W2eNg
	 wiiFr91N8b/dkhfrCUv76/9JOCeaihPzP1P/PICtVvKsZHGQDj9K5FHdfkpygMNYrk
	 gNN+c9JOHgn0hivyAzehXjlcZWUem8ffgEMxA34SoRLCHslw+3W4WvvuwLcQHZ5gPy
	 74s6R3CfAZE8LadZdjd7Ws9K8COvToRLzCR32mzThm4x4XKkiqFtaZuL6XLcCokZWJ
	 R+U0XrKfZh5V/4PWLnfaP9nCWmyeY6QTnRPFVizsEC2r4T/PWE4qaZdbbWnW32dX+N
	 4DfRE1fMklUXA==
Date: Fri, 17 Jul 2026 16:25:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
To: Frank.Li@oss.nxp.com
In-Reply-To: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
References: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
Message-Id: <178432353778.2692844.15138095566024676604.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: imx-iomuxc-gpr: allow
 bridge@18 as child node
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


On Fri, 17 Jul 2026 16:15:17 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The legacy i.MX6SX (>15 year) SoC imx-iomuxc-gpr contains one LDB_CTRL
> register. Allow the LVDS Display Bridge(LDB) child node under
> imx-iomuxc-gpr.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - remove status = "disabled" at example
> ---
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml  | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.example.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.example.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260717201519.844259-1-Frank.Li@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


