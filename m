Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD754C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RPD9zCkYpEFXFkstqhyOb8iX6+4+Xh8cL6FAPBm4VQ=; b=kD3phNGSAyWCzHZKKzQqO6XgTT
	6Kv/adQGfRKQbrJNrRWrb93wwK++5Y91xMM+RuZvgYxTQtK8Yh0iBqe5Yba8EWwsf/pNpyoU2dnGN
	sjH/BKNOGimSctT47peI6MD3THzIR1EGzoLi6jWQuSP/9kFKOpxVCkgmGDTy+0rUUD+B/+1UXcm9p
	vydypnuWiOboPjE6bdaz5oSCS1MprdyYyAL8DDvXB16ch/aQ/TK3EZNKPlsN/6TNkA7luPteI96y5
	b8NdWfT3GEZuQmKPkD75kzYH/4L6rJeXFDS6Bw1cXGhGyL61sa0kzHjJsKmXOZZa9JSOA0EQMwRTh
	Y42Jcwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYZj-0000000BJca-25x1;
	Tue, 14 Jul 2026 08:33:11 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYZg-0000000BJbL-3PpO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:33:10 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id D9FF422866;
	Tue, 14 Jul 2026 10:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784017981;
	bh=5RPD9zCkYpEFXFkstqhyOb8iX6+4+Xh8cL6FAPBm4VQ=; h=From:To:Subject;
	b=QPbZAiLrylAhQopbd8b7Jphl2QaqIgE4F0fN+KYxFFHhiNv7ervkryY5qnNcBz2LF
	 MzaqSTAwgsny0heS2ml7O0Nia7/gZ+VUynx10OB6mqSutjWY+jfOkqjOf8z8+65rbC
	 njUh+RVCyLD+mEZ3Lxp7HQqLP6TcfNFQ/Mj41l0MR83/O+PXjBuqX1BUGQHcDUSF8w
	 1mlZhl+hz2d717Yn6XSOe08kDY2+asxLNeLLMEcLElKcXNqUNJfhdXKN07ON8AY2ed
	 VWGauA123gBGJls9iVigBBjLTBTUM6Iw1VyVXqyDCVZX9+TDY8QFzWc0BVRy9A6W8p
	 F/M/PNtPdtCjQ==
Date: Tue, 14 Jul 2026 10:32:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260714083259.GB22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
 <20260714065947.GA22086@francesco-nb>
 <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013309_009670_D80A63C2 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> Hi Francesco,
> 
> On 14.07.26 08:59, Francesco Dolcini wrote:
> > Hello Frieder,
> > 
> > On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> Add the ELE firmware API node and pass its handle to the OCOTP
> >> driver. This allows us to gain read/write access to the OTP fuses.
> > 
> > This seems something we should have in the soc dtsi (imx93/imx91), it
> > does not seems board specific.
> 
> My original intention was to move as much as possible into the SoC dtsi.
> The problem is that the memory node is somewhat board specific due to
> the DDR. And I can't move the firmware node into the SoC dtsi and assign
> the memory node in the board dts as the checks for all boards not
> specifying a memory node would fail then.

The ELEFW is required to boot, is not an optional component for this
SoC, so I would try to find a way to have this duplicated in all the
board files.

What is the reason to have this memory address different on various
boards? Can we have a default in the soc dtsi, and allow the board to
override the address if needed?

Or can't you add the address in all the boards, and keep everything else
in the soc dtsi?

Francesco


