Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C1606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r5369j6f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rreqjXCuaDWJ3vSeRfN8yw7LxuY/EzKtao82LH4eM9g=; b=r5369j6fysg0QxRmuDkjHpdFPz
	xZflBQcLZ1C3gH6bvMfaBv9Q0osd6vQETeypJ4nAeUlGC3gP8/SJFlQwDiNrvjAqPKwMxduEhnRzb
	fAvUNOPKNvhD/GtS+IB1ipV3NXBT6Lq1bSAo7XqlFjdvlYAsDlSeKQExHQXvg4D9qP99w7oNzzNvS
	7w7/PZirzPel9EZfxyQu2wtJyf7cgPxeBq/Dd3vIw10Cs9zTTMmrY3nzsmRNpCLSfDRA72yIMkXFh
	QN88nOtBNl6ggp5U+AEuWfoK0qcJKScSOGE4+zmP4oeWLWtF+kpF1hwRQXpVmhVnvfysDoLcrNgW5
	Sbfm7fsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn1g-0000000Bn1I-09pK;
	Fri, 30 Oct 2026 13:52:12 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn1b-0000000Bn0Q-40fH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:52:09 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso508299241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368326; x=1793973126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rreqjXCuaDWJ3vSeRfN8yw7LxuY/EzKtao82LH4eM9g=;
        b=0gGDxt0yQjTSbhByBtMXk25ZYl26hy1HGl6+i4Kn3n9/6WfXxDP3OrusjU0532yzDv
         +bsnRipZzUHlS/KucB1SKqb5G9NO8ueOS0o7/zAxx5tSDS+YTytzMf36AQNcxhIuTwOh
         XHqI8tvqKn8aptIjT6C3W6ajjvgu6oA7amrU40PG/Iqyg37bLEoqYW8mcPPwtd9xfbf7
         xwNrwh5lahzd4lt2wmRgmNArEUovvQ/RbVhVieGRToLMc1ISun2Q0hygej2s5DnYxTTE
         W0Rpp12VWns7r0MqeA8AnLdhfjgC8tyXXyD+KbEx4sl13Makz/qco1gjKkpKLuuGzeKv
         2kWg==
X-Forwarded-Encrypted: i=1; AKwUvBws5w00pD2NVpXw4NfQOec2EJLiuSRZAems994+VolfeMpnHsxraeP98V6DieKhMRVQueO2jHqHdy2H9/nT1On7@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0s7wZ1/Ijq/UBBIp6ARDWiQWNbMnDnmKamXe2FCWM2UiRj/DA
	IQ6kKjCVjfX/BFAGBTsshCiz6buYFQw/4a7ARAI7ILo8PA2cNwNZKHf5KlDFH4mO
X-Gm-Gg: AYBFou3Yu1P0Ey/S2fH8dEuoRSwKwlGh8VJQYNBInAAxEFarTMQo0PU1Zu++11sxS0S
	DOKdWsvl7hl1Stv9d3uKv+eGpwBqUN0P16arXH5wm3lwqagxmH7ggkcuEm095in92An19AdmRcD
	0U1bFITf6tvVQJnAns69IsYx07VyMJdIu8bXWtG/mQjvL/m7scxZ36+wWevrj77WvliTqK+H+mk
	pUPaAuoDQRl/j3Fn5zGzsh1LDgQWjtOJ/7kDp45PaM5DiwxT130/Fcb00KgjoFBXHHLxgXPojoo
	zC14PW26Fy+cecJwILeeqIi0RnECKREwwV+XrEmKB66VabfFqi0OY8KpDKkRD7JZEn3rwwW1WJJ
	rRyJQ46fVafjQkiVhw1WGO45GubGXU7fEUUXy6k2YCy5rCEHwFI9TXZtKR0TkHz/I7NCDJdA7zD
	fNwBxO1oO80urP5l9b/++LkdL5ROTynblipd4JszwE3OuHApc4Y739Q5AlDdQLw3YDRCpKfrgoW
	KidbjZ+k2SDxF6AMA5gxJvrOX1nJwnK4xq2MwQCoBvd6PnE0FVuWJiNV6YtDio4FT2v0KB3XSeu
	W+NejwKp9EGfM35jsblB5LILgclH/aEBoxUWyFt70aoc+pJR51fnK0mbe+62jTn0jSAp
X-Received: by 2002:a05:6102:358d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d072d5e4a4mr1338013137.36.1793368325862;
        Fri, 30 Oct 2026 06:52:05 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0776a824csm2241059137.11.2026.10.30.06.52.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:52:05 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-980c4258105so407700241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:52:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwb1lxA8L5yRZv5hBSwdwg8XCik22uuVpBelTcRq0IXKoSl7iifdac9dQSEaINHMYTDOI6ZTMqcHXP+d9faJUGx@lists.infradead.org
X-Received: by 2002:a05:6102:160b:b0:7c2:7a0:ae28 with SMTP id
 ada2fe7eead31-7d072d2e3cemr1195876137.30.1793368325370; Fri, 30 Oct 2026
 06:52:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com> <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
 <20261028163940.GA2673734@killaraus.ideasonboard.com> <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
 <20261030112314.GD2587681@killaraus.ideasonboard.com>
In-Reply-To: <20261030112314.GD2587681@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 14:51:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXR=dcooQoKwrycDpTaZjFk2CCueL08dYYFJLE9bP90cg@mail.gmail.com>
X-Gm-Features: AclHuK8hW4HdhOJ1AXkGa9vmPAzXpiaHAsOh7vH3ng5jr5l_XLCKj0-fmKWKS9c
Message-ID: <CAMuHMdXR=dcooQoKwrycDpTaZjFk2CCueL08dYYFJLE9bP90cg@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_065208_029468_0DCFDBB3 
X-CRM114-Status: GOOD (  71.10  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On Fri, 30 Oct 2026 at 12:23, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 29, 2026 at 10:08:28AM +0100, Geert Uytterhoeven wrote:
> > On Wed, 28 Oct 2026 at 17:39, Laurent Pinchart wrote:
> > > On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > > > > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > > > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > > > > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > > > > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > > > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > > > @@ -28,5 +28,8 @@
> > > > > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > > > > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > > > > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > > > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > > > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> > > > >
> > > > > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > > > > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > > > > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > > > > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > > > > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> > > >
> > > > I could add them, but do you have any need to refer to them from DT?
> > > > So far I only added clocks that are listed as clock supplies of on-SoC
> > > > modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> > > > Timer Unit (TMU)).
> > >
> > > So we have two conflicting goals here. One of them is to only add clocks
> > > that we have validated to exist (and ideally work as documented). The
> > > other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
> > > satisfy them both fully.
> > >
> > > I think we previously discussed adding whole groups of dividers in one
> > > go, as some sort of middle-ground approach. Those are clocks that are
> >
> > That is what did in this and the previous patch: we need
> >   - R8A78000_CPG_SGASYNCDn_PERW_MAIN for n=16, and added the one for
> >     n=8, too.
>
> That's missing n=4 and n=32. While SGASYNCD32 isn't referenced in the
> datasheet, SGASYNCD4 is (in SCIF and HSCIF). Maybe that's just an
> oversight ?

We already have the clocks for (H)SCIF (_BUS, not _MAIN!):

    #define R8A78000_CPG_SGASYNCD4_PERW_BUS         0
    #define R8A78000_CPG_SGASYNCD8_PERW_BUS         1

> >   - R8A78000_CPG_SCPBUSDn_SCP_MAIN for n=16, and added the ones for
> >     n=1,2,4,6,8,32, too.
> >   - R8A78000_CPG_S0Dn_PERE_MAIN for n=24, and added the ones for
> >     n=1,2,3,4,8, too.
> >   - R8A78000_CPG_SGDn_PERW_BUS for n=32, and added the ones for n=8,
> >     too.
> >
> > I did not includes clocks with values for n that exist according to
> > the documentation, but are not used as suppliers for modules.
> > Of course the documentation may be incorrect or incomplete, and we may
> > need to add them later. As IDs are ABI and the list is append-only,
> > they must be added at the end, which could indeed lead to not all
> > clocks of the same group being located together.  From an ABI point
> > of view that is OK, but from a human-readability point of view it is
> > indeed suboptimal.
> >
> > Before, we tended to add all clocks from the clock tables listed the
> > documentation upfront, ignoring clocks that are clearly internal-only.
> > Some of them turned out not to exist later.
> > Some new clocks had to be added when the documentation was updated.
> > Nothing new here, except that the list of clocks on R-Car X5H is an
> > order of magnitude longer.
> >
> > Note that we don't use a linear array of clocks indexed by clock ID
> > in the R-Car X5H CPG driver (yet), so large holes of unused clocks do
> > not hurt (they do hurt in the SCMI driver ;-)
> >
> > > not directly controllable. There's a risk of adding clocks that don't
> >
> > FTR, the xDn clocks are not directly controllable; clocks like
> > R8A78000_CPG_MSO_SCP_MAIN are.  We know the latter exist, as they
> > are used.
>
> Yes, I was talking about the clocks documented in the various
> non-PLL "hierarchy" sections.
>
> > > exist, or clocks that we won't need to reference from DT (because
> > > they're only used as parents of the MDLC-controlled module clock). Do
> >
> > The direct parent of an MDLC-controlled module clock should be in DT.
>
> An additional difficulty is that we don't actually know what clocks the
> MDLC gates :-/

This hasn't changed much: on other R-Car generations we also didn't
know which clock(s) are gated by a single MSTP (Module SToP) bit.
Historically (old SH parts), there was only a single clock supplying
each module. Modules on later SoCs gained more clock supplies.
Hence we always assumed (at least) the functional clock is gated by
the MSTP bit, and modelled the gateable SMTP clocks as a child of the
functional clock parent.  But it's quite possible other clock inputs
to the module are gated, too, depending on the actual module (some
modules e.g. need a PHY clock running to be able to process wake-up
events).

Comparing older R-Car with R-Car Gen5, I actually like how the new
MDLC block combines the power domain functionality of the old SYSC
block and the clock domain functionality of the old MSSR (Module Standby
and Software Reset) block. It improves upon the now imprecise modelling
of MSTP clocks, and maps nicely on the Linux PM Domain abstraction:
  - power domain: generic_pm_domain.power_{on,off}(domain),
  - clock domain: generic_pm_domain.dev_ops.{start,stop}(device).

> > Higher-up parents should not be needed iff the SCMI firmware exposed
> > and/or implements the proper clock hierarchy (which it does not at
> > the moment).
>
> A big *iff* :-)
>
> Even in that case, we'll have (at least) two issues:
>
> - Some modules may need to know the rate of the functional clock gated
>   by the MDLC. As those clocks are controlled through power domains,
>   they are only specified as the last cell of the power-domains
>   property, and are not listed in the clocks property. How do you
>   envision this to work ?

The functional clock (or its parent) is still listed in the clocks
property.  Compare e.g. the hscif0 nodes on R-Car V4H:

    clocks = <&cpg CPG_MOD 514>,
             <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
             <&scif_clk>;
    clock-names = "fck", "brg_int", "scif_clk";
    power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
    resets = <&cpg 514>;

and R-Car X5H:

    clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
             <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
             <&scif_clk>;
    clock-names = "fck", "brg_int", "scif_clk";
    power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;
    resets = <&mdlc_perw 0x54>;

On R-Car V4H, MSTP514 aka "hscif0" is modelled as a gateable MSTP
clock with parent R8A779G0_CLK_SASYNCPERD1, and used as "fck".
On R-Car X5H, R8A78000_CPG_SGASYNCD4_PERW_BUS is used as "fck" directly.
Calling clk_get_rate() on MSTP514 and R8A78000_CPG_SGASYNCD4_PERW_BUS
gives similar results.

> - When multiple clocks derive from the same PLL, it's common for the PLL
>   rate to be specified through assigned-clock-rates. If we want to
>   continue doing that, we need to to make the whole clock hierarchy
>   available to DT.

Yes, you need a public ID to refer to a clock from DT.
Do you have an example where we would assigned-clock-rates it for a PLL?
So far all users of assigned-clock-rates on Renesas SoCs use it
on clocks that are already public as they are also needed as clock
supplies in clocks properties (e.g. CAN-FD and SPI reference clocks).

> > Still, they can be internal enum, starting after the last
> > DT clock, like we did in other R-Car clock drivers.
> >
> > > you think that's an issue, could it cause ABI problems in the future ?
> >
> > An ABI problem appears only when you refer in DT to a clock that does
> > not exist in hardware.  This should be caught by testing before the
> > DT user is added.
>
> So we could add e.g. SGASYNCD32 already, as long as we don't reference
> it in DT without testing.

We could, but which one: "_PERW_BUS" or "_PERW_MAIN"? Or both?
And what's the point if there are no users?

BTW, there are 87 SGD4_* clocks listed in the documentation.  They are
all sourced from the same PLL, and have all the same clock rate.
I don't think any of these can be gated.  Hence if I would write a
bare metal clock driver, I would just expose and instantiate a single
SGD4 clock.  But the current SCMI implementation exposes 87 different
clocks (and didn't make them usable by Linux until recently)...

Perhaps we should drop the domain suffixes from the definitions? Even
e.g. MSOCK_PERW_BUS and MSOCK_PERW_MAIN seem to be the same clock...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

