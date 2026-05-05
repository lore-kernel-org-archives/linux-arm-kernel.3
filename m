Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7BFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GlP2KVGAH3ZHV/1ess4VM1rrDScODyMTFYB33kqARo=; b=YgRUwMqZkQAK7t+rR4kQOuMYFZ
	iEZsmvr/1fCX7FSyg7D0VZpqjMmx/tNsO8DME+P/99K0G21h+VE5Pf00tNvT3iyKQ1nL5fn7F53g2
	URO7W9XCIMIdgALWiZ2J6kNqERcx/4FhVaNaWnmK3gCXA+aDS5TQ0mXWy9SLePljD7qdNriw1p/hl
	xjpT98vc+YEe+h/OE0zpAg83xnxDVF8sLwttmDyATBqp/UPgnE7a+q3Hy6lCwWuV/Be2++zrzWtk3
	AhvTaS6GBz0D92so+g8s7jv+JCAL5Xf8iLW5mlgSmmsxrzGXd4Fdn/4bZ8vcY2X1d59NtXcztAJan
	gMvi/zqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKO9U-000000002mo-3MWZ;
	Tue, 05 May 2026 22:22:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKO9S-000000002m9-1vqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 22:22:03 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 450B578E;
	Wed,  6 May 2026 00:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778019717;
	bh=CPnhvTo/ayDu0ICnIu2QOn5mr/0Y2yZIkfO+u6R0rxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXZRIqeBIjeQo1LkaQ/vthgzsebr995OeJWxRlc2HDoL+Figv4sL/WHbn6bfmGU2p
	 QWy0MyHSQc+v23g2804kp56itaPE27DLGoAg20Zqv042VSESnu7wE1sT6xNDc60sj2
	 uDKaDnYVoahAjmygNv7JFOmgq2i1dfRtMItdhwME=
Date: Wed, 6 May 2026 01:21:58 +0300
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
Message-ID: <20260505222158.GJ1547435@killaraus.ideasonboard.com>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
 <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_152202_644069_9D121E4F 
X-CRM114-Status: GOOD (  22.90  )
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

On Sat, May 02, 2026 at 11:17:22PM +0200, Marek Vasut wrote:
> On 4/29/26 11:57 AM, Geert Uytterhoeven wrote:
> > On Sun, 19 Apr 2026 at 21:37, Marek Vasut wrote:
> >> Extend the Renesas DU display bindings to support the Renesas R-Car
> >> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> >> except the HDMI port@1 is not present.
> > 
> > "and DU1 is unused." (whatever that may mean...)
> 
> Fixed in V2.
> 
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> @@ -42,6 +42,7 @@ properties:
> >>         - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >>         - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> >>         - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> >> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU
> > 
> > I am not sure you need a new compatible value: is the DU really
> > different than on R-Car M3-N, or does it just lack some wiring? ...
> 
> It seems the DU is identical to the M3N one, so I will add another entry 
> to R8A77965 DU to handle the M3Le one, just like R8A774B1 and R8A774E1 
> DUs . I hope that is acceptable, and also addresses the feedback on this 
> patch ?
> 
> I dumped the VSP and FCP versions on M3N and M3Le and compared them, and 
> I also wrote and read-back the CMM registers to confirm CMM IPs are all 
> present on both M3N and M3Le:
> 
> FCP is identical on M3N and M3Le:
> fe950000.fcp FCP_VCR=0x106
> fe96f000.fcp FCP_VCR=0x106
> fe9af000.fcp FCP_VCR=0x106
> fea27000.fcp FCP_VCR=0x106
> fea2f000.fcp FCP_VCR=0x106
> 
> VSP is identical on M3N and M3Le:
> fe960000.vsp IP_VERSION=0x01011504
> fe9a0000.vsp IP_VERSION=0x01011404
> fea20000.vsp IP_VERSION=0x01011904
> fea28000.vsp IP_VERSION=0x01011704
> 
> CMMs are present on M3N and M3Le, tested with write of bits 28 and 24 
> into CM2_CLU_CTRL and then readback:
> fea40000.cmm CM2_CLU_CTRL readback 0x11000000
> fea50000.cmm CM2_CLU_CTRL readback 0x11000000
> fea70000.cmm CM2_CLU_CTRL readback 0x11000000
> 
> And it does indeed look like we do have DOTCLKIN1 .

So the die seems to be the same as M3N, just with some signals not wired
up. We could simply drop the HDMI output port in DT as Geert proposed.
I'm however a bit concerned we would later find differences that require
a specific compatible string.

At this point, I think more testing is needed, with local access to the
board, to check the display output. As that's hard to do right now,
let's start by upstreaming board support without the DU, and add the DU
on top.

-- 
Regards,

Laurent Pinchart

