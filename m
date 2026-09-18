Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB7EC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3vK+hrez7Ed1fDsl2TVjNVdL2Vp9oUFESzWid8IhF0=; b=MisOoHgxQx197SQJw1iNSUiUns
	8KeDjNFnPsqzXviFJRfRbeGuZzasPuaNQPPIU/Xuy1UH7PehZS3z9oK1Svpg4WUfpXKVp5mMcdPOi
	LarG3wVYEpK5EUfH1mLJtStpbk72Qm87SLFmBJYqbG+XuQVvukflMFXVDiK+f4y66ga7xhD8Sbu+k
	8gUcX6AIYcMbHXhyse5n7UtC1+4ErNF4E4EjR5RI1mUEJO89UQ06os+Ogep0t6mVIR4GTSM33Q3C/
	EloAIieXKYoyQtYI4P4WCBVjvAHHmGtCXXG/0itnCW8ejyyh1xiC5ygxHSOLUpI9aPUTXfDu2Gzqr
	nWXklz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UNf-0000000Ds1X-2gNr;
	Fri, 18 Sep 2026 08:55:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UNe-0000000Ds1J-0Ip8;
	Fri, 18 Sep 2026 08:55:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 762C0413CB;
	Fri, 18 Sep 2026 08:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189461F000FF;
	Fri, 18 Sep 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789721737;
	bh=Q3vK+hrez7Ed1fDsl2TVjNVdL2Vp9oUFESzWid8IhF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWhxTCOnTtlFovIZHK2qxAQPf4EAqwRc2LiGpoMZpF80nlaiHWuvtipfLpZT5Rhkg
	 h7dGte7v2M8uzKuHphGdDgxXMM1ayQHzEnUNCQSUupkayOjhAUM7lrnFJy/nwlPJVG
	 +CwDXoUhoDyCp80GKNUd9GzuyUfl5xT9xi4ufKmHas+RKI9DlgBu91G4KEF7G2JWBO
	 dgzyj8wjun6MW4UZFKUtMbu1eAX1UL2Ll/7rqmZZTICBslkEb+Nh40Pbw/fBmFX9mI
	 hC9HuQ1jG64n1s0pW+vDTBVYM/wt5fg7YGCM7ivCI93N+6APTGbtfeWE9rByH/JG6N
	 SSWCCaD5uhQPw==
Date: Fri, 18 Sep 2026 10:55:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bcm2835-v3d: Add an
 optional reset line
Message-ID: <20260918-nostalgic-enlightened-macaw-8f4e5a@quoll>
References: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
 <20260915-vc4-reset-control-v2-2-cb3a25b07822@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260915-vc4-reset-control-v2-2-cb3a25b07822@igalia.com>
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

On Tue, Sep 15, 2026 at 05:51:25PM -0300, Ma=C3=ADra Canal wrote:
> The BCM2835 power management block drives a reset line for the V3D block
> that is independent of the graphics power domain, allowing the GPU to be
> reset without power-cycling the domain. Expose this reset line in the V3D
> binding.
>=20
> Keep the property optional, as devices like the Broadcom Cygnus don't have
> a reset line.
>=20
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


