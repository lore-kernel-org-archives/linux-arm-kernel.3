Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E7FCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srjqsu/CzyJPLcISmZtzPE6Hh7zthtKm0bgXC6QNd2o=; b=2QU91DEGhu8/dO7T6If7imcsNw
	QX/riBdEOQBJX3Wt59xSiXLK7/zFvbWmK9H5qxWvo6VIVrIL40I71dvMjUOfrGJnzSnma4CyY5n3x
	WbfLkJRep9HtCWbwDN3vXNAsoaAX6u3xk8YbnNd3XeWOaXXJJs31AkN3cDnbwrMzb4sbGYDtuq3K5
	5CQvW5QIHY8JuSUDYc8Yrr3x81d5XaLugR7LBjrhqcQlUvHPCNP8emsyMZcyFqexuj7GLg+c7IvL+
	3wiw4KJ0LT0F5qoGccmPiwbwx9e2392dyP7JUrstOvTtKCD1v8h+ZOEl46nngVjPFcdBNTox8BA5j
	SyAan7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSmd-0000000Gy5M-0FYU;
	Mon, 25 May 2026 10:43:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSma-0000000Gy4j-2JBk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:43:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5768D40411;
	Mon, 25 May 2026 10:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236C81F000E9;
	Mon, 25 May 2026 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779705819;
	bh=srjqsu/CzyJPLcISmZtzPE6Hh7zthtKm0bgXC6QNd2o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=RSCuc8IEgkJu8PXT7ayTk7inXAFejDcQRYa1aZbfh9Zr7qEit8g4+yFvXyD2Ln7+g
	 9OV4t9U9fgIFBRXpOm69/x6mEvNakoihDrzcpmp8uGbVbep6Fnk6vMHpqVDhJ2Wphv
	 4g2O1dpHN09pOAyPNPFRKxXj08oPgcy/B9S+ak78QFmJan8Cno182lbgdTpg8mx8Ef
	 QdXLuCrkKju+UctYLxHWfHhC/0FeZyjCsxNbnGJF1UNFD7EgOwQWw7DziirHb+WI4M
	 TGXJD+thL/kKPrd3uumOvJ/RTcdUn8HFN27gDneoTjGrons6jncQ1neK98OezxyDMx
	 e3mzXtiqN9dbA==
Date: Mon, 25 May 2026 05:43:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
In-Reply-To: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
Message-Id: <177970581844.3566674.15613967035246417411.robh@kernel.org>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_034340_629962_C40FAA4D 
X-CRM114-Status: GOOD (  14.84  )
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


On Mon, 25 May 2026 16:12:22 +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v8:
> - Use standard port reference instead of video-interfaces.yaml
> - Add parent syscon node in example to show device integration
> - Add required constraints for port@0 and port@1 in ports node
> 
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): '#address-cells', '#size-cells', 'formatter@20' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): reg: [[0, 1254162432], [0, 65536]] is too long
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): '#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


