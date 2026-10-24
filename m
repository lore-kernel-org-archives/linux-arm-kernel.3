Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA9F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xO+KnjGk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbwoWAdP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VR4wE0obqEETTnkvc1cZD7oRkkv5XdPKp0vhsRHmEPU=; b=xO+KnjGkfFE4El5T+SwduSuvM8
	bBD36NCxHzMXgvzTvwLffapDJx5+NFon+FGXD0/r0Ax3sw1FVY93LIyArex9fT/kN+4gcjSEl/yxV
	DNzDts94BpruFycq+/pISaN9jhJ6hrHP8cInlT645SovMF8Cn3yd7Dc73QU5yCI0dwsTtCanG2UR3
	luTjBUZ9dfCMbHYnbVqlFQhbgKBMxYwvvDbfkyPIt7DXY9PrrtJvQNZdSWpOuUDzC2WhQI9PMMS65
	i7yOc0i5l4ZyqnK6jhmMO0IOo1/5YJt9lWhNT9If2+NPRqnBOBJZAex6QtBXmTS7QnWjZPsPAaY4W
	SXhxkZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKc0l-00000000DjS-3scH;
	Sat, 24 Oct 2026 13:42:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKc0k-00000000Di4-1fBg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 13:42:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FF91601DE
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8371F031E0
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792849330;
	bh=VR4wE0obqEETTnkvc1cZD7oRkkv5XdPKp0vhsRHmEPU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VbwoWAdP1jav4AQginmjgRlN4qTSlFXGRM6SdLPbsAU1bILpiEGmgDAA9EGFrwGnL
	 TPXJUwpgI0xCf+xr7Qp7+F+xNrj5UyUDYwwSAbBvEoAHVpMbIYqZUGFz+W2ODLq4+Y
	 ocwGO0vgNkShOXPj/9k1UXzs/3GiW0zfZ2YqCZh1Iip2tbSiUfM1JzQu+Dl0jQllhs
	 ZufPdxQ9bFabAx9x7kOmGrCNcEE5X0F1DnBUR7Lhoq85/KhJ4rW0yvQXpuAbIOiKd4
	 g/lbt8NGys8TUM5zh3e1Dy6ChPxghStytGUPhrvoJIr0HpeHm7nRvf1QhvDICvH5WC
	 orDsUHTArXnsw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a772ec8389so11710081fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 06:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzv+b6/skwVVr7xPaQseyRUMtcOCPNe2Hj8oNIC9EKe8AYcNwJG28OSoKl3LtM7HoBoLBErH31QFkI8Z9Ti2KZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLsio7CtTN4godHJsHBmXkQJXlQ5F+pUYVKE8x5F4nkCJZyA5Se
	LNjFusG0XBsrMLF9qcrHXTjfloBfjU2cogsyWM6iZ6zAAMobNnjQRJmZSMHJ579eOskcYXRRSWh
	HFBgGDP6vkHCQGbuLBYz6pfSXRlJe4vg=
X-Received: by 2002:a05:651c:a11c:10b0:3aa:f94b:842e with SMTP id
 38308e7fff4ca-3ac758f2ab8mr1313291fa.23.1792849329124; Sat, 24 Oct 2026
 06:42:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com> <atywVnHU5NsP_gOP@ashevche-desk.local>
In-Reply-To: <atywVnHU5NsP_gOP@ashevche-desk.local>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 22:41:55 +0900
X-Gmail-Original-Message-ID: <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
X-Gm-Features: AclHuK9FDF2lgZeM1hRUmkk4PVa4hWifzNBxVn4_Mwsx2Yyiyx2HnawGxsTc9R8
Message-ID: <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
>
> ...
>
> > > > >       /* Internal 8250 only */
> > > > >       UART_PORT_AIROHA                =3D 124,
> > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > >
> > > > Why? Besides the poorly chosen name, what prevents us from modifyin=
g the
> > > > corresponding parameters at probe time by leaving the one of the ex=
isting
> > > > types?
> > >
> > > The new type was primarily a way to reuse the core's FIFO configurati=
on
> > > table, including the RX trigger mapping. H616 uses thresholds of 1, 6=
4,
> > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4=
, 8
> > > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > >
> > > The core already has get_rxtrig/set_rxtrig callbacks, though. I'll re=
work
> > > this to retain PORT_16550A, supply the H616 FIFO parameters during se=
tup,
> > > and use those callbacks for the correct trigger mapping.
> >
> > Please consider just taking the FIFO size from the DT. On some chips
> > not every UART has the same size FIFO, so we already need to deal with
> > it.
> >
> > Also, FIFO size is a standard UART DT property, though somehow not incl=
uded
> > for dw-uart.
>
> FWIW, it supports all standard properties for UART.
> Check what uart_read_port_properties() does.

Ah, that's nice. I hacked up something [1] in the past to get it to
work, but that was probably before you added the helper. I never got
around to splitting up the commits and sending it out.


ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?=
id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9

