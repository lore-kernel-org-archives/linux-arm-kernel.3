Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E602CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ffc678fQhzI/pdu+hLX+ARqrXJLZH6TSQWiX1NPHrZM=; b=cc6d+01XNvWbvOSeNTgeT30PMe
	k6bPhdcPppQdpknWxE/ldB0IyROB2arn1ApQH/U6VM2kbDtfzpa70vsSOog6y7xjTppzXqkBd4JH3
	724Zqy7txZS2Sf1k+T3Qw/RI7kncVlzluwS29PzpC7H5z5jBJvmnL3JvxAsxX0rvdRU+CApV5gfZY
	ZwlB0x/fajNX0VO0rY5gM5kF7pC+yzZ7Jz3ZZqnXa/XDQ13oAL2ENikL6DkiL8jXDufr54CbTokp/
	Ra5trJ9YsPZbZ85LW4TE2qlMnMtEMfVAIg6xHHQ1Pbegy3pO5f0pvvOPD6eFlJDDx537OCRNP4SK0
	tVSdHCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwixO-00000003mfD-0mk2;
	Thu, 11 Sep 2025 15:11:30 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwixL-00000003mc6-2gD2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:11:29 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3D364240027
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 17:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757603482; bh=Ffc678fQhzI/pdu+hLX+ARqrXJLZH6TSQWiX1NPHrZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=TnxtUmxm72N0S5hLUeZoPl+SgtgB7gCg2c6AyfSQ1/KRdEH3USSX6lP9cGj7yHwND
	 hGU4uiIZBAEtb2hyK3DZkJS1Ru3vYnq/vOrm0lEImjlvbpzC96XtFaytQijHy6zz2B
	 o+rzTOCnLhwBhFVTe+fUCUDkCqdgcqybmsKlvrglJvrU+PAcGQkLq5Z4o/lKUmjGt6
	 TEfrKXgRCORHorps+nbrxO/18DlGgujQCGenDnZ8ebERLtNCbBsJXDBg/Fmg72cfbl
	 FHZ0ObAE6FsNr/Yfn8yBKziLprr+sFb504/4SN9Ek8C4NMVtiThLPwTOZDDi9LO8I8
	 du5l12wAQYDkQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cN1Gt4zm0z6v15;
	Thu, 11 Sep 2025 17:11:18 +0200 (CEST)
Date: Thu, 11 Sep 2025 15:11:21 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: allwinner: orangepi-zero2: Add default
 audio routing
Message-ID: <aMLmlsZimgKVeiUF@probook>
References: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net>
 <20250809-opz-audio-v2-2-f4fd15552a82@posteo.net>
 <CAGb2v671xTaWkRD0xVPsgGWvykAwPESXuBLgDz-oo4ywOJ=5Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v671xTaWkRD0xVPsgGWvykAwPESXuBLgDz-oo4ywOJ=5Xg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081127_957877_19248F10 
X-CRM114-Status: GOOD (  22.64  )
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

On Wed, Sep 10, 2025 at 08:58:49PM +0800, Chen-Yu Tsai wrote:
> On Sun, Aug 10, 2025 at 12:18 AM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> >
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> 
> The subject is misleading. The Orange Pi Zero2 is a different board with
> the H616 SoC.

Oh, indeed. I got confused. Thank you for catching this error!

J. Neuschäfer

> 
> ChenYu
> 
> > The Orange Pi Zero Plus 2 has the same pinout[1] as the Orange Pi
> > Zero[2] (with the possible exception of line-out left/right being
> > swapped), and the Orange Pi Zero Interface Board is sold[3] as
> > compatible with both of them. We can thus use the same audio routing.
> >
> > [1]: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus-2.html
> > [2]: https://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
> > [3]: https://orangepi.com/index.php?route=product/product&product_id=871
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >
> > v2:
> > - new patch
> > ---
> >  .../boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts    | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> > index 7a6444a10e2534458b7380882ea4fd42bd54fea8..97a3565ac7a819be6b18d324fa6f65d0d1d2b2ad 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> > @@ -99,6 +99,20 @@ wifi_pwrseq: pwrseq {
> >         };
> >  };
> >
> > +/*
> > + * Audio input/output is exposed on the 13-pin header and can't be used for
> > + * anything else. However, adapter boards may use different audio routing.
> > + * - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus-2.html
> > + * - Allwinner H3 Datasheet, section 3.1. Pin Characteristics
> > + */
> > +&codec {
> > +       allwinner,audio-routing =
> > +               "Line Out", "LINEOUT",
> > +               "MIC1", "Mic",
> > +               "Mic",  "MBIAS";
> > +       status = "disabled";
> > +};
> > +
> >  &de {
> >         status = "okay";
> >  };
> >
> > --
> > 2.48.0.rc1.219.gb6b6757d772
> >
> >
> >

