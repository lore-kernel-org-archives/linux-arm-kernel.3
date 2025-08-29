Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD56CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dbo6xW5TJbh5WPsB6dk7vrKFTqJnS4MupBdN9HCpIP4=; b=MPvbQCMVqbWUPWi/m3ztKy2cCi
	qdl4OGFXrx2yjuTfKV7OJJNXxPQD0ke9Sk9bU3seXFC6uVUNwuhcYBjUtSnSrFolN7ixKIguajbKs
	CaxU8xOJeEnb6/zPGpT78/fGPy4bfroVyz9wFXG+4da2qq3I5FllZQiqUx1KtO5atnewoCmaDR9Qz
	QR5uHdxyrtC8aY2wIvkBCOS9ZdiW8k4QmpjMNkHm61q/GJLCbqcKy/O0Gtj6oReJN4mrBKvVDmaMY
	w4EBOTMFaaL9AtyK36HyuOPdM4ixPdXyMUke7cOFyAzTjoPWZj5WLLrDMC53zeRCSMT+3qK4pyLAr
	EXs/pIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2GG-00000006RpQ-3BFp;
	Fri, 29 Aug 2025 16:47:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzVM-00000005uaD-2lhq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA19060147;
	Fri, 29 Aug 2025 13:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166FBC4CEF5;
	Fri, 29 Aug 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756475459;
	bh=iMyE22m+SMBuDDViYX2YsQUqlBSUcMMIUputDrUwsPo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J08iN6RdW+t2gMQ59Tr1GMVwa3UffcElZFqa4Zg99HY8zZzGt08x/uKqmpkG3ubKu
	 8TrwqgVR9+6I7fMDTZau5j1fIgrT2uDHUJ1priylIHzrnyc3fR3hIpJ8eTY8ey8x7P
	 yLjGFysK0NlqW3ZnoBjqFzZlX1vxIVPDnnWMy+kC0t12AUmzfX9idKKzeSc5A89pg4
	 b2xpZlqyBvyquHWQKX8Xb+U/E8UTUXQNo3dWmER5QMINukZ7pGdDqmLST4KVRDuv6W
	 qe93O16t/bYXFGKjMEY8G56asDFR9GSQg8s7cyzLMJ0UHOEhFTUr4jfqB+KHxTiQA0
	 tEPnD46DuqdnA==
Date: Fri, 29 Aug 2025 08:50:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 joel@jms.id.au, andrew@codeconstruct.com.au, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, linus.walleij@linaro.org, 
 lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 openbmc@lists.ozlabs.org, brgl@bgdev.pl
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
 <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
Message-Id: <175647456196.394574.546840408984626348.robh@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
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


On Fri, 29 Aug 2025 15:30:28 +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 135 ++++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 452 ++++++++++++++++++
>  2 files changed, 587 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: syscon@14c02000 (aspeed,ast2700-scu1): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: syscon@12c02000 (aspeed,ast2700-scu0): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250829073030.2749482-3-billy_tsai@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


