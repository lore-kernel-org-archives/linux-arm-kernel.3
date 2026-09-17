Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9829C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJB4/M6PcBSGQIQbVbWuwScsUxZylXwtKq33s3tug4I=; b=GbKBOoorntcGuUnQgcmJP/HL+g
	x0CUtQqAQuV02hWdVU5EFx85P4QctgF/ejz0ZHjLaCw5WKneBGmSUes0JJSxks8rRPVsKHBRqNBwh
	lVA7SWT4ZFeswyQ+4752aHMhbGqjlvyxYWkIq0JeQ1jchnp3tLEOcibW2kskFi7jV6BGZIWwW54bo
	qJRubYHycMb3pyrBCOADdxBEhk+Si9Hlr4U7AnmcBytcLS3f5dlIjuVox3vduB2LU99BZ1joCglCB
	0YhAMEsv8CWpTYpDQ4EhTyNLkiMP6zR8xofkLQhxWSFGOkmvl0gm10tdJwwHD3BtBtmf/dDo3bcq+
	h6QOIswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FTT-0000000C1Tm-0Xxu;
	Thu, 17 Sep 2026 17:00:39 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FTO-0000000C1TI-3pAx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:00:37 +0000
Received: from francesco-nb (unknown [178.197.222.34])
	by mail11.truemail.it (Postfix) with ESMTPA id D37761F81F;
	Thu, 17 Sep 2026 19:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789664432;
	bh=WJB4/M6PcBSGQIQbVbWuwScsUxZylXwtKq33s3tug4I=; h=From:To:Subject;
	b=0C8myMUzp0uN4t4xtVEJhAB+zL2aVucmlEetjYJl7CCFZ/EWhET5kRM0tRRNKzXGa
	 bWZ+527oiSifcyt85FaXsTo36iWpEFWBTX6begY0z3ll6RuEnBifhZiisgHfycEE7w
	 gZ69oZPMUIIRSPTWTBtbD36rGvdXgCdcEEuONY/g5/yCLNvsaFc9lqK4Ne5rq448xS
	 sF9V0qnJsaNIm+iqkqQooeVhrLW2PJjcy8IjnzJPqsu+tO2izztcriCAg/Ilobx30x
	 4BTkYula8k3H3r749g4TXSeLoYOPXTYVr+HPQgS/8/7e04kcOZ1CVnRY0MncqOLMe1
	 rIbLCoMfojxAg==
Date: Thu, 17 Sep 2026 19:00:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260917170027.GA6655@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
 <aqgEfRl9INLZ-DWM@SMW015318>
 <aqgGgxzqiIbF66DX@francesco-nb>
 <20260917140836.GA119572@francesco-nb>
 <aqwMib54h5ys5HZL@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqwMib54h5ys5HZL@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100036_411899_F09D762B 
X-CRM114-Status: GOOD (  22.50  )
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

Hello Frank,

On Thu, Sep 17, 2026 at 10:51:37AM -0500, Frank Li wrote:
> On Thu, Sep 17, 2026 at 04:08:36PM +0200, Francesco Dolcini wrote:
> > On Mon, Sep 14, 2026 at 04:36:51PM +0200, Francesco Dolcini wrote:
> > > On Mon, Sep 14, 2026 at 09:28:13AM -0500, Frank Li wrote:
> > > > On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> > > > > On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > > > > > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > > >
> > > > > > > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > > > > > > carrier board.
> > > > > > >
> > > > > > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > > > > > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > > > > > duplication create a common dtsi to share commonalities.

[...]

> > > > > Is this blocking this from being picked up?
> > > > > Is there any other concern on this series?
> > >
> > > Can you answer these two questions?
> >
> > Please let me know if it is a requirement to have the gpio line names
> > wrapped with 4 elements per row or not. I am waiting on your answer on
> > this.
> 
> Although it is not "must" requirement, I think it is easy to read by
> packed 4 elements.

Thanks for the reply. Given this comment and the disagreement we have on
the read-ability I do not plan to change anything in this patch series.

Let me know if any other issue is present or if anything changes on this
specific regard.

Thanks,
Francesco



