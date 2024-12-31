Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5E5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVYT592QTQQm6z73gDeCglxq4mZt2CC66LmWLyUt9V8=; b=vS2z+nB48tt6MccF31FTr/t7mi
	uXql7Qm5zVR0m9ram+mQ6PsUDIPqa4I6G9rF6jia8yU+CN5Qkv+JHszh+5mgZZ5RSOqVMOnavULV+
	C6RDfXklMUdVm7eJNNUUXCZlcEyKjUr7mEeT9165Ar4tSCfrDIwCILGA663FL834Zbdp39cuH8z1n
	N+0rNbhFNhEUUiqKGl+5U/5r3efCYBFbdm1OvlGVghN06H1VTZ8ZVUi1dZ5kg5/9XlHU5qOU60lmM
	HonduJi3XQ37YrVbAQcLApsOHrSUv2nun7jxfAaN02TPR1JfXCOFJPTkvewFVFa/NUphu6IFmEXbv
	IPOKYg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScSP-00000007H4J-11Ry;
	Tue, 31 Dec 2024 13:38:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tScRE-00000007H00-1KOZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00FC6A406DB;
	Tue, 31 Dec 2024 13:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE259C4CED2;
	Tue, 31 Dec 2024 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735652255;
	bh=VlKLhUN+zDmr0U5+deIXHrgXfztAdQTHo3T3VjafnL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQnkiJbcSg0EI64smS1a4LcCoIU/L0WXtYnGipGgmpWIH2l991MQlg4Yctfk7RYnS
	 lqG/0sdMv4Kp4uD5s1BwRxmPKSN08NtUzPItbu71bVaCUohaW5ok+3KTF/m3U08bV4
	 vzrBjkJqbM3yt6fa0fmzZ1MPBzGz7KjBsTPKqT6RgYwDntZknUCREmaDlq4ySlji3s
	 LhX5mq7G5P9KMdQxJl9sNtHGMv7/qbAxnEv8Uw0bMp1WoOPLxEtnMFIMfSdH5Qs79E
	 eJ5ZMpN6bT4fKG+TLvWJgGdY36Up+ixdzqVqV8wtV9fsaTia10Vqp/lZJpH2bp6ojD
	 0W5EY0hh9XY5Q==
Date: Tue, 31 Dec 2024 07:37:32 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Message-ID: <20241231133732.GA76940-robh@kernel.org>
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
 <6768438d.4a0a0220.399c57.89b6@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6768438d.4a0a0220.399c57.89b6@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_053736_518590_68624C6E 
X-CRM114-Status: GOOD (  22.38  )
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

On Sun, Dec 22, 2024 at 10:51:24AM -0600, Chris Morgan wrote:
> On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Devices integrating Allwinner SoCs may use line-out or headphone jacks
> > with jack detection circuits attached to a GPIO. Support defining these
> > in DTs.
> > 
> > A number of Anbernic devices featuring the H700 SoC use this mechanism
> > to switch between a headphone jack and an internal speaker, so add these
> > to the allowed routing items.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> >  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> > index ebc9097f936ad..b4b711e80b65a 100644
> > --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> > +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> > @@ -98,6 +98,10 @@ properties:
> >      maxItems: 1
> >      description: GPIO to enable the external amplifier
> >  
> > +  allwinner,hp-det-gpios:
> > +    maxItems: 1
> > +    description: GPIO for headphone/line-out detection
> > +
> 
> If possible, I wonder if we can keep this without the vendor prefix?
> It looks like for now Nvidia and some Rockchip codecs have the vendor
> prefix, but audio-graph bindings and Freescale codec bindings have this
> as a non-specific property (and it looks like simple-audio-card does it
> either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
> upon the circumstances).

Yes, drop the vendor prefix.

Rob

