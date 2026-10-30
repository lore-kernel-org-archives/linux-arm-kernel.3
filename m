Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C66606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kyjTp+s9;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=o5D5kxem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GqD8gV1VbR94HboJm2ZWYB3hzF1YyVBGt4mXsTw30gc=; b=kyjTp+s94L5C5OzMdDhOIVddX8
	Dv7zYaIbhONu1PvxSCdMmy03CvDyCBFXZBXUfj5o8dUp5b+xDvuJKXAAdGOJMqU2ZV6B2L4AxTFAL
	W6OVaqZowi+GKbeiObSZ65acpLqSd3Q2uVSVe+QGg6S+aj/Mi+lOMhpzI1+fXNAqhw97dBY0YO0C6
	+2GHeCPNglpcIB5zJ81t6BEZKL5rUb/Fi8YNRfb5UkQv8uP0i7MN5Njde3FOqQx4rMPBjesoFVimD
	Zzlu6xC/ejOrLuh58hpJa3OfoCjQTBNH1C1h1azoEGrbAJHUkUMDGJ0ciodDMovkNsVvmLMNCfY/F
	UMUye4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkhh-0000000BY5J-26Lb;
	Fri, 30 Oct 2026 11:23:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkhe-0000000BY4R-256x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:23:23 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 591D063C;
	Fri, 30 Oct 2026 12:21:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793359261;
	bh=YhQvMqYGsNMsZuibcxcTlPG0LBgEnS9OCb4qiH2A3k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5D5kxemIEyF4yBozq8fTa89N+/Wzi7bA2crxPUq3aQMTLzQTw99Sb6nDDnqw9qgT
	 CqMocAYB/EhZvwAYDNsDIBALcnb8qTsfL4n+sAl6utPey5FtX50WFnc1McEqHyXZLN
	 Wx7iZIJMZpdljOlh+sxtXnuau6u1gCM4Y/306WrA=
Date: Fri, 30 Oct 2026 13:23:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM
 clocks
Message-ID: <20261030112314.GD2587681@killaraus.ideasonboard.com>
References: <cover.1793026273.git.geert+renesas@glider.be>
 <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com>
 <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
 <20261028163940.GA2673734@killaraus.ideasonboard.com>
 <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_042322_686236_D94EE656 
X-CRM114-Status: GOOD (  48.44  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:08:28AM +0100, Geert Uytterhoeven wrote:
> On Wed, 28 Oct 2026 at 17:39, Laurent Pinchart wrote:
> > On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > > > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > > > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > > > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > > @@ -28,5 +28,8 @@
> > > > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > > > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > > > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> > > >
> > > > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > > > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > > > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > > > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > > > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> > >
> > > I could add them, but do you have any need to refer to them from DT?
> > > So far I only added clocks that are listed as clock supplies of on-SoC
> > > modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> > > Timer Unit (TMU)).
> >
> > So we have two conflicting goals here. One of them is to only add clocks
> > that we have validated to exist (and ideally work as documented). The
> > other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
> > satisfy them both fully.
> >
> > I think we previously discussed adding whole groups of dividers in one
> > go, as some sort of middle-ground approach. Those are clocks that are
> 
> That is what did in this and the previous patch: we need
>   - R8A78000_CPG_SGASYNCDn_PERW_MAIN for n=16, and added the one for
>     n=8, too.

That's missing n=4 and n=32. While SGASYNCD32 isn't referenced in the
datasheet, SGASYNCD4 is (in SCIF and HSCIF). Maybe that's just an
oversight ?

>   - R8A78000_CPG_SCPBUSDn_SCP_MAIN for n=16, and added the ones for
>     n=1,2,4,6,8,32, too.
>   - R8A78000_CPG_S0Dn_PERE_MAIN for n=24, and added the ones for
>     n=1,2,3,4,8, too.
>   - R8A78000_CPG_SGDn_PERW_BUS for n=32, and added the ones for n=8,
>     too.
> 
> I did not includes clocks with values for n that exist according to
> the documentation, but are not used as suppliers for modules.
> Of course the documentation may be incorrect or incomplete, and we may
> need to add them later. As IDs are ABI and the list is append-only,
> they must be added at the end, which could indeed lead to not all
> clocks of the same group being located together.  From an ABI point
> of view that is OK, but from a human-readability point of view it is
> indeed suboptimal.
> 
> Before, we tended to add all clocks from the clock tables listed the
> documentation upfront, ignoring clocks that are clearly internal-only.
> Some of them turned out not to exist later.
> Some new clocks had to be added when the documentation was updated.
> Nothing new here, except that the list of clocks on R-Car X5H is an
> order of magnitude longer.
> 
> Note that we don't use a linear array of clocks indexed by clock ID
> in the R-Car X5H CPG driver (yet), so large holes of unused clocks do
> not hurt (they do hurt in the SCMI driver ;-)
> 
> > not directly controllable. There's a risk of adding clocks that don't
> 
> FTR, the xDn clocks are not directly controllable; clocks like
> R8A78000_CPG_MSO_SCP_MAIN are.  We know the latter exist, as they
> are used.

Yes, I was talking about the clocks documented in the various
non-PLL "hierarchy" sections.

> > exist, or clocks that we won't need to reference from DT (because
> > they're only used as parents of the MDLC-controlled module clock). Do
> 
> The direct parent of an MDLC-controlled module clock should be in DT.

An additional difficulty is that we don't actually know what clocks the
MDLC gates :-/

> Higher-up parents should not be needed iff the SCMI firmware exposed
> and/or implements the proper clock hierarchy (which it does not at
> the moment).

A big *iff* :-)

Even in that case, we'll have (at least) two issues:

- Some modules may need to know the rate of the functional clock gated
  by the MDLC. As those clocks are controlled through power domains,
  they are only specified as the last cell of the power-domains
  property, and are not listed in the clocks property. How do you
  envision this to work ?

- When multiple clocks derive from the same PLL, it's common for the PLL
  rate to be specified through assigned-clock-rates. If we want to
  continue doing that, we need to to make the whole clock hierarchy
  available to DT.

> Still, they can be internal enum, starting after the last
> DT clock, like we did in other R-Car clock drivers.
> 
> > you think that's an issue, could it cause ABI problems in the future ?
> 
> An ABI problem appears only when you refer in DT to a clock that does
> not exist in hardware.  This should be caught by testing before the
> DT user is added.

So we could add e.g. SGASYNCD32 already, as long as we don't reference
it in DT without testing.

-- 
Regards,

Laurent Pinchart

