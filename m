Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80B5CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6UbRsIWobStO4PauFCCdk0cwD0xE2xs+6mdgAfQ94A=; b=jCbIjr5C6LciyoqVoiWzMJMLsP
	At3hupRq99cXANbTdElc+ib/czYj+L3sKrA3zqahViSvVvJLKrAYqNLM1jm1pyLdNa6FiTEntVGEt
	mzjFMg0u57LbMZJ2ed+bc0KFSRwV3SLY8cEY8CyDaI7uJwaamCPP74wOfS1sahQVKoTgrM0qiCcqm
	+n0hMZ++jWxAxDwcc8jspi6SltZA+Ln1Fwsm/3SYDMnmoaTf1tMH1ypDrllI39ncWDr0iiK2RAZQN
	x/KKrK0EeE9btIIab3HvD3vKmB6sN2pNP6AaXBWaJd/JK5UaasuwB3eMPcvJZEDCOfxICu3xLGZf7
	WcU3hy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAteg-0000000EU9V-2JFj;
	Mon, 20 Oct 2025 17:26:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAted-0000000EU8R-2oH8;
	Mon, 20 Oct 2025 17:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2207844F79;
	Mon, 20 Oct 2025 17:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56787C4CEF9;
	Mon, 20 Oct 2025 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981195;
	bh=aMGWLdDm/gNeBxI6lcRh8r6af68Cspylr2/fbbMhzzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFc3d0W6O1ecq4SpW/YELQ+ZTpJ6BDbEAELpWrAyCHHA/TU0K1whNjA3Db5jUWU4y
	 F6pLQ88HLiWuWMRxWOABwNdFPFv20JHMpjZBXlVa+MlS1lvxbJE+3gekxg7B/Elv3/
	 6/h3xO/j15SU3bEshUj0kpt+NIbADUDluHa6HGFdFZYois6CndRsydgdKPjnaRdKvj
	 VOKLNbDjXK4kYCOjir9t+HmAuZGlsWV190qnL/SAzTSX87lOgCfjWohb9gapNOe9K3
	 TkzXWPMkbXIKrmqiurxsBgekDr4pSuHt0qfUYfOAjwds+vEpeEtMAvXaTnf+nczdGa
	 qbFM/JH1ch5NQ==
Date: Mon, 20 Oct 2025 18:26:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
	heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Add support for rockchip
 pvtpll
Message-ID: <20251020-dose-treason-2a0ac50c6bb4@spud>
References: <20251020023724.2723372-1-zhangqing@rock-chips.com>
 <20251020023724.2723372-5-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ryBOeWKUiYWTAeKK"
Content-Disposition: inline
In-Reply-To: <20251020023724.2723372-5-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_102643_760661_93B013E6 
X-CRM114-Status: GOOD (  16.79  )
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


--ryBOeWKUiYWTAeKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 10:37:23AM +0800, Elaine Zhang wrote:
> Add pvtpll documentation for rockchip.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,clk-pvtpll.yaml   | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-=
pvtpll.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> new file mode 100644
> index 000000000000..8be34bcde7b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Pvtpll
> +
> +maintainers:
> +  - Elaine Zhang <zhangqing@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rockchip,rv1103b-core-pvtpll
> +          - rockchip,rv1103b-enc-pvtpll
> +          - rockchip,rv1103b-isp-pvtpll
> +          - rockchip,rv1103b-npu-pvtpll
> +          - rockchip,rv1126b-core-pvtpll
> +          - rockchip,rv1126b-isp-pvtpll
> +          - rockchip,rv1126b-enc-pvtpll
> +          - rockchip,rv1126b-aisp-pvtpll
> +          - rockchip,rv1126b-npu-pvtpll
> +          - rockchip,rk3506-core-pvtpll
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  rockchip,cru:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the main Clock and Reset Unit (CRU) controller.
> +      Required for PVTPLLs that need to interact with the main CRU
> +      for clock management operations.
> +

> +required:
> +  - "#clock-cells"
> +  - compatible
> +  - reg
> +  - clock-output-names

Please follow the property definition order here.
pw-bot: changes-requested

--ryBOeWKUiYWTAeKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZwxgAKCRB4tDGHoIJi
0lTjAP9DBWIql0smcCTv41AISicEcx32++9dYLGuZP2GnfVVvwEAqq9+B9akz4PS
l2ntUaeyTNhVEinlaBiupteZ3Yz4aA4=
=wj6X
-----END PGP SIGNATURE-----

--ryBOeWKUiYWTAeKK--

