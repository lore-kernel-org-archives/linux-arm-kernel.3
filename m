Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99377C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnyTZrEmfbVjsNCHt7zd7vFCHkdttTw4fWF4KUmG7Sw=; b=SsvCIKc/XmJHy8bcDHUsbZPNXF
	xSY0ALdQsP8k5NGkbj/Jw8jb4nQwTiClPiM8y9jnRCJScaZT4HqMMgvjT5DrfqODDV/onA0WAG8bl
	hKQojmASGHwChNSEq4Dq4+ZUsQwIhEU2vVfX4XS8lRSa0eriYwYCIPz6nb7evkyj0NbnKFGTr71MY
	WF2xDCC1lzteNpox5Z8awoQg2Ba53gcFOzNgqkcZnQFcwh0m33v8cObENVFJQ99MBy22QyhmWw9lX
	xyJ0Q863rwpWv1qbmSycp9VJ6qfLZzEw9apuRKWOUcQdJ9N7/26dpvij4mOP8nDqUWwlV5vNPKUOK
	IUen/mBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqg7-0000000ANvN-3xus;
	Tue, 27 May 2025 09:32:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqdA-0000000ANUu-3SMH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 09:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2332461129;
	Tue, 27 May 2025 09:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A10C4CEE9;
	Tue, 27 May 2025 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748338195;
	bh=yx44wKhyWSIIz+gEiInWp3kNE5EdMe0ABsYt3dl6KlE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VZMy6YLIzi0E+tQikW/k2S3coZ3itQpR7Mk9hxf6fnCc54gCAzsqhOtNJTvFe5vgM
	 xjfF2OO8kayX4YwTLScTKkK22fQ5iwCT6WFL8J+JophziiQltlMzyUjrzwRhiUCP/f
	 p1JIKY91iLQM9mCIjkhqRMMOV9t00vnyLx8qYoR5/RbZoWYQSYQIbjop79M4nTsomU
	 VJzUGOkR97aRojNaoV3l6mmkxQvRTnC5POowQxwOsSyj5n42D4dZbu4tzsSUYPtnSv
	 l+d8XYzaiCn6VNQQcm0xNiLMbIa7vcCRY/VDVtce7NSsHJ32cFMH/JJj8jpRxR5emG
	 3jN9vw6i843fA==
Date: Tue, 27 May 2025 04:29:53 -0500
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Thomas Richard <thomas.richard@bootlin.com>, linux-crypto@vger.kernel.org, 
 Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 Gaurav Jain <gaurav.jain@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 linux-kernel@vger.kernel.org, Pankaj Gupta <pankaj.gupta@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
In-Reply-To: <20250527071552.1424997-4-john.ernberg@actia.se>
References: <20250527071552.1424997-1-john.ernberg@actia.se>
 <20250527071552.1424997-4-john.ernberg@actia.se>
Message-Id: <174833819381.3537254.5508047100817417003.robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
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


On Tue, 27 May 2025 07:16:03 +0000, John Ernberg wrote:
> NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> resource management.
> 
> Allow specifying them for such SoCs.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> v2:
>  - Adjust commit message (Frank Li)
>  - Only allow power-domains when compatible with imx8qm (Frank Li)
> ---
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: patternProperties:^jr@[0-9a-f]+$: 'if' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: patternProperties:^jr@[0-9a-f]+$: 'then' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: patternProperties:^jr@[0-9a-f]+$: 'else' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250527071552.1424997-4-john.ernberg@actia.se

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


