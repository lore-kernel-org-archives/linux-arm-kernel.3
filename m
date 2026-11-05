Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B66606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fgz1m6Xi;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEIc2vgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uWZDC+jKR50KkuL/m90FaOZS23uCXLeIovjpwO7U69c=; b=Fgz1m6XiNfoNG8
	T8xCCcHkPe9wnpadERVhjkbxeslAUwt0ppfKUeMrNQXiD/NvwN5m1eeKpD7srP+AIx0PsaOfk9KBU
	JF8axqj9OS1gClBm4hpxoYJ+6frDxSR8ZvdJEBhrgMhECJd33eKXde5w/4uj1oY1Kb8kAEGC0RBH0
	9aSMhaIqtdJp+kiWlFna+OtqpxuuahAeLC9mdjDd3Fa6hqvu5fLUHg4tDwxIsa8uN4KirntMgaTf5
	2uY/S9D1iXK+HnwH0VH1mW4Tkwin4YhlhIr8DzGQbm/EyNw3xN4y8S7HSoA7nbhv66I6UEn0g+TgQ
	p2U5BiC7Hvc7Gx+RT4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy9k-00000009DP8-0j2F;
	Thu, 05 Nov 2026 14:09:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy9h-00000009DOj-3cR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:09:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 382C743D65
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 14:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4E31F000C1
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887769;
	bh=uWZDC+jKR50KkuL/m90FaOZS23uCXLeIovjpwO7U69c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gEIc2vgXojaI7fLQe2A1eMM5vENRX6IJ9jAXk4+aXPqJGYuaF7IslkQbHL19df884
	 ogA2YlzVBJKq2xnUxIwT1vmileZSCUoP1Nb4OgxAHNwO2RzJsk9lTMbvDwDc5fgHQl
	 ZiHGw3Z578ERPzNkl7ZstfGTIRDC1lITQD9Z7NoTSmkKtWwmz76no80L39/9Tdn4fH
	 CE3/T5QKcatW/sO/NVg2JBzw13sqs0aJxutYOy0W7YD7OcZUXpXGOATS397JiaKLRj
	 5Zw+lrJk41UK6dR4VxKg6dzeNJFlI9s+G+G5QwR7JUL2GXg4d3Iw2VVKl9RlldTTqF
	 OFNr/26fZ/2Tg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so14954481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:09:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByChkUedwXyok3I9k18S63bVHlDj/yEE1/s/vv2L91YMCwvOlc6OI3b2w6mthdWVdzbtB9KOs/8K6roqZ5eQDBE@lists.infradead.org
X-Gm-Message-State: APuU4Z+thFJubdsDVf7v84fI7S5dQ5X1ft/HleqdltexD/34QGDGD7cT
	QgG2UGYXWczNvARyhtlFs/2qiIJbZnfbtJqWPzxGpwkE+Q3JSh5iDi99Qn/yGEEceRBXnEe/MBG
	hw7MXNQFjIKBxcUogK+1xIrEQ3XpwbfM=
X-Received: by 2002:a05:6512:688b:20b0:5bf:e4e6:7f78 with SMTP id
 2adb3069b0e04-5bfe4e68c03mr2949831e87.39.1793887767615; Thu, 05 Nov 2026
 06:09:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org> <340843f896db387a7c3ff4d6a06ef7c2155d1f98.camel@pengutronix.de>
In-Reply-To: <340843f896db387a7c3ff4d6a06ef7c2155d1f98.camel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 15:09:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=sYc2_Pj5k-5d4QqcqNpFjQkcTKJFv4oDhXCHo9kymSw@mail.gmail.com>
X-Gm-Features: AclHuK-xb4f0QrVUB5hiQs77kNWFtdOJD63XyBZhuUtDoapdcW_U4E9f6qqA4pg
Message-ID: <CAD++jL=sYc2_Pj5k-5d4QqcqNpFjQkcTKJFv4oDhXCHo9kymSw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] reset: Add BCMBCA block resets through the PMB
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 12:28=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:

> > +     unsigned int i, zone;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(power); i++) {
> > +             for (zone =3D 0; zone < power[i].zones; zone++) {
> > +                     ret =3D bcm6846_power_on_zone(rst, power[i].devic=
e, zone);
> > +                     if (ret) {
> > +                             dev_err(rst->rcdev.dev,
> > +                                     "XRDP power-up failed at PMB bus =
1 device %u zone %u: %d\n",
> > +                                     power[i].device, zone, ret);
> > +                             bcmbca_pmb_reset_cleanup(rst, group);
> > +                             return ret;
> > +                     }
> > +             }
> > +     }
>
> This doesn't look like it belongs in the reset controller driver.
> Are these power domains?

Indeed.

I was trying several times to restrict the scope of the MFD subdrivers
but they have this tendency to all require each other so I'll just bite the
bullet and implement the power domains too :D

I'll fix the rest of the review comments.

Yours,
Linus Walleij

