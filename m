Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hPUIy/rK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNn8gBxI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SjVSzXWCLx+Jjtey5wy5TTeQi34u7lMXmhE20s/yWMM=; b=hPUIy/rKKkU9IZ
	HxJXepE/bNjjiuEv/b0AZJ+jUeR6BBAbukFXlayVdOHLBUDmlHbS7b4LkeTwI1xWCfQEUG6p4tnLH
	3/hWYmkbhtacvWlsSQYigQFAzhY4wojZw2IjoLa9hP+sLwRhRnz6pEMfE/blqRyMpa9ElM9eStz3V
	xXQm/pnb8T+2HCaZqT2pfP8nbpHufvYJ4o9ErJSze52zXLfYycYnZCyl4MY/w1ebAPewtKKxN7pSc
	SG+DiiAlF1s3+FNk+l1F4COyOrYxoUY7h88JeY/5z5IgagVopTp92NcDGceIIxt2E7nlZZt9KxmTz
	SvEFOpJAATffA+TjBM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEcs-0000000BU9E-228w;
	Fri, 06 Nov 2026 07:44:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEcq-0000000BU8s-1diD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:44:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C716C43F34
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 07:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0251F008BD
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793951079;
	bh=SjVSzXWCLx+Jjtey5wy5TTeQi34u7lMXmhE20s/yWMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jNn8gBxICYDAbumbHASNtUJNAGZaLnMzXaQakplDv1+8hPEpLanYzmowHaqYIGsdI
	 1z1PkWmAUzIT8ZLe52KxnaXhQCarXpC7D/sJrZDPQ68Vnz7BZb8CigcFC4Wp6DNuWe
	 bMOFNB1d9g1e4rKUYE1Tj/tEZ/dEP6n0iTcQI4+3YMxYi2B5+c3cBMIZDn1dLPJQa3
	 mgw9ut8GdEr7gD3oPWoi9t+M5eaPAryKofexTfas+Wh0lRBnEcWJcc4a2aBcMWopZi
	 8y8C1MKmgn1dKlZUoO/LFE1FUoJ4l5bG+QzbEB6cYCbG6mS7mkXZyqp137Ga4SfoEi
	 By8LfhrBTlYHw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso270920e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 23:44:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz5wFdCsqOzgFtZyP4WNmz8Rd8v1E8I7/2mC81Av9ND8+ri5K4lBCG8z6Mlubg3rHe55I3Kr/PNyR8huSA2t76s@lists.infradead.org
X-Gm-Message-State: APuU4Z+qKmUbGgyNIGEET5dbucTHoytqGH/TOClFS1UIY5wi9wbTaRVb
	VA0g1mIXZc763WB2wGZFORrahtGAIR29A5K26zUPWUeiQCq8aXTpKLncdDPtfcU75FSp1w5k5q9
	bLPjAZs5ZNmllsfok6Si1+Hq6pmsK28k=
X-Received: by 2002:a05:6512:12c9:b0:5bf:b603:365d with SMTP id
 2adb3069b0e04-5c003a8ded4mr513982e87.10.1793951078173; Thu, 05 Nov 2026
 23:44:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-6-455fe9eed5ee@kernel.org> <b65ef6c6-cbcf-4793-9ba1-7c5cb270f574@roeck-us.net>
In-Reply-To: <b65ef6c6-cbcf-4793-9ba1-7c5cb270f574@roeck-us.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 08:44:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLm0patDC0Vh7sh3Mr214zaF3HFDoc8y=dHVs-gQePHa3g@mail.gmail.com>
X-Gm-Features: AclHuK-ug9wMfHMkul6is-bHRohYb321IdFcWEC09gms_v_lOAueeEGxhDLccag
Message-ID: <CAD++jLm0patDC0Vh7sh3Mr214zaF3HFDoc8y=dHVs-gQePHa3g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add Broadcom PMB PVTMON monitoring
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 4:06=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
> On 11/1/26 14:14, Linus Walleij wrote:

> > Expose the BCM6846 die temperature and seven voltage inputs through
> > hwmon using the shared Processor Monitor Bus (PMB) regmap.
> >
> > Register the temperature channel with the thermal framework so
> > existing zero-cell device-tree thermal sensor references work.
> >
> > Poll for valid samples with a bounded timeout, releasing the PMB lock
> > between reads. Report temperature in millidegrees Celsius, including
> > negative values, and voltages in millivolts.
> >
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> Please let me know if you want me to take this patch through
> the hwmon subsystem.

Thanks G=C3=BCnther!

I think it's best to take all through an MFD immutable branch as
is custom with these all-or-nothing drivers.

Yours,
Linus Walleij

