Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352A6CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOWbc93NNAvuoFHJIERvL2ni0Hh4WX8rxmSVcRBWSh8=; b=ru62AtI9H4c4K0Mmj2Oz9z0oKo
	KXgJ9gDsHQIiJrOZLoKIXqJgMgzHI+TJ/fOUA9ykh36wiDT78kZJn//YgotZTU+luo0TAJTE8dWMt
	JWgg4mn47xds96sFEmuRE54OT/z3RMCwfGtVw1uvFTaIp8aSEDyEvQK2FqmtpVCGFGniEiI1Kx69j
	GOP/iR8UXLvPOeP9DuTFkJGfsqLuJ42ROKy1D3zssDVXtJdvFLtMBzLjBQpGYnp7XdwuGCxZ+y08S
	QpusGV0ceL7P4tnStpl49Ca+1LMbltW1PvxQ/S2Uqgmq/TFbVYG52kEgOQm4YejqnSjnhnwAMqOMt
	P5nCXhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2fQ-0000000GdWf-0XMd;
	Thu, 21 Aug 2025 10:37:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0os-0000000GHQs-1X1M;
	Thu, 21 Aug 2025 08:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755765528;
	bh=OOWbc93NNAvuoFHJIERvL2ni0Hh4WX8rxmSVcRBWSh8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UNNSDlpjULRYhhubgyBlL3uOvOZTQmSqPOv2MHax1e1KRJ+2nv98syzqmrv6NZaFI
	 ew7WR8HtaioqREui4tfTOLNyfdHkExd7J2MWERwm9fix6D4Yb7wQXduX7SWIAqg8UY
	 mwk3EISANgsXq/dfh6J76UGV1FiYryAIkNMh7w2kLN+gNNkxtHXy/Sh0AF6iaOhCgV
	 OSffjmCunuEHnVAQmQ81fFFEqoDytDBrz9adhKQFrmh/uVp1TQAg0iQdQ6L93BSgRm
	 EQ8c1LE2Eb1YwT+uTausgVfHy1MEVfLt20KvB28Zaw0blRjONprF1wgajZb26iDZxJ
	 YLYdrr4VkAu5w==
Received: from localhost-live.home (2a01cb0892f2D600c8F85CF092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B55E17E0C8C;
	Thu, 21 Aug 2025 10:38:46 +0200 (CEST)
Message-ID: <6491baf3e08454f2ea042934f9f781cf21cbf4d7.camel@collabora.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
From: Julien Massot <julien.massot@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>,
  Enric Balletbo i Serra	 <eballetbo@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Weiyi Lu	 <weiyi.lu@mediatek.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>,  Sean Wang
 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Thu, 21 Aug 2025 10:38:46 +0200
In-Reply-To: <376a8f00-e803-4ab1-a54e-6535e41ebaee@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>
	 <20250821-whimsical-mustang-of-champagne-ca7a7d@kuoka>
	 <376a8f00-e803-4ab1-a54e-6535e41ebaee@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013850_552834_68D0D233 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Krzysztof,=20

Thanks for the review
On Thu, 2025-08-21 at 09:30 +0200, Krzysztof Kozlowski wrote:
> On 21/08/2025 09:16, Krzysztof Kozlowski wrote:
> > On Wed, Aug 20, 2025 at 03:44:52PM +0200, Julien Massot wrote:
> > > The mt8183-mfgcfg node uses a power domain in its device tree node.
> > > To prevent schema validation warnings, add the optional `power-domain=
s`
> > > property to the binding schema for mediatek syscon clocks.
> > >=20
> > > Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains=
 property to mfgcfg")
> >=20
> > Checkpatch complains here, but more important - where is explanation of
> > dropped tag?

Right the proper tag is=20
Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains prope=
rity to mfgcfg")

> >=20
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> >=20
> > But this tag appeared? It wasn't even given!
> >=20
> > You remove public tags and add tags never given on the lists.
>=20
> I found Angelo's tag, but still dropping other acks is not explained.
>=20
Regarding the tags: in v2 the patch changed quite a lot after I applied
Angelo's suggestion, so I decided to drop Rob=E2=80=99s Acked-by as it no l=
onger
applies to the new version. I should have explained this in the changelog.

Regards,
Julien

