Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0DAC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/WguKCxp0qhjpAyaHl9tRObozilx8BUenSblkEI6HM=; b=Qv2Rt89jw8yL5uA13HMG0cDwDc
	QPeXKYlv+NABBtzSv0Y+QgCySQYF2agaJZz76Jz5y2V3dKP7RqLM++dx49ww7hfMvB7nUjdCoO62F
	amtXj/kyLAG038jvTFiQ2dex6AgBdqLgpf4JbtUfHE4wZOGHe6NOxEJJzDXijlyXgF7wGSitGkTzz
	YATvlesJmkx+ZMSWbrI18s7VJ6PJ3ilsDK5uaXr6izawiAPHr0GOP3JdNiX9afoSwA0Qzbj+Rk6S7
	/QZBNBM2w70Vva0WSKvEXYFKikUK9dHIhIPiW8ot2pPcm/9HhFu4cDY6qmmdsahzhbfS5rJmrn6iK
	IPRYjnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqApT-0000000Az6d-1pbd;
	Thu, 06 Mar 2025 12:59:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqACK-0000000Atj1-1Kh2;
	Thu, 06 Mar 2025 12:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741263569;
	bh=bRmppDD3UR7+vn2dZ4ulwCSuB4hzHfQscGhABBmBL1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTAC4v8chbBR5zWYrExx/9feWvRDBAz/LoFBo5IIwdoskEr4r4MBezh1BjF9cWhn+
	 tjB7pNeZO9E8O5wZ/xWAtARkBL4EenhqpLMpN4Sp66HE4LZy/cnIayknvG3sKTf/ai
	 np6xd/fWMbxKm90MukAR1sIuNERigRVsSFFop5ejqhGc0Digb+w8PbAGR1fIbfS1Py
	 P+Y5J87e1U0tGrR+x5Lc4aBMzRGYVBxmsFwm39XSPtjG719uhridTSX2nTINBVrex1
	 N+P0+LiOw6QYBsUCy8Gwd6bSotIzLjdiNVXEZfU0lhOmHxBx21VBn6l3KVwg1eyxYg
	 kLxABJhWONk/g==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF14317E09AA;
	Thu,  6 Mar 2025 13:19:24 +0100 (CET)
Date: Thu, 6 Mar 2025 09:19:22 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
Message-ID: <2fa6037d-b5e9-45b2-a5d5-dbc92fb3434b@notapiano>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
 <20250305-mt6359-accdet-dts-v4-1-e5ffa5ee9991@collabora.com>
 <20250306-certain-jasmine-mastiff-fd67ba@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306-certain-jasmine-mastiff-fd67ba@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_041932_545347_D3298DB4 
X-CRM114-Status: GOOD (  20.32  )
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

On Thu, Mar 06, 2025 at 08:57:27AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 05, 2025 at 03:58:16PM -0300, Nícolas F. R. A. Prado wrote:
> > Describe the accessory detection (accdet) module as a possible subnode
> > of the MT6359 PMIC.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 51 ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> > index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..51012b8bbfaef3df7bdb619a4f8d828d6f9cc15a 100644
> > --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> > @@ -24,6 +24,7 @@ description: |
> >    - LED
> >    - Keys
> >    - Power controller
> > +  - Accessory Detection
> >  
> >    It is interfaced to host controller using SPI interface by a proprietary hardware
> >    called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of pwrap.
> > @@ -224,6 +225,30 @@ properties:
> >      description:
> >        Pin controller
> >  
> > +  accdet:
> > +    type: object
> > +    additionalProperties: false
> > +    description:
> > +      The Accessory Detection module found on the PMIC allows detecting audio
> > +      jack insertion and removal, as well as identifying the type of events
> > +      connected to the jack.
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mt6359-accdet
> 
> You just removed the other file, no folding happened here. Drop the
> accdet node and fold this into parent.

Sorry, I'm still not sure what you mean by folding here then. Right now the
accdet is a subnode of the PMIC. If you want me to remove the accdet node, where
would its compatible and property go?

    pmic {
        compatible = "mediatek,mt6359";
        interrupt-controller;
        #interrupt-cells = <2>;

        accdet {
            compatible = "mediatek,mt6359-accdet";
            mediatek,hp-eint-high;
        };
    };

Thanks,
Nícolas

