Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C27DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyRqvCiBUNreiVdu1C2ibSdtvPeHazL8eEH7UAzR7EU=; b=uzFyRp81RXFUxIsLp73l7tX9IV
	Hhp3X6P1xg6kpgrtSND136F+qmad1rkjTUh9Z7YfXe+tWyo8aXa3gsGzLaGMYf3D8yNgqobSLjeUv
	j2r9ck9BlvzPwQ2ZL5R/ouXzv5qrl+EvxyRdJXyrthUNfF+09YYZG11+XKiyXOSaQ++UYxChInebB
	/qUgFvh8t0Z/vjlfXbciHD1BbFU3Z8mb8h34zdojb6LmFNpxqStE2SlSHM3e9IaGW8ANPaUkRDYew
	aP9c15ZhWD3uAqfQ62OC425+aU1EVxp1EphgR0sUXxjZhlQctbCag6obWw1emRYFlvpw8Msvm5AC9
	Vi7XkFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRupl-0000000AcAN-24ZH;
	Wed, 18 Jun 2025 15:36:17 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtBo-0000000AMEU-0Zrg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:50:57 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750254652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wyRqvCiBUNreiVdu1C2ibSdtvPeHazL8eEH7UAzR7EU=;
	b=PO8Pt/BtUik48+dNlnsyUpVPXJGAil3xpxAmvB3wa5plkjFiDY9SvLfpotgUxNiUpXi2Pn
	RHIceBY5WeG1CUgwC/ijnwS51ENTQqWsKBw0do/zDCK38mBHiBBM9HhYwKzKkRN61QQa0o
	/TXiW4L/qAhWOCdhCJalWaRPpApsfXSELtS/plOMwpSPPpS0YaQXV36Ecgu1WX40K0/4EQ
	uZrAid+s6JWpYmA4Q2PU8FPGATnipXAxOduV7UmOeWbtacFwARWb536WA8Qo9aAW17IPRd
	V0C8tzAic03D549Gox5ZGJ5poa6kbB89SGILMDoSYSVoYMqLl6p6ic2UTP2y/g==
Content-Type: multipart/signed;
 boundary=bf878dc077ebb1f1135359669f74c117a74de9e39e80d44933d5744a26aa;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Jun 2025 15:50:39 +0200
Message-Id: <DAPPHL6RPWWM.94C7P26AUCCN@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Olivier Benjamin" <olivier.benjamin@bootlin.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Fix the mipi port definition
 for RK3399
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-2-e54797ad2eba@bootlin.com>
In-Reply-To: <20250618-dtb_fixes-v1-2-e54797ad2eba@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_065056_390510_8BA93638 
X-CRM114-Status: GOOD (  18.45  )
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

--bf878dc077ebb1f1135359669f74c117a74de9e39e80d44933d5744a26aa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi (again),

On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
> The RK3399's MIPI DSI has 2 ports: in an out. The definition of
> the port property necessitates the value of #address-cells to be 1.
>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 5ebc380a24df86ba7172b0950b89cac56b61c507..5a7341fb6bcb0613af6f3ac31=
d99355a0f890e89 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -468,7 +468,7 @@ &mipi_dsi {
> =20
>  	ports {
>  		mipi_out: port@1 {
> -			#address-cells =3D <0>;
> +			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  			reg =3D <1>;
> =20

In rk3399-base.dtsi there is already a definition for mipi-in and
mipi-out. AFAICT what this change does is require a reg property on the
endpoint and I don't think that's correct.

It seems to me that all you need is a mipi_out_panel definition.
So what I came up with is this:

```sh
$ git diff
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/a=
rm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 04ba4c4565d0..b175aeed99e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -466,18 +466,6 @@ &mipi_dsi {
 	status =3D "okay";
 	clock-master;

-	ports {
-		mipi_out: port@1 {
-			#address-cells =3D <0>;
-			#size-cells =3D <0>;
-			reg =3D <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint =3D <&mipi_in_panel>;
-			};
-		};
-	};
-
 	panel@0 {
 		compatible =3D "hannstar,hsd060bhw4";
 		reg =3D <0>;
@@ -495,6 +483,12 @@ mipi_in_panel: endpoint {
 	};
 };

+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint =3D <&mipi_in_panel>;
+	};
+};
+
 &pmu_io_domains {
 	pmu1830-supply =3D <&vcc_1v8>;
 	status =3D "okay";
```

I don't have a PPP so I can't verify it, but ``make CHECK_DTBS=3Dy W=3D1
rockchip/rk3399-pinephone-pro.dtb`` no longer reports issues wrt
dsi@ff960000 (after I also fixed the panel compatible like in patch 1
and added a LCD1_RST pinctrl definition as indicated in my reply to
patch 3).

Cheers,
  Diederik

--bf878dc077ebb1f1135359669f74c117a74de9e39e80d44933d5744a26aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFLENQAKCRDXblvOeH7b
bv7jAP92BoaEAnzcznQlnluIJ5X4iWpd/HlBmdpadX6RnGY14wEAjkopAG+tNdwu
6H5yPB7qZUbPv1znf4zQjUKT3EQO3AM=
=DH21
-----END PGP SIGNATURE-----

--bf878dc077ebb1f1135359669f74c117a74de9e39e80d44933d5744a26aa--

