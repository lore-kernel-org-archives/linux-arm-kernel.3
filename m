Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qMSHnuoT;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aJtvb4/C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=; b=qMSHnuoTHvZARluAUyrON0yPUW
	ERfztvPh/FkeGEIyA5vFVNQ0nj0LEk2G1AauE4LG5qMRpNZCAXJRTYp1Qrc0NKAXeIPJ7Nc/6KoUu
	NBY4VkTP27LDYGNeRNA0m0Hq/JX2WiYq+WWxa6jhXVq/yX19z0YrQ930wzqy01CEEe4bUKtWnDuX9
	yiqNtsILmoXAtZflJ7FZg0aZVmqXbMaaiaYdP09IugGFcdGU2xLG4VPVg46jqmeuuMzvJnWh5BK5U
	A8j+IwPWZI4qs3IlZENeCSGcrW2xEv1ihhaL5pfyEZRVpcj69p/2tezqpV/LPqS5QxPbdcFHZ880m
	qHvkdxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxQ-00000009BRI-0TCv;
	Thu, 05 Nov 2026 13:56:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxN-00000009BQP-3G78
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:56:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e20edd106so1355181f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887004; x=1794491804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=aJtvb4/CMh2ZUTvOuJyAm6HZkM4c9lhnF9MYMOlLpJAaabZp4ictRdHBxR28u4nkqX
         YMVseMaZOrUe2qZp6Vy9a4VCYIbJuV1xqD2qSd/LQhpGMsMb/dFbgN615+Wey0k9z935
         pukrSOb9DhIilNQLt0ljxwZC8sUI/+x5Skr0NNFLWulastmrWpyMY1/TG+6WaInKWqBW
         urlI/FiSWqbbS9XJELSdbxBEDGPDmPOs2TvBPsebpROQak6uGoGz+6KQAUhANyGncMJ9
         R1HthwMHM59/P/2JKGAxPyBwT0tcW7cbtr9qZoacFicjmZ0JgyKxDJbTCpHFdZ6eGHUq
         P/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887004; x=1794491804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=akogQBYGyv8qKaoj0T6CGtmiOKH9aPniKQQ29IV65wji7twN5MnQSesmGJYEsSBl2t
         hyEWGHa3kplxTzuCP7PkXtoCeoNn4fjes9sqS/T3pjCLNNa4FWTTjbftuEb0UdMfp1xl
         65ksJk5vW7Kj6HmtAv6WgKitekBGkL4qeQ/ixlDJguzWBHhDI0KVODfzXSNYRAaf3I/y
         JLcl8kceE2K6khiMu6XRt+WjgtCNnj0y3BCdbRRnaGJFJ72MnxUVlLhPUdtWFXB9X6O1
         9VPAYpj72GHvo2tOEl7i8PYy7BvcmmbZytotAuQVjIobJD2zPrI2TPMt+4+L4LnPDHD9
         oE/w==
X-Forwarded-Encrypted: i=1; AKwUvBxpMNfxS/LwqLgREJlvTEXA/OMjTzu27mVhSKcoj23zjXtCi9vi/licS1wK6xvB1glyQTmcZ0hrqkV9XxlqcHCR@lists.infradead.org
X-Gm-Message-State: APuU4Z82fmN24nRs0E1MNvHJGMuwokmJuDa0GewkflxOr1v+II2A3M5Z
	XUNspCB56tgfzfbSox+HZ/ChYjwL5YfymWMkn+wGjr+29vRc42Xf/8Y1VRpITJ1XPYE=
X-Gm-Gg: AYBFou09/okxxoQeL6lupXf57PvLAJR7iJMskELxX0cRawl/pKu9j662M+qgQALkd1u
	HGS9JzO8WlEINNxvy4f0G4MPhDGCI0iBggqzoUUCjqk8JEFl/s7yQaRDQ/PENStCq5F3StoXieV
	MExsfeOrRDeHCqWlpelpnyga6CXu+qirRZXQjHef0aW1e8x1I+r0pkxaWDemE5iRMTB2fEIHodp
	feH9C5WbWYrXDLTCGGnk+AK9bEVhkqGER0IdSQSrnR+cxFytANHycOpaDIjWYlJJd7P74oyavjM
	gxbimSoI1jN482X6Qc6kAq88keUdvdXPomCZR3D1Ws5YTMo7i/M+N62Joh+eAe8qgbB4aqmgvU7
	38N6XgVGd/P/W5jkOIRbbiJwbQzdYepZGdShVbx5arwz27sbmzM5yvcjyFD4A/unuxg5X8yCoIZ
	4sel5ZO3plC2vhh+J/2+kVREQRv5NeaTtwwNspefqcrxdCSXF+654zphgUM+L6N9sFjTeQwEttJ
	yxhK26KZDdVv5SfdvDALqFCsE7JN89mowwQLF6N3SAJIg/yRrqPRmebJDj1KDP9SmgJHLxPAbT4
	eY+H8YGYA+z1cXWQaqPdpDXAoGHp
X-Received: by 2002:a05:6000:25f0:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-48e6e2e75b0mr38836163f8f.14.1793887003590;
        Thu, 05 Nov 2026 05:56:43 -0800 (PST)
Received: from localhost ([194.213.108.7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48feda20567sm10969363f8f.51.2026.11.05.05.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:56:42 -0800 (PST)
Date: Thu, 5 Nov 2026 14:56:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
Message-ID: <auyKnmpiL7ZSJkgs@monoceros>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2v5unmaqs7i3rrwd"
Content-Disposition: inline
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055645_831998_A8EFAE84 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--2v5unmaqs7i3rrwd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 06:00:58AM -0800, Akhila Kavi wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it pulls in a lot of
unneeded dependencies.
<linux/platform_device.h> already provides of_device_id so you can just
drop it. Alternatively if you want to go full iwyu, include
<linux/device-id/of.h> instead.

Best regards
Uwe

--2v5unmaqs7i3rrwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsixQACgkQj4D7WH0S
/k68lAf/S7Au5tx54BaHhFIyr9rnWPJhc+OMWG/KaFglaxrdG2WQeAImkDXsQr88
Akm6VVPKYQBh50KUi2muuoNafteiCwHcq9JtSo2+R9q/d75TDEKggJICOxF7DYzs
wTbn+hGwOmxGwHjpR0nNW8uQWUyIhk0irXV3NsQkMhikal9x5T8XOesQJnoZA3bT
UEzoa1NXgZD0o4T+sQSLjMueCbC8OkC7GrhuMqiNG6OzWo42mecP4cY4li4MxjqP
rFj3ymSSJzaGlEtZoe9+m0986qi8/JUOkyh26I1QR8xsjKpq194Y55T4uLnlklID
EsuWtThrtvbozh5Kxnz8O9aFUEb1xw==
=onVy
-----END PGP SIGNATURE-----

--2v5unmaqs7i3rrwd--

