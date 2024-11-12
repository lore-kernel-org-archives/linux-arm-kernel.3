Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2AD42B8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlOhPUq2RmnDLqQhWNbJaCu28fxeScVH0/hYL8NJhaY=; b=0wIPF+O/O3JJXSMYwL4M31xpWN
	9vZkCM/8LFWM4s8vic0MqUm5XXrwaudZ3RleHp/iP1+o8phUVtosjZ4jDT6G5ph+FCf0itDHRXiN+
	duwadNHrMLFCv0GneylqB3uTuVABPg69Bnd6IAEcxswHy+s1n0XFKjFHrP/zc2rQ7cVO4gTwSqNNB
	AmGKKDJajT79inlCttEJK69iOtP4N3x3heExFqR3HKF5nRJfg7Yq3CaKTI/xZZGAb2dX4+q4Ah8Ge
	GqSIQE4kxFD255J4h9izuzQxSMUQNuoAxHAGsrWPG8uIonoks7On1dbwOsAM5cDdTaCp2WJC/KGrN
	+l0kfCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsJh-00000003qWp-1rRn;
	Tue, 12 Nov 2024 14:56:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs8A-00000003nr2-2yT7;
	Tue, 12 Nov 2024 14:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95361A41CD9;
	Tue, 12 Nov 2024 14:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8B7C4CED0;
	Tue, 12 Nov 2024 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731422673;
	bh=EjPK34+AC2Pfhya/hAO/+gef3LLKikFCHohkMhTY3fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQkBdyJIPNx6GWYU+T7x82rGzvF8PeuQfl+zs/tOQRDrp2LJbaCDsytTuAlUH0nKQ
	 CrX2QB6TyMhise0BmTtJRqJrEqwTUYLiVqRKSdXW8kTwoM5jYxXrY9mtWd73RAmiu7
	 sXIhil1Q71nmi0K7oCMXIt8/aSH3EMQJuRs/RLsPuxJfNYmamJXsHZjRZYlLafXb1q
	 nXE/pO6NON06KK6vDHDkJBqa2QPHDH/Isva5SRn4c2+qPRcGBZ5Yh6fG1JOZOKQI45
	 MGy11AdgoqVsSGitWcvmduyYXmzKW+UEbGvYdnWMyWg4itCsl3YzwMhegY+dty5nZ6
	 h7LyGhAFVB9Ig==
Date: Tue, 12 Nov 2024 14:44:27 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
Message-ID: <20241112144427.GI8552@google.com>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org>
 <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk>
 <20241106110046.GR1807686@google.com>
 <CACRpkdbf4Pb+n-F-K-JaUvytwCGUHHh8d2rYP4A9KgVTzqSnGw@mail.gmail.com>
 <20241111165120.GD8552@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111165120.GD8552@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_064434_902553_B8BA752A 
X-CRM114-Status: GOOD (  24.79  )
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

On Mon, 11 Nov 2024, Lee Jones wrote:

> On Wed, 06 Nov 2024, Linus Walleij wrote:
> 
> > On Wed, Nov 6, 2024 at 12:00 PM Lee Jones <lee@kernel.org> wrote:
> > > On Wed, 06 Nov 2024, Lorenzo Bianconi wrote:
> > >
> > > > On Nov 06, Lee Jones wrote:
> > > > > On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > > > > > Add support for Airoha EN7581 GPIO System Controller which provide a
> > > > > > register map for controlling the GPIO, pinctrl and PWM of the SoC via
> > > > > > dedicated pinctrl and pwm child nodes.
> > > > > >
> > > > > >
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
> > > > >       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
> > > > >
> > > > > --
> > > > > Lee Jones [李琼斯]
> > > > >
> > > >
> > > > Hi Lee,
> > > >
> > > > according to my understanding this patch has been already applied by Linus
> > > > here:
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=devel&id=50dedb1eb1e6755ccab55f6140916c2d192be765
> > >
> > > An interesting choice.  Linus?
> > 
> > Yes I suggested that I merge patches 1-5 on oct 29 and applied the
> > day after:
> > https://lore.kernel.org/linux-gpio/CACRpkdYshPusdA7bDW2y8H_wp-Fm3N-YCsY1_Qn=dZqRiFy12w@mail.gmail.com/
> > 
> > It's because the bindings are dependent on each other, this one patch has:
> > 
> > +  pinctrl:
> > +    type: object
> > +    $ref: /schemas/pinctrl/airoha,en7581-pinctrl.yaml
> > +    description:
> > +      Child node definition for EN7581 Pin controller
> > +
> > +  pwm:
> > +    type: object
> > +    $ref: /schemas/pwm/airoha,en7581-pwm.yaml
> > +    description:
> > +      Child node definition for EN7581 PWM controller
> > 
> > Those refs will explode unless the two others are merged at the same
> > time.
> > 
> > Usually we merge the whole shebang through MFD but this one felt
> > different because there is no actual MFD driver, just using simple-mfd.
> > 
> > In hindsight I should probs not have been so trigger happy and give
> > some more time for this to settle... Merge window stress I guess. :/
> > 
> > It's fine to apply textually identical patches to two trees though as
> > git will sort
> > that out so technically it's no big deal, you can keep it applied if you
> > want.
> 
> It's okay.  Life will be easier for everyone if I remove it.

Okay, I dropped it from my tree.

Next time I would like a say/opportunity to Ack please.

-- 
Lee Jones [李琼斯]

