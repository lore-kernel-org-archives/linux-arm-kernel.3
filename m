Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF2EFF5104
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nzMHmzKdn6jI56lWtmKaV47anHPbxIQIrEmLHQt9yQ=; b=iXJoyuso62M7+lPpJdVnraRbXK
	ZivOKZWZdy1gzWHV/rnIX1N4sBB99w94YKthtdWlrZx6LDnSWjgoaA7WSDZoimOSVB1i4abgS5RZF
	HabUcdgUqMZTvldd2tZjW2NQoxFu1pM0p0c1IQfo1lOchljEr6nbOV1oJ2GFeIJtxTF2qWlxb356V
	GT0zb9fpXX6mFWBzn09nS5uVBcE69q32NJ+Xg/N7TXh8bz23YScCnIs7ZqR0X3U8d3w2b0we1qOP9
	ZyiAF14cKUmkLnemqu1RhdVHZ9L3l5mAvq21ECMa2UWB0HsvRoTFEwSXeBgsb0bJmc5K6JZx65IvA
	mL/MDN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8zC-00000006loK-2N3i;
	Tue, 07 Apr 2026 16:09:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8zB-00000006lnz-1K9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C119B600AC;
	Tue,  7 Apr 2026 16:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D250C2BC9E;
	Tue,  7 Apr 2026 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578144;
	bh=B2VEEKnUZtT0OiN2Ngu8Tmj4uvxETDndnz4xu90eo1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3pRYXC9YIMF02RtzVzG/MJGRfH4hEa3cIeKhGdq2KgkefGHN6SK3cizCYBSuJSJ9
	 xaoqGxxB/yg7lFzCmgsd6iclQ5BWMJ7n/6gd+T26KO4RsMfUHOXpFgYTaSR/UylPFw
	 m5moSUAGmJsHxbLijvft2rVPjO19Zn/MW6uLwtwBpi0V8YJwKpAG1LxJKLl+J7AJfB
	 NHLRREeiv2JZzbW9JaF+zKTwALcUhQSkB1OUX8Y08jkju4nNIZTsaSyylHJOditEhe
	 4JN6zjS3ztpz7qeHC/4hVHYHKXM82ctKMrfDhwi24E2Cp0uh1A5WAuRgrKGeLQwl2m
	 dYjNqTo+EiUAw==
Date: Tue, 7 Apr 2026 11:09:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Linus Walleij <linusw@kernel.org>, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8122
 compatible
Message-ID: <177557814106.2663832.10126964665811714800.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-7-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-7-5842e1e393a8@jannau.net>
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


On Fri, 20 Mar 2026 13:23:25 +0100, Janne Grunau wrote:
> The PWM controller on the Apple silicon t8122 (M3) SoC is compatible
> with the existing driver. Add "apple,t8122-fpwm" as SoC specific
> compatible under "apple,s5l-fpwm" used by the driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


