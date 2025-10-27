Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8E4CCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPNgQd3tvN+U16PQSse1qazzinVkbj5D7r4jyYJwpDQ=; b=Lx7gpq3IzUHL0ZZdytP7oGk7x1
	3jTwkv5OD8Xcpz7xxsnN/PnUQ4tgePbirTt0vqiXun9yklfEnh8s4UOCLphLbKSVq4uclD8wknHOP
	toogT2y+5XH6+A7Q0b9OFo0tpKkV8EGjpec3POk4WLyrGkP2dQUIn/GTziY9UecPKVe+YxmTplgY3
	JCdxOeZYOiSuaR6asmWJRaDrfsvDQ/2i+21bejRoIM8cgf3Bx58+Ph0IEwizJRLeF/xJZJ3THQ5lR
	s4vszP01jn2hMdD4x7JDupjSgLw/A0x3VmEhL+E1ATi0OBq9S0iCIpzuVDzwxCVAuX5IfrDVUYLHo
	+7fILnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQNL-0000000EMRR-3Nhb;
	Mon, 27 Oct 2025 16:47:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQNK-0000000EMQp-2fLs;
	Mon, 27 Oct 2025 16:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B3346041B;
	Mon, 27 Oct 2025 16:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CE3C113D0;
	Mon, 27 Oct 2025 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583637;
	bh=32yOyFVynkfVIvnGVgJ92i0Ip1krG1hpIICP4cn0SOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIRBPzybk9NCdARzw23obr4pZMzwR/6XNdofj1qMoexG/4DU8IIk2+PM8X5IDn/gG
	 /y1QthXqj9X6dblAsvAyIqeUiVOMpdrDk5BKx96RXacgKJFftP5+Z13HaYlb04F6gq
	 SrY6R7NHuQFVjki4d6xx9Wy63ZuftiRH6jf5zyzitCSlTM24JBfK9VMx58eDCqgeEb
	 odSzeccOojfaQ6ZC5gt0zyFnw20uNcDtwcX1cA3ifbaBMmhHwEa5G4hymHgg4yLhdk
	 2hNg51IkIJRIObKlWkpVtrQwI0MckKkOLBzJJR5Vw9swl3jZwaB3lIPodHTno/fNvH
	 B/GM2H8mSaPyw==
Date: Mon, 27 Oct 2025 16:47:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
	heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com, finley.xiao@rock-chips.com
Subject: Re: [PATCH v5 6/7] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251027-await-wound-0aee2d20e0a3@spud>
References: <20251027084147.4148739-1-zhangqing@rock-chips.com>
 <20251027084147.4148739-7-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eSWQ1Ctgvp2pmYfz"
Content-Disposition: inline
In-Reply-To: <20251027084147.4148739-7-zhangqing@rock-chips.com>
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


--eSWQ1Ctgvp2pmYfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 04:41:46PM +0800, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  51 ++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 547 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk35=
06-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> new file mode 100644
> index 000000000000..ecb5fa497747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3506-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3506 Clock and Reset Unit (CRU)
> +
> +maintainers:
> +  - Finley Xiao <finley.xiao@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |
> +  The RK3506 CRU generates the clock and also implements reset for SoC
> +  peripherals.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3506-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1

Can you explain somewhere why the input clock is not required?
Feels like it really should be required, if it is what the output clocks
are generated from, but I can also see why it might be optional either.
pw-bot: changes-requested

> +
> +  clock-names:
> +    const: xin24m
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"

--eSWQ1Ctgvp2pmYfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP+iDwAKCRB4tDGHoIJi
0o54AP98UXzeSXPMJY9coqV6N4MEVJH9zwk04uZhVRES8i7hMgEAysyNVT4D/cF6
jLYYWNYeQbkblle37SMJSItJT554Rgc=
=vAfi
-----END PGP SIGNATURE-----

--eSWQ1Ctgvp2pmYfz--

