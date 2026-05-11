Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371B4CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTubT1RlethLG/F7Qx0c6IR3bOaaoNbWtjaqJeEx+6U=; b=qqUMx02Lrqd0xkA1wIsno2DlZH
	xo9lUP/kTvjB8+0IV5W1TDUufaCE7EYXgKmEDDB68J2z4dL+wW8T0yN5ZD4kryg5laCX8nQQQGN0B
	aO6ALRPbgfiPKLFNps2HcYtSD3zptfAmZaW5pZDch3gfdT0P69oozlynQKmgHqqMt2jv0vxqum0hJ
	RWAI7YVvraztVLX8asjl6Mj78UV7wR1hZGcON7vP+N3axaqlotb4ZoJpz4wcwMbb5lryZfO9DsFcs
	FpgdeHzgxBRBmFhUerdYyPA+ouJ2W2xOQoCwvwEo/mul6JOKYSaYbhcxoz+jobCyTDVoQpETpCK+m
	PuCVC4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGn-0000000D0XW-2XmP;
	Mon, 11 May 2026 09:49:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGl-0000000D0WK-23tS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B738743B62;
	Mon, 11 May 2026 09:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDEC2BCC9;
	Mon, 11 May 2026 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492986;
	bh=y5DSKdKa37aBlgtVU8TQCHisc72vONuDAdNEJjEkS30=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=L97yCQn4V0sBM1wSVEzW36yrUHOpUbdkwS9k9T4P8TSIgrlSvuOP2Jx8RyN7Q8e8o
	 44dI5MJ4jCGJrE3nEmNavNvSIXmLyG95NOxHF7Ihcffb1W7G9tyyLxiEwgDu3D4nVT
	 qG9AnMr9AC6H0Nx/y6NiPwLCxoDyBFff9IK0rUwr962OEoaVT0HRjyb0iV4U4rfaoL
	 6GPWUrPdWcMS6afSUfI9yS795wvh1IIM+XZAzD++XYEDNtElvYrm514GWC0imfzqrX
	 1QH5SFpyAldi11MH5tvHYqE6OyFU/t+KQ2lMwhoFc7uTOm+YyhDEv0PUJKzLWaCLZK
	 Xs3Nlqeol/ZqA==
Date: Mon, 11 May 2026 04:49:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, devicetree@vger.kernel.org, 
 yclu4@nuvoton.com, simona@ffwll.ch, ychuang3@nuvoton.com, 
 tzimmermann@suse.de, krzk+dt@kernel.org, zhengxingda@iscas.ac.cn, 
 schung@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260511075142.54752-2-a0987203069@gmail.com>
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-2-a0987203069@gmail.com>
Message-Id: <177849298427.1066847.3849705835228409800.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize
 for DCUltra Lite variant
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024947_571267_9DD6CF98 
X-CRM114-Status: GOOD (  18.86  )
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


On Mon, 11 May 2026 15:51:41 +0800, Joey Lu wrote:
> Extend the verisilicon,dc base schema to accommodate the Nuvoton MA35D1
> DCUltra Lite (a previous generation of the DC8000 series) which has a
> different clock topology, no reset control, and a single output.
> 
> - Replace the fixed clock/reset item lists with minItems/maxItems ranges
>   so sub-schemas can enforce variant-specific constraints
> - Add a 'port' property (single-port alias) alongside the existing 'ports'
>   for single-output variants
> - Remove the mandatory 'ports' requirement from the base schema; sub-schemas
>   shall enforce their own port topology
> - Add a 'select' stanza so the validator matches any node whose compatible
>   contains a known Verisilicon DC string, including SoC-specific glue
> - Relax additionalProperties to allow unevaluatedProperties enforcement in
>   sub-schemas
> - Fix a minor whitespace issue in the port@0 description
> 
> Add nuvoton,ma35d1-dcu.yaml as a sub-schema for the Nuvoton MA35D1 DCUltra
> Lite display controller:
> 
> The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
> controller. It is a single-output display controller with a 32-bit
> RGB (DPI) interface. Unlike the DC8000, it does not have discoverable
> chip identity registers, does not support the CONFIG_EX commit path,
> and uses dedicated IRQ status/enable registers at offsets 0x147C/0x1480.
> The clock topology uses two clocks (bus gate and pixel divider) and
> does not require explicit reset control from the driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 94 +++++++++++++++++++
>  .../bindings/display/verisilicon,dc.yaml      | 64 +++++++------
>  2 files changed, 131 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml: allOf:0:$ref: 'http://devicetree.org/schemas/display/verisilicon,dc.yaml#' should not be valid under {'pattern': '^https?://'}
	hint: References must start with '/schemas' or be relative to current schema's path.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260511075142.54752-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


