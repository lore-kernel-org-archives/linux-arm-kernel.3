Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAC3C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDaB7X3E14MJwdUXZjZeefQhxC+ZJdUIfgwiwyvfoHk=; b=JxycQSIYlxcwSnvFiJEahkE2TI
	4X/F0Yow9/OD3YGbbkjvILpcfMVj+XWY7gLnB4iuGDVlDqf+hplpaOy24Mbz0gJbj+L7Pr8HeDn3Z
	SoeEyhGc3rUT2R0BReDcVsVRJUZWUp5MtnVgX2Rhmg0NMkTJiYrOndj3sUkMenEXGyg2RYKQ79f7E
	2CPqhyzZjU8jfLF+0PqzvXGpYQInQWsoTlFHs6zVsxVkKTn/RjzNX3VUpQi0qYstRqNQusFxzxiwZ
	LOq+Um7Ea4xX8vHShKfGLzxmW7IEY7JhgsyAu6yAJtjgFcupyDUukGXeyfmt4LzV4hYai6HGBd9OA
	bUqlidlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5Uz-0000000E8Xs-0PCR;
	Fri, 27 Jun 2025 09:35:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5QP-0000000E7tt-2Jej;
	Fri, 27 Jun 2025 09:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ECBE45506;
	Fri, 27 Jun 2025 09:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177BBC4CEE3;
	Fri, 27 Jun 2025 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751016673;
	bh=PfLvLuu3VqBR8of5r4wurKyduxqxtC+tsoMskrI7zzU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nqf9iZNKeurHEpBJ8I5dLQUSCiQCfdApL+fh0X80KJK6cdKMXJKXccwoUbwOjz3M+
	 f5EwllrcdrMU1NZ7NHMz3j7VGWBwebCwKbuyVUN7wri9vOfo49ymroy97DWFN0z1+5
	 DGAZrG/ID0Z9FmW7gDLwbkcZ8yZpLprTm5oUy9+oH7fR3AZcIf5Oj0wO8fWqXAHqZ/
	 R5/t3R1e2Wg0UbvTUjtifqg3v7mzYA17Yc52aKSzfeOmN+TQjSGJUBZ4Sef8TheX+v
	 MgV4mjJo67GrmGjCnfWBt9pK/dyG2qjqja706gQT/lA2MsVzNISTgoOl9GuV0gRcqk
	 TuuE0RhJmeBVQ==
Date: Fri, 27 Jun 2025 04:31:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Lee Jones <lee@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Li Jun <jun.li@nxp.com>, Fabio Estevam <festevam@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
 <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
Message-Id: <175101667122.2392436.17662976986893381131.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix
 duplicating dtschema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_023113_609834_2E9BBCB3 
X-CRM114-Status: GOOD (  12.15  )
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


On Fri, 27 Jun 2025 10:01:52 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166
> ---
>  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml: fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


