Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ECBC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoWfYjj7geBEgtBjXdF5/WIH4GJNtcxQHnt+xjX8Kvw=; b=VrTofpoVFLn2Kh8NvflDmkg0am
	0ItdmIa3aE/IcuQUIeWWi7D2jiR9NaPFE3/xuzHpnpVgQh5JAVYddWxm596qcCISxxpnGBMTRr6Ii
	BHCun6AUaOo7Ezkc8WXXhibvKWp2i2TFqnJwn3Y6vlYNPdybhYFeO+c310c4/MP2r93idcbMq+x5j
	+5+cVY7JAtwqRueK5COXCL7JiBb2pt1BM7cjNqpXZifjXtR75mhKLs4FeuKVqDJOqWhqTt9CGWKOv
	fYLHbDHbFSpsIgT55Ml48Oz8OUsl/JtMMbMEMVnUorvVqwxagbdINBrsaw9qDTyouajVbcHlTvZ99
	B5eT53/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lwP-00000003Vbu-3uiv;
	Mon, 21 Sep 2026 21:52:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lwO-00000003VbI-2IBg;
	Mon, 21 Sep 2026 21:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=eoWfYjj7geBEgtBjXdF5/WIH4GJNtcxQHnt+xjX8Kvw=; b=HkrQOOOjlx+TKDtRusn+0FvMZb
	cIQVej5QlqC5aNt9TSJBmhMFVrTv+LGfIiE4s8aVKeG87AVmsK59TDZNkV4s8uAral2Wj9yzZ+6MG
	4AIFzT7pFhMHERPxAWz7pyQxezfxsCszmb+fUjuizXVCZVV2o/Z7qfi1AstO8X9MfmMDqctoyyOmd
	SVmhKeXsoinCwOo04WoXysB/QPB36+COgNw1X2wbQCGFK8zzWen79TAtgYBvX+CXvswROL0gXHEKY
	Cw7rssjp6IZinvyZAoQI6HGsYqDnb2ovGb5UzzPfYq1kCeNMA5IqGeK2cJYMHvFASwE7apkI9Hyqs
	ZqWfS36A==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lwL-00000005ftg-1vZn;
	Mon, 21 Sep 2026 21:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eoWfYjj7geBEgtBjXdF5/WIH4GJNtcxQHnt+xjX8Kvw=; b=kOKh+tO180j0JZFNK/WRL9wKCn
	OsrbwpICbLRHcW+J3f/ISUueH6+dPWCMG8lkIeWPJM2/kT9gRaTTvaYlUEdJbSW5yPbvIsFIKotX8
	4vlKwGkEN29oWCVA0oEA26cAn0CM4u+ile4EdpHQ0Nsja0IwHNvfxvjJJODjLLWCYIutNkJR9U7kL
	cxkRTYOklkTtzeASjPrsO/Svnu01pm00kH3Z/Q43Y3FC3unz6hZsQA0fYFDOGPJv09UXidcW4UenI
	O8hJh/gXD8lBrT+PEvLGlcnSWizPbOnDYLpT0uQHRBKW2XlD7zPwXxcBlpyPKkzYgDWaH5v9FEcLN
	c/2G0pNA==;
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v13 07/14] dt-bindings: power: rockchip: allow resets in a power
 domain node
Date: Mon, 21 Sep 2026 23:52:31 +0200
Message-ID: <2492931.NG923GbCHz@phil>
In-Reply-To: <20260915104328.45901-8-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
 <20260915104328.45901-8-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_225245_543296_4F1259F0 
X-CRM114-Status: GOOD (  11.52  )
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

Am Dienstag, 15. September 2026, 12:43:21 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Jiaxing Hu:
> Some domains do not come up in a usable state on their own and need their
> resets cycled once power is on. The RK3576 NPU domains are one
> case: without it the first access after power-on takes an async SError.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  .../bindings/power/rockchip,power-controller.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-control=
ler.yaml
> index b41db576f..83741f048 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> @@ -136,6 +136,13 @@ $defs:
>            A number of phandles to clocks that need to be enabled
>            while power domain switches state.
> =20
> +      resets:
> +        maxItems: 1
> +        description:
> +          A phandle to a reset that needs to be cycled once the power do=
main has
> +          been switched on, for domains whose logic does not come up in =
a usable
> +          state by itself.
> +
>        domain-supply:
>          description: domain regulator supply.
> =20
> @@ -216,6 +223,7 @@ examples:
>                      reg =3D <RK3399_PD_IEP>;
>                      clocks =3D <&cru ACLK_IEP>,
>                               <&cru HCLK_IEP>;
> +                    resets =3D <&cru SRST_A_IEP>;
>                      pm_qos =3D <&qos_iep>;
>                      #power-domain-cells =3D <0>;
>                  };
>=20





