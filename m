Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFCED609DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12DqePLKoTrEy4MFBKf2pq2QIO8hf39o64WQAb2Jn8w=; b=o60/gTNf+V8QhQdJZpz3bsGqtt
	hXwVCyceJNxJbKojQ4b1OqceyyAZEkXRXyZMw01saEkgy3myjD6ZLMNtVbzo9kXW0lgrGwpBB863F
	lNgmc6fPeuabphC7In1M9dn5gSNFERMfBx9vKZ4LDZoEghj8HXwq9N0DB5Gjxjn3H3430R20Xfn4I
	kGhwEFonEEyjpFLm6DspS2NbW/YgEtlSM4e+F+TjTePYIEeTHAA/aTw/J2AmP6An7xOlwf1ft2WML
	58qifHemIzUvbzb5i/1uFm6yj9TXQNdj8wv8lqMKBT8SiBa775vI2cgaVPSjrB7VdCzgtM9LAFpIu
	EnIDyBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG9H-0000000D0GX-2dqf;
	Wed, 27 Nov 2024 11:23:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG1v-0000000CyZa-1LAW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=12Dq
	ePLKoTrEy4MFBKf2pq2QIO8hf39o64WQAb2Jn8w=; b=CdtAx3KB0YICFDFVfczE
	4JUiYove8hph0vLsd7cIgmSUVQ+pr+9AoP41cqJHm+SsNM3lvPdNimaJOBFD9oSM
	H4CoVY6deMuSbMAd+6wiQ9CCGhSgQgvg74txg9RB3uSKqgQAKBg0JmQPIgfpUBsI
	YnAfUy7D1LChHIKnSabgTcywPNL1py9dTZdHOmDj2Fd+RUkk3sC5Ag2DnAFewOXn
	yn7nEGSFSUHEKFYhQPm1bHZVl5jZXPjnSe0ovLcfltTFHiUgHYviFDxn17jM1gel
	Fxj6ic1I5bbDlpYz0ATLWSQIpuhTFklXtxOHShGNbB4426S9gEHtjkgHlXG+lV55
	+w==
Received: (qmail 533524 invoked from network); 27 Nov 2024 12:16:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Nov 2024 12:16:16 +0100
X-UD-Smtp-Session: l3s3148p1@hlggGOMnatMujntz
Date: Wed, 27 Nov 2024 12:16:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wolfram Sang <wsa@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v11 0/7] platform/chrome: Introduce DT hardware prober
Message-ID: <Z0b_f0gg9KgSozPH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Wolfram Sang <wsa@kernel.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HQnyox1fdhJ456xp"
Content-Disposition: inline
In-Reply-To: <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031623_622094_213173C4 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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


--HQnyox1fdhJ456xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just checking in. I just wanted to make sure that this is still on
> track for v6.13-rc1.

Eeeks, not only Andi was so busy that he lost track of patches. Please
accept my apologies, I was under the impression that this series was
still under discussion. I sadly missed that it was ready for prime time.

That being said, I applied it now and will send it to Linus by the end
of the week. Sadly, this series was not exposed to -next before, so I
hope a few days of -next will work for him.

But I will surely try. Sorry again!


--HQnyox1fdhJ456xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdG/3wACgkQFA3kzBSg
KbaO8Q//YQ/9g1dt8JdYH661u4RqF4lC38vtKoaZJEADzExdg71xeJQx5nw4Ucg7
wdvlvIVqq2quH31KM5oOz04t7bglWhsqGlLUUG5CAe3W55tjNpJYgBEnBQs+9ylf
VdxC/3js3Z2K07RQmCiCGDZuyF7eLkc0AOYrWg6vnGKpnZWO8aTsDRSe6XsDXFPF
saOY5F3nwjwpoOmUT/qY2ezh/Cls0qClCdXbvoSj5p6+XHcRObtGuMBCSdiYo9uU
Ec+25hpHSYChlEA0PdlXzw2jObBfp0fOUNWBqadOgAuYsLwK02jI90fvhymPRsiM
HJD8H1L2oulpK3VayJtRhjQowUW3UrdcdleoOwq91TY32vrlZ6SDtO/C8WphUqT+
ORaJHqIeBZSW2nwAXBOepoid1JR2pPYiEWZ02kfaKvG0g/sMFoHyXV9OB9GAWyRT
hNQPXZBFS0LV+6J7pIzmxjXxugwrTnI7AWJlGHGjxYxjc42Y9C8H7H8JfkadRuAW
w3wcqoPXRJUZsg3GZHBCwIDYtXgr3q7J2iwDPe5h/cDFE5CbtsCL8O8iV9NNqrjF
T928c/gxQjsRotHFRUBfihhIia/M2zLB8M6Rq+KRzaCCy78UiZkRhiDinstbzlki
sI0XLrvQAEQVgoJNDsr7K2orxIcijqjlZ0k6pqNf4roXjJJ8Hxc=
=h8vf
-----END PGP SIGNATURE-----

--HQnyox1fdhJ456xp--

