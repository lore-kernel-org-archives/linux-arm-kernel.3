Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B2CFD316
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xAznBhU7b6p8zrOxLbtkgNtB3cV8Rju+4Nj3dJJodo=; b=m3W4IGKEJL1wvsiJiqHIARzsN+
	D86teW2usrLr9uiqvwV1ZHzWGI5g9EbH5ot7rj1qep75id2nFg9SNBj7HtGU+qvI9wxCJCRsQvdSg
	qhZsR7FkfjKca2b0N16DjMzABDO/HvYbXZwHD8QjbWwkYll8QTB96QWkFKxkbTZyie2UK//VF8R98
	+Kkw5U4MoBTPcDs2sG8LbHLkSv1IJtK5PJ0qjN5G7khwfOAysxjxjMxdrTHNWiJ1JIFIUWtRxk/fM
	KvZIeps7mg3itC0GkcwBomo+jJnk6woDdCDEgwPZB3JyJY4gWiQllEY7oizwzF75pHFl2B0axE5D9
	EkeVsZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIYP-0000000Ajqs-1MiY;
	Sun, 23 Nov 2025 22:27:33 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIYM-0000000AjqM-2bXG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 22:27:32 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 953B51C00AB; Sun, 23 Nov 2025 23:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763936843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xAznBhU7b6p8zrOxLbtkgNtB3cV8Rju+4Nj3dJJodo=;
	b=eZctvz/AuXpRgwETlv1Z76brt46sfWxyZhJzJJYhqbkkreqWfOEmZbhoFcyVgHOka59Cq9
	khR5WEhVnzLBx/wPiaxlkz9oI2vkUApME9IEhexQqCfe8IFDTerizsPYYCji2GnTplKXqw
	XrwAHnIJkkD0x55zUhov5YKJb4YpzDQ=
Date: Sun, 23 Nov 2025 23:27:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and
 mustang boards
Message-ID: <aSOKS35/huSWd/RW@duo.ucw.cz>
References: <20251111192422.4180216-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YeGGzS8kR2qSk1N0"
Content-Disposition: inline
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_142730_951446_26401F26 
X-CRM114-Status: GOOD (  11.72  )
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


--YeGGzS8kR2qSk1N0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series adds barebones device trees for Pixel 10 (frankel), Pixel
> 10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
> bootloader these can boot to a UART command prompt from an initramfs.

Well, booting to full system with working cameras would be nicer, but
this is good start. Do you plan / do you have resources for full
support in some reasonable timeframe?=20

Please cc phone-devel@vger with phone related patches.

And... thanks! :-).

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--YeGGzS8kR2qSk1N0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSOKSwAKCRAw5/Bqldv6
8sPoAJ9cO3b8E0fHRQKhJnNaeZSI9nez0QCcDEiBnY8VsCk6Oi+ran/TdVPmbIw=
=DqOt
-----END PGP SIGNATURE-----

--YeGGzS8kR2qSk1N0--

