Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD62C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrEby8X97oMS/rj+guNPUJDiVtS8KqyTeO4FfPyEZHU=; b=KZiLBzmnoR5uDr3VCPh37ugXnX
	1v2xPSjLYKJet8rUxaRWp9N1hgfk5t28QqhbDRSSzMekFt096gx+A0hQ5QkVK84nV2DeMnIQOEu1N
	ICLwOMD93CW/aeliBGTn3iGS5H+zq0w8hOmyJGzrGbJvSEvTyZZA7pKt4GmKOeDtB/1n5vjL8Oe6D
	AyQB5etpXbENLYPIXmypiiG3AOLrg24oJVp/xuUbcSskLKXsSwUm5O9akIdBmLI8TdoLF8acHpxy+
	13sQ6RCB+SVWumTGinogw5qYQSH9pkoOaw8TttYrXuZl2DZsCsriUHXBSGQKoSq1K29aG5+UO6YSj
	xJ5/Ulvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7qt-0000000EZeF-15GP;
	Wed, 14 May 2025 08:52:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7J2-0000000ET7t-2rBS;
	Wed, 14 May 2025 08:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB768A4365A;
	Wed, 14 May 2025 08:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E50C4CEE9;
	Wed, 14 May 2025 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210655;
	bh=HrEby8X97oMS/rj+guNPUJDiVtS8KqyTeO4FfPyEZHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O31B7HzEyj3Nh4DAAJoFtHFRHPDbN7/g83eRGt9BVOdIa407ZQsTtrzwDXm08UiHf
	 au9g7acBtuIWljLhpr1LVdKmuA8eumou+3pxY2wx3+y4tNi2Da0cT7MJesdUQoTz9M
	 x3xxKgtVuJl2rvXx+koXEHh2vjGBnY7kezCh1XkcOUJx3DdswXJ0KhNUIt7N7AvEDZ
	 rI9bK1c389FzNXR/9nABj8vY3s7LJ2xWKNrLciHhrbc0NFCR3BrPv935Avf+Fzw7u4
	 T0XJMfje25BR4bZ5c1G189g5NyRAtkKpL1STKWQFKkrsIWLPUncgYk1ehmnKyxJOhp
	 VoQMI5UaLWtjg==
Date: Wed, 14 May 2025 10:17:30 +0200
From: Mark Brown <broonie@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/10] ASoC: mediatek: mt8196: support ADDA in
 platform driver
Message-ID: <aCRRmk2Vqplbbusn@finisterre.sirena.org.uk>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
 <20250514081125.24475-5-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Ucd00qPZdK+Pv3F"
Content-Disposition: inline
In-Reply-To: <20250514081125.24475-5-darren.ye@mediatek.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_011736_787318_5B288D6C 
X-CRM114-Status: GOOD (  10.26  )
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


--1Ucd00qPZdK+Pv3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 04:11:06PM +0800, Darren.Ye wrote:

> +#include <linux/regmap.h>
> +#include <linux/delay.h>
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mt8196-interconnection.h"
> +
> +#define MTKAIF4

This define is there unconditionally, what's it for?

--1Ucd00qPZdK+Pv3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkUZoACgkQJNaLcl1U
h9DiUwf8CeXyIw1furK0nf9QfBubUYFQ3DjxWzlkFbKAyVnUb3qF3V4vkrVIRC2P
HYiWu0j8HLfZE/o+6cFkU0RIhzDgC/TGdMp/8ZlCLG3PpX8n124t3GsigTEOv+ZP
13p4rzmwS4GdMZD5uY7yI5mg1ScK69kNmb6ah4DeOTo92/GJQTITnJXq8B3UegXr
P5rk8qlBWvgKL4ebpRSGbCztpZZ+rDkUzaNutwIk0I4mzdmGwfJ/u/kBk1oUNhoD
+dvn4qemKwDA8J9QV/sDzEu964KbUx+iWz1AryHn3TwKzF6kO1I2nirfld6rrqqK
0vtfqUZc+p2IdLOgN8NnSiL0/t3h4Q==
=xV1N
-----END PGP SIGNATURE-----

--1Ucd00qPZdK+Pv3F--

