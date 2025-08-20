Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5CCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iroe3MCa2ZZaRY9jKe2399kPLRw8TL6vb7UDOEeV6xo=; b=zxeF9Lx/Y6XVuneqF3/IzctqFo
	J2KO7G4c+E4xH1yQUcdaonM8BzOtbzYH1NC+4vQ5hZMHKvhyTp1gU64oJpH9+Fc0qJff+PxP7nZSU
	FLfRA5vsgXFH9Sglyd3a22qjYVu5TGyYjyuAhhNN+Cq+hkmus+9o/95zUGa645r7LcAuQRPfuTBR0
	o5XCGdspx9GqprpJWlu9TzM4KYTmrNhTBuyafpvZnxbzbHXwUhgD8kjxU9iWhIMCDn0uhZ3Oxtim8
	bbPFyMqMefQicoxZrzdXCMzRD7J/y+PrvRNKGT7bc2ovToG5k6HHQIwtABu8b2iwk6kh3uOiralIV
	CmdL0Ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojYn-0000000DyV4-1PZN;
	Wed, 20 Aug 2025 14:13:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiqb-0000000DmQZ-3MgQ;
	Wed, 20 Aug 2025 13:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696443;
	bh=Iroe3MCa2ZZaRY9jKe2399kPLRw8TL6vb7UDOEeV6xo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BPhghfmM17dTR9tU6w/x7QCksTcLIMZmJe9nr6IPzIGw7KNbMFlwN7Vy7Ks4TWEdt
	 +dIh+4Rx64/VObgOsVABZr2GyQDDUTspGLOi7NkBPilc3dQxEETLl89DMf+h2l6v5O
	 iUpiW5Mm/T1gZtNkKllA9wBB+gAuH62JEyCpqmvebiHanOXdSoqw84/RxoPhMIg9nv
	 uIiJhWmnNENJCXvDzCPPw+kJDZz7w3VJoo92oHfL4/AisZfUB6tzoouFMo9wK0m+FL
	 OR6rdIAdm1MFOn6jbjmF/kE6YGuhwXO2+lDjzbqxer5YqNL9MhikIrkrnIH5PkJb0A
	 xaCNRtP8+0pcw==
Received: from localhost-live.home (2a01cb0892f2d600C8f85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D12717E01F5;
	Wed, 20 Aug 2025 15:27:22 +0200 (CEST)
Message-ID: <124e3fbe79660eac9d529b127d888ce6942ba346.camel@collabora.com>
Subject: Re: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
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
Date: Wed, 20 Aug 2025 15:27:21 +0200
In-Reply-To: <ab97489a-9493-4005-9a1a-9f88ad970b05@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
	 <ab97489a-9493-4005-9a1a-9f88ad970b05@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_062725_991896_3A643E4F 
X-CRM114-Status: GOOD (  13.44  )
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
> > The mt8183-mfgcfg node uses a power domain in its device tree node.
> > To prevent schema validation warnings, add the optional `power-domains`
> > property to the binding schema for mediatek syscon clocks.
> >=20
> > Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains p=
roperty to mfgcfg")
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
>=20
> Is MT8183 the only one?
>=20
> if:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek,mt8183=
-mfgcfg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^(if it's not just=
 mt8183, this should be an enum)
>=20
> then:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 power-domains: true
> else:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 power-domains: false
>=20
> (check if the above is correct, don't blindly trust what I wrote! :P)
>=20
>=20
Verified on my side 'mediatek,mt8183-mfgcfg' is the only one with a power-d=
omain
property.
I will add the if/else and disable the power-domains property for other com=
patible
as suggested.

>=20
> after which:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> (if it's not only mt8183, keep the R-b on this commit regardless)
Thanks,

Julien

