Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA8D74941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBHFy9QnSRqK9Fqex33YB+Tbb6DWEugLoJ1KU0kgc18=; b=EezBQ2AcgLgMLq1Ry7Xv/9W2+J
	wdoGaXk44cFrqIkv7E5PWky12SR4XkSOMGJBphJzdQDujnRHItF2TdGP7K5XdgQe/53PfVN/YUt5p
	IclEbybK9iR8ysZlv+Wyw2ER9rJDkalGnCKoCURTllllNYbBCxNbB3J/a80vdtQpetQznQpef6ydR
	q2FoRzsYMfj2GiQ7lhCMOg54QpCWXrRzFmEd37ro84qB+i2zz4UERsYRhul3rlCogYDZ7/uhzH98B
	YvZ3QRlxZg9jKFxZTd6TzUb/2VUQrFU1eA+NZtHX+ysuVvLt7UHCxqgNJmWC9R+NaX23aGlaQ4/Wr
	wjVURLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tWx-0000000FvPR-43Nw;
	Tue, 29 Oct 2024 21:13:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5soL-0000000FmBb-3XMA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39B405C5A0D;
	Tue, 29 Oct 2024 20:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5940C4CEE4;
	Tue, 29 Oct 2024 20:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730233649;
	bh=U4SnKlnxNPeXXDgnYqCkV6Hwn50RacK0HlNJIo7xwTg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=OZZrvhWt/ldqTuIpEVGFPwXGiKshjCdRgSAoP0HCu+0bcVhs5/D9la1N6VGCAFxDO
	 54rc81Hot7Fqcro3JTALFNsKUWHqqnc+bUxoMXHYq+i6A12muILYbOKxaBXhSyNpC+
	 Nodip9bi7BFYn2o2+nldWlmJ9cWz1re2A00Ia+44SlTRyFTcGBfEVMAkGKsuM3L+5j
	 LuNr+eoE2vTDcAbOac4h8g1jSgbVc98o+jies1SFbNlLl/j4R79+erUdfe+/AQPJd2
	 gJwoyFy1tyDMZ4uj5F64BSrZNxE2owyYa+kMtua55/csWatHZc8KdckzMLo6y4Qo8V
	 YNitSfncSg29A==
Date: Tue, 29 Oct 2024 15:27:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: conor+dt@kernel.org, a.fatoum@pengutronix.de, andreas@kemnade.info, 
 imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>, marex@denx.de, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, shawnguo@kernel.org, dri-devel@lists.freedesktop.org, 
 krzk+dt@kernel.org
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
Message-Id: <173023364718.1604322.9871635763168871763.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132730_062088_BC73C83F 
X-CRM114-Status: GOOD (  12.97  )
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


On Tue, 29 Oct 2024 16:16:38 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Only document fsl,imx6sx-lcdif with a fallback.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/fsl,lcdif.example.dtb: display-controller@2220000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sx-lcdif'] is too short
	'fsl,imx6sx-lcdif' is not one of ['fsl,imx23-lcdif', 'fsl,imx28-lcdif', 'fsl,imx8mp-lcdif', 'fsl,imx93-lcdif']
	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241029191640.379315-1-festevam@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


