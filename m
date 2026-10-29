Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E00606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UbkZBPEA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZlsJgsuUxLshKsbZ0JGTcZhiSxa4IqXzGzYrO+oYcmo=; b=UbkZBPEACCRs66wAyMU8CavWS7
	B/mqdXpgp+wKGEvi+ZnT7owC5B2kM/QXot+yRIGA8vqgmaVdG3I0FM58+dg+6vmla5Ilkn+GuUfYA
	vzucYM5aBHgLCfwo8Cx9xllXPjtp1W9CHpzTwrhkSK8T/NovQv7j4KA4InUSZmouz7mTtcmCvXYFB
	ekv5a88zOxOWGoGYTUbMWTLj/CKXpxAyeMeOgmKSei+7X2v9jeZPcJaD+rcSLMd8BWH/kOy1gKVky
	PftJ5HW5nkpUo2kcRoa01YKHsLUOB7csSSyQJ0PGozclNyXQLBlC3BA+wrAsLgVz1263eYYhGGdPR
	LoRdI+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM7r-00000008oNy-44Z3;
	Thu, 29 Oct 2026 09:08:47 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM7o-00000008oNC-2oj4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:08:46 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso783910e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264922; x=1793869722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZlsJgsuUxLshKsbZ0JGTcZhiSxa4IqXzGzYrO+oYcmo=;
        b=CX4TKo0FUs+8J0x+sRvx9G1VwlbCpmuzdx7VX1idW4IykdI6SfRbK8ZPwbw2bFvAfG
         SPsLwKBgh5iYfmottHCBwx3XQQCklUtuMVUVcvJvS85cMLT72geWYlIzIFXa1iaZSnvV
         k4B9+mIuDt0D/ol+PToOk1LnBYiyCw6WhEbLPGSxNrY2sbZzHuED9rLjedWQvNWbguO2
         FrX4IIefNURdkE1DvI9/XKeSLZrXFEvUW4/S3XlcL/9eShzqbBonqb4fGnfIJ813CDc5
         VFA+teJvPUQ4UkJ7oQNXEdXfJrqY+XFmpFLnJfwmeVS3F/e0t1H8vbS3MR5PT8cCzoet
         4Hlw==
X-Forwarded-Encrypted: i=1; AKwUvByh+PYBU0bdRG4+H08eYjqWT8Q81T/d7ur6NMXRsr42D0LkvRuaPbltQow+w1M6tf5LsU3B71RMaJAWZaODwqIc@lists.infradead.org
X-Gm-Message-State: AFq9FYKzrblej+JHn1MNi6F0cuhILrLSI7gRc6GD0KJpNkzybRMcW6Uc
	SI4sKBbDXGwXTYw8nwVHuygNc41DavH8cTDioe+lKxjZxiWgvsKZVdVj8dSdEebu
X-Gm-Gg: AYBFou2tvi2Ni/hb1woYpz3nhexvyFRiZc5i1PbT9WHSHTwFLkmXSQBmLps36861HM1
	iI8XZYhEqwxpz5zsfyafRg5vDfASWbiLH7EeNmYIyJB47gjZBiRvINmLlsxg+WE59qMIa3bFYaK
	rRJlc2qtSrMaJQikYV9sM1kauoEUtSv/cWpkxFcC+jR/sGKqdEpAOrrOsLwVToeNhJ6jOgTl6H1
	r2x6F3LtY9zEZWUnszV/yN4URPcgbaYWuFrkxzkRqm4Y+zRp2s9JjpU+3YvZRZk9Vim5pfvCfDo
	yanX13KzBWKf7wm9rAi8JdAtBB+cIHzT3fsyh0ylBx8LnLGUndM6IHDZpITWzWhNCVTpbgM9wtH
	LYBZ/pS/oeZT5Zv/7vSSCTJbHU5wi16D75egKClvtPoq+HKiFbXLEw6ALcQd7S02pwkyN0E2f7F
	mf38phSeqdAtfb8QRf7I+2cEaQzI++s2iGJZwi68WJC/ZZCxXiK7R9xEqGz/ehQRc9MCd7yv4CZ
	db143n/UHzfrk5neEEA6uN4XaAcfrdJzOW2r8JlpaR31RpsU/hcZm4yGffCBcTWAlEHFoFHvcGz
	/gV1rqWtX6CHpLEx0/ZP7P2FHBQ+EYq2xwIECmPzrkeB5f8ATJmvrE76TcJl29kBQCU=
X-Received: by 2002:a05:6122:328a:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5ec4ccd4191mr2587763e0c.19.1793264921916;
        Thu, 29 Oct 2026 02:08:41 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm4705771e0c.10.2026.10.29.02.08.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:41 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so573401241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzp86El9Njri3B7HtYrPJRUYESfxPlj+Y7dyclmSbPEdYjgHEIIAIanXbulytro34CwEPcH06dX7moPdGKJHayB@lists.infradead.org
X-Received: by 2002:a05:6102:8357:10b0:7cd:3218:362e with SMTP id
 ada2fe7eead31-7d03a5d6043mr1694600137.29.1793264920555; Thu, 29 Oct 2026
 02:08:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com> <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
 <20261028163940.GA2673734@killaraus.ideasonboard.com>
In-Reply-To: <20261028163940.GA2673734@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Oct 2026 10:08:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
X-Gm-Features: AclHuK9-UV4UizkhZLPxSnm2gBMXfy5lUX6jKfLRdtUVdpASkFCmlMNEyTp9nPg
Message-ID: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261029_020844_744225_378A7E67 
X-CRM114-Status: GOOD (  44.31  )
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

On Wed, 28 Oct 2026 at 17:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > @@ -28,5 +28,8 @@
> > > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> > >
> > > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> >
> > I could add them, but do you have any need to refer to them from DT?
> > So far I only added clocks that are listed as clock supplies of on-SoC
> > modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> > Timer Unit (TMU)).
>
> So we have two conflicting goals here. One of them is to only add clocks
> that we have validated to exist (and ideally work as documented). The
> other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
> satisfy them both fully.
>
> I think we previously discussed adding whole groups of dividers in one
> go, as some sort of middle-ground approach. Those are clocks that are

That is what did in this and the previous patch: we need
  - R8A78000_CPG_SGASYNCDn_PERW_MAIN for n=16, and added the one for
    n=8, too.
  - R8A78000_CPG_SCPBUSDn_SCP_MAIN for n=16, and added the ones for
    n=1,2,4,6,8,32, too.
  - R8A78000_CPG_S0Dn_PERE_MAIN for n=24, and added the ones for
    n=1,2,3,4,8, too.
  - R8A78000_CPG_SGDn_PERW_BUS for n=32, and added the ones for n=8,
    too.

I did not includes clocks with values for n that exist according to
the documentation, but are not used as suppliers for modules.
Of course the documentation may be incorrect or incomplete, and we may
need to add them later. As IDs are ABI and the list is append-only,
they must be added at the end, which could indeed lead to not all
clocks of the same group being located together.  From an ABI point
of view that is OK, but from a human-readability point of view it is
indeed suboptimal.

Before, we tended to add all clocks from the clock tables listed the
documentation upfront, ignoring clocks that are clearly internal-only.
Some of them turned out not to exist later.
Some new clocks had to be added when the documentation was updated.
Nothing new here, except that the list of clocks on R-Car X5H is an
order of magnitude longer.

Note that we don't use a linear array of clocks indexed by clock ID
in the R-Car X5H CPG driver (yet), so large holes of unused clocks do
not hurt (they do hurt in the SCMI driver ;-)

> not directly controllable. There's a risk of adding clocks that don't

FTR, the xDn clocks are not directly controllable; clocks like
R8A78000_CPG_MSO_SCP_MAIN are.  We know the latter exist, as they
are used.

> exist, or clocks that we won't need to reference from DT (because
> they're only used as parents of the MDLC-controlled module clock). Do

The direct parent of an MDLC-controlled module clock should be in DT.
Higher-up parents should not be needed iff the SCMI firmware exposed
and/or implements the proper clock hierarchy (which it does not at
the moment).  Still, they can be internal enum, starting after the last
DT clock, like we did in other R-Car clock drivers.

> you think that's an issue, could it cause ABI problems in the future ?

An ABI problem appears only when you refer in DT to a clock that does
not exist in hardware.  This should be caught by testing before the
DT user is added.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

