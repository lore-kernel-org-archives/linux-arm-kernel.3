Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A5CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh5ilGfgBOd7IY4hv5kPF1I4gBzJqYiKUxJVuEQxYWY=; b=y7hSJjlEYm5jC4T6v0jyOSYwFp
	M91OExcBcAkIOZA7wViaAAfFLJGw84zzFT9Sicz6qWyJVQk2UV8vXnYRW9wsSxslfE8x0/aU1gt7H
	eYeLOFexjm5QZjSUXQ+nu43fBPDES1g4P0HXuRjfyZ8+tsQkrcYTlX9QMxy80O9do3ubzSg6OH12N
	/ztp9m43KdkMLJaPFTHwrPKFe/tdFmDFlX7i0uWypgnPlkPSWFyb+ZDePJ7Ld/yHNovbbO6ldkJO1
	wGXouvRvtzKG+HbyK0RqSDJauAT9NPLqxPMup2hzTndBloT3RDNziY2ESVYE4jta0pwmQS4FwESCG
	6TSlU8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyQq-000000073AV-1r6M;
	Thu, 21 May 2026 08:07:04 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyQn-0000000738s-19Vz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:07:02 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e4004a4a6fso5731997a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350820; x=1779955620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh5ilGfgBOd7IY4hv5kPF1I4gBzJqYiKUxJVuEQxYWY=;
        b=UDNC5hZVHuxcXHyTog+wU/DwQ8/MGj4o8HwmRMHXs+MzzWSl00q370q5CMLhBC2hyX
         1QBHbISbIhCUlNrLLaOM2GBgrVcve6Lfj9zs0YnySfn8Hvf2omwMCccD5mQjf6lUsehH
         qeQKRkiG+Qj3Ld5jthBhfURAUv6lu8j7+1hHhG4MEtCnxnILTD6I1DCdg3SzgppCIB0D
         KcQB7tC0rldLAsP4ot7klMA4dVz633Kg1ncrHLXmHXIibc4Huh3eR7ytYG7WS7sq7Zw0
         3EqWgB2fVunnqlVGV2cbSnyolKaqFTlQTayD6OCWZ0o7KbSmQBtiq62LqwpHGW1ru4iI
         BR3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+whaAn/c95KTU0+tuCwHcKG4Zj7znqz4J5HPUT/3f0abBqSPbr8/nDhPXzGiLph+b9Nr19uN8rZPMkzzR8GP7g@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ0A6gOxbae5p7zUGS4h4dyH/cjUWIH+Da4cR6qPXHUypi7IHp
	BTnpVJXGf8mmZbuFRePNEyDfWMFSPLxnmcpRwt1EdlTC0YiSqBfnLHtU4+afZ1maSPo=
X-Gm-Gg: Acq92OFdtXTf73WGzAnOHo/jIIQo6s6rbzdKhgY+zvYo1Jkr0N/Ke0eaTUP0bvffbs9
	i4WFnupPEJKu/atvJVnqBqjoJXDf92t3o6rCek/w4JxnZkRbMFfW+kZ6RvDJSVVVjxkx8fMl8Ik
	CDp9/7HUwcJCnfhsRVNbec7JqqnWf6dqNmj8vHtnR7Yxs25r2CHsU6QodU/rkzAjFiHd2Muu8kt
	Dn2SM6jqud9Yf/+tDZlA6DFK80bTuI19y6kmgNcypziXMTI8GCmemX2wP0XFYrRuHRPNOfsC1tt
	fL2f6fagcSSwjTsEvfJTiawp7AHO45KlKIm07D/iKiE9zX3YdQxYLeLjUp3cSxbZnbG9iycI5iq
	2YVVz0dP10fMTTfMcvc7Go2AVuLjZUwPhvkRWUZH8Zq1ObK00/a3oNfCzikPbk3Ua6sOJ86+fUu
	0XTp1Ko5dMtUUVvuGHgL3eQb/QAWe1clbjOCRFMelRZhGxILc+NLjUaLxm4bH9
X-Received: by 2002:a05:6820:1c81:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69d6ee3c011mr723158eaf.8.1779350819670;
        Thu, 21 May 2026 01:06:59 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d773c26e0sm80592eaf.14.2026.05.21.01.06.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:06:59 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dbec19732eso6741680a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:06:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95PNUu9vgZk0vsAxJtLidnoZTQ64tuS/GngQhkwstF3fdAJGZJEw69Z4ILHfaoDNM3dylno86hIj7R2dn1UzI+@lists.infradead.org
X-Received: by 2002:a05:6102:952:b0:660:cba2:b6a5 with SMTP id
 ada2fe7eead31-6738d46a2c9mr965451137.7.1779350455953; Thu, 21 May 2026
 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
 <agor5HJ0JFBoX3sZ@pluto>
In-Reply-To: <agor5HJ0JFBoX3sZ@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:00:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
X-Gm-Features: AVHnY4LKAf9GYj9Cj8Ma9x6mjosVr-AC-oJEzWQ_9yBj7Yua2eAsFSXzEFT0UeE
Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_010701_331301_46925836 
X-CRM114-Status: GOOD (  56.87  )
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

Hi Cristian,

On Sun, 17 May 2026 at 22:58, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 15, 2026 at 05:39:45PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > > each SCMI provider implementation on the running system are.
> > >
> > > Thanks for your patches....this is not a proper full review of the series,
> > > BUT this patch catched my eye..
> > >
> > > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > > exposed out of the SCMI world, since being the SCMI an attempt to
> > > standardize a common FW interface (as in [1] of course), you should not
> > > know what runs inside the black-box, it should be irrelevant...
> > >
> > > ...indeed the versioning is used inside the SCMI stack to deal properly
> > > with different protocol versions implemented by the server OR to apply
> > > proper quirks when needed, but all the rest should be standard....
> >
> > [...]
> >
> > > I watched a bit of the LPC discussions around this (from Marek I think)
> > > but sincerely most of those problems had one (not necessarily simple)
> > > solution: fix your firmwares AND/OR apply quirks in the meantime...
> >
> > So let's forward to the future, where the firmware is fixed, is fully
> > compliant with the SCMI spec, and all IDs are stable, so no quirks are
> > needed.
> >
> > Where do we specify the SCMI IDs to use?  Unless when using the
> > remapping driver proposed in this patch series, they must end up in the
> > DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
> > or in board-specific .dts.
> >
> > The SCMI server is supposed to expose to an agent (e.g. Linux) a
> > sequential and contiguous list of IDs that represent only resources that
> > the agent is allowed to use.
> >   - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
> >     describes all hardware in the SoC, which is typically much more than
> >     Linux can or even wants to use when running on a specific board.
> >   - You would think we could put the SCMI IDs in the board-specific
> >     .dts.  However, that would limit actual use cases later, which do
> >     not necessarily depend on the board solely.
> >       - E.g. when moving control of the CAN-FD controller from Linux to
> >         the Realtime OS, the CAN-FD node must be disabled in the DTB (by
> >         overriding status to "reserved", or by just deleting the CAN-FD
> >         node, both of which can be done by the boot loader). However,
> >         with SCMI, the IDs corresponding to CAN-FD resources must be
> >         removed from the ID space, causing a full renumbering. Who is
> >         supposed to update the IDs in the DTB?
>
> As per my previous email, after such a breaking change I would expect a
> new DTB describing the new HW to be needed anyway.

The underlying hardware would still be the same...

> >       - E.g. when partitioning a single Linux system in multiple VMs,
> >         and distributing hardware across these VMs, all VMs need
> >         different DTBs, each describing a subset of the hardware.  With
> >         SCMI, each VM needs different SCMI ID spaces, causing not a
> >         simple partitioning of the devices in the DTB, but also a
> >         renumbering of all IDs.
>
> Ok now I am lost..why do you need a distinct IDs space for each VM ?

Aren't the different VMs different SCMI agents?  If not, how do you
prevent them from stepping on each other's resources?

> In a virtualized env, I would expect to leverage the SCMI stack to
> realize the exact opposite: same set of IDs advertised to each VM (and
> so same DTB potentially) by the server which in turn can decide to
> assign the same device (and handle the sharing) to some ID or assign
> different devices to the same or different IDs on each VM: i.e. you
> have a set of virtual_IDs that is what the server exposes to each VM
> SCMI agent, and then a bunch of real physical IDs, without any contraint
> on their numbering, that the server uses in the backstage to refer to
> the real resources and that it properly remaps to each per-VM set of
> exposed virtual_IDs during the build and/or boot board configuration
> phase....i.e. when the FW adapts and reconfigures to the specific
> board that is finally running on.

Again[1], how would that work?  Clock, resets, and power domains are
not the final resources that are used by the OS.  They are merely
resources for devices that are described in DTB with other resources
(MMIO register ranges, interrupt numbers, ...) which are not handled
by SCMI.  If the server remaps e.g. a clock to a different clock,
it will no longer work with the corresponding device described in DT.

[1] https://lore.kernel.org/all/CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

