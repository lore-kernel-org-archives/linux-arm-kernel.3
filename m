Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF6C44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTarYRorlM/Rn7cCaR7+b+Qezl3OqBStgUiS/lo6A0M=; b=cQsWC/kNhmzV2St8sFDWAZG2Cb
	Y0+9hNMLzOXXBSz5JkzdwLdCadmdRBNwZ/oIcy5plozsYU0XSKlpkM/Lh3QRVQY8mm6a3CWHXBzGZ
	vJuhvyjECUrrTPTUeCTzJPql7YZ655ClXwTFXSfBNmqD9rbZfLwzDZFrScggX6fa+BvrGBSDpJIIv
	s093CxdK6WNJiGIKw0bR8qysJj1Og294joafGEdOZ8DCrIsShMYVm9+6NhC3LdUgVewS2Rdwhaqby
	9K3V2GuAOmpeHm3Z7DAMavGawul6uSjMAaWmLQx7yggXIhenbfhdzhYNjFTN6G9QTAXKG0vuv2QfJ
	D9rT89ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQi1-00000000N3J-3LJf;
	Thu, 16 Jul 2026 18:21:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQhz-00000000N2U-2mlr;
	Thu, 16 Jul 2026 18:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sTarYRorlM/Rn7cCaR7+b+Qezl3OqBStgUiS/lo6A0M=; b=E5KGQvMIP4P9mjc4QniEKE/KJE
	L4EZstBq76YnlxNHjH0Nzcd/Bvfv7K4sgAcnnxQyZ7zVvDkPNdYU+t1FhJ5eUW1w18iKN5JGgQ3TK
	NJsRrtlsb14w0O+f9kb9L2wUbSbuVh1vb13Y95nWCIOrnSFlDh8mrRMU10VUlTjQL6C3RozK4q8cz
	Q8whSV2xEAu0SWxOA6gnYaND+efwyuLPsfgSME7owvyoIrsL3/YQaiPxLYs38FhPOcHxHeobkm660
	XlXVely8/20/eOtM3ipCEjT0r4xC8LKwsu/yDXGbSeSXps0Jx7SH1zcxaQQX0l6zdN8jPqH5up7YD
	yT4iKGnA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Thu, 16 Jul 2026 20:21:15 +0200
Message-ID: <25132193.ouqheUzb2q@phil>
In-Reply-To: <20260714054653.266842-2-hrushirajg23@gmail.com>
References: <20260714054653.266842-1-hrushirajg23@gmail.com>
 <20260714054653.266842-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_112119_701813_688D6340 
X-CRM114-Status: GOOD (  12.81  )
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

Am Dienstag, 14. Juli 2026, 07:46:52 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Hrushiraj Gandhi:
> Add device tree binding documentation for the Vicharak Vaaman2,
> a single-board computer based on the Rockchip RK3588 SoC.
>=20
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>

In v2 [0] this got an
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please make sure to cary over such tags into later revisions.
B4 caught this, so all good for this, but please keep this
in mind for the future.


Heiko

[0] https://lore.kernel.org/all/20260628-retinal-ungreased-4c6d45e3596a@spu=
d/


> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index b023d4cc9842..b5a43fd5e546 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1311,6 +1311,11 @@ properties:
>            - const: vicharak,axon
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Vaaman2
> +        items:
> +          - const: vicharak,vaaman2
> +          - const: rockchip,rk3588
> +
>        - description: WolfVision PF5 mainboard
>          items:
>            - const: wolfvision,rk3568-pf5
>=20





