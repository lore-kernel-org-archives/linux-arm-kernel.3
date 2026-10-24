Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45567606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=teRruQ10;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIaRE0t0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=77L0zCZoOr1z13ZaKANU7WNCtV3LEiZYs/dClJg+u74=; b=teRruQ10e1BAlHtQbBFJYAbEc8
	5Y3RFbVlXfPTnLB46wT1tRkTXfgHM7UgBaGQpRJPMdrEbOzFVzYT8XqhsrCXshn3VySXthulMQBPY
	uBDch33lQyaCRbkvnBi8r0Yz1Xlrauq0AwPvHpr4YSWmGZ2un84Mz+ZxLNJHY2sGNjARgwFy3C0l7
	fRBkyg1T5WH0XZErmOVxwKgaeUWqH/CZCfbOioGQSwfqU20tYPaMoog17eli5XzXQO1ov0gzfLP+w
	b7wa+1lb46AeeZcCsoA/MfaH5FLgEgIHZb31b3Am4G/U+ctgIaRBs9joMH43kzJD5AMPluJ1HHsPS
	MECcXSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKcSW-00000000F4u-2MqN;
	Sat, 24 Oct 2026 14:10:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKcSV-00000000F4b-2v6h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 14:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 084CB43E74
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 14:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEF31F031E5
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792851054;
	bh=77L0zCZoOr1z13ZaKANU7WNCtV3LEiZYs/dClJg+u74=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DIaRE0t0eLJ9ts/KqrWBjMZ1wNMZ9fLyQsiIWTchL+W20YM+JKio8qPKaHTCEpqMX
	 O0gq2uu+G2hu6q3F3RGhtbcvimgiG0kaPv8lh+QGNoev8VRS7RWoEHOrraL9F3tZ2V
	 oqMkAnDSU4aZ7RHk+8Yl8Y5nGBDK9DGO+PkY2j+roB+cF0PBOppVgt+NEoqgmzSwU+
	 d0UnAXejbYGWn08Cui262kFQZh45e/3LbZ7b0TSYOa5LZP3W/gALk6Io8IaIe+xDOR
	 kPBN0dZmK7k5r3jvaVFFXOma8qDx6QcsaSd1lYqrW3p1wtXtZLfF9rJqV2IGa6jtPK
	 KrXI9RqzvR55w==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so17383331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 07:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcOtvJmj4hRTDfmMmCyC8XNA5XTbezyTc/Wj+obGQrzIgOYGdpiaOTCh6/2AncVOlKwhFQhtnZeyCr4MQiSR2r@lists.infradead.org
X-Gm-Message-State: AFq9FYKj1hML6wpnTxcwacslJyAbkXyRAbLX4tU5dXJAK1ZILGgT3nUO
	4BYcVBjA1fNblaPRkyRrq9UCF3rURLQDlH2kvEZTtkWn53QqlP2FejKLzHGyDVjfyiMpTdXUapw
	desdqfyiGTzXiSfWDt8/Fl3jGJYCgtdU=
X-Received: by 2002:a05:651c:b1f:b0:3a5:e792:2dc8 with SMTP id
 38308e7fff4ca-3ac6fd2b91fmr5065141fa.16.1792851053288; Sat, 24 Oct 2026
 07:10:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local>
In-Reply-To: <aty37_xHO-QRa7hQ@ashevche-desk.local>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 23:10:40 +0900
X-Gmail-Original-Message-ID: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
X-Gm-Features: AclHuK8in-RebYr4WdGY52-xcg2ve7F2PHG1dtE5MpFbEAzuaEhl8yb8pdBRewE
Message-ID: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
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

On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > <james.hilliard1@gmail.com> wrote:
> > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
>
> ...
>
> > > > > > >       /* Internal 8250 only */
> > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > >
> > > > > > Why? Besides the poorly chosen name, what prevents us from modi=
fying the
> > > > > > corresponding parameters at probe time by leaving the one of th=
e existing
> > > > > > types?
> > > > >
> > > > > The new type was primarily a way to reuse the core's FIFO configu=
ration
> > > > > table, including the RX trigger mapping. H616 uses thresholds of =
1, 64,
> > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to =
1, 4, 8
> > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > >
> > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I'l=
l rework
> > > > > this to retain PORT_16550A, supply the H616 FIFO parameters durin=
g setup,
> > > > > and use those callbacks for the correct trigger mapping.
> > > >
> > > > Please consider just taking the FIFO size from the DT. On some chip=
s
> > > > not every UART has the same size FIFO, so we already need to deal w=
ith
> > > > it.
> > > >
> > > > Also, FIFO size is a standard UART DT property, though somehow not =
included
> > > > for dw-uart.
> > >
> > > FWIW, it supports all standard properties for UART.
> > > Check what uart_read_port_properties() does.
> >
> > Ah, that's nice. I hacked up something [1] in the past to get it to
> > work, but that was probably before you added the helper. I never got
> > around to splitting up the commits and sending it out.
>
> Hmm... The helper is in the kernel for the past 2.5 years.
> Maybe you rebased it and it lost original dates?

I had been carrying the changes locally without committing them. I only
committed them recently to back them up remotely. So yeah, the dates are
not accurate.

> But if it's not working, we need to address that, I believe it should wor=
k out
> of the box, because the same function is used across dozen of serial driv=
ers.

The new helper probably works fine. I can rework my code to use the values
given by the helpers and give it a try sometime next week.

> It might be an issue in 8250_dw.c, but I can't tell for sure.
>
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/comm=
it/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

