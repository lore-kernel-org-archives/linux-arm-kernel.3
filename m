Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CFF103E302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBGeKWKKKMA/GYKVdnALvhIQ+8mrBUlUzmRZ9SlygL8=; b=V/diCI0Gsw05KGBJVwkssrye7t
	BwW6LkmZyJcgV2cQ0wMvkxO0RH6ijOCiokrEw++BG3MgX8S3DViccNjUtuznEL5PbfRn5GIE04P6p
	6SfZjN/pOa22XoHB/P3Ad4I+n3RunglRudX3LLGXl8OnMRNb32jNj6q8c7UL38xYeE6Kj71+rApUH
	DP+WKW0qSTimrud8sZSqMmAfp/cWw+ad3yy5btJ7zcBZzbKSPZb0utkwK7efAfPta0viybwyJe7UN
	jmQ3Kn27nqwA0vXpJ267qmevUW8QRtQ7Ckc92ajN9vebVBA3AfV95OOwfpU2HkUINXzaX/slYKlPb
	l2DMNgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14OU-00000000Y1i-1NaT;
	Fri, 13 Mar 2026 15:25:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14OS-00000000Y0s-0wRi;
	Fri, 13 Mar 2026 15:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FBGeKWKKKMA/GYKVdnALvhIQ+8mrBUlUzmRZ9SlygL8=; b=siZ3hLr/RBuaALUlg0nh7FZcY7
	lWf5bv5S/xfRiWZ7Kz/z2JTrBN3OdMkK4ZjW9DJWtdfXn3BiamcMdU31fI5nlqK48075qsDryk5NH
	gMPGOKk/7zQbpuhCsELAjcw2ffuRfNmj/bRb/3yCjIAgf3VGvPr8YLOiGyT4QVagg/qo5NXKdtFyN
	hQVidV3y9NX/XujTtkD5r+6ixUjpWNGCb3nX7jc28er9fN7xsVcXIoqvIFC+OeZgn6UW20Ch0J/kX
	Nd0GrGT+Jf7HZDJJi2VpQbCE4WWBJs9KF7xvbTEYEhFJCaPJ+bhRaMz1yrZC93UrHH7tK2jxby+xw
	CNQ9m07Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: ulf.hansson@linaro.org, Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Fix the RV1103B compatible
Date: Fri, 13 Mar 2026 16:25:30 +0100
Message-ID: <12853156.O9o76ZdvQC@phil>
In-Reply-To: <20260313130835.708066-1-festevam@gmail.com>
References: <20260313130835.708066-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_082540_283429_9DAC6B52 
X-CRM114-Status: GOOD (  14.52  )
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

Am Freitag, 13. M=C3=A4rz 2026, 14:08:35 Mitteleurop=C3=A4ische Normalzeit =
schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@nabladev.com>
>=20
> RV1103B uses the same DesignWare MSHC controller IP version as RK3576.
>=20
> They have no "ciu-drive" nor "ciu-sample" clocks and use the phase
> tuning inside the controller.
>=20
> Fix it accordingly.
>=20
> Fixes: 517b1e3c9455 ("dt-bindings: mmc: rockchip-dw-mshc: Add RV1103B com=
patible")
> Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml =
b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index a75209bd2710..4965bb518c54 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -43,11 +43,14 @@ properties:
>                - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
> -              - rockchip,rv1103b-dw-mshc
>                - rockchip,rv1108-dw-mshc
>                - rockchip,rv1126-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
>        # for Rockchip RK3576 with phase tuning inside the controller
> +      - items:
> +          - enum:
> +              - rockchip,rv1103b-dw-mshc
> +          - const: rockchip,rk3576-dw-mshc
>        - const: rockchip,rk3576-dw-mshc
> =20
>    reg:
>=20





