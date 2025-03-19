Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1258C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pfc8AOZKo7MFY5X2k8Bd5c4cSUcavoVqUt8NvU99eFE=; b=voszMMNhS+5Apph94N9/6KHLZx
	KevyO5rhMdzLHMx2gts888PdUvPn9YgE9nNx4eCPZsgbL714UFOj8yK754xddzyxRffoKf0IH0yyh
	BM6DoC0WmBmsC6+pK36SShdjrqyQkoF9EMTEG+A5odEyI5oJCf2usL+0ESgAm3oBX+XWwH9rvNNaZ
	lTXpnnKbVRVfPz0gtMONOX9ZC+r3XUjDDHetDZ8UvOTjFr3A23RZJwqhqdZI6R+U91Xtg8tBdpNZS
	Vx2zsEJMqZCuonx8hX3ec0PbW0kLBSj0vdOdC4PZpPKm7WqZ6Q7g/ti4ihR6ch8rmWgapcTEpYutW
	9Fi1MyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuouQ-00000008MpY-3Vmw;
	Wed, 19 Mar 2025 08:36:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuosF-00000008MPE-43SM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 08:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BB925C5A5C;
	Wed, 19 Mar 2025 08:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487C9C4CEEF;
	Wed, 19 Mar 2025 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742373243;
	bh=uHvP5v7oifXK6felVK4bK42cu7yy9x6VTVSPes59okU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJYYznFaUu+VoupKyTZDR38lR2kdDtpPfGJfuqyBdYqwj+lYgFFggKrK4wWhos2cl
	 aAb93us0ya5aY809KshBxieVJB935C1RYf2coB2dGTUcT16dPduenoP1PumfYxHYap
	 wtc667FkA24dYiwNhn3p0Ea/TpVwl0NEprbtTnKLTa2VsNvOvO224zTp3ZvXg0s7mG
	 0e+lGFa5v38rPF98/FsREiEAtNK6JZVodh/xGTy6ugnmkSnXyAi50zHSQPfe6wDGLc
	 mGEb5/aZzI3wjfCRRkIAivwjYWdcz2XbJbPvRtG5uZBy5DU6vWx8rhW6LwwM3x6QPD
	 lizlcx6I6/SyQ==
Date: Wed, 19 Mar 2025 09:33:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, florin.leotescu@oss.nxp.com, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Message-ID: <20250319-auspicious-sparkling-dachshund-ef0eed@krzk-bin>
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com>
 <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
 <CAEnQRZBmYdLh29ha1FKz8=CbxjFBFFTgDkjrEmwTxW2WcxodfA@mail.gmail.com>
 <ca734f66-593f-4e7c-bc76-e343a7eb88d7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca734f66-593f-4e7c-bc76-e343a7eb88d7@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_013404_063028_BCFB44B2 
X-CRM114-Status: GOOD (  19.48  )
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

On Tue, Mar 18, 2025 at 09:37:29AM -0700, Guenter Roeck wrote:
> > > > +patternProperties:
> > > > +  '^fan@[0-4]$':
> > > > +    $ref: fan-common.yaml#
> > > > +    unevaluatedProperties: false
> > > > +    properties:
> > > > +      reg:
> > > > +        description:
> > > > +          The fan number used to determine the associated PWM channel.
> > > > +
> > > > +    required:
> > > > +      - reg
> > > > +      - pwms
> > > 
> > > Is it necessary to make 'pwms' mandatory ? The current code works
> > > just fine with defaults.
> > 
> > The code adding OF support is added just in the next patch, so the
> > current code isn't event
> > probed when trying to use dts.
> > 
> > Or am I missing something?
> > 
> 
> The patch introducing devicetree support to the driver doesn't evaluate
> the pwm property. That makes it quite obvious that, from driver perspective,
> it isn't needed. I don't immediately see why it would add value to _force_
> users to provide pwm frequency, polarity, and the output configuration
> if the defaults work just fine.

Indeed. PWM source is actually fixed and rest of pwm argument could be fine
with defaults.

Both options are fine with me, so keep my tag.

Best regards,
Krzysztof


