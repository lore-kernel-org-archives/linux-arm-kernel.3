Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C804CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGBjb/TgAhfgPZi5I5T6fapGmQkRehVI7gSw2DickvQ=; b=tNYOyp6rT4mLiMeqz6Zmm+L6bG
	YM4rJVzBJxi5vsLUlD1UycHfHleDUSUUjMHkqzZp2c/qAao5WKSuMKXNuTzs3zPmGni6Zb1qeQk9r
	1avcqMXok5J3piDmfnDX3ZjgpaVZKqcPt37lry2WdKXLaTPkwmePpcSgDcXp1C03S9zszro8S9cYi
	GPnFDYGJKf0WQc7DpIzlcl6NY4Zl5PcdlIDn3ByEWQUK9u8D+K77vs/O6RcnY0fHLUNmj2xmz7WpC
	O6YDNgk8GEBJUmauchU1Uk3rg90ZGGuUjq0kGNYs9AwI4tyitgEqn+GxJLT+8IWVKglx58a4pkXRQ
	lozInoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojj7-0000000E1uf-0a7R;
	Wed, 20 Aug 2025 14:23:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoitS-0000000DnHg-1VmU;
	Wed, 20 Aug 2025 13:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696620;
	bh=EGBjb/TgAhfgPZi5I5T6fapGmQkRehVI7gSw2DickvQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IRLqJa+OmrNlzDzXfK+Ji+kDy9yuppw3uqBAL7w5tIxnpR4smT1h+4n3lcmimmqSg
	 mE4NoORV2/3zqNaIajI6VNA69du0SUvkw/i/wggnupZOp/M5ge5YYt+ciFpxREfwJ9
	 OJtcdMFYr7wS7HgqvKVrkm5l1yPgawgent7Xt1OMVdW46z7/iVS0F5aJdgCGP/al/D
	 pzqi5Mx0UQ0XkGyf8YPhTCgtULkb/jK6U0igXJaNTgAurEqaI4Yh3sWFA5Hml23awp
	 QceS6BTaTSRxl7Wbs17lsZXDKBLLnDibhfxh3OkbymI5p/YUOl4p0d4kW1UVWYOIYi
	 UgQfdfsGMI++Q==
Received: from localhost-live.home (2a01cb0892f2d600C8F85CF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C79B717E01F5;
	Wed, 20 Aug 2025 15:30:19 +0200 (CEST)
Message-ID: <3967c5d8df7f72bae859ebc07ce035b1978c12dd.camel@collabora.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Weiyi Lu	 <weiyi.lu@mediatek.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>,  Sean Wang
 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:30:19 +0200
In-Reply-To: <7c0433be-1008-4d6e-9672-b1908383e162@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
	 <7c0433be-1008-4d6e-9672-b1908383e162@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_063022_543981_3B2BEF86 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Angelo,

On Mon, 2025-08-04 at 09:59 +0200, AngeloGioacchino Del Regno wrote:
> Il 01/08/25 13:18, Julien Massot ha scritto:
> > Update the mediatek,audsys binding to support the mt8183-audiosys
> > compatible, which uses a different audio controller binding
> > (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0 .../bindings/arm/mediatek/mediatek,audsys.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++++++++++++++-
> > =C2=A0 1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,au=
dsys.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> > index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411=
c5632ae6663d15f29 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.ya=
ml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt7622-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8167-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8173-audsys
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - mediatek,mt8183-audiosys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8183-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8186-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8192-audsys
> > @@ -41,7 +42,6 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: 1
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0 audio-controller:
> > -=C2=A0=C2=A0=C2=A0 $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: object
> > =C2=A0=20
> > =C2=A0 required:
> > @@ -50,6 +50,21 @@ required:
> > =C2=A0=20
> > =C2=A0 additionalProperties: false
> > =C2=A0=20
> > +allOf:
>=20
> I think you can do it without the allOf here as well.
>=20
> if:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains...
> then:
> =C2=A0=C2=A0 properties
> =C2=A0=C2=A0=C2=A0=C2=A0 ...
> else:
> =C2=A0 ... etc
>=20
> after which
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Indeed allOf is not needed here, will be fixed in v2 and will add your R-B.

Regards,
Julien

