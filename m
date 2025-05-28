Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BFFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mvkQ2sR3+GHLX2KV8AJCdMmmzj8VbPr1oiCTjujqVw=; b=OiFNyO3eUiagpw37GD95agQja+
	7TVQQduwBC0+FGTBxYCqUIBz0PcTbyk/8W2UsZbpUj25lSN8lSkPbG8sUE6/LtZxe1YTpMEwJQRgD
	7kBmwLXG9Def/8wruDlKSRlxLzZHhtJ8DeQ8GEsy13/SbRw6VDUhXxphYOi+25HuFP2cjzBly8m8x
	jiaEVuRwh6ZMNVLI8I/B/1MInDR5TDFaSaDihNwBnlj5FpUPNQK++6RBh/2TsEW6ClZuJ18rMsU3a
	2mmzDXkvwKJtMqQATtsm62mcWsFUT/O2BUlKykputcrai5ltzWG6g9A/qRO5yEwc7vWjMu8PQLYBl
	aMIhoj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJii-0000000Di72-49d2;
	Wed, 28 May 2025 16:33:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJfQ-0000000DhVn-0ote
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B48061F1D;
	Wed, 28 May 2025 16:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A22C4CEE3;
	Wed, 28 May 2025 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748449811;
	bh=HHKUmYQYx+MVj6W9eglzPGornr6ttUWJyuK8q87x0h4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Q5BpTKerQXKj/oCa+Z2coUymzeTVRHNlRuCXTGKbTkE1UCGTjPUPEkSsiCJQjO7X1
	 j0eD5Cu+JeVNhAMdhxpoK4BjKR73YE+7Ocohv5EcY7GgZcY9wsIZtBdq937UkCnQa3
	 zqrGjY2D6XV7W+ulRlTIKtR52wC6Ng/2PWKn/oRKEhxqKseXvxQP+B28pyTHhcwHC4
	 v/SVjLVS3+6xAJDIWcZ1PFfluUVEk9ed8HnpQkAcbvLGcJx+gk44awPymP38gqCAfe
	 6YauEPhQgUOwfw6mpTevElSL+Up083ZM++lpUUygg+iekjWQPQMmWrkW0azjayUyDP
	 LM6RoNXr3DXiA==
Date: Wed, 28 May 2025 11:30:09 -0500
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Gaurav Jain <gaurav.jain@nxp.com>, 
 =?utf-8?q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, 
 Thomas Richard <thomas.richard@bootlin.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, linux-crypto@vger.kernel.org, 
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Herbert Xu <herbert@gondor.apana.org.au>
To: John Ernberg <john.ernberg@actia.se>
In-Reply-To: <20250528144259.2603914-4-john.ernberg@actia.se>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
 <20250528144259.2603914-4-john.ernberg@actia.se>
Message-Id: <174844980849.122008.12781867693102871804.robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
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


On Wed, 28 May 2025 14:43:07 +0000, John Ernberg wrote:
> NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> resource management.
> 
> Allow specifying them for such SoCs.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> v3:
>  - Fix warnings discovered by Rob Herring's bot
>  - Declare the compatibles correctly (Krzysztof Kozlowski)
> 
> v2:
>  - Adjust commit message (Frank Li)
>  - Only allow power-domains when compatible with imx8qm (Frank Li)
> ---
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 45 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml:114:17: [warning] wrong indentation: expected 18 but found 16 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250528144259.2603914-4-john.ernberg@actia.se

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


