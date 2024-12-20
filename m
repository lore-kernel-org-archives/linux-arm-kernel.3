Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C794E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm44ygNWKYGV3y3H0K5cP9+tVucODkBUA9S2/w7YdGY=; b=aBvTl87kqRMaxGoC2GjKMjQKs7
	I066MT3suxo3yVb3Ziltap2+UxZyMhLJ9HAvuxJsqqinZKI3XxiFxumTfbPSrX1gzgeUDCxCrhRZT
	oDximmHMWFDu6rBFWOCw33iqY+wGvw2v7xRik7kxh0bS6dGjvS/IfMKy9OCY7JwJ/SeRKpr5UvtDB
	dpYv+YLLFXZ33/UrPpqoRBJKnj4aIxa01R8rvX7H7V07KqFg7UdH0iTDDbn0JtbtiMUqZBijpsxik
	nQoUnUMFc2MUp9JtpEG6VGtQZWCtDwwUi4S//0aDQJWQFg0PFo2k/iDWfF1M4HB3/6jLr/AUN2FJV
	cgM/5gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOee1-00000005HIp-3yyv;
	Fri, 20 Dec 2024 15:10:25 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOecs-00000005HBi-0i1L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:09:15 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1734707351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gm44ygNWKYGV3y3H0K5cP9+tVucODkBUA9S2/w7YdGY=;
	b=k4BoEQlhF80JQvT9EVpsHHjC3QnjsslMmbUrZCINO1D/ViREoOPDIXdDwFlQWpvl8TXAr4
	hnbAW+Q76wFQwcxFDE4cAHH410sLSpomHPQMrkrnX9x7UsFPralB9PTiSt5GXQQOWu720k
	GHgOPSVRwzHD59jKadxldU9LjsjTqW3XuaiqKT36PcWqkMKF6+/775Q9N7KTe4EGRHSiSR
	o4qsvetBgAHiuwUkYDU+2V5iDyUW/xIrreW71DnJFPIuORMc8r9ARntJ801enlJeTHFpMK
	Qp4xCa1UBu4+utcjzsoD4Rr9A3bnzWi0ImeVwejSf3dTJpNG1bVqLCrNa9zW7Q==
Content-Type: multipart/signed;
 boundary=ff7edc69d668878bbf70c9d85970dba51d02cb40c816591ed056f064a903;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 20 Dec 2024 16:08:54 +0100
Message-Id: <D6GMFFSALGMQ.3GQ1PUD6L2TV8@cknow.org>
Cc: <linux-rockchip@lists.infradead.org>, "Conor Dooley"
 <conor.dooley@microchip.com>, <devicetree@vger.kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Chris Morgan" <macromorgan@hotmail.com>, "Rob
 Herring" <robh@kernel.org>, "Dragan Simic" <dsimic@manjaro.org>, "Jonas
 Karlman" <jonas@kwiboo.se>, <linux-kernel@vger.kernel.org>, "Tim Lunn"
 <tim@feathertop.org>, <linux-arm-kernel@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, "Andy Yan" <andyshrk@163.com>
Subject: Re: [PATCH v2 5/7] dt-bindings: arm: rockchip: Sort for rk3568 evb
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Kever Yang" <kever.yang@rock-chips.com>, <heiko@sntech.de>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
 <20241220101551.3505917-6-kever.yang@rock-chips.com>
In-Reply-To: <20241220101551.3505917-6-kever.yang@rock-chips.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_070914_492361_B725DB49 
X-CRM114-Status: GOOD (  13.30  )
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

--ff7edc69d668878bbf70c9d85970dba51d02cb40c816591ed056f064a903
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kever,

On Fri Dec 20, 2024 at 11:15 AM CET, Kever Yang wrote:
> The info for rk3568 should before rk3588.

Indeed, so thanks for this patch.

> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>
> Changes in v2:
> - collect acked-by tag
>
>  .../devicetree/bindings/arm/rockchip.yaml     | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 753199a12923..45ee4bf7c80c 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1006,6 +1006,16 @@ properties:
>            - const: rockchip,rk3399-sapphire-excavator
>            - const: rockchip,rk3399
> =20
> +      - description: Rockchip RK3566 BOX Evaluation Demo board
> +        items:
> +          - const: rockchip,rk3566-box-demo
> +          - const: rockchip,rk3566
> +
> +      - description: Rockchip RK3568 Evaluation board
> +        items:
> +          - const: rockchip,rk3568-evb1-v10
> +          - const: rockchip,rk3568
> +
>        - description: Rockchip RK3588 Evaluation board
>          items:
>            - const: rockchip,rk3588-evb1-v10
> @@ -1099,16 +1109,6 @@ properties:
>            - const: zkmagic,a95x-z2
>            - const: rockchip,rk3318
> =20
> -      - description: Rockchip RK3566 BOX Evaluation Demo board
> -        items:
> -          - const: rockchip,rk3566-box-demo
> -          - const: rockchip,rk3566
> -
> -      - description: Rockchip RK3568 Evaluation board
> -        items:
> -          - const: rockchip,rk3568-evb1-v10
> -          - const: rockchip,rk3568
> -

While you're fixing the sorting order of these 2 Rockchip items, it
would be great if "Sinovoip RK3308 Banana Pi P2 Pro", "Sinovoip RK3568
Banana Pi R2 Pro" and "Sonoff iHost Smart Home Hub" could also be moved
into their correctly sorted position. A quick scan seems to indicate
that all the other items are properly sorted.

Cheers,
  Diederik

>        - description: Sinovoip RK3308 Banana Pi P2 Pro
>          items:
>            - const: sinovoip,rk3308-bpi-p2pro


--ff7edc69d668878bbf70c9d85970dba51d02cb40c816591ed056f064a903
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ2WIiwAKCRDXblvOeH7b
bqZ5APwIJeBqivJAoI+z5FAYCygHTE4cPqOTLgVXZsDKbn+9CAD/a4R1bix8rmQU
e0oW+cSo6l5s0PpVOtlvPgfgKc/bbA4=
=P0sf
-----END PGP SIGNATURE-----

--ff7edc69d668878bbf70c9d85970dba51d02cb40c816591ed056f064a903--

