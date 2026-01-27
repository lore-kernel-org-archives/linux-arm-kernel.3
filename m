Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC578D34088
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+TlRnti7aKMycX4gSzGYw9zeiCqncr3ag266wtMU84=; b=lcjxBvTZq0GxYsy7+Tzy+yOWBt
	9d6zBz5QW/Im2wDw2Nm1frMtSItBmTP+HoPwSx6TDqDhwiUmerCgbW2byGKhljz7t+qdbunyjP3EI
	lg0Tcai3DPjdtw3UsZac95h7zKKaunt3CjvUx6CW7OpMEooGkycpzj1H/qE8HerHOunVuAgisyDxT
	v4niZjv77tHKleLXZ1znjG2/aO9lru+A6/2VJD5xbRZH1r/BeD3/u1RKI8PLALssoAKxzq7f8TP//
	+E0LR+5gOGAfCiLAU0hHo227cQkBZ3cjfVoMpL99p08z1dcpqMsCPPYDORMaD9k2UMqvKhr3dBleD
	nywo0pmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkl5h-0000000EYcQ-3YxV;
	Tue, 27 Jan 2026 15:34:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkl5f-0000000EYbm-0arv;
	Tue, 27 Jan 2026 15:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5C9B44084;
	Tue, 27 Jan 2026 15:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FDAC116C6;
	Tue, 27 Jan 2026 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769528088;
	bh=r8swAlZx9gfHag0kXpyqxA7e8B89YoYJ5gDgTraENPE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AgwJC/mLo/RKTmsx+eYELFgTaPAqfeSLcvwLkkGy2/CtRB3bhuXM4IEq9+YbGYMCQ
	 R3GLERCy/X29SqmJD1hLWV5MP/2MD34L+tTdiGukKBZW3Y7UsdnK2LUtrNWUsUQdYA
	 caLkJQLIHvkhynBAhxNbC+m1l9QoJHfSXcn8D1DTjnNko8YuESxNvMm80L+ZElSR0I
	 e2p0hvdrKzUv25wZ/+xMN6Y49r175vWIE2LejimSl8ccZQYjwmwVH2E9eTLby/0Mki
	 io0mAy4STdYdE4W29dr0JK5auJSPNKpABf0JwW5K72v2JXNl9b5R4Mlzd9ud+ABkMs
	 HbOc+N8xrXM+A==
Date: Tue, 27 Jan 2026 09:34:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de, 
 Jacob Chen <jacob-chen@iotwrt.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 linux-arm-kernel@lists.infradead.org
To: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
 <20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de>
Message-Id: <176952808764.1883880.9874819074919420186.robh@kernel.org>
Subject: Re: [PATCH v3 01/27] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_073451_849988_34BB8DAF 
X-CRM114-Status: GOOD (  15.10  )
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


On Tue, 27 Jan 2026 15:39:10 +0100, Sven Püschel wrote:
> Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
> peripheral found on the RK3588 SoC. Also specify an iommu property,
> as the RGA3 contains the generic rockchip iommu. The RGA2 also has
> an iommu, but it's specific to the RGA2.
> 
> The existing binding refers to the RGA2 peripheral. The RK3588
> contains one RGA2 core and two RGA3 cores. Both feature a similar
> functionality of scaling, cropping and rotating of up to two input
> images into one output image. Key differences of the RGA3 are:
> 
> - supports 10bit YUV output formats
> - supports 8x8 tiles and FBCD as inputs and outputs
> - supports BT2020 color space conversion
> - max output resolution of (8192-64)x(8192-64)
> - MMU can map up to 32G DDR RAM
> - fully planar formats (3 planes) are not supported
> - max scale up/down factor of 8 (RGA2 allows up to 16)
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/rockchip-rga.yaml       | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-rga.yaml:64:1: [warning] wrong indentation: expected 2 but found 0 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


