Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F39606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1XGCnWp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ANKUnqLt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=; b=v1XGCnWpFSgFcm
	ThaE3/hWi/s6Z5Sli4D5NS0ppar7HhXcMdnq03toncSXHrCNC48dP+dFyxLircE/yBpL2xV7tNp2b
	Q9NBwWaSpOTpBWiSuw/EFnPIIaKh9F3OFlTMbFcbpacw8KOUyDyxsx/pOLLXVPeBf/igolB0yHLDB
	ZdXDKiA6F4dkmq2gF2pFMr0bYweVJLasAhMMtI1fdpu/muZOKyStkO9ksFKcInx23naKA/AmSv/LT
	D8/074qqHZgFPEeGhYF8J84ZCrz71f+qDbdyXXMaKeTJTEimu63qovZHSGAaYNt9D7A/tso/8bHD6
	odJE7jJyawJDwKwoM/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL2Aj-00000001EC7-2Bmg;
	Sun, 25 Oct 2026 17:38:17 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL2Ah-00000001EBZ-1nwS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 17:38:16 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-7c3b75caad1so1461799137.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 10:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792949893; cv=none;
        d=google.com; s=arc-20260327;
        b=hO8oU/CtJfje6PrE0XqWdG2oFjDfKudZabzZ9IqekqUacf2T23VlHxrL5tOkDJsP1p
         hcSjozeN5xpHmDfRsm0M83snYlb/OOCtpYYZUJcJljxjCGRqjGsV9PSMYyRkf6P7fmhB
         m1eGxzVLYqfix7lz4m5bSWW9n526H/UiMJZMJ98sWPybRFxaGhUm+FAhLF3m/Ap+q78m
         HAgwnieZBB+ZBv0HjCYeB8iJhBFrQCOr3Yllr61uZ6kafN5aAN8+Mtk+Q1uWVFHauYG3
         fwgmy9jvtoVihuo8nPX92RXeXJAoleczllA3Xco9SGlnn5DaDR+fSmCIpBY+tQnVUGOz
         lMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        fh=opAJZ2Vb0pl0YzPwfyf4pJ3nSDNqITCGGHjrAD5Dpis=;
        b=WGZjgqVTwexl+sZ0miv/QVuWTshSjBswPBi+DBU3vASooiRl1d7QfB88O33FN/i5n3
         yEMfNJNdFgMbamBhvqtpWvV8gDCTebVZ0NN4Bf9/mjlUg7xZ66qZbY7/xG41sk9j+v74
         oKykd0HhaUwu9jstghEY0CCbjOuKV0UN+KPzhgk3wEQgNky37H+Nl99W9dRFPcLuMExh
         92+4dyldBBIA+zOVS+/76NmvkLg7Zv38HBCtW8qSFB5nUgXJvZJuRl3vQIIy8lBgsnKR
         XxR0aoSBKGqckV7TZDIIrb4X1d/GAWP69GnrP3N55kAVj/+PcmjASGvN8QhGfkHE5Qg6
         OAxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949893; x=1793554693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=ANKUnqLtLFs8S4vPsX0L6e/8NL+LOUImQDaTLly+pQ9GuswPHzLu/K7bkgznQlbAJ0
         9O7Jx/6ftF2WSazsKWqDJQ4XdlZCcvjM71vsMS3s85svQenVkWYG01EqI1BZFNKTE2ca
         FbL34uwvyXNW12Fg6C3dwL8nwIhCQp360gZfAd/zV4ZXIrMab5NQZDnFbO4vACfPrqN4
         CILODQbwaFQ53Kin4thRFEIfo2ySqn1yTWYxDfnt4k/wLY46wO56M1CB7Bg8kusYEO4U
         I8JXMOW9iHP8iy6rQ0xvTJC+i4d4ojeESfnG7Lt6y23oglgJ7gr4YAoiyxVK5sbwUYfV
         pJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949893; x=1793554693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=jUtm/CyOdy2VEXRyaAcFkQuUFLl7W4hyA6Br9Jx+bv8694jyTzhRmCLfddVxK1mzPY
         I0AH4WK4zThXxr8j6EvHfPeSpAiso4EDzCDLpuAqL/xjL4fpKHeOic/jT35dV/KTg0WF
         3/axKOK1XIQAb6hdGHDIEmoNWPbYmTm3oYFY64qvsyyzaQCfW19ylpiHU0RL/nDWORqF
         6+DENmh55a7eIN8ejaerip7BL3hhXgoInDprYYqvneo1cfGT6Cs8hLcEuvq7pBEno35s
         FAxcX91MOi4KY/0gn9kJbp90H0USPSDjFYGaW6lOiFwpiF8K3X6Vh+JuFNQ2/ASmxveB
         fi8w==
X-Forwarded-Encrypted: i=1; AKwUvBwqQxUERFcRjALDW0Q/fpgmvO64r1TJjCJ5xKodwEXk5PeSodE+tRbobdEo2hbklFN1RTtlOS4/lROr0IvzJ+pD@lists.infradead.org
X-Gm-Message-State: AFq9FYJNkYTaK4D1M5EpC2puqh5lqom1D/BmC69qsNyE646yHhhq8SwN
	RnfXQndneq/EgCuDLAvlczNCQg2+aGeUxPY8K45sHpew5vjjARi2fj9h9OzOry0LHYtQ3VMaskc
	rvSSEtYXs+2sXecbHg52qeugM6zvrEqU=
X-Gm-Gg: AYBFou28ntxxg26hXXFp82lqITB39nJWHLFha6ajUAKKK6oZrbOpHLbnaUQKf9znR8b
	c+HOhdFn24qsHC4x+M6vtbWdQH88U6QNsmAfWqJoTXa7ois6maXA//5BJEtMEmhmYkF0gsuQMOT
	guWz2szgnmMQfc9xhLemi5E2e18FAsNSmjl8Vrcq6YBPOKqn4pmxQzjv8twg5g+Bp5mymgmPQYq
	dEiuhIu8swufOqnMrQPQWvrz622jGPL8oFV/3c7hiG5w5v8qSt2shPTHJUyLkgd2ETTpp4IbCf+
	ILQSB6/DFlccygoDzsLzgI7GmH68vZ4kPEImNyBM49aKU+BfEW/nt61qEr5sC49zlWSPjfaaUBQ
	j8iWisrArZUlqoAdU2dfSjLcuIaJEA/hez07Y0Do8tolBp0ZNNRIny2/I/A/8/eonDxJ8REK5CY
	jaiR3G/MpD0Bnqs6nSphVnPP1iipIZnRTRRluvTuryxDMlrPBGn4aZUUz9nHYTZ+u18qoJDcUEX
	7wxhjTjveADxjivSK59608HXTopwU/x3XA8i/6iQKeWtffa+qs=
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr1213666137.14.1792949893405; Sun, 25 Oct 2026
 10:38:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local> <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
In-Reply-To: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 11:38:00 -0600
X-Gm-Features: AclHuK9ADptacPxgJpmNc7NJsHyAAEhwuFjXIctIvJ_VhKssk-2-2xQxAyeIEHs
Message-ID: <CADvTj4p1vxCUsNk98Q=TRkvtZQ4LzXNY9V-2GT30aspRGUgrsw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: wens@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_103815_508610_9C5E1015 
X-CRM114-Status: GOOD (  33.38  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 8:10=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > > <james.hilliard1@gmail.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrot=
e:
> >
> > ...
> >
> > > > > > > >       /* Internal 8250 only */
> > > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > > >
> > > > > > > Why? Besides the poorly chosen name, what prevents us from mo=
difying the
> > > > > > > corresponding parameters at probe time by leaving the one of =
the existing
> > > > > > > types?
> > > > > >
> > > > > > The new type was primarily a way to reuse the core's FIFO confi=
guration
> > > > > > table, including the RX trigger mapping. H616 uses thresholds o=
f 1, 64,
> > > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits t=
o 1, 4, 8
> > > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leav=
e
> > > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > > >
> > > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I=
'll rework
> > > > > > this to retain PORT_16550A, supply the H616 FIFO parameters dur=
ing setup,
> > > > > > and use those callbacks for the correct trigger mapping.
> > > > >
> > > > > Please consider just taking the FIFO size from the DT. On some ch=
ips
> > > > > not every UART has the same size FIFO, so we already need to deal=
 with
> > > > > it.
> > > > >
> > > > > Also, FIFO size is a standard UART DT property, though somehow no=
t included
> > > > > for dw-uart.
> > > >
> > > > FWIW, it supports all standard properties for UART.
> > > > Check what uart_read_port_properties() does.
> > >
> > > Ah, that's nice. I hacked up something [1] in the past to get it to
> > > work, but that was probably before you added the helper. I never got
> > > around to splitting up the commits and sending it out.
> >
> > Hmm... The helper is in the kernel for the past 2.5 years.
> > Maybe you rebased it and it lost original dates?
>
> I had been carrying the changes locally without committing them. I only
> committed them recently to back them up remotely. So yeah, the dates are
> not accurate.
>
> > But if it's not working, we need to address that, I believe it should w=
ork out
> > of the box, because the same function is used across dozen of serial dr=
ivers.
>
> The new helper probably works fine. I can rework my code to use the value=
s
> given by the helpers and give it a try sometime next week.

I've incorporated that approach into v3[0]. The H616 DTS supplies
fifo-size =3D <256>, and the driver uses the value populated by
uart_read_port_properties() for the transmit load and receive-trigger
mapping.

[0] https://lore.kernel.org/all/20261024-submit-h616-uart-fifo-v1-v3-4-286f=
c1b8c3c1@gmail.com/T/

>
> > It might be an issue in 8250_dw.c, but I can't tell for sure.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/co=
mmit/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

