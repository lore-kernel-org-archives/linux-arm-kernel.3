Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F8ACD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LIo9TozabnQDIdpLKcmev/lRB8BZu1WwyBJm2qGo+Y=; b=m9xzCZx0kkTF8mJ7Phgct+GLjE
	s+dr0ANksYOQOmUH+7SslGIworgpQHO/Vw+VDb0XZepKNoA+8LH4dvTb4ovoAYvH0cw4QST4kpd5y
	4y/SUQni+08kT6NuDNCYRwQ/ltd4SabP424Lj76ab84aMqG8sP8jvyjR7etVBz7JbCbjEtuLczIaJ
	0iokEDrcIovODLcijDk5Ga68MOw7d9RTT92LEEGDXtqlZkdtN9TpAPUwaYOF3zGz4PtDncpnmSm6f
	/NsGX+3EApNbvnBQB06ZtaBmBJvxRxlGZ3T4RfuC+TR7zi/9jcGT+SXoXPc2pklp9mslYywwTLhcz
	PnOV6kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgu9-00000001lZn-1lc9;
	Wed, 06 May 2026 18:23:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgu8-00000001lZX-100x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 18:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37A246014B;
	Wed,  6 May 2026 18:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB78C2BCB0;
	Wed,  6 May 2026 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778091806;
	bh=/SxnHXwXkcJ2w7XFQ1HeyaJ3OACr3W5SIqggah0abSE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dZ4KhPTeKCPdcIM3uY86WUQaB9adD2ubzosodrUC4/SwTpySCmDBdrvx67EYge27s
	 tNE9ZhkCenZ81z/D/SE6P01CwPW/ok2eBcI21VLgLzuObPwCSjREAKH+s1yRCg2Z0t
	 A7tgJMo8n3n7VV82r4DWXyiMHXSZmUynpjQzchs5OjVzEcmknRlUpDqnJtgyWzpYyd
	 1Lrq6sqOs1faA+8iVCd9c+aXXMjbONgx3lfar7Fu1uUVwXa7yCoMnCveVrRu08qOV1
	 KnCK4Wx52BWZEArM6SipxnPXahFsLVM/oQHlh0OEzyN9THeF2IFnZJK+Zhjw3ZavYQ
	 wMOZpnXGvONgw==
Date: Wed, 06 May 2026 13:23:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
In-Reply-To: <20260506170236.2610955-1-kernel@rembrandt.dev>
References: <20260506170236.2610955-1-kernel@rembrandt.dev>
Message-Id: <177809180119.2697484.15620649929174831633.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
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


On Wed, 06 May 2026 19:02:36 +0200, Andrew Rembrandt wrote:
> Convert the ST Nomadik boards binding from free-form text to DT schema.
> 
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
> and keeps the existing example.
> 
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
>  .../devicetree/bindings/arm/st,nomadik.yaml   | 36 ++++++++++++++++++
>  .../devicetree/bindings/arm/ste-nomadik.txt   | 38 -------------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 37 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/st,nomadik.yaml: properties:compatible:oneOf: [{'const': 'st,nomadik-nhk-15'}, {'const': 'calaosystems,usb-s8815'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/st,nomadik.example.dtb: usb-s8815: ethernet-gpio: {'gpios': [[4294967295, 19, 1]], 'interrupts': [[19, 1]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/st,nomadik.example.dtb: usb-s8815: mmcsd-gpio: {'gpios': [[4294967295, 16, 1]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260506170236.2610955-1-kernel@rembrandt.dev

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


