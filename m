Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69892C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/t7vCxJWdDph//099EQUA35oIJvQPYCB3Z9DffQy6g=; b=JWXFHz25nKz2LllnzyusFQqlmT
	8zKKp8hFvaIIufFEl2wI3px06lPeq8Q7XWNZIBCccIu4JTR2SfEWMmlv2wJdv1edu0ZAcl9KZSzNq
	nbimxd9nUg45ziDuBQW5qxP1tgVgxKk3j8JHyOvLUnEnIeU9Mrul7K/F6Fdd3rm/2xC6tv9U808ew
	z6JEyHbfyuiXNwBCJTq6DkWkXBmeqB40yiXBtDftoah0dT0jObXZwteP2MFIF5YHxmbbOdksRT30V
	kI+z+rpdZMxyvs04oSlIC8SWXtd5bmK2Q0aLPzRJbuaULMdWxH1VG/4kJ9dMGIsaKP5Wo6MgRcuga
	0El1V+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJoo-00000008pyL-3LqQ;
	Fri, 07 Feb 2025 08:34:34 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJnP-00000008pfr-23UK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:33:09 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 26D131F9E1;
	Fri,  7 Feb 2025 09:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738917182;
	bh=l/t7vCxJWdDph//099EQUA35oIJvQPYCB3Z9DffQy6g=;
	h=Received:From:To:Subject;
	b=x4VMvHw4NptAo6x5XBmAV+QyJzCjjYW92WHrhRpEQEeN4AiwlYBrOWnwuYnv3+xdS
	 CduSirEGbfD2odtgGD8sqFJCJ9+32bW/KFtb9wnnB99Hlaajp0rtKbVovJRKUvjTwS
	 fmgzuipXjkP5rYLWk5Ax29PDsHC8Xj3MDh9oJ8djV50HYbtY3AGPacKWJAjnE6ep5D
	 LVunkSKdESz3ahRx38ffZQLEZFJsJ43tp2PVrE7wr4082EtgSqslloEUpzynX0LRwf
	 xnBmNBPjniMBj60NSNgxR9nqm4JDWFodHRONrpK1BWXQCA/tTG9gHLO6alYXXkyt5X
	 U3irvwSolkaAA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id BACC07F926; Fri,  7 Feb 2025 09:33:01 +0100 (CET)
Date: Fri, 7 Feb 2025 09:33:01 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p: Enable AUDIO_REFCLKx
Message-ID: <Z6XFPYaj069fvW1h@gaggiata.pivistrello.it>
References: <20250206153911.414702-1-francesco@dolcini.it>
 <20250207014239.xzm6rfnusckql2uo@litigator>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207014239.xzm6rfnusckql2uo@litigator>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003308_423428_D22A3702 
X-CRM114-Status: GOOD (  22.82  )
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

Hello Nishanth,

On Thu, Feb 06, 2025 at 07:42:39PM -0600, Nishanth Menon wrote:
> On 16:39-20250206, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > On AM62P-based SoCs the AUDIO_REFCLKx clocks can be used as an input to
> > external peripherals when configured through CTRL_MMR, so add the
> > clock nodes.
> > 
> > Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62px/clocks.html
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > index 420c77c8e9e5..4b47b0774330 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > @@ -42,6 +42,26 @@ &inta_main_dmss {
> >  	ti,interrupt-ranges = <5 69 35>;
> >  };
> >  
> > +&main_conf {
> 
> 	Why not add it to main_conf section it self in the file?

The reason is that main_conf is defined in k3-am62p-j722s-common-main.dtsi,
that is shared between am62p and j722s.

On j722s the audio refclk is added in k3-j722s-main.dtsi the same way as I did
here, so I cannot move this to k3-am62p-j722s-common-main.dtsi without updating
also k3-j722s-main.dtsi.

I looked into the differences of j722s and am62p, and from my understanding,
from the audio refclk point of view, they are identical (same IP, same reg, same
clocks and same IDs), so this should naturally be moved to
k3-am62p-j722s-common-main.dtsi as you are suggesting.

... however, for some reason I am not aware of, on k3-j722s-main.dtsi a different
parent clock is used, and I cannot understand the reason. The actual parent clocks
in this patch are just the same we already have everywhere apart on j722s. I tried
to look at the history of this and it seems that on the TI downstream kernel branch
this is defined in the board dts file (!) and this confused me even more.

So, not wanting to break stuff I was not able to understand I came up with this
proposal.

An alternative could be to override the "unexpected" clocks from
k3-j722s-main.dtsi to the board dts file, and have the "standard" clocks, as
proposed in this patch and already used on all the other AM62 variants, in
k3-am62p-j722s-common-main.dtsi.

+Jayesh that is the author of this specific change in k3-j722s-main.dtsi.

Francesco

> > +	audio_refclk0: clock-controller@82e0 {
> > +		compatible = "ti,am62-audio-refclk";
> > +		reg = <0x82e0 0x4>;
> > +		clocks = <&k3_clks 157 0>;
> > +		assigned-clocks = <&k3_clks 157 0>;
> > +		assigned-clock-parents = <&k3_clks 157 16>;
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	audio_refclk1: clock-controller@82e4 {
> > +		compatible = "ti,am62-audio-refclk";
> > +		reg = <0x82e4 0x4>;
> > +		clocks = <&k3_clks 157 18>;
> > +		assigned-clocks = <&k3_clks 157 18>;
> > +		assigned-clock-parents = <&k3_clks 157 34>;
> > +		#clock-cells = <0>;
> > +	};
> > +};
> > +

