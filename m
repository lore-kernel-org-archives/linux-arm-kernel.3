Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC15C98303
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 02:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNNQIe+zL0h/HI/LHONU+gkJLEjREbUKUSNPPiaoEeo=; b=IMmK+5Aswh1qD/w3xjlsFYrDPh
	En0SXnJN4VgqS2DLr4O52TnSGjke7ggZiFdaC0Qzr0XwWVhGwMgyymIX7nNtV/Cj2JqPnCQI+cXut
	ggo6KHcHBJ7JcSZAC0O0ObXdvQUz2ImoT75mePRqzlZLPlsbycXyx+yJRtHEpOtdsNZlK85oRttMO
	oBtqZEnWgJ95N0Hy6i60PA1Keu/zY159d4f/WRjVQnRC/Fov48t1+E6jU+sfir96T+lqldr6+eYOu
	S3m/P5QARZ8lmeLvpfmEMsNjaB3mdmFFA3D27gvnhdf0xOd1afAsvH9XmsIRSQNjzQ22CqvDDimdA
	NQPiUcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgwHi-0000000F8pz-23FH;
	Sat, 17 Jan 2026 02:43:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgwHh-0000000F8ps-0Xn7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 02:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37AC160127;
	Sat, 17 Jan 2026 02:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4B3C116C6;
	Sat, 17 Jan 2026 02:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768617807;
	bh=M8I0P+6+kQfZVYRfMsIkrT3kwJeTYt5m5hoJ5qwOuIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOdeCkWMhN9WnWZxErtm5Hm2SO6e1OYgFzVOxSN5IwSyO5pmzbdapo5Ot+4c+GrEQ
	 Gmz0C5eQ9AhCq/BwZUiQuR9rDqfDU+c3GXVEzbaF8ZfEIMSK2bu1t4jknRu9w8WEzs
	 QRt8BGWgiSvF7JAlWXRxe74aEhVWlPuaMVOi0w/9jdqrg9+/2goye6UcPfFrhMZb/z
	 K60GAcMWsyJyMSuKTSMZUiSg1pG65aOBDHLM5z7lbPHsq6mx8xTFigMuJo5RYSugYR
	 UFlV7ePveLsp1zwHmtlj/WxSl9XTi22n6BKfTEuhkE6KHE4p/9TKrTLgBL+Lbv14Jh
	 WHq6jtURQ5ckA==
Date: Sat, 17 Jan 2026 10:43:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>, Li Jun <jun.li@nxp.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: Re: [PATCH 0/9] arm64: dts: imx8m*: misc update
Message-ID: <aWr3R-phzjSS9GL-@dragon>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
 <aVwWnAMqVqE7jtCy@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVwWnAMqVqE7jtCy@lizhi-Precision-Tower-5810>
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

On Mon, Jan 05, 2026 at 02:53:00PM -0500, Frank Li wrote:
> On Mon, Nov 10, 2025 at 03:54:40PM -0500, Frank Li wrote:
> > Some misc update for imx8m* dts
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Frank Li (2):
> >       arm64: dts: imx8mm-evk: replace space with tab
> >       arm64: dts: imx8mp-evk: replace space with tab
> >
> > Fugang Duan (1):
> >       arm64: dts: imx8mm-evk: add uart3 port
> >
> > Li Jun (2):
> >       arm64: dts: imx8mm-evk: add wakeup-source for usb phy
> >       arm64: dts: imx8mn: add wakeup-source for usb phy
> >
> > Shengjiu Wang (1):
> >       arm64: dts: imx8mm-evk: correct the spdif compatible string
> >
> > Sherry Sun (3):
> >       arm64: dts: imx8mm-evk: add uart1 and bluetooth node
> >       arm64: dts: imx8mn-evk: add bluetooth dts node
> >       arm64: dts: imx8mp-evk: add bluetooth dts node
> >
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 78 ++++++++++++++++++++-------
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  4 +-
> >  arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi |  4 ++
> >  arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  1 +
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 32 ++++++-----
> >  5 files changed, 85 insertions(+), 34 deletions(-)
> > ---
> 
> Shawn:
> 
> 	Can you help check these patches?  only patch 4 need remove "evk"
> at subject, do you need me respin it?

It doesn't apply to my tree.

  Patch failed at 0008 arm64: dts: imx8mp-evk: replace space with tab

Shawn

