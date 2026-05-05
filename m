Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BE4FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBm69cSTNolIKgN0mc/GeediHAiejkjiM8lUZsKqCxc=; b=19mYt9x6Gm26I2Lf//z8SH2LUJ
	kEO/VwBk34evi05yXiqMP5u8qOVmPJPEhHSU9cCwn/d6we23ExuXM7xGhO5ba0JnCnRYnvdStYNp9
	ZAi8HLcOrnSawDBYoLoXjagF/VafSjQTtOVIlFpETVT0k/f7xxVjLn30O0y1rr8nLJ2zDN2J1U5Xw
	yhT8qBYJADcM566HS9XRxNb7FDr26MztIcQHkYEeOSg71+3B3A06E3b5X5O1XB9pd77NO3NXzFKnK
	CeDU6+QmLO6IQpqcganh5wFIa5stxcdN4AczBT4WxdLSA+TjBnEgJypuSvYhcc0R8zm73gz+BhFHR
	xahQycRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOHQ-000000003XK-10Zk;
	Tue, 05 May 2026 22:30:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOHO-000000003Wo-1J9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 22:30:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E3EC5B2;
	Wed,  6 May 2026 00:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778020209;
	bh=FivnVMCzkyjqi1+iDD5086xG3G9ENzvwOjmZvkafsyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Si3jCrHt3NhRrBvFE7LKoNIWoxGPcm1fDga2uJqRjJpm6im2HOZyMsmeRf/ThmbK1
	 gljF51HI4ZsPUh1wCEjlJ2uLNtm1qTOXMBWqjud9SuE8rMnMrKRFKWE+r3qM6KNkS9
	 VBHbkwCDj4JSIeoIN0pFsLea5IfLf+aMHuX/8izY=
Date: Wed, 6 May 2026 01:30:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
Message-ID: <20260505223010.GK1547435@killaraus.ideasonboard.com>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
 <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
 <20260505222158.GJ1547435@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505222158.GJ1547435@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_153014_495144_F244B5CF 
X-CRM114-Status: GOOD (  33.67  )
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

On Wed, May 06, 2026 at 01:22:00AM +0300, Laurent Pinchart wrote:
> On Sat, May 02, 2026 at 11:17:22PM +0200, Marek Vasut wrote:
> > On 4/29/26 11:57 AM, Geert Uytterhoeven wrote:
> > > On Sun, 19 Apr 2026 at 21:37, Marek Vasut wrote:
> > >> Extend the Renesas DU display bindings to support the Renesas R-Car
> > >> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> > >> except the HDMI port@1 is not present.
> > > 
> > > "and DU1 is unused." (whatever that may mean...)
> > 
> > Fixed in V2.
> > 
> > >> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > >> @@ -42,6 +42,7 @@ properties:
> > >>         - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >>         - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> > >>         - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> > >> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU
> > > 
> > > I am not sure you need a new compatible value: is the DU really
> > > different than on R-Car M3-N, or does it just lack some wiring? ...
> > 
> > It seems the DU is identical to the M3N one, so I will add another entry 
> > to R8A77965 DU to handle the M3Le one, just like R8A774B1 and R8A774E1 
> > DUs . I hope that is acceptable, and also addresses the feedback on this 
> > patch ?
> > 
> > I dumped the VSP and FCP versions on M3N and M3Le and compared them, and 
> > I also wrote and read-back the CMM registers to confirm CMM IPs are all 
> > present on both M3N and M3Le:
> > 
> > FCP is identical on M3N and M3Le:
> > fe950000.fcp FCP_VCR=0x106
> > fe96f000.fcp FCP_VCR=0x106
> > fe9af000.fcp FCP_VCR=0x106
> > fea27000.fcp FCP_VCR=0x106
> > fea2f000.fcp FCP_VCR=0x106
> > 
> > VSP is identical on M3N and M3Le:
> > fe960000.vsp IP_VERSION=0x01011504
> > fe9a0000.vsp IP_VERSION=0x01011404
> > fea20000.vsp IP_VERSION=0x01011904
> > fea28000.vsp IP_VERSION=0x01011704
> > 
> > CMMs are present on M3N and M3Le, tested with write of bits 28 and 24 
> > into CM2_CLU_CTRL and then readback:
> > fea40000.cmm CM2_CLU_CTRL readback 0x11000000
> > fea50000.cmm CM2_CLU_CTRL readback 0x11000000
> > fea70000.cmm CM2_CLU_CTRL readback 0x11000000
> > 
> > And it does indeed look like we do have DOTCLKIN1 .
> 
> So the die seems to be the same as M3N, just with some signals not wired
> up. We could simply drop the HDMI output port in DT as Geert proposed.
> I'm however a bit concerned we would later find differences that require
> a specific compatible string.
> 
> At this point, I think more testing is needed, with local access to the
> board, to check the display output. As that's hard to do right now,
> let's start by upstreaming board support without the DU, and add the DU
> on top.

For the record, a useful test would be to disconnect the two VSPD
instances from the DU and expose them to userspace (setting the uapi
flag to true in the driver), and see if they pass the VSP test suite.
That would tell us if all three VSP channels are operational.

Then I would try to operate all 3 DU outputs and see if we get
interrupts from all of them. I think the DU channel that outputs towards
the HDMI encoder does not get any feedback from the HDMI IP, so it
should happily output data, ignoring there's no HDMI output. And we
could even try to wire the HDMI encoder in DT to see if it's there.

Lots of interesting hacks to experiment with. I'm of course not
expecting you to do all that, I can also give it a try (even if it would
be nicer to get local access to the board to see what signals are
actually output).

-- 
Regards,

Laurent Pinchart

