Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CAEB2700
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDD4iNLP5zZJwnV/07DKNWZqg1CIxz3AVjon6A1Ip9w=; b=2sLVipBOWQNUvKMHenfqQs/rh1
	HiFzO5w62KnUwaYpPMK518+QxdVQ7T0ZFULA7rBjt4KNUfevE7F/jQ9JOQNhQn1Cj2FCQaxTX5wsn
	yTziSjbIjir+R59muYqzNuA/89nhgt+LKZlRUEXJMYLpLDtY7aLD0D+aMKhy4UHjKmad7erE+a/Uk
	hTweYGGoDE9o0NmUcuQr0qZuCNv+R0hiFFIAeQISrYHOoa+xR44w7cmf9cA4i0PzLm8sxWZ/Ms9GB
	WGH38oVQg7RIdz7piYbO5ky0S5+BQ/naotuAbPJYQe/9rlvww8G5+rQlIQP2gFe59a73GN4Ksd49X
	F47g93kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuef-0000000HURn-2Tpp;
	Tue, 10 Feb 2026 20:48:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuee-0000000HURh-0Zti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 20:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E622B60136;
	Tue, 10 Feb 2026 20:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B62C116C6;
	Tue, 10 Feb 2026 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770756494;
	bh=8Jn1Y4izc0UX6TWuQOTgUa1Iqbm12Lpkc6uITFUi1Cw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YJzTyC+EC88DeDJ2ipytIEimaxRZK90PFnSBPqLRuFluQPRcILGA3rT4946x+/CBP
	 5DJhvuFS9D8TKYRF8/Yr/SfCS6cDI1vy8Drnt+puEMBA/9Y+J4z07CBIt5/kKRLhuE
	 giGpdE230iB1xeN9E8V8BmA7uw9UeG4vJ+I2FOZ79l8w+/pNRHA5ZSV/iAzyrGf8kD
	 h5DOmtP/3DMZPgI3/BWI0A/K3HwUN1eIe1soEuZHzkXcxUFSBVyZHebZxO51tYXkl8
	 1Z54TEuON0ZUYnc0NiTonod/3XuKJMUjf6Zq290c6jp0TamBcVgVcJiGfX1pIIzjpV
	 lCMcmxDYe6N8Q==
Date: Tue, 10 Feb 2026 14:48:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-imx@nxp.com, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 arnaud.pouliquen@foss.st.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 linux-gpio@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 imx@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Shenwei Wang <shenwei.wang@nxp.com>
In-Reply-To: <20260210170814.406883-2-shenwei.wang@nxp.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-2-shenwei.wang@nxp.com>
Message-Id: <177075649333.2817738.5507371747833844104.robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
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


On Tue, 10 Feb 2026 11:08:11 -0600, Shenwei Wang wrote:
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml references a file that doesn't exist: Documentation/driver-api/gpio/gpio-rpmsg.rst
Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml: Documentation/driver-api/gpio/gpio-rpmsg.rst

See https://patchwork.kernel.org/project/devicetree/patch/20260210170814.406883-2-shenwei.wang@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


