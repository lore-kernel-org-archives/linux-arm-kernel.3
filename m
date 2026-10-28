Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB77606A5F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aDOOnvFe;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aoMmoJYo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TJlktW/QHwQzWX8KmM3KGgch3rcXax0gFxtt66ySgB4=; b=aDOOnvFeMcvx8GrWpjlQOO4VQD
	wcr7OPGIPOxp7xgi5zywhHtA6oK56q56IJ1YCRSCvZ59kexBzXypNhVByUnJt+qJh2yN5NIENVV0a
	pGo3AaITodGGRBIRxosPPnxWSGq7/hqmZRMl0Zu0ntSxUvhHG00ozi5PRgojrQecysilWHsxiew1L
	SP+g+06amC8sVzIzNnMq8BAw7Iw52iMBtaYlJ3z0N7pnaTXIwE7CC9FKBkygxjbss1Z+0GVUFYP7I
	eNHKmryAgwOrOkooUsD4rYa8dzxDjsXZjjqMoKLi0p8XphKpcvX5kPAoqV765Hvh7NWeuoQA/100q
	rIhfRdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6gl-00000007YjK-3L5i;
	Wed, 28 Oct 2026 16:39:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6gi-00000007YiV-49c4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:39:46 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9BADB07;
	Wed, 28 Oct 2026 17:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793205449;
	bh=5oFtXnzBQ98MFaco5zMv+o9V6iN5E4nNphi2zpmABz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoMmoJYo7EOox5Wv63orgylHjdTEx5VSBwQdf4G54k4lg1X1J25tmZPH/0b21GbOQ
	 KV5hzzcJ6M1/2PbiGQDQVL3xCY5yuEUnAlaD92gnsz1am0ww70WreQbrmGB62HeJ0Y
	 UJdm3Fm4e/02xIBObfm44Grlb8/rDMMSRTHEDMiM=
Date: Wed, 28 Oct 2026 18:39:40 +0200
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
Message-ID: <20261028163940.GA2673734@killaraus.ideasonboard.com>
References: <cover.1793026273.git.geert+renesas@glider.be>
 <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com>
 <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_093945_219809_FB99767A 
X-CRM114-Status: GOOD (  21.71  )
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

On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > @@ -28,5 +28,8 @@
> > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> >
> > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> 
> I could add them, but do you have any need to refer to them from DT?
> So far I only added clocks that are listed as clock supplies of on-SoC
> modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> Timer Unit (TMU)).

So we have two conflicting goals here. One of them is to only add clocks
that we have validated to exist (and ideally work as documented). The
other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
satisfy them both fully.

I think we previously discussed adding whole groups of dividers in one
go, as some sort of middle-ground approach. Those are clocks that are
not directly controllable. There's a risk of adding clocks that don't
exist, or clocks that we won't need to reference from DT (because
they're only used as parents of the MDLC-controlled module clock). Do
you think that's an issue, could it cause ABI problems in the future ?

-- 
Regards,

Laurent Pinchart

