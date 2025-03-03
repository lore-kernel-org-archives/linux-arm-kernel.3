Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097C0C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3JcmKy5y+addoOL5rDK9l5E3ggHSvwg/Oz//CqFfrI=; b=UKAU/YBvT9malPZna1W0q5cvqx
	XYNcRwWDW7etuBa4q81+0cAUUj0vimwPW7Zgw+VI5aFlv4eJC8Pb3BQLpuuYzMoPfmV3YT1Qhe/Zf
	NKgwvkGyzzPi2pH21QmVOVBYxNzqvzHsZZ5qHRwERX5zLmyy3wh+IBUFpD2+X0eBQ5CgdgTtK/I7t
	gl5iGEsMQPhCGhGrolcbSkABUl7m7XkNsHJ0G+MOIbCoc8YPr3ab5KpYc+ybpNWGoYgL3q8ShbRic
	H4hFVoHi0aid0wBsgi4VaTLpDKPGhT0yJiR0pikKC45VaGJiDDMvpzu1c5mSlKcJ256aS/PcJE2Y9
	Q9wTYx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp79k-00000001B2G-3pKE;
	Mon, 03 Mar 2025 14:52:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp73M-000000019zG-2XLE;
	Mon, 03 Mar 2025 14:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741013154;
	bh=oQYo31W0WahUUgGafPAeoZtr6PUwTcxwzU94GR9sNHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pR0IFrRInKm/4EW6eI5mCbpu6AcfVVOO9d1GKUgU8zBG7hrdEKWti0g2z9qKTo7gY
	 TIySusZ81Wlxzu0ugr8hSJHkluVicHzHktayYvlfQ4JY4C69Xs5d49ZVZ6VP4GF+xF
	 6x/X1Q1rWFk4lojtvsxX04cw/WDmhoz8DRzu77hkZqIwfXOvX53TDdtA/kVJdWvDSg
	 tmJPG7aZWAePfIVwt4zSMqPpShGVez3MrIzhk6GdTU3a3lDV8epkhGjXQKMo5WxJ7m
	 9lKkFUxXIl8HQz2256mS7B6P4G9A2R/UfRp3swUIQHxuY4jUNWGJwtron53UPxB3uN
	 nbZzneyQzINPw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 909A317E0E8D;
	Mon,  3 Mar 2025 15:45:49 +0100 (CET)
Date: Mon, 3 Mar 2025 11:45:47 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 01/20] ASoC: dt-bindings: Add document for
 mt6359-accdet
Message-ID: <0120fe30-43c4-4fec-8b5e-fdb6b382fc2a@notapiano>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-1-5bd633ee0d47@collabora.com>
 <628a81c5-b9f1-4be9-84ec-90022a3526da@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <628a81c5-b9f1-4be9-84ec-90022a3526da@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064556_803942_9197C961 
X-CRM114-Status: GOOD (  21.15  )
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

On Mon, Mar 03, 2025 at 12:14:51PM +0100, AngeloGioacchino Del Regno wrote:
> Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> > Add dt-binding for the MT6359 ACCDET hardware block.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   .../bindings/sound/mediatek,mt6359-accdet.yaml     | 42 ++++++++++++++++++++++
> >   1 file changed, 42 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d08a79301409374714c76135b061e20e8e8acfaf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mediatek,mt6359-accdet.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MT6359 Accessory Detection
> > +
> > +maintainers:
> > +  - Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > +
> > +description: |
> > +  The MT6359 Accessory Detection block is part of the MT6359 PMIC and allows
> > +  detecting audio jack insertion and removal, as well as identifying the type of
> > +  events connected to the jack.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6359-accdet
> > +
> > +  mediatek,hp-eint-high:
> > +    type: boolean
> > +    description:
> > +      By default, the HP_EINT pin is assumed to be pulled high and connected to
> 
> Just to be clearer about this pin being an internal one and not externally sourced,
> so, *not* a SoC GPIO, but somehing that is completely provided and handled by the
> accdet IP...
> 
> "By default, the accdet IP's internal HP_EINT pin is assumed to be pulled ..."

The HP_EINT is an external, not internal, pin of the MT6359 PMIC. It is an input
pin of the MT6359 IC that gets wired to the tip (left channel) of a 3.5mm audio
jack to allow for detecting when a plug is connected.

Since this dt-binding is about an IP in the MT6359 PMIC, I think when saying
"HP_EINT pin" it is already clear that the pin is on the MT6359 IC, but if you
think it's necessary I could make it "MT6359's HP_EINT pin".

Thanks,
Nícolas

