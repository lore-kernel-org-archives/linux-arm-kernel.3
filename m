Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507C0C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFxeqb2w6p/HM7KrbyHkPToUG2g8rWkVuLOzQ+f45vs=; b=e56R+Kkyz2iX4RqXrzmZ/VoQyi
	rJBfRrk/Ms+axfwlmOdd5ui+iyqDNiVymFdB5RQktzLfVAn6DYzv0f628RjpcV95PDqZpaW0iLPNV
	iIeftByz8CkOgiuttxEujyUHWMB3sGyRw9shPRWhTkMWh97ou+ul6XtXWuHbWgW9VYu9bS6BEWcU+
	bDViEFOI72+NJRgLbBt9oifa6zTUPtQcBBXPaQC2ydHq2FzN26hilFhhXUGoka7ZcitlMW9JJwuNe
	CWMSbIQEzwmhmTR9pPashDeyrewotRqK7Rsm4LLNjx5HMni7G7nH4VQcRGfg5Oimc/3puaUS2AkVU
	YmvvIrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzkC-0000000AyCF-28ph;
	Fri, 28 Feb 2025 12:45:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzid-0000000AxYQ-0fFO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:43:56 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 177021F9D0;
	Fri, 28 Feb 2025 13:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740746632;
	bh=NFxeqb2w6p/HM7KrbyHkPToUG2g8rWkVuLOzQ+f45vs=; h=From:To:Subject;
	b=nxpObFjDS+xoC+STRpagsX4FWph0sBnWrOMrSK3YKRSZR1J0p0sVD8w0jxP3Pl8AT
	 2hnUXAGt5V/Uw+7Ael657bMHbMydhx89VKnS9U/U981cVlNg36eXOYy55Vv84V8vcW
	 /kUht3tOoSG0/HtuEJB3QTFzYo7A1UIGcirYYqvZsob4GSGcvBvvnAfz2X+i9OVLLU
	 YDsfVfTC84uLXYat3AjU/RmXYSTVoWdjloWLwzDO0XG3YZrP5EBiU+UpoT1LF/1ocZ
	 Y4upNOSX4RmdSqXKoads6uywDhsaOV4n3t+CUAj+IeFuvBunQW5CeOM1VJ4VODpyvs
	 PTNMIiwD8lfwA==
Date: Fri, 28 Feb 2025 13:43:47 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p: Enable AUDIO_REFCLKx
Message-ID: <20250228124347.GA20656@francesco-nb>
References: <20250206153911.414702-1-francesco@dolcini.it>
 <20250207014239.xzm6rfnusckql2uo@litigator>
 <Z6XFPYaj069fvW1h@gaggiata.pivistrello.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6XFPYaj069fvW1h@gaggiata.pivistrello.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_044355_353446_A71F423A 
X-CRM114-Status: GOOD (  29.98  )
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

On Fri, Feb 07, 2025 at 09:33:01AM +0100, Francesco Dolcini wrote:
> On Thu, Feb 06, 2025 at 07:42:39PM -0600, Nishanth Menon wrote:
> > On 16:39-20250206, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > On AM62P-based SoCs the AUDIO_REFCLKx clocks can be used as an input to
> > > external peripherals when configured through CTRL_MMR, so add the
> > > clock nodes.
> > > 
> > > Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62px/clocks.html
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > > index 420c77c8e9e5..4b47b0774330 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> > > @@ -42,6 +42,26 @@ &inta_main_dmss {
> > >  	ti,interrupt-ranges = <5 69 35>;
> > >  };
> > >  
> > > +&main_conf {
> > 
> > 	Why not add it to main_conf section it self in the file?
> 
> The reason is that main_conf is defined in k3-am62p-j722s-common-main.dtsi,
> that is shared between am62p and j722s.
> 
> On j722s the audio refclk is added in k3-j722s-main.dtsi the same way as I did
> here, so I cannot move this to k3-am62p-j722s-common-main.dtsi without updating
> also k3-j722s-main.dtsi.
> 
> I looked into the differences of j722s and am62p, and from my understanding,
> from the audio refclk point of view, they are identical (same IP, same reg, same
> clocks and same IDs), so this should naturally be moved to
> k3-am62p-j722s-common-main.dtsi as you are suggesting.
> 
> ... however, for some reason I am not aware of, on k3-j722s-main.dtsi a different
> parent clock is used, and I cannot understand the reason. The actual parent clocks
> in this patch are just the same we already have everywhere apart on j722s. I tried
> to look at the history of this and it seems that on the TI downstream kernel branch
> this is defined in the board dts file (!) and this confused me even more.
> 
> So, not wanting to break stuff I was not able to understand I came up with this
> proposal.
> 
> An alternative could be to override the "unexpected" clocks from
> k3-j722s-main.dtsi to the board dts file, and have the "standard" clocks, as
> proposed in this patch and already used on all the other AM62 variants, in
> k3-am62p-j722s-common-main.dtsi.
> 
> +Jayesh that is the author of this specific change in k3-j722s-main.dtsi.

Jayesh, Nishanth, any comment on this?

Should I proceed with this last option ?

   An alternative could be to override the "unexpected" clocks from
   k3-j722s-main.dtsi to the board dts file, and have the "standard" clocks, as
   proposed in this patch and already used on all the other AM62 variants, in
   k3-am62p-j722s-common-main.dtsi.

Francesco


