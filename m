Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E403CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHqRa8jsx4scxQoHsogOHYRV2hwQ6tQgcKa606SaBXY=; b=yJ6aFu01gEgEzflxJzlPCRQ1V2
	4mFBuvxami97miOjMEQdEccYD8YZ+Xr2brXP0bckFkprmQUqGZQ+wDiB2IimFL0wDv5kYK+YQT5Yw
	g7qA9O/3jcpcvw2qHNqoChRzWj+g6AjPLv0iQQZUAxjShPw64ivxo6rEeNBoPd3Jnc/mmThYhcOEi
	10q3PHISmykE2P7j+nItngoYr8g7IlGwiDWmKjowyEgHlGlfYfOeXz3fumoDDnlIBDGSJ9FQJT1OO
	EmWPRKTz7a/8UlSZ50SnRCDPudIuQIThsQE0wWAHZ95Ko5+LwDfw857T9fmdeKQV+s6dWex0wAEs7
	m+hQvTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqLW-000000074Dc-2nqL;
	Wed, 03 Sep 2025 16:28:30 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnLk-00000006YGX-1Nfl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:16:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4D4D1487E25;
	Wed,  3 Sep 2025 15:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756905386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aHqRa8jsx4scxQoHsogOHYRV2hwQ6tQgcKa606SaBXY=;
	b=Mi40bUy3Qk6XWegkRfPM2jnv4dDk/bMr2lj8J/pF4Gri48WBAkFX2c8VfueH8QqgCf2Ng8
	j5AcfYSFfVjl6qZmg4jeiz3c6SMpf4oy8SG4v5oJmU7JXVKjlUK0bGcYIOJWNDqUGyZcms
	Sff7vKAfUKeT6nvfJzbKbjFGimAEMj1wL7WqwQ3CZM5jPi07ldAlfZilQmSE3wtlrNL8Gv
	OYP7T1CFZSdYRfuoHH7n6uRcTI+N6s7ysLFA6qazlJP/eibZT1JQi7uKBLnEPtQqfcfvvh
	qz6NHVk6ppVZmLyBYDYcwkHh/+haGNIMfW6/g/QOTfw6wH67NV3Kug8C4llwIQ==
Date: Wed, 3 Sep 2025 15:16:10 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Vinod Koul <vkoul@kernel.org>, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, o.rempel@pengutronix.de,
	daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>,
	luka.perkov@sartura.hr
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
Message-ID: <20250903-gratify-sustained-9acc011bc3c9@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Vinod Koul <vkoul@kernel.org>, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, o.rempel@pengutronix.de,
	daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>,
	luka.perkov@sartura.hr
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
 <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_061632_865919_D824C946 
X-CRM114-Status: GOOD (  19.28  )
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

Hello,

Am Thu, Jul 31, 2025 at 11:05:07AM +0300 schrieb Claudiu Beznea:
> Hi, Vinod,
> 
> On 23.07.2025 15:29, Vinod Koul wrote:
> > 
> > On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
> >> This patch series adds basic support for Microchip LAN969x SoC.
> >>
> >> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> >> which allows to avoid the need to change dependencies of the drivers that
> >> are shared for Microchip SoC-s in the future.
> >>
> >> DTS and further driver will be added in follow-up series.
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
> >         commit: e56982021f5303b2523ac247e3c79b063459d012
> 
> As this one depends, as well, on the first 3 patches in the series (Robert,
> please correct me if I'm wrong), and there are still discussions ongoing,
> can you please drop it until all is clear on the first 3 patches?
> 
> Otherwise, applying only this patch will lead to AT91 XDMAC driver not
> being built for SAMA5{D2, D3, D4}, SAMA7{G5, D65} SoCs. Linux is not
> booting on SAMA7G5 SoC only with this patch applied.

Second that.  Just tested v6.17-rc4 on sam9x60 and DMA is not working
at all because this driver can not be selected anymore.  This must be
fixed before v6.17 release please!

Greets
Alex

