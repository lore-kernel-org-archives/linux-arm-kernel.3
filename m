Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB9AC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8d54ZjF80j5PSeUUGJOwzN8j8yyoXk5bK5VrCr6trE=; b=rjvtuGkD2pqR1UkaDfL8BRKt54
	XKs6WWU6IyM+HgkDWB9bPmEZAvuznkscuottJmOZusPT287ucsBaqYVYw1wV5eg660XP3WnkKsVNA
	2NlBADRsfmZ45pIVzVa/gKWFn0pUWwbYm0RqpBZ7wAopl0TQvXNhfQ2yYSuxCab/Lu+il6636RQUs
	nV8Sf1WujRP2dcBZ6Q+HggO/2EglHnT78j+heTqtLh0xPSp6wQPRWp4pc/FvXIXnTyU3/4X3/thhW
	FrGyVgPiCBYE6CVNZrczebUonSWFX5mrgI+m7ZHfedUICWi7sTrc4dyWTycJaGdxvMsUS/MYdssYp
	5KPKL+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gYX-0000000Fbh0-1pnJ;
	Fri, 18 Sep 2026 21:55:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gYW-0000000Fbgt-0KNS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 21:55:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83DAA6053B;
	Fri, 18 Sep 2026 21:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1521F00898;
	Fri, 18 Sep 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768539;
	bh=J8d54ZjF80j5PSeUUGJOwzN8j8yyoXk5bK5VrCr6trE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FR5oM+9/Q9Gt7NasIOp2sGg+Hd8SkJeOIApn+kgvLPBhyKowszo/f1INrNqWLrUZ8
	 fJfKV7IKFBaWQImHLJGKCr+oPg/r8j0jM8Fg0GpOtIk8E09QF4s7nJnVTsVN0LiigU
	 57rIx5IYFGLbweQoREwF4uiJOsVN95CDkR4i71gDGnrps4JYkTOTmrVSW0nSC+/xJg
	 8B+l6FkQ38lFMGoaib9NVAUFluoMu3jjNSbGhh1rhq6t3KeidD8TU+58wC3QfupWis
	 rijZ/Way9jBq3VyYXSqYvfPWzzc6ShiNElyYOzpzeBuJvKrEJGMZX/k6d7I4bSbe4c
	 7/5vvyRYXP7nQ==
Date: Fri, 18 Sep 2026 16:55:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>, linux-pm@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH v2 19/20] dt-bindings: display: ste,mcde: Deprecate EPOD
 supply
Message-ID: <178976853742.2415043.13414750295183513008.robh@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-19-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-19-9d0c17e1f816@kernel.org>
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


On Mon, 14 Sep 2026 13:54:47 +0200, Linus Walleij wrote:
> Make epod-supply optional and mark it deprecated.
> 
> The MCDE should use its power domain instead.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/ste,mcde.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


