Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6821F43832
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWOiUybQl33wCXjqyih6ysFG7CN7KK9uvB2QlyuzVtE=; b=bN1f7BJf2poFnNeFNo3cOJ9Kg9
	sWrDhyEd6mkW3Vx/qUwjslq0eI3QNIoQQQShXo6lRW9uMste0GDYmgcc7Kkf/IosorhjMIoCNILbB
	w9NdhDBSlBRR/B16EJsm0EBh7PST/uXtbvtxbM05kGPxrNNKkAWIAW8zjjWVB/4ntJFWhlcCVSpq6
	FSvwVklhZOOmURGVBHcI8H79Bkh70MfEMYFsUdwEFTj/B8ZU07GLz8L3xs6eXmnDDveYIktGZcCE9
	UHOs80qQGaaf/6C/cfRvrLl5QulUO4Kj58EU+GMTFCD3lyh6mIcLP4jX39qnnHIJr+OAp/wdzc52T
	SROG9Ghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1tS-00000001I4c-3m6X;
	Wed, 15 Apr 2026 15:11:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1tQ-00000001I47-3kPX;
	Wed, 15 Apr 2026 15:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6262408A2;
	Wed, 15 Apr 2026 15:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506AEC19424;
	Wed, 15 Apr 2026 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776265863;
	bh=+oW66S9iTPf+DjWP4/3R62ZAPXefkeA/w7M50i/1pCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAEkVqHWfZJO/HGwHZI8JT6iF29PV9+Ol8j6ILWF/U2h4+77GUgsJHHX4dpgw1KKb
	 wdXI3YROj3dA7OvFI9dRIQOSkgb1BzQ7vqumiY+/ms0a3405vOULDU9khzIPmRzB2t
	 2GCtac8RMMIRn09eW7k8wgh1wKiorozpYxwRultaEcUC0FBvkxkhknSHR7rP5uoFr/
	 ZjCWd5roEDrNm5+woZweYER1dLjdzVeV2l+QIu/1Es1nd46xXg+wvskjXkU6vjdzgN
	 YdzZgVJM2a4vd3slRaSmV5VI6jsNHwAAIsleablQBVcE9ccw68XffwhJAmmCNoXKTS
	 TmBFrdpcKoY9w==
Date: Wed, 15 Apr 2026 16:10:59 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: amlogic: clk-measure: Add A1
 and T7 compatible
Message-ID: <20260415-clerk-juggle-986fc332451a@spud>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-1-02b6314427e6@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S2RzMzVYXQiNue92"
Content-Disposition: inline
In-Reply-To: <20260415-clkmsr_a1_t7-v2-1-02b6314427e6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_081104_972054_1AC200D1 
X-CRM114-Status: GOOD (  13.91  )
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


--S2RzMzVYXQiNue92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 04:33:41PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
>=20
> Add the Amlogic A1 and T7 compatible for the clk-measurer IP.
>=20
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

In the future, please note why fallback compatibles are not suitable in
patches like this.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml   =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-=
gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic=
,meson-gx-clk-measure.yaml
> index 39d4637c2d08..b1200e6940ac 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-=
measure.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-=
measure.yaml
> @@ -24,6 +24,8 @@ properties:
>        - amlogic,meson-sm1-clk-measure
>        - amlogic,c3-clk-measure
>        - amlogic,s4-clk-measure
> +      - amlogic,a1-clk-measure
> +      - amlogic,t7-clk-measure
> =20
>    reg:
>      maxItems: 1
>=20
> --=20
> 2.47.1
>=20
>=20

--S2RzMzVYXQiNue92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+qggAKCRB4tDGHoIJi
0rm9AQDRmlygY1FIas9dunBFzqaN1S0RjyEx3WgzWgAJHA+UQAD/RuOZzIqvbtOj
rv/4/XvbxNUIPH2QkKG9Sy+ZPQwHKwo=
=n0nL
-----END PGP SIGNATURE-----

--S2RzMzVYXQiNue92--

