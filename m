Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PbaoKDZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dlJ5xMksR4WOvEPc9s2K/nzvHc7oGxq9usmZlWMYcc8=; b=PbaoKDZEUTOIjMtSJ+SHIBgpvu
	f3yYC39R+Mll6eA+Schv51wSLoLU2zLUNsN+w9nNAyeNxtZm39xrSqpV0FszkW83heKw9tTO2baqm
	+ZR6XrXM1EhbtJtLqNcSvwYYoiqDztnPhOTgQjlyaFAGa/MxwjZ3kzqECRsW8ZVbf2Dq1Sm94hqzt
	IUcyo39Uea1btdruc0FyepwGf5oPj1CjCwcx3vE84k3JfobhFOWujKjy83zJcScLH89CY4xhJCTtP
	/OXuBC5caNIOFXHETKVoqTVO+lF0/k1xtZX/MZQ3T8F4GdHaK6IC0y9u5hI+4FxJiGQvgZWedJ5IM
	QKH0n+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOACi-00000001dJO-04pW;
	Tue, 03 Nov 2026 08:49:16 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOACf-00000001dIr-2BFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:49:14 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc603a168fso1250258137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695752; x=1794300552;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dlJ5xMksR4WOvEPc9s2K/nzvHc7oGxq9usmZlWMYcc8=;
        b=MVaHH+KEuvskLtUid/1fgLplhcZkN2YtULEBwD6Ljs6TK5CPpch2RSj369/Aka4aNe
         PNchRZMKj++ls01vneg6/FhIX6oBnrLLK5nw5+kgZJCL0RoXMVtw+RDvFocqsrZCkGed
         Wo7aD36iy2uo2VwVtGDb2y5QvyQc8hDETndtZJ4Nj8QifcPfXwMsEiJHf4M4CdqZF8RA
         SK8gWpXoGF7CJljKJ8nuOW8Leet1cLOjII4TafdyZ1wF7Pt9S4/C//os4hRfY/deVenc
         YUDYHZb8YN1DmNAHTyfJ0O9y3F7omMkzMszMJnJhvoxa0lnNlsyBurauZ56jFEBXwFVI
         gEpw==
X-Forwarded-Encrypted: i=1; AKwUvByyEkghdcIyZSiZmGsmmIa7QZR0AZ6mLCWiWAACHbnbYOVWNyCDF7/hPTU8jNFpP/fraX5JcH0KyHGIlyUDS9DV@lists.infradead.org
X-Gm-Message-State: APuU4Z9fwxbvYu2XCJGniyem98CTvSxmm57PFuCQYumhTcfRkARtxENr
	uichkFUN1Gb8J6KMbXV+70r7VRvdI5/AsfF/j0PuP/jDRxWVW3YfTcvoOJP1RYzqNEs=
X-Gm-Gg: AYBFou3AoWA56FrJVww/X5+gtDFEbgerWSm8wa78AejAyoTPnwXi3nMPwQGHipUA0vl
	DjiYDbcmaPs8qz57oEP+ymHwXLoic3aHbVPSchx0PKChC2XHsdFeVTk8SLfzu3m7m43lZ/OlCd2
	/XMr7xP1oYJsdYsu3gIS0i6d9IMegtVnxq8zg7vIUgIhrbBF31Mvg784JGOrJNnbpBdRqpe50Ih
	VWO33nnJTqT2mWayLa2andyLZR1OWRBsMI/QZUqWD1QRaAy3Bl8RuI8wFtxmJNh9M70L+XB3Ut8
	tz0Kzy1duXmA/RZeymOVh2UOvFZDWFHH9zSxPoGep0E3+tB842dUfZUq6EFUaYafXZw6WHO+n53
	/begGX7iM+PtuiJQ1dzpFub0NZZp5QPY1WDNmn6mz7W9XU2bg1nxsVlhlVWRndzpVjrKTsqLdr0
	L2JV4t8fS0oP0ArmHK4jlvXh37knM5dEuBJeObMKDgvZ9ldP+cCw5KwoZl7LySOHGypW2q/CaUC
	FlmciJIGB0mjl7iz4yKhdF1YgTHHeAXPwIF7+7CEkRfiHOUq2DshkLd6MGo/LzMmRWyKpyeV+uV
	+lWNeyP+4Ex3THxVWi/KAycgx55vbNxbxq0uvlkjswspiFhfpcA8YxhmLVADINcWWw==
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr4492671137.37.1793695751904;
        Tue, 03 Nov 2026 00:49:11 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4c1603sm13811648241.10.2026.11.03.00.49.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:49:10 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so1200933137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy3ut8dtjiA2Af3iLnrd+VHhrq21lW8t/A7Cixv/yP/jrp4rV/+8FmMu90L2Ef+m3FxEKqZn88tgP467hwphUd6@lists.infradead.org
X-Received: by 2002:a05:6102:370d:b0:7c8:18a2:f769 with SMTP id
 ada2fe7eead31-7d0723dd1abmr4090280137.0.1793695749441; Tue, 03 Nov 2026
 00:49:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com> <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
 <20261028163940.GA2673734@killaraus.ideasonboard.com> <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
 <20261030112314.GD2587681@killaraus.ideasonboard.com> <CAMuHMdXR=dcooQoKwrycDpTaZjFk2CCueL08dYYFJLE9bP90cg@mail.gmail.com>
 <20261102160945.GH3368923@killaraus.ideasonboard.com> <CAMuHMdVHFquHz+OzpHirWENEEQeZbiXx=8eeRDKssvw++jGOUw@mail.gmail.com>
 <20261102230610.GC3548113@killaraus.ideasonboard.com>
In-Reply-To: <20261102230610.GC3548113@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Nov 2026 09:48:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_7c8b+oj0Xb4rHWA4v8FzBG98pRrCcON-uufKUtzUMQ@mail.gmail.com>
X-Gm-Features: AclHuK_e7CeN9r2CWRxTZ3YftMZc8LrnmvjcdiFK90YF4Wz4SjpA3pg2WAZWNlI
Message-ID: <CAMuHMdU_7c8b+oj0Xb4rHWA4v8FzBG98pRrCcON-uufKUtzUMQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261103_004913_601074_C1090390 
X-CRM114-Status: GOOD (  70.48  )
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

On Tue, 3 Nov 2026 at 00:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 02, 2026 at 05:59:02PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 2 Nov 2026 at 17:09, Laurent Pinchart wrote:
> > > On Fri, Oct 30, 2026 at 02:51:54PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 30 Oct 2026 at 12:23, Laurent Pinchart wrote:
> > > > > On Thu, Oct 29, 2026 at 10:08:28AM +0100, Geert Uytterhoeven wrote:
> > > > > > On Wed, 28 Oct 2026 at 17:39, Laurent Pinchart wrote:
> > > > > > > On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> > > > > > > > On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > > > > > > > > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > > > > > > > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > > > > > > > > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > > > > > > > > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > > > > > > > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > >
> > > > > > > > > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > > > > > > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > > > > > > > @@ -28,5 +28,8 @@
> > > > > > > > > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > > > > > > > > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > > > > > > > > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > > > > > > > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > > > > > > > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> > > > > > > > >
> > > > > > > > > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > > > > > > > > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > > > > > > > > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > > > > > > > > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > > > > > > > > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> > > > > > > >
> > > > > > > > I could add them, but do you have any need to refer to them from DT?
> > > > > > > > So far I only added clocks that are listed as clock supplies of on-SoC
> > > > > > > > modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> > > > > > > > Timer Unit (TMU)).
> > > > > > >
> > > > > > > So we have two conflicting goals here. One of them is to only add clocks
> > > > > > > that we have validated to exist (and ideally work as documented). The
> > > > > > > other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
> > > > > > > satisfy them both fully.
> > > > > > >
> > > > > > > I think we previously discussed adding whole groups of dividers in one
> > > > > > > go, as some sort of middle-ground approach. Those are clocks that are
> > > > > >
> > > > > > That is what did in this and the previous patch: we need
> > > > > >   - R8A78000_CPG_SGASYNCDn_PERW_MAIN for n=16, and added the one for
> > > > > >     n=8, too.
> > > > >
> > > > > That's missing n=4 and n=32. While SGASYNCD32 isn't referenced in the
> > > > > datasheet, SGASYNCD4 is (in SCIF and HSCIF). Maybe that's just an
> > > > > oversight ?
> > > >
> > > > We already have the clocks for (H)SCIF (_BUS, not _MAIN!):
> > > >
> > > >     #define R8A78000_CPG_SGASYNCD4_PERW_BUS         0
> > > >     #define R8A78000_CPG_SGASYNCD8_PERW_BUS         1
> > >
> > > Wait... Aren't R8A78000_CPG_SGASYNCD8_PERW_MAIN and
> > > R8A78000_CPG_SGASYNCD8_PERW_BUS the same clock, just with a different
> > > name ? The user manual says _BUS, the clock diagram in the spreadsheet
> > > says _MAIN. The SCP firmware defines both, with the same parent (PLL5)
> > > and the same frequency. I have a feeling it may "just" be discrepancy
> > > between the user manual and the spreadsheets.
> > >
> > > *sigh*
> >
> > After my previous comment about "87 SGD4_* clocks" (quoted at the end),
> > I started wondering if they are really identical and ungateable.
> > The documentation calls each clock list a "clock hierarchy"
> > (e.g. the PERW hierarchy), and each sublist another "clock hiearchy"
> > (e.g. PERW_BUS vs. PERW_MAIN) which sounds like they are different.
>
> I only see PERW_MAIN, not PERW_BUS. There's a PERW_MAIN_MP sub-hierarchy
> though. And I'm fairly sure there are errors in the diagrams (at least
> in the VIO hierarchy).

The clock diagram indeed doesn't have PERW_BUS clocks, while the clock
list does have both, and the main document refers to them as clock
supplies for e.g. (H)SCIF and I2C.  Sole exception is LBCK_PERW_MAIN,
which is in the diagram, but not in the list; the latter has
LBCK_PERW_BUS.

Note that S0ASYNCD8_PERW_{BUS,MAIN} is even listed twice, with different
divider chains, but still resulting in the same final rate.

For e.g. VIO, _MAIN in the clock diagram and _BUS in the clock list
indeed seem to be synonyms.

> > I also wouldn't be surprised if each (sub)hierarchy is gateable, too.
> > So unless we can get clear confirmation, I'd rather be safe than sorry.
>
> I haven't found any sign neither in the documentation nor in the SCP
> firmware sources that those would be gateable. If they are, they are not
> gated by default.
>
> In any case, I think it would make sense to model in DT all the clocks
> listed in the diagrams. That should make it possible to properly handle
> gates after the fact, should there be any.

In DT, we only model supplies and consumers, so only tail clocks from
the diagrams (i.e. what's in the lists)?

> > > > > - Some modules may need to know the rate of the functional clock gated
> > > > >   by the MDLC. As those clocks are controlled through power domains,
> > > > >   they are only specified as the last cell of the power-domains
> > > > >   property, and are not listed in the clocks property. How do you
> > > > >   envision this to work ?
> > > >
> > > > The functional clock (or its parent) is still listed in the clocks
> > > > property.  Compare e.g. the hscif0 nodes on R-Car V4H:
> > > >
> > > >     clocks = <&cpg CPG_MOD 514>,
> > > >              <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
> > > >              <&scif_clk>;
> > > >     clock-names = "fck", "brg_int", "scif_clk";
> > > >     power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > > >     resets = <&cpg 514>;
> > > >
> > > > and R-Car X5H:
> > > >
> > > >     clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
> > > >              <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
> > > >              <&scif_clk>;
> > > >     clock-names = "fck", "brg_int", "scif_clk";
> > > >     power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;
> > > >     resets = <&mdlc_perw 0x54>;
> > > >
> > > > On R-Car V4H, MSTP514 aka "hscif0" is modelled as a gateable MSTP
> > > > clock with parent R8A779G0_CLK_SASYNCPERD1, and used as "fck".
> > > > On R-Car X5H, R8A78000_CPG_SGASYNCD4_PERW_BUS is used as "fck" directly.
> > > > Calling clk_get_rate() on MSTP514 and R8A78000_CPG_SGASYNCD4_PERW_BUS
> > > > gives similar results.
> > >
> > > On Gen5 we will then end up enabling the clock twice, once through the
> > > power domain, and once through the explicit clk_enable(fck) in the
> > > driver. I suppose that's fine in theory (there's an extra runtime cost
> >
> > It depends, and can only be true for drivers that still do explicit
> > clock management.
>
> Yes, I forgot to mention that.
>
> > Many drivers that don't need to know anything
> > (e.g. the rate) about the clock have been modified to delegate this
> > fully to Runtime PM.
> >
> > On R-Car Gen5, the (now purely internal) module clock used for module
> > standby is different from the "fck" clock in DT.  So perw 0x54 is
> > controlled through Runtime PM, and SGASYNCD4_PERW_BUS is
> > controlled by the SCIF driver directly (but it is a no-op as the bus clock is
> > always-on).
>
> I expect the FCK input of the IP core to be connected to the clock gated

At least the FCK input.

> by the MDLC. Using SGASYNCD4_PERW_BUS in DT is likely inaccurate. It
> should work fine for now as the SCP firmware doesn't make the clock
> controllable, but I'm not sure that the bus clock is really always on.
> The dividers listed in the CPGMA* diagrams typically have clock gating
> capability.

E.g. DIV6 dividers (like the MSIOF parent) do have clock gating.

> > On previous R-Car generations, "fck" is the module clock, and is
> > enabled twice.
> >
> > > though) as clocks are reference-counted. However, the current SCP
> > > firmware reference-counts the clocks based on their SCMI ID, and the
> > > MDLC clock (perw 0x54) and its parent (R8A78000_CPG_SGASYNCD4_PERW_BUS)
> > > have different IDs. This can cause the clock to be disabled at an
> > > unexpected point. In this specific case, however, given that
> > > R8A78000_CPG_SGASYNCD4_PERW_BUS isn't controllable, it won't cause an
> > > issue, but in the generic case it can fail badly.
> >
> > Current SCP firmware indeed doesn't handle parent-child relations:
> > e.g. perw 0x54 has a clock rate of zero, and is not a child of
> > SGASYNCD4_PERW_BUS.  So the MDLC remapping driver ended up becoming
> > responsible for controlling the parent clock if it is gateable, which
> > is the case for e.g. MSIOF (see mod_map_in.fw_fck_parent).
>
> It's worse than that. The firmware doesn't implement parent-child
> relationships, but sometimes it tries to control the parent
> independently from different children :-(

Bad...

> Look for instance at the DPCKCR register. bit CKSTP is documented as
> gating the DP_EXT_VIO_DP[012] clocks. I expect that bit to actually gate
> the parent clock, DP_EXT_VIO (from CPGMA1). However, the three separate

Agreed.

So DP_EXT_VIO_DP[012] are/can be modeled as the same clock?

> DP_EXT_VIO_DP[012] clocks exposed by the SCMI firmware (and named
> SCP_CLOCK_ID_CLK_DP_EXT_OTHER[012] because consistent names wouldn't be
> confusing enough) all map to the DPCKCR.CKSTP bit in the backend, and
> are reference-counted separately.

That is really bad.

Are the DP_EXT_VIO_DP[012] clocks functional clock parents?
If yes, the MDLC remapping driver can work around this by always
controlling all three together when module standby is controlled.
If no, the CPG remapping driver probably has to return a new clock
type that controls all three together.

> > > > > So we could add e.g. SGASYNCD32 already, as long as we don't reference
> > > > > it in DT without testing.
> > > >
> > > > We could, but which one: "_PERW_BUS" or "_PERW_MAIN"? Or both?
> > >
> > > See above :-)
> > >
> > > > And what's the point if there are no users?
> > >
> > > Future-proofing, to avoid adding the SGASYNCD32 clock later with a
> > > non-consecutive ID.
> >
> > Then perhaps we should add all clocks from the spreadsheet upfront?
>
> It's tempting. Maybe doing it per-hierarchy ? When enabling devices in
> the VIO hierachy, I ended up verifying most of the clocks anyway. We can
> then try to spot all inconsistencies and ask for confirmation.

It is indeed tempting, and would match what we did for previous
R-Car SoCs.  Having unused definitions is not that bad, it might just
increase a linear table used in an xlate function (which we currently
don't have in the CPG driver).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

