Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZixvdv8KzjjZ427UX89Rcdev9mRIal5kpYzm/15pxo=; b=yY/OhbSuFGN5PzifUU10uUf32k
	+jCSWNz7Iqyh/zTvgNe6YCJxa0BIcyG84TqHt4KkRm5NcTRniFEJuJ4eOgEve3oOQYSSrFQxYGYOz
	VJkY7NxmNedH6DBuNm9VrSHzuU1lcpD0iJXNGBdNMwGkOWOo4kfElsRC+WC5WzMW0LN5NvfA17Mu/
	r81y4VP+Aq1w+2NsZxeXfj7xBYzTzuBXtBJG7/3u+QaY7vgLnFezxqcba/H4/mzg30pnlwlw2T/g8
	9nvVc6TlIWJ+6bZF60wyCJKk3Se6TlzkFrezh4S7xj/PhwdGDUtvUojs1k6MpwwSLU71KOMgZIxv8
	WOVRd46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd2f-00000006wgO-2KNc;
	Fri, 03 Jul 2026 12:30:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd2e-00000006wgI-3DXD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:30:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E66B43D5E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560BD1F0155B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783081848;
	bh=vZixvdv8KzjjZ427UX89Rcdev9mRIal5kpYzm/15pxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KK38QZdkYThkiPWF7B4/xn4yFq8aFWwRGHuWNO6Dt8k4/5flB1up3vEw88Q9UXjdT
	 xcTwHectQlmeHF94GulOiqMDpyw7k5hQHkgFvLq0yKA/ePbHqtYlqFIpjDA/JoICDK
	 AX/Xw7T60GbqkEwg4HTtp2Xp/zMWDVpUEe36bHzqkEaE5Qww5KitbS+0nzxDPRuE3S
	 3BHmNOWeIEwOH3VFIcx2A4QEm+no3zn4JHdMZPP3jW8UYzVsI/wKLecsTrSPlcF75A
	 giK0pVtCVzMNGREYvqOQ6/pUPskxcAYUgFxn2oI/MXzUhzXBWpUO4vxsQQfcH79az2
	 UqUS4NRlBJluA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b27812c96so4555191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 05:30:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YyqUO/fw10wJpJwykbtqX12jypIwyUIoynWuB8lMYdMuIYmZBWR
	dj3WO0vWc+YMZAFKLE4UQGgG6Up/fMUlIvjT+oVePBDwIvncISg7dNIvJjfnC7SEpV1OvUKRw+O
	EpalUHxrSmR5x1lXUAKaxuM6hm+iHInE=
X-Received: by 2002:a05:6512:a356:b0:5ae:b2bc:826e with SMTP id
 2adb3069b0e04-5aec68b4312mr1674503e87.36.1783081847047; Fri, 03 Jul 2026
 05:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-15-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-15-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 14:30:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=+GTZ0FfzPUvp-4y+Hvkh9MCnr2imsoxkRAZtWdKNEyQ@mail.gmail.com>
X-Gm-Features: AVVi8CdS3NptlkPctMN0dKhVs2Ory6SkB5Eg2wUpTs3s1VvY0UZbJATjoG4Svc4
Message-ID: <CAD++jL=+GTZ0FfzPUvp-4y+Hvkh9MCnr2imsoxkRAZtWdKNEyQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] ARM: mark mach-sa1100 as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 1, 2026 at 11:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> If anyone is still running one of these four machines and planning
> to keep updating their kernels, please speak up now so we can adapt
> the plans as needed.
>
> If nobody is found using StrongARM1100 any more, it can be removing
> during 2027, leaving 6.12-LTS as the last longterm support kernel
> for it.

I thought for a while I would do it but didn't have the time or
energy, so I dropped the ball on this.

That said, the current LLM code agents are a bliss for tedious
tasks like this, it should be pretty straight-forward to convert
SA1100 to DT-only if (and only if) there is active interest.

Yours,
Linus Walleij

