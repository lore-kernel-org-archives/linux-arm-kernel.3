Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715D6CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXpFBvl/G9TdM58J/HqLeuWhK7n8weJPpEkm2tmgU/s=; b=wVZsnAF1zSRHX40KyRBX8eg2L1
	MGhcYhtKslByqRYgwZLcydGkU5Xk/3KkFXe75RQOFJyx9pXzfE1m4Fzqh4BcQhvDEIBC0efM/oGru
	nvPcBA/ObHEcn3v+m4FysSGEqNU3pSIP/SDQWf2RJYR1g9Awd3g1Df/uYxWJa/o/7UG0mgBNfaHLW
	kLFKWtlgD0QWGPFc7JlFJW+NYRFWKiKoJz31gBPB00ZFHlmjxKmlV4Hh+uJr5gZX8p1MfYFNgFaEL
	1EP39a3S8vgBr5QZY5SRgEKHZnZRt3b4R6UwOeL32febxS4r+WYgCxtYjztYLDUedmMbbq+EL+Y9A
	5GQTCwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqapY-00000008oAI-302i;
	Mon, 25 Aug 2025 17:18:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZhL-00000008cA2-2dxG;
	Mon, 25 Aug 2025 16:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137929;
	bh=MXpFBvl/G9TdM58J/HqLeuWhK7n8weJPpEkm2tmgU/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O3oy07lgJtUmddl3ObqfK0Dw2tOSJrtb1veMxs9gJqc7bsM0XH/3uuLH7p8NbyS28
	 sOYokpgZqXpq8Ef5TLcv2wU2fJbnufKcoc8VQaI+c4G2+Uijnvj5lRVtMQWMN86vTK
	 Ce/WkSB2SpjBqC/OQ75c3Pr3Upefjp1H4g0g1C7ns6xLBQgm0bWyb2G5UrzoKjsaKs
	 ds2/C1Z35njmOiwLvV+HV5LjtyKXoDVcw4RiZ3TJA1VsgCqmlgWZ/slNlZUEAoF/Q/
	 2taqVa7VlaMgP+o9Z67fi+AfkWgZy8RbxmetnKPghMOkNBEckyliDL3Zsrgw3732N1
	 YEJyLZFWPlWLg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 218B317E053B;
	Mon, 25 Aug 2025 18:05:28 +0200 (CEST)
Message-ID: <57d67b983f527e9a202422dcc329622cceac6b89.camel@collabora.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Mon, 25 Aug 2025 18:05:27 +0200
In-Reply-To: <20250822144652.GA3763665-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>
	 <20250822144652.GA3763665-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_090531_850722_12033AD0 
X-CRM114-Status: GOOD (  18.94  )
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

On Fri, 2025-08-22 at 09:46 -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 03:44:57PM +0200, Julien Massot wrote:
> > Convert the existing text-based DT binding for MT8183 sound cards
> > using
> > MT6358 and various other codecs to a YAML schema.
>=20
> In the subject (on all the patches), avoid saying 'binding' twice and I=
=20
> prefer 'DT schema' over YAML. Lot's of things are YAML, but only one=20
> thing is DT schema.

Ok, I fixed all the commit messages and replaced 'YAML' by 'DT schema'.

>=20
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../sound/mediatek,mt8183_mt6358_ts3a227.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 59
> > ++++++++++++++++++++++
> > =C2=A0.../sound/mt8183-mt6358-ts3a227-max98357.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 25 ---------
> > =C2=A02 files changed, 59 insertions(+), 25 deletions(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a2
> > 27.yaml
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a2
> > 27.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..048fe62715d67d44daa08e75a63c
> > 782238815689
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a2
> > 27.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/sound/mediatek,mt8183_mt6358_ts3a227.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8183 sound card with MT6358, TS3A227, and
> > MAX98357/RT1015 codecs
> > +
> > +maintainers:
> > +=C2=A0 - Julien Massot <julien.massot@collabora.com>
> > +
> > +description:
> > +=C2=A0 Binding for MediaTek MT8183 SoC-based sound cards using the MT6=
358
> > codec,
>=20
> Drop 'Binding for '.
>=20
> Sure
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> And thank you for jumping on all these Mediatek bindings.
>=20
> Rob
No problem, Thanks for your time.

Regards,
Julien

