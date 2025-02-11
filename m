Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF78C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO7X7qZVsW+G0MiLmhSCzhRDY0YQ1kOhBbsoR4z5aYU=; b=Hn3zvm+tUZ31mpUMv2N7cuHNrA
	s6WYCapawSxSpln6aY3EjHD/USfVvsA65Q5v6zPvN19ob2lupUBg0vkIoix31nFndJg8NeumPLS7K
	Jfjt/tPcSX2PEZM2rfm+qpK76ntF933OjUQOW6nOa1Dh5IKO1xerrmkS7HRVbmo7EFVofTairErTF
	lcTsapd316FqWHTxywc5UGAXz6YcJKwdzL5AA0uVEXkBt3RZIC119wj+c/1XKHLUz6vasAKbYWSLL
	ZB1fuHX/A5EngiXEpJNAk4ksYMspV/waJkg90CGgCLZM8j4gQ0ag+1MKrmTzD36UWRHAbaqS0qd3J
	NZKMoJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvet-00000004xgN-1ysm;
	Tue, 11 Feb 2025 19:10:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuSt-00000004lMT-2WuU;
	Tue, 11 Feb 2025 17:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EC1A5C4D73;
	Tue, 11 Feb 2025 17:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9EFC4CEDD;
	Tue, 11 Feb 2025 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739296470;
	bh=5rmXpuduF/u7vqhQmmIvfQ9KEO3o9/3YAw2HM+4dEfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORhJUFZuBi0N/fPSErbN9tgZDcMqiiMEWc8jMASSf5bjnb+MMeuds7a6jGNEcLpk1
	 4ZZy56likvWzUXQrRuDm7xfiDnlgPPPjlMe5H/2/3j0bUv5Jtkjbg1Fa9MS/JSPKEj
	 C+hjYgi5+su6mDQ2CYkSJesdNFN6voFWjzB2g/aIeRE+OfNyoKIR+i/ott4QcWqv+6
	 izjSSQsj3zf7GkboFlt9TAvozOz28BCmvnNtzQkOO06V2yBxy67pEhHLpYdGl9mrMP
	 hAOF3m/bjUY/FprmIAWE9ca/FCFORT7c7UDSqnjsmEygzMwl685ICS+pnFvLRdiM2N
	 aPBYMjgXHTRxg==
Date: Tue, 11 Feb 2025 17:54:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen <sunny.shen@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	"Paul Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Message-ID: <20250211-feed-shed-4b32f146cc54@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TeColmbo9d48spU6"
Content-Disposition: inline
In-Reply-To: <20250211025317.399534-2-sunny.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_095431_730123_3E5F2F45 
X-CRM114-Status: GOOD (  17.62  )
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


--TeColmbo9d48spU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:52:50AM +0800, Sunny Shen wrote:
> Add MDP-RSZ hardware description for MediaTek MT8196 SoC
>=20
> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rsz.yaml    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,mdp-rsz.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mdp-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mdp-rsz.yaml
> new file mode 100644
> index 000000000000..6642b9aa651a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz=
=2Eyaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rsz.yam=
l#

Filename matching compatible please

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek display multimedia data path resizer
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  MediaTek display multimedia data path resizer, namely MDP-RSZ,
> +  can do scaling up/down to the picture.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-mdp-rsz
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MDP-RSZ Clock

This can just be "maxItems: 1"

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        disp_mdp_rsz0: disp-mdp-rsz0@321a0000 {

And "disp-mdp-rsz0" isn't anything close to a generic node name.

> +            compatible =3D "mediatek,mt8196-disp-mdp-rsz";
> +            reg =3D <0 0x321a0000 0 0x1000>;
> +            clocks =3D <&dispsys_config_clk 101>;

Surprised there are so few properties, no ports link or anything like
that?

> +        };
> +    };
> --=20
> 2.34.1
>=20

--TeColmbo9d48spU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uO0AAKCRB4tDGHoIJi
0sY+AQC0Vco77whZIp3/tgk1bNN+9gXooiLJUhwGAHf4Gg/oTwD+OPXyvK0GT0dj
g+jzc91WFWTOwC/l9B6XKr8nX2rgSQI=
=EAWO
-----END PGP SIGNATURE-----

--TeColmbo9d48spU6--

