Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61D2CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNYKVB7ejZHvag9mlt4vBKdDNtWCCkBY3PhbjTGPdRk=; b=turBVcDGaB9gxt9TI8pba/eTI0
	JN7IOtZPlebLEBjJpTvoOPqiLuANNNIof4qI2GXPFIKG8LlMSBpjieatOxhAY7KMpTbi/JzOsG/Kl
	MYmAHQGdI/M1lB0B4yN1IVoHdO5FHiwmpvm4rsKRrrCspfvO1MfgGspldPmHFR8N4GnARua16+yCQ
	dHWMpclp5N6k5AMk2p7IMmLvmdUAkMUiN8GLf+pUrnAId0o43oPT4a0fS31ggMLFK5WcemifqJavw
	0TtI2sakVYNwIUf0/0CrmYqFW0uYUWPNKVQ42y73mKPVs5CKQds8rchYAEi60nHTgsJoP7ymNCwsH
	ZCD1Phqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaee-00000008mnm-2OwE;
	Mon, 25 Aug 2025 17:06:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZfL-00000008bsJ-2ffX;
	Mon, 25 Aug 2025 16:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137806;
	bh=yNYKVB7ejZHvag9mlt4vBKdDNtWCCkBY3PhbjTGPdRk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ThS3qUoaX7eSegoVgtUWcxMbZq7tWTHAX6xAiSMkJu4+yJFjx7OYHWS+8FWzCH9OQ
	 YafPQfcpzdW2iRvTV43ZZOnjD2sSpXfwKTXEnzOhDvtt9VRfFaQxs/zPxK/5S9PqM8
	 jl7GTA8FsemJ4NL3V1wEQCIcTo4ErT9Aunz6NJTm2lDRCJ/OOqn2Apv5DjtdywA7dN
	 j/NUoXwrCm19r6Jvt4hssp3/GTJGLUbSF6R8BW5AxUS+fXSqoFxU2J7B2HWwmli9sv
	 Y2VR1uGnongrkp5618EobR8+03VtVyiy0NIyoldlpiXzHW0+tQP0kC6gkqLQ4pop3z
	 kffGlHDrJymjQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EFED117E08E3;
	Mon, 25 Aug 2025 18:03:24 +0200 (CEST)
Message-ID: <305df15f3fdc1b9b1b1d9b853a859cfd969733c7.camel@collabora.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
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
Date: Mon, 25 Aug 2025 18:03:24 +0200
In-Reply-To: <20250822144224.GA3745327-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>
	 <20250822144224.GA3745327-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_090327_829515_38962866 
X-CRM114-Status: GOOD (  17.40  )
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

On Fri, 2025-08-22 at 09:42 -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 03:44:56PM +0200, Julien Massot wrote:
> > Convert the Device Tree binding for MT8183-based boards using the
> > DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> > amplifiers from the legacy .txt format to YAML schema.
> >=20
> > This improves binding validation and removes DT schema warnings
> > for boards using these audio components.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../bindings/sound/mediatek,mt8183_da7219.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 | 49
> > ++++++++++++++++++++++
> > =C2=A0.../bindings/sound/mt8183-da7219-max98357.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 21 ----------
> > =C2=A02 files changed, 49 insertions(+), 21 deletions(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..b6fee3ff3af9a90820ee57efdf8e
> > fb3f3d474804
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mediatek,mt8183_da7219.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8183 sound card with external codecs
> > +
> > +maintainers:
> > +=C2=A0 - Julien Massot <jmassot@collabora.com>
> > +
> > +description:
> > +=C2=A0 Binding for MediaTek MT8183 SoC-based sound cards with DA7219 a=
s
> > headset codec,
>=20
> Drop 'Binding for '. Otherwise,
>=20
Ack

> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Julien

