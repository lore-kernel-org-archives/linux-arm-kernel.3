Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2910CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA9seg1fpxaQELGrSnSu4+Jx/cuciZJA886149/ITZE=; b=XTZ5Y/ty+e5McF6Qy2Yxbg8Jtn
	GQcL9U8SXGrTq+079Vxb6uH+WL170M3sXM6hU4dtAcsZFPkSJfTMQR0/T4oC9VVyKr0EWo2BvRfl2
	fYCJ2fhggNGRGxgz0G6XFXkFA81rCtmmbUtELcgewG2d8PL60EGNJFnplctCio5pVzNTig1N6BMwz
	ZIbJMhOg3ykgIPm0m0nXk7bzNof8Es/8wO4p2IQAgs8L0dHV6D5l9TVdZ9LfHzHPS/1W5ObVJotKw
	G5TjB2H5SAXg76pjgtkCj/yqtVHkoWC41f8+S7NrMPyZEXglO3CCPk3AHiQh29lY/qC778MncKjwv
	gCeRH4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7umj-0000000BILJ-0LHN;
	Sun, 12 Oct 2025 12:02:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7umg-0000000BIKa-0ZyD;
	Sun, 12 Oct 2025 12:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aA9seg1fpxaQELGrSnSu4+Jx/cuciZJA886149/ITZE=; b=mjkEg+LUVGD6UvMWXmsyec6jkd
	BhThjFqW6VIJTzrPqKA+UJqUuBojkOfhtxNaIuK4Se20xmvnXYSYbCzfTgtZuFgovphlA609Q+zGo
	foE2pPuwgPqW0AMuHt4u9dkY+3dFuUway0kwiCHeazgvJfdph9rUdi52F/B9QP4PUSo2vpgfe0Qd+
	HhQVMp5aaUCcecFVXicrP9868hkAOGUnMX0qqDm6JtqRKk2IGnjMeyX36S7oVG0WkBv/4R+AMhnCt
	B4UwR1mHogFP6cZ5QiscHyMzGv4x+x3LrgwRT/AEGKGsNXL9lyc38LOWwq2Tf/ZeSemRw1fPFVVbR
	pQmNyZJg==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v7umc-0005Mi-Fg; Sun, 12 Oct 2025 14:02:38 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Andrey Leonchikov <andreil499@gmail.com>
Cc: Andrey Leonchikov <andreil499@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: rockchip: Fix PCIe power enable pin for BTT CB2
 and Pi2
Date: Sun, 12 Oct 2025 14:02:37 +0200
Message-ID: <2674033.Lt9SDvczpP@diego>
In-Reply-To: <20251012093135.80395-1-andreil499@gmail.com>
References: <20251012093135.80395-1-andreil499@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_050242_219566_64EF0CCE 
X-CRM114-Status: GOOD (  14.17  )
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

Hey Andrey,

Am Sonntag, 12. Oktober 2025, 11:31:26 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Andrey Leonchikov:
> Fix typo into regulator GPIO definition. With current
> definition - PCIe don't up. Valid definition have on
> "pinctrl" section, "pcie_drv" (gpio4, RK_PB1).
>=20
> Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-

How did you decide on the patch subject?

I.e. "dt-binding: ..." denotes changes for the binding as the name implies,
while you change to a Rockchip specific Devicetree should have started with
"arm64: dts: rockchip: Fix PCIe ..."

Also, please provide a Fixes tag in the commit message.


Thanks
Heiko

>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/a=
rch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
> index 7f578c50b4ad..f74590af7e33 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
> @@ -120,7 +120,7 @@ vcc3v3_pcie: regulator-vcc3v3-pcie {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc3v3_pcie";
>  		enable-active-high;
> -		gpios =3D <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		gpios =3D <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&pcie_drv>;
>  		regulator-always-on;
>=20





