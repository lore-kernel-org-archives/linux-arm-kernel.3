Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463F2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WjWPotVh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdABaKXz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3I1uuTK8iNGnY6KeDyQT2SJpiIheh8weAr6k39okB38=; b=WjWPotVhWUjjKV
	Z/CBf9PGZa86JCCCgBVdFE5+R5qDKpWfDEankW6GQ6FfzaBMSEFCqOk5tQ52hIU8Y63yDbySdgLNB
	CSJYwJSVNLU6Cgk8iFg5eHtDDA3y9j5ouxiwnAnAdPEqZ+QRZClhh0Kcf6avIgBTqmFddE31Vvjp+
	5/DVrA24fB/lq6mT5D8U4wZ9dLsotG4k03d7N9V95WTKlpVvXqtrJ7i1LvINoQv3Rs3/DLWm/2xU4
	5g2ZCEFUVsriYfod/wOcHKuh12nlhsl0mDH+WDmQkMmkjEbxkq2WYHc/NzVNOIFPHnaKb9JneQ9rQ
	wMoDyk02+9pPy9x/7f9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnWR-0000000FsmZ-1Yx8;
	Mon, 02 Nov 2026 08:36:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnWN-0000000FsmN-1xlv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:36:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E242944530
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 08:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8E51F00A22
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608562;
	bh=3I1uuTK8iNGnY6KeDyQT2SJpiIheh8weAr6k39okB38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hdABaKXzq0B4SwXeyHCCqSwSU3vJyC+ldceFfAJyMRZWrIBdsakGPUYRfdxQx/ypE
	 Lpg/33AhBWlgmr8oRRige0T+yKHd9hK5JoTEkn8Nx9Asi3ZpDFHYK0BIrUEdlyvbDa
	 L2+50CwShXR8ZwouotMTjvXXhPAy9RUeoCDKiBtVGL+gHclt7+pjxliMQHFJy3n52H
	 NCmyMKf7GHzRDKoyAKBewfsj520ZY9JXITED0b6Sb+RDozE0fdFnMjRSCij9e88nPV
	 qVGT0UON20kxht6fzLa/EcWlJOCQ16jZ7lXpXxUmAkx54mZv9+JbOjUG6xQDZBDYVS
	 6t6li/Ov/DBIw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so1877444e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 00:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwTlI9vANSaK24vMJ3/PgHn2XxhhsinT8CDY3d74lKppC4eYA8D18WokFI6ghfmnCodsf+ewokXAcgFExf0LDW4@lists.infradead.org
X-Gm-Message-State: APuU4Z9VDiuuH+KvlFKsGUJnVGGXVyQeapVF1yU5oPyDb5jbAVbI9o4X
	klRXuRGBuW3gGgq06MSoJnFWzWHf9cVQwB9sn/yDW99TSTt8hMCogCMcE2BWoxZl5hHy300acbu
	Vz7nI1xxpMcnEK8br8lAT/3VomB0COZM=
X-Received: by 2002:a05:6512:131c:b0:5bf:d10a:f36 with SMTP id
 2adb3069b0e04-5bfd9587203mr3108280e87.33.1793608561349; Mon, 02 Nov 2026
 00:36:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com> <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
In-Reply-To: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 09:35:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSaQvhb88T-Htbxo5Zraw-rWExtwd+xyKeh_e_nx6vcw@mail.gmail.com>
X-Gm-Features: AclHuK9G3q47tXvjcobM5d9UVt8ByEn8Or5PP0D0xsQOLYPH6bGFA6p8ZVR0NF4
Message-ID: <CAD++jLmSaQvhb88T-Htbxo5Zraw-rWExtwd+xyKeh_e_nx6vcw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: William Zhang <william.zhang@broadcom.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
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

On Mon, Nov 2, 2026 at 8:50=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broad=
com.com> wrote:
>
> > > Inside the PMC is the PMB, the processor monitor bus. This bridges
>
> > Should have pointed this out last time.  PMB: Power Management Bus
>
> I think you did point it out, I just didn't manage to change it everywher=
e,
> hopefully I only missed this one...

Ah no, it was the PMC3 I corrected. OK fixed this everywhere now
for v3, thanks William!

Yours,
Linus Walleij

