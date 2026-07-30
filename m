Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899C7C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwVWNRy6nalbM0tK/ypHZd0adndrVP+y49fN+aH/CbI=; b=Y+YHebm9ZzR+S2yVu2LKuOggN0
	1ucBEbkTuKzSHWKgoEdK3UKol7JOS5fSIjvzKrGsUwdZTG4Irzg6NpkMf3UJvS5aReT582z3eJ0PV
	guURrf8/WS+dqEsmRpg8Q5VTjpJQwLUaIuF49oA2D0vdiYA1VsbtEOxZLJ+mHXYbxoY1hTn82q80P
	jts7TypMaskqy5IUisxZYanUIzImOrz93z5aZkohVFUJEoPg3krpxbvZavw6pGx8pvliZhiEchGIc
	vKHaHCr2PTe9YQVIz55c0diSttfO+B4LmCtDI/tkYVheD7fVzQbm7yeF9ydsPfzDj52Rd8VvbIprC
	AwxYae+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWnv-0000000BHC4-1V8c;
	Thu, 30 Jul 2026 19:52:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWns-0000000BHBV-1aa5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:52:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f7854678bso49259f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785441146; x=1786045946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vwVWNRy6nalbM0tK/ypHZd0adndrVP+y49fN+aH/CbI=;
        b=TGrGR3IU8TA2Plk3GAlk5I0MBKrgud8S051F7TC9DrQKLpIF5CSsu7yTNlr5UM1VMb
         679eZ6fzMyj5kItmF7b3qZ9lfEUSk0BUIfYFfR6ySpg3Cb04h3zWAr7kHRmhtCbD+nCi
         GX1sSFL2aAXlTS+9ZhBXhoqMtYWy5rOlm1qZ2EpG/YGvS+SNJ8LK7T+sOBv3hkZTo2pk
         /HixIn7LD9hXyzcI9ztkfQ1hBDmZT+H/JK4+ghgYyOhVj9JuRPEygHqBs9Qh/MXTVXmQ
         X+/qc460UEVhwRn8ycUmuQzWgmwBAmm48330aJzgwC2xKXnA08tEqvGIUf/ZRVyLmRgK
         p8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441146; x=1786045946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwVWNRy6nalbM0tK/ypHZd0adndrVP+y49fN+aH/CbI=;
        b=FeWwOvbljzm5SwS1QX/wTln2aDJ8RZYYrk22djwN+Zi4sFU9nhKmP/HXRN+0q5SwtT
         wVNFZysroCR2J8rBfvDnHOfXBDcZw3VOD8zYHZf+EQ8/ORoaqBYk32z4eNn2z/CIun7M
         VYQYkMCxfRO45jKArFIbHt1HUhIlpaf/PEmy3yKadWTGdWGOVOAUVG8ln3124BkB4QrD
         TQvOrsdGGdnj5r86JhQjz0LFZ4kYDq+eZsuQxuGVyVnNfpQ02GP4g5rZAH6r/kSxDCNR
         0VUw/YbriD08Ee6BFUKbRst6ll0+MnaFkUeeVig9QaxkzE+UAqRlQiMJXdq5AzAWprNU
         eZtw==
X-Forwarded-Encrypted: i=1; AHgh+RqxMi2v3gwWumLzRS8CAlJ+RwYswIlE6LE+6Wt20rBOykdDrnXRM1wozG1m77PjSwwNLnMVkym1YkfzoYGezOQn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz15dSsBun4vnE1SSla4XFkgP5uOXWaMzDUlF7KGIn0hr+n4x93
	m5iCs4x9KXfTCsUSLoa2AFXz0PLackKmkgXT2FMwaz8gr1np3x6O+SzLg13ha7youm8=
X-Gm-Gg: AR+sD12tJegmXUkibUVGz6xpJQsTabay3m0FaRleu46oKqSygKkfWb2HUh4kwIcFVya
	iJR4J2k4wC6hDf09VqdUXNGTc3v+foOMJj13yxfxo7IbMau4saWM0h2F3CPUEE5Qcf1A09nQUa2
	rw7VTT94u+YvEHvzihajLOIVxBzJMwMbENLmE5lgID7MZwfUdsdXfpPH+yCrpZAvGulmAytTyCi
	8aKaz1XnBdPc2ACJApN2ovSTPsCWt9H4JfZxLBIO6vj/risiIzd8SB7auHB9ZXhHUGxoOo2NAg+
	GV/tdjJHQ8ycEbu4JXqaN11o4qKDjlshpG/AjpAZevDVhSi55fSU7npK/TBZHes/cw0B7CYTnhr
	0531SoghPXWngiX7kklnUibxQtrd5N0pjO714pUCLBO5AdKXcdzsdRB3q8aPPM7DYVjz4NYbTlZ
	/aNANluyCGRsk7To5/bCt3mlNiNz2joKsg0IfPiYHgfVFzaWx87nKfDMJTGKQoNYiF0mvbsZBhy
	rx3AQ==
X-Received: by 2002:a05:6000:4383:b0:47f:9254:d45c with SMTP id ffacd0b85a97d-47fc82305a5mr6432813f8f.31.1785441146101;
        Thu, 30 Jul 2026 12:52:26 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fc892cc3asm9575726f8f.23.2026.07.30.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:52:25 -0700 (PDT)
Date: Thu, 30 Jul 2026 21:52:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Conall O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3 3/6] iio: adc: xilinx-xadc: Split driver into core and
 platform files
Message-ID: <amuqm5qdzXqKutPS@monoceros>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
 <20260729125455.95893-4-DileepKumar.Nagavarapu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5ow5tkqlkhhbeq5"
Content-Disposition: inline
In-Reply-To: <20260729125455.95893-4-DileepKumar.Nagavarapu@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_125228_715385_774E589C 
X-CRM114-Status: GOOD (  11.09  )
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


--b5ow5tkqlkhhbeq5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/6] iio: adc: xilinx-xadc: Split driver into core and
 platform files
MIME-Version: 1.0

Hello,

On Wed, Jul 29, 2026 at 06:24:52PM +0530, Dileep Kumar Nagavarapu wrote:
> @@ -19,21 +19,13 @@
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

I wonder why so many people recently add <linux/mod_devicetable.h> in
their patches. Is there some tool that suggests that?

Anyhow: Please don't. <linux/platform_device.h> is already enough to get
of_device_id (which is the only *_device_id this driver is using unless
I missed something).

linux/mod_devicetable.h will hopefully go away soon, so each patch
adding an #include for it is annoying.

Best regards
Uwe

--b5ow5tkqlkhhbeq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmprq3UACgkQj4D7WH0S
/k483wf+OGssOXqZyZNhVlMbxIFkvol7gw7dRZpH+FLGCwaz+YoZOShc6uF/dy0R
toxrO3NuL6fqemrQygPUT7CDqUxs2H+fpREr6fqwxp28MDtOMojPvp98Hz3WkGsy
32ONJaOn6e/cqTNYeRBts9+710rveP80zM5/iO5Hl2srSXemwjlip72uWRymUdme
lJLVrZbJJMTt2zVeJIfx0HrstM+ZeG8BnU0+oTSoUaFkfVRbeyJYqmifZ6Y/jtB2
gaTmouQCp47MEEUcEmXHf3tJ2o4Dt576bsXp3x++/XW3KCYvHgA+HRkgLWjZ1QNz
TfvUbzG14aw7+PZE5PzAT3zdD16KaQ==
=rINs
-----END PGP SIGNATURE-----

--b5ow5tkqlkhhbeq5--

