Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7190BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fwuhHs7pqnSyoIdYUQwG7qjgQ1CC6dPRZ/xpENoi6E=; b=QMvTN7awflTSLkQmGHqPskROuT
	cSjEEFky444C3TMBy7UvBqQB0ffaoi12IdAQCSUzku2k8wxGm81eSlZ6aBQqj8SD/yJ/dR1PSnA6z
	krfmWUz8XDNnWcggWsO/Kaimt/Kk3Nm+/OnKO6spyfjhk4Rl78CP/96ch7XHbZ1lzP+kjOpsFS1H0
	AAUJgjE+7emzK7e0aioKGPgQIG77bwT+/g9fK3EOruAc2x7AQs23oJl32YQN/RM7Y/hz3PVRz1bk4
	GfqvdU61EDYZ3wTCoBSBtSF0CvYj7Hc3HqfInHj1bxpDnYZ1B/AxydJ9aYXDZUeKX7UBugisoX0Fh
	VdlRw8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsm7-0000000AHQB-0574;
	Wed, 18 Jun 2025 13:24:23 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrei-0000000A54k-00FI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:12:42 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750248757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fwuhHs7pqnSyoIdYUQwG7qjgQ1CC6dPRZ/xpENoi6E=;
	b=WGEEuCPdsRaGDkWhC8iz9ZzBxfRVX6fRUXN35unrrg/RSzEOp5Y2YlPQz9Kw46epXq25Kt
	qKy9OYZjWc3RZI23h2IDLRL354jLZvmJTj80nLS+olZ86dFpaS+GGr0VJafCYbccXUFMNy
	tAnq4OBc+6/FaeJsHd82Q0oD8vtQZZXtTV/ld4ePnMAaE5eLqXIpMjjoy+SAfPJqAAyWDJ
	VkrAsh+MbnzD/LLEBxhJCBA5S2DT2iIbfyUNa03gpy4BRs7J8KBkvv/1Rvj4v+kkgZ7CjC
	06rcd5QPUk45Zffjom8mZLRe/1MTB/Qk76ZzDQ6ns50y9cRikT7plfCxpnw95w==
Content-Type: multipart/signed;
 boundary=d094255437ed180642212f2daf7bb7d49bbc773ab458e9a2480ab8cbe8f0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Jun 2025 14:12:13 +0200
Message-Id: <DAPNE849BAON.1DPGBKMHM552V@cknow.org>
To: "Olivier Benjamin" <olivier.benjamin@bootlin.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Remove unused property in
 PinePhone Pro MIPI panel
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-3-e54797ad2eba@bootlin.com>
In-Reply-To: <20250618-dtb_fixes-v1-3-e54797ad2eba@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051240_428499_36BDA919 
X-CRM114-Status: GOOD (  13.17  )
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

--d094255437ed180642212f2daf7bb7d49bbc773ab458e9a2480ab8cbe8f0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
> The MIPI panel definition in the PinePhone Pro DTS includes a
> "pinctrl-names" property, which is unused in the absence of pinctrl-0.
>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 5a7341fb6bcb0613af6f3ac31d99355a0f890e89..405140700208365c8631de86a=
2d7b6e577b7aa7f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -485,7 +485,6 @@ panel@0 {
>  		reset-gpios =3D <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
>  		vcc-supply =3D <&vcc2v8_lcd>;
>  		iovcc-supply =3D <&vcc1v8_lcd>;
> -		pinctrl-names =3D "default";

Why not define a pinctrl for LCD1_RST for GPIO4_D1 and reference that in
pinctrl-0? (See page 11 and 16 of the schematics)

Cheers,
  Diederik
> =20
>  		port {
>  			mipi_in_panel: endpoint {


--d094255437ed180642212f2daf7bb7d49bbc773ab458e9a2480ab8cbe8f0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFKtJQAKCRDXblvOeH7b
birRAP9UF4IfSII2WRPdY7JTipjbLL5426U7AHmPMYj5ktK2igEAqMjf89ZjcYJi
y80+OTxY2ljkePaU/MPugTRVg3TTcgk=
=NOom
-----END PGP SIGNATURE-----

--d094255437ed180642212f2daf7bb7d49bbc773ab458e9a2480ab8cbe8f0--

