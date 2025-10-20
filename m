Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5065DCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrvMr7onL6jzQpj+avk40S5Ws4+HMzbExPEA1Fgy5Bs=; b=AiC0f2RQZ+Juo0qnL46USaJOyA
	ZtusA9Nb6p5KfNs/bjLX4JuyPDtXCdRy87eYHGajO+5eQaWcEp9LSJMqfADH1o3yg22vyLW1RjyAN
	R58lCIpeIh97aerXEMVD/IgF4h2QK0UzuEulqUHASX9qOG5jpK+b+r66pAGZbTEA2347pkHHZxoCu
	0K/Yk9deQ6IyCzsV3RXymQgYrqoP6Mja08gxuLuHWWoe7n8Xa37sMjSJY4NYbLq8DYvEaREnNtiWi
	HqXxEvuHxeOyjHEozX5TcXnMEEduCEnuH6C8Yf2xMQARq2QLSea7HG8nA8iw8qFeV5QE6fKPQFBLG
	7LEefJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtdZ-0000000ETyF-3pjB;
	Mon, 20 Oct 2025 17:25:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtdZ-0000000ETy3-0nKi;
	Mon, 20 Oct 2025 17:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D32E462053;
	Mon, 20 Oct 2025 17:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB16C4CEF9;
	Mon, 20 Oct 2025 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981132;
	bh=DuBiH9luvdFsYtFQDPaPHiGDRbY0ctxFlHUj5m7vjTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvFaRQws7bdXPnuSz/e9AOAPBP5vBrh4radRk3rQm+sefnQSGzRu3/alDZVhArAuJ
	 yqau7dOASZUNWselQ2tzgdz4BRYTmRsG8tR34AwICJaEHX/Ykdo+soiQJHDc9WUUwM
	 xKHW8fopijbL08IfGG3DQhUlvUTxbYi6nZgJi6g2Ws4TRclTKbt4NnZ0lVHp3C+uwV
	 rrZawovEREr+Y7GLeuGXQ8DGukbkIklwlmxAm81VJojIA/ghY/D5EDKX1U8ayM6JbW
	 s5k3AJECYx/FbjGxyKs8GhBxmxq0VEKeLzCE27bSgT5pFwyTF7O5Urv8HCQwB6SnKM
	 78qcZBhgNad0g==
Date: Mon, 20 Oct 2025 18:25:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
	sboyd@kernel.org, sugar.zhang@rock-chips.com, heiko@sntech.de,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Add support for rockchip
 pvtpll
Message-ID: <20251020-pureness-portion-61cef49b6042@spud>
References: <20251020023724.2723372-1-zhangqing@rock-chips.com>
 <20251020023724.2723372-5-zhangqing@rock-chips.com>
 <DDN1RQB4LG0X.30F0A3IMJ4YI4@cknow-tech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zDbktCb2H3iO4Q0A"
Content-Disposition: inline
In-Reply-To: <DDN1RQB4LG0X.30F0A3IMJ4YI4@cknow-tech.com>
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


--zDbktCb2H3iO4Q0A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:38:02AM +0200, Diederik de Haas wrote:
> On Mon Oct 20, 2025 at 4:37 AM CEST, Elaine Zhang wrote:
> > Add pvtpll documentation for rockchip.
> >
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > ---
> >  .../bindings/clock/rockchip,clk-pvtpll.yaml   | 100 ++++++++++++++++++
> >  1 file changed, 100 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,cl=
k-pvtpll.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpl=
l.yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> > new file mode 100644
>=20
> Should this file have the 'clk-' part in its name?
> In a way this is different from the other DT binding files, but none of
> the others have the 'clk-' part in their file name:

Normally we would ask for a filename matching the compatible, which IIRC
is what these -cru ones are doing.

>=20
> me@pc:~/linux/Documentation/devicetree/bindings/clock$ ls -lh rockchip,*
> -rw-rw-r-- 1 me me 2,9K okt 20 11:32 rockchip,px30-cru.yaml
> -rw-rw-r-- 1 me me 1,9K okt 20 11:32 rockchip,rk3036-cru.yaml
> -rw-rw-r-- 1 me me 1,8K okt 20 11:32 rockchip,rk3128-cru.yaml
> -rw-rw-r-- 1 me me 2,3K okt 20 11:32 rockchip,rk3188-cru.yaml
> -rw-rw-r-- 1 me me 2,1K okt 20 11:32 rockchip,rk3228-cru.yaml
> -rw-rw-r-- 1 me me 2,6K okt 20 11:32 rockchip,rk3288-cru.yaml
> -rw-rw-r-- 1 me me 2,2K okt 20 11:32 rockchip,rk3308-cru.yaml
> -rw-rw-r-- 1 me me 2,1K okt 20 11:32 rockchip,rk3328-cru.yaml
> -rw-rw-r-- 1 me me 2,4K okt 20 11:32 rockchip,rk3368-cru.yaml
> -rw-rw-r-- 1 me me 2,5K okt 20 11:32 rockchip,rk3399-cru.yaml
> -rw-rw-r-- 1 me me 1,5K okt 20 11:32 rockchip,rk3528-cru.yaml
> -rw-rw-r-- 1 me me 1,1K okt 20 11:32 rockchip,rk3562-cru.yaml
> -rw-rw-r-- 1 me me 1,8K okt 20 11:32 rockchip,rk3568-cru.yaml
> -rw-rw-r-- 1 me me 1,2K okt 20 11:32 rockchip,rk3576-cru.yaml
> -rw-rw-r-- 1 me me 1,6K okt 20 11:32 rockchip,rk3588-cru.yaml
> -rw-rw-r-- 1 me me 2,2K okt 20 11:32 rockchip,rv1108-cru.yaml
> -rw-rw-r-- 1 me me 1,3K okt 20 11:32 rockchip,rv1126-cru.yaml
>=20
> > index 000000000000..8be34bcde7b0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> > @@ -0,0 +1,100 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip Pvtpll
> > +
> > +maintainers:
> > +  - Elaine Zhang <zhangqing@rock-chips.com>
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - rockchip,rv1103b-core-pvtpll
> > +          - rockchip,rv1103b-enc-pvtpll
> > +          - rockchip,rv1103b-isp-pvtpll
> > +          - rockchip,rv1103b-npu-pvtpll
> > +          - rockchip,rv1126b-core-pvtpll
> > +          - rockchip,rv1126b-isp-pvtpll
> > +          - rockchip,rv1126b-enc-pvtpll
> > +          - rockchip,rv1126b-aisp-pvtpll
> > +          - rockchip,rv1126b-npu-pvtpll
> > +          - rockchip,rk3506-core-pvtpll
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-output-names:
> > +    maxItems: 1
> > +
> > +  rockchip,cru:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Phandle to the main Clock and Reset Unit (CRU) controller.
> > +      Required for PVTPLLs that need to interact with the main CRU
> > +      for clock management operations.
> > +
> > +required:
> > +  - "#clock-cells"
> > +  - compatible
> > +  - reg
> > +  - clock-output-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pvtpll_core: pvtpll-core@20480000 {

Additionally, none of the labels are being used and should be removed.
"pvtpll-anything" is also not a generic node name, so those should get
changed too.

> > +      compatible =3D "rockchip,rv1126b-core-pvtpll", "syscon";
> > +      reg =3D <0x20480000 0x100>;
> > +      #clock-cells =3D <0>;
> > +      clock-output-names =3D "clk_core_pvtpll";
> > +    };
> > +
> > +  - |
> > +    pvtpll_isp: pvtpll-isp@21c60000 {
> > +      compatible =3D "rockchip,rv1126b-isp-pvtpll", "syscon";
> > +      reg =3D <0x21c60000 0x100>;
> > +      rockchip,cru =3D <&cru>;
> > +      #clock-cells =3D <0>;
> > +      clock-output-names =3D "clk_isp_pvtpll";
> > +    };
> > +
> > +  - |
> > +    pvtpll_enc: pvtpll-enc@21f00000 {
> > +      compatible =3D "rockchip,rv1126b-enc-pvtpll", "syscon";
> > +      reg =3D <0x21f00000 0x100>;
> > +      #clock-cells =3D <0>;
> > +      clock-output-names =3D "clk_vepu_pvtpll";
> > +    };
> > +
> > +  - |
> > +    pvtpll_aisp: pvtpll-aisp@21fc0000 {
> > +      compatible =3D "rockchip,rv1126b-aisp-pvtpll", "syscon";
> > +      reg =3D <0x21fc0000 0x100>;
> > +      rockchip,cru =3D <&cru>;
> > +      #clock-cells =3D <0>;
> > +      clock-output-names =3D "clk_vcp_pvtpll";
> > +    };
> > +
> > +  - |
> > +    pvtpll_npu: pvtpll-npu@22080000 {
> > +      compatible =3D "rockchip,rv1126b-npu-pvtpll", "syscon";
> > +      reg =3D <0x22080000 0x100>;
> > +      rockchip,cru =3D <&cru>;
> > +      #clock-cells =3D <0>;
> > +      clock-output-names =3D "clk_npu_pvtpll";
>=20
> rockchip,cru line as the last line?
>=20
> Cheers,
>   Diederik
>=20
> > +    };
> > +
> > +...
>=20

--zDbktCb2H3iO4Q0A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZwhwAKCRB4tDGHoIJi
0iLPAP94ZMFR0xuWCqtCuslKikrX4Ilvj42EKuYV0Wo1K3G3xgEA6RkNCbvO3yRX
ZW3mmydndwZgdwfiMuW03QLeH0FEnwI=
=Kr3S
-----END PGP SIGNATURE-----

--zDbktCb2H3iO4Q0A--

