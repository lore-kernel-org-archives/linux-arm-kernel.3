Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434E6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=; b=ejoer3JYOPnd2ejLZ/ffbKDc0j
	0/viT1negxSG9yujVjR5Faki8II2zC+Yh8L3Ws58diRq15rWWkvoIT2XTIS9k6sWJIbpnQcQfv3yz
	w/JKXD/O1M4cqfnCQDqvJpXhGEOVwEF/jtxhf3A/WVF9J5jRCNu7AVvLo7WdbdcaUHtSb3fZ/FH4D
	QDYsiwByNMAII521y/c8p8dGwtkQgl8MjDiYnEDefOihwBZqN9R67/t9vJxXHJqoxQldiNBfmwWie
	lPrJfbiPbDv9nAWND+10h4pbl3iwvWJu2pmkXszygScgNDdTxLrH0fSFWRUwsGocEtXEZpu6QcSVW
	DRkAIwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBwo-0000000Bgcl-2lFk;
	Sun, 10 May 2026 21:44:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBwm-0000000BgcA-2kaM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:44:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso33578845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449462; x=1779054262; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=;
        b=lDFTa1MJhzRPcVOz/sMFJHpLYu3kwDHHwht0mXddW6SpVZDrm8w71xmgt87sqtnO/8
         7ezeLaFLWunFJLOCJh5jU/iOg5Pt1an8kq3zZWPvjjHWDNjnLhHV4lkocfIbyieK0FhQ
         bdZzDAXlsG5iC69PsFu6GYrb1wv4Kp7rTVEuLEozWsgMOnVXEgjVJ6Iz5D3I+CpvIeAM
         tbbwPMpX8jaXdq1QwN+pOmq6vveQE0vLrT4jCpXCpmqmeUoPlXbn9Gx89qRZHzkhjUHf
         eLlWy2eLxU46CMXkpBE+N6BKIsuxsmR4duWn1P6W8NxGhWttsNKq1Geu2dAzzZcYn7xY
         zGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449462; x=1779054262;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=;
        b=hL3uLdq9VlSKOzqvSU/LVe6FNak8pC9R4QlDYs6Wr/xlVh6ydoaHVqRmNldb8K+Ftt
         6Pvy2yhV5uFZdIV+nUEsTJLUHScb33KRA1F9vsFsGtURzrNUKpP6WL1cmW/UhKITtNgK
         OO5+1zi6GO+4x3CyKfjKPe7kGydcv7YAa8uq+avhENdqiGzNgYuaXHxx5Mm9ZtUBYG3n
         tzo5DnXcMxPwZmPBoQ/G0n0iSlwIUdoEs+BPBsv6W9zOEKMJTNIS7JCwmlgxKu+DK1eM
         iY4hebHdWPnG42XUHodEQ6qqRkMDZoMGnILsd2/Se8BH4YwDJ/xOnlSPsfU3c3kaxkpw
         cx8g==
X-Forwarded-Encrypted: i=1; AFNElJ8qmgaNDdGJ/ZL8bOdq6DjJ8sQeSYXUkxwkjtwj/3v4TzJgHf2LppYSxR+27nkz69iuIrRaYuyEdiXz7rkPKPH5@lists.infradead.org
X-Gm-Message-State: AOJu0YwdAU7Z71q9fqR1gKi0MAFRnLrBRp0MOgGYonkVkSmoPkPmCK1E
	mxBgqG8lMoAGKm85SSW289wo/dBWBlKfAzR6ceuTN2v96diXFj9EFTjhpP7uVGVrvXg=
X-Gm-Gg: Acq92OG/cpeiowloAtEW0v1NxcEGe7vodq+Wu+zKQ6K1ZsRHbc3jb3mB1J3NwNLjDMZ
	gctDq3gIbJ1DJFnVwvVJ29myr29hlKMNeRChaiyo7wVXa5U26VRpnVe4wIbRXOMu12aL0p2F1cJ
	r2nC2oLzk+tPX52r+5o6wh+4MOQNW4t6b0CXyYCjgiwQx2DQLDYelkQEW4qh/BOirum6MpfOf82
	prFKISLv6iFS8u+p8JxKYWtGLwRjhxEde5NN7QI28Fuv9ubnPYIbZuAd+s/CzIrsBD2QAG3YQko
	uUwMD5T/byzEQ0xKr/zF4CMnA8tFjC1ptMn102G9U57vXRgzOQLfZlp4zh5Sy5wXKL2syZj8RfO
	w8WM6+cnpXVHBxxppGp+zw5cJsKAyW7d+OVyGZTjara0LXefkRd7KdvNwjjkh2aPtTwWzOTde1W
	212YPE8JxhCjA0Egr6jhnzwLBzKon+nW/ch7swGe2OBkg=
X-Received: by 2002:a05:600c:8b65:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48e706c7e20mr118280775e9.22.1778449462329;
        Sun, 10 May 2026 14:44:22 -0700 (PDT)
Received: from strix.localnet ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7041defesm143551425e9.15.2026.05.10.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:44:21 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 4/4] clk: zte: Introduce a driver for zx297520v3 LSP clocks
 and resets.
Date: Mon, 11 May 2026 00:44:12 +0300
Message-ID: <6334180.lOV4Wx5bFT@strix>
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
References: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
 <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5167878.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_144424_716208_9CCAA9AE 
X-CRM114-Status: GOOD (  11.03  )
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

--nextPart5167878.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:44:12 +0300
Message-ID: <6334180.lOV4Wx5bFT@strix>
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
MIME-Version: 1.0

Am Sonntag, 10. Mai 2026, 22:01:03 Ostafrikanische Zeit schrieben Sie:
> +       static const char * const *parent_names[] = { "mpll_d5", "mpll_d4",
> "mpll_d6", "mpll_d8", +                                                    
> "mpll_d12", "osc26m", "osc32k", "pclk" };

So this obviously doesn't build, and I didn't spot it because the git branch I 
sent this from didn't have the Kconfig options introduced by my other patch 
series. I'll resend, my apologies for the quick v2 spam.

--nextPart5167878.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoA/CwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiS/YQAIf0qPo56nJtvWnvshjI
jYTbtH4/9VEWn+hbTxBWhSKMeLAZrhArnpgzBZKh9eCUkFT+gD8J/qIIPINkWDhk
6fX1PuLkXwdW+MpfdkjontAdN/EZhm3lPeJhIGt3GruUA00eNtpn3iycubfSYcmK
5kMq9z446fozdX66/Oi+TUL2jbXvRlByXqFGznzqZiyd+lolxlnm/Wifzd3Ro7yg
qny8kAsZ0EaW1HiuHKP7SHIFfkSFoeQUIDtpF4i+TIFqqSMb6+SIOa/iXwQtRMgp
rtVRv2XwPPYL6G6dKbDrjJiFThvbarchTCVxXmRsUtXYH87oMy5GKuBzoEed5qwH
ApZH4okVK3eELxsk+Dpu6VYtBftAMpTOWf+87Z+FEJRu0so88yioA1Gw4DJGmuAT
fiV9X4a3B96Z/vtvfFJRHwWIhMaRkwWcoxis8eCtM/6X8DmLQWUHCd8SKZsz45As
tHjztXUMwmC0F1FL1N68CML8a1MUQ6lhGroL5xj9BfJYf9UH6BpoACH9Mi6Xl7YT
d4Lq2qi7CS+8Spqt20uHR9+6bPYkLo3Ks/U79EcSa+QTg2Ug1P+G6QePlGEoeS7X
YAQX5PCivPvMa7mTTw4jnT/3SxZHBd/KDBTpdnahl4QYDXrvxS9T6kKr4dkbzLru
DjFXREbRhcS+D9cuyqvVoOWy
=5+QN
-----END PGP SIGNATURE-----

--nextPart5167878.31r3eYUQgx--




