Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE4EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 23:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vneVFZPql6wrINtNlOgBWwh2nm6wqpeKDPqkAovtFOA=; b=R8vc5mN6WqQXsF5bFL8zJ96wdG
	NOSCtkeD7zSXstPtJFDdt+XYcRroXB8per4dCxVAhjX/S5R4xnEQJtS5QQcUnQqwnEO213EZKcg+p
	xtxJrNFWGFsNTEPIiuHLB188WBjYEb/TEJfCJQkcylHWHWSivlhxlJB7dzzcehlFVrOMNgGa8aFfx
	ygU+xlN/ePldqgAEeMhbniTjdMY3yqqpbjaHOeqvtDSvLfiJJUsHbccdeHZVlrnpmwnoF6QRkp5Td
	WnAj+jdAHwRL2jFhV+Ov1TCgD9NU+e4x+EMP3IUtt/LhYiJWz8Ba4i6yc++sYCDTJtG5Qh16NL6zS
	lGYsYMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEhg-0000000FXGQ-2nyp;
	Fri, 14 Mar 2025 23:44:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEfz-0000000FX1J-19XH;
	Fri, 14 Mar 2025 23:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD1D2A4895D;
	Fri, 14 Mar 2025 23:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D70C4CEE3;
	Fri, 14 Mar 2025 23:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741995770;
	bh=i6FRKWOeqg/0KUT5wWrUWYaQ1sfxi4vzjuefq8uOkTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT5BI2SquehMr/G6I+RSq8tCFeNWG5IzDAuCcNwBmZvrPr/CMB9c/Cu0B4da2dcq6
	 3HgbCHL09QRG4ttMl7rEOsrnG70LoXYH8iLEAHFAJ8SAZ1hvyYumKhG2QMqUmN+Zqd
	 ckaZdt6ilfAmYu4F2pu4aMX14+p+0FiLkxG4ct59QV5qn0j+nbACRBHQj1RYBKABsB
	 xtUbk5KOagUxkwoi+ftl3eh1fSaDIVsxgyIxvjpFftHoERBT8eTsRMaQLJ/ze+NrTS
	 UvNyUSm7gKpdOqxzHsJSH3au1LOw9TDad9FNqJwFAySmoMTVlf2zRMo76xGWgokBUY
	 t0dzSaL8YHanw==
Date: Fri, 14 Mar 2025 18:42:48 -0500
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
Message-ID: <20250314234248.GA2536020-robh@kernel.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
 <20250312104344.3084425-2-wenst@chromium.org>
 <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_164251_440878_F57D5D49 
X-CRM114-Status: GOOD (  27.91  )
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

On Fri, Mar 14, 2025 at 02:58:36PM -0700, Doug Anderson wrote:
> Hi,
> 
> 
> On Wed, Mar 12, 2025 at 3:43 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> > longer boot-up time. Power sequence timing wise it is compatible with
> > the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> > out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> > enumeration. Enumeration and subsequent operation follows the I2C HID
> > standard. The eKTH6A12NAY requires longer times for both parts.
> 
> Somehow the last sentence above confused me. Can it just be dropped?
> All you care about is that the new trackpad matches the timings for
> "eKTH6A12NAY". Not sure what you mean by "eKTH6A12NAY" needing
> "longer" timings.
> 
> 
> > Add a compatible string for it with the ekth6a12nay one as a fallback.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > index cb3e1801b0d3..81c391952ccc 100644
> > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > @@ -4,14 +4,14 @@
> >  $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Elan eKTH6915 touchscreen controller
> > +title: Elan I2C-HID touchscreen controllers
> >
> >  maintainers:
> >    - Douglas Anderson <dianders@chromium.org>
> >
> >  description:
> > -  Supports the Elan eKTH6915 touchscreen controller.
> > -  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
> > +  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
> > +  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
> >
> >  allOf:
> >    - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > @@ -23,12 +23,18 @@ properties:
> >            - enum:
> >                - elan,ekth5015m
> >            - const: elan,ekth6915
> > +      - items:
> > +          - enum:
> > +              - elan,ekth8d18
> > +          - const: elan,ekth6a12nay
> 
> The "enum" above is weird, but it matches what we did for
> "elan,ekth5015m" so I guess it's fine? I'd leave it up to bindings
> maintainers. I guess the assumption is that we might add additional
> touchscreens to the list...

Yes, but up to you all if that's a valid assumption.

> 
> 
> >    reg:
> > -    const: 0x10
> > +    enum:
> > +      - 0x10
> > +      - 0x16
> 
> Again happy to leave it to the bindings maintainers, but _maybe_ just
> drop the "reg" parts here and below. It doesn't really have to be part
> of the bindings.

I tend to agree. Sometimes we list I2C addresses as that is part of the 
device whereas elsewhere it is not. I don't know that it's worth the 
if/then schema in this case. 

Rob

