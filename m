Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D52C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKC9UuiVWxD/MFzLYjOHg83pmVBtg7m7d81lYjsbO4o=; b=rw7xxHT0WsJGzXnQD9nJKyM4YY
	pnvQXFdUR/Zfx5RN6geP3xQPVslXtQunJI59uKZop88Q31n8OQUaQaA5g3t1Uzfc3ZEwPuOjW1+bo
	Y0OlV3SCxRSV/AOKzROIWNWg2HzHu9xN3H4mr9KSr4A+2Y1jGsvu4xoZAD26LSSIQYDv5UMUhOnIN
	ez6BX03vdzD5B/3CylBcJWy91El4Xl/1Xf4pfCHIxe6BQWW/TG3g7yEmaN/gvg0g/yamdwuYO96yh
	+OxkH+amEj1hU2wp2I7lXhmDnd2ieFNeuaOVzFL7fGa+dgCGY9w8IypUVpZKfSZ8FZL4fl9NgeFTB
	6xmVLplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXeC-0000000BzrS-01y7;
	Wed, 22 Jul 2026 14:10:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXeA-0000000BzrJ-4437
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC99E600AB;
	Wed, 22 Jul 2026 14:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE471F000E9;
	Wed, 22 Jul 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784729405;
	bh=GKC9UuiVWxD/MFzLYjOHg83pmVBtg7m7d81lYjsbO4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FBKZJysHWtyygCrX8kFOgyhfU6JsT4+b8mD57jr1fEBBFHnR1CwvpG9Dej2mjrENQ
	 TD2HffbkHINJ4F9QFThkAws/a93D69vf8qsp+1OFudLsj9/kL1mJsRgPeyQjm4FNty
	 h1TIfz/RZoQNSICrYttVQTabtwHH8B9UGM2X/Melqh+gCZzVBOsZ0Wn67GIX53qKB2
	 dh6yUEVATyElmTWiwdAmoVWfbQ7HOhQzROthiI+RxeDfpcP++ZFV7dKiEyGHlhyvfC
	 UdZx13hKoS56mTpYZ3zXrgVeE/Bo7Tijz7toMzQkCII+LvDK7l7bx8vC7xqnVZkc7K
	 pLl2PMKBLjOaw==
Date: Wed, 22 Jul 2026 09:10:04 -0500
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox
 bindings
Message-ID: <20260722141004.GB548057-robh@kernel.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
 <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 09:49:14AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 14, 2026 at 9:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 15/07/2026 00:21, Douglas Anderson wrote:
> > > Introduce bindings for the MailBox Array IP block present in Laguna
> > > SoCs (AKA "lga", AKA "Google Tensor G5").
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
> >
> > Filename must match compatible.
> 
> Whoops! Will fix in v2.
> 
> 
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - google,lga-mailbox-array
> > > +      - const: google,mailbox-array
> >
> > Don't use generic fallback. Just the SoCs.
> 
> Sure, if you insist.
> 
> In general the "mba" hardware is designed with enough identification
> registers that we should be able to autodetect which variant we're on.
> Thus, my hope is to not ever need to reference the SoC-specific
> variant in the driver itself. It's not the end of the world to use the
> "google,lga-mailbox-array" as the generic, I guess...
> 
> I don't suppose I can change your mind here? If we take
> "google,lga-mailbox-array" as the generic, then going foward a few
> generations we end up with:
> 
> properties:
>   compatible:
>     oneOf:
>       - const: google,lga-mailbox-array
>       - items:
>           - enum:
>               - google,next-mailbox-array
>               - google,nextnext-mailbox-array
>               - google,another-mailbox-array
>           - const: google,lga-mailbox-array
> 
> If we keep "google,mailbox-array" as the generic, then going forward a
> few generations we end up with this, which seems nicer / less
> confusing:
> 
> properties:
>   compatible:
>     items:
>       - enum:
>           - google,lga-mailbox-array
>           - google,next-mailbox-array
>           - google,nextnext-mailbox-array
>           - google,another-mailbox-array
>       - const: google,mailbox-array

I find 4 strings nicer than 5 strings.

> Sure, it means that if someone unexpectedly makes a new Google
> mailbox-array that's totally incompatible then the
> "google,mailbox-array" sounds too generic, but that doesn't feel like
> the end of the world. You could call the new mailbox array designed in
> the year 2037 the "google,2037-mailbox-array" and things would overall
> be less confusing than using the "google,lga-mailbox-array" as the
> generic.

What exactly do we need to do to stop having this conversation? We've 
done this scheme and version numbers and it never ends well.

The reality is the h/w folks can't help themselves from changing things, 
so nothing remains unchanged for very many generations.

Rob

