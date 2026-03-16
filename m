Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5DDD58B36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4AH6YkoxfjCVSwkpW5NTHf4L5AVTzIAYMMqohKdiUs=; b=r1npcxHZDGEXvYwa7x2wAy19Xh
	wagSxFBjbnLyXAuxT7hpLLO9fJEnDjpeOa0AYyL5E2SkQ+RePBH/ucKMoIMQVzJCUScbYYlY1WAYm
	u1+lsPwnxoRa6pFN4MnpFGOBwQa2JIcP9C9LzOmRJRcNQqOPLXn7lXl0yjzrrELq8mRcgka66g6Bf
	ltKX53+ObI9WNmMjzZaicrD6vLmoT2nwG3tZCvuVByKXIvRp0Teq6uIrjjCwgCV/93NSqJhWnPCxK
	h/1Ve0a2Iyny74+JLtBiyZK0osxCV/DJeekFaHAJti0NMMEJ3S+g6ZkOyBwTMbGpYpik68IY8ze91
	yf+14UcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20X1-00000003LwT-03h6;
	Mon, 16 Mar 2026 05:30:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Wy-00000003Lw1-2stl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EF7043CBE;
	Mon, 16 Mar 2026 05:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461E6C19425;
	Mon, 16 Mar 2026 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773639019;
	bh=8B9fuSdohsuu1CMnw79SUjkL9MjMlLUlCNTDA2w6noo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBtsWnDwe7n0y74F0kwuhppOL3Jf1ovoELahhJv2KmO48mrDBsUpOFr6UnwcdDaSD
	 nS0n36nZvPz09OF8iIRxZSHpcJcHGcO2FblGqZsuTt0sUIK+D3ilx+EY5a7CP2fnj2
	 JU1z/PXpSEEHoUzAiW05d/SEqGl8gzn/+idUucciuX8W8tN8p9iogB62tRi4WwQ9jt
	 CyFDY7vdLq8Unov6pUmV/FxGfoYQNvV3rUtVD8GpgsdTLpQ1P/KEY6E3u2AmhyOzHd
	 OqWinSAJ4pHKYAoS+QMXvJUMoMrpnIwsNZMzWafBI2EoejO4Rl0jL3rAe2V9lvHQ9H
	 u+xNRn2dWbq+Q==
Date: Mon, 16 Mar 2026 11:00:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Sherry Sun <sherry.sun@nxp.com>, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, Frank.Li@nxp.com, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 06/13] arm: dts: imx6qdl: Add Root Port node and PERST
 property
Message-ID: <wnbxqzsxq5v33rr4cweoz2inkxsq536bqxvtpdleboll76gx7k@rdhh4ntyydk4>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
 <20260313020823.1592389-7-sherry.sun@nxp.com>
 <CAGb2v65dvWRqugwBAORB_dD+3Part+OieCe9hnSR781g-6NgZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65dvWRqugwBAORB_dD+3Part+OieCe9hnSR781g-6NgZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_223020_799484_A5DC6572 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, Mar 13, 2026 at 02:08:05PM +0800, Chen-Yu Tsai wrote:
> On Fri, Mar 13, 2026 at 10:08 AM Sherry Sun <sherry.sun@nxp.com> wrote:
> >
> > Since describing the PCIe PERST# property under Host Bridge node is now
> > deprecated, it is recommended to add it to the Root Port node, so
> > creating the Root Port node and add the reset-gpios property in Root
> > Port.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
> >  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
> >  arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > index ba29720e3f72..fe9046c03ddd 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > @@ -754,11 +754,16 @@ lvds0_out: endpoint {
> >  &pcie {
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&pinctrl_pcie>;
> > +       /* This property is deprecated, use reset-gpios from the Root Port node. */
> >         reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
> 
> I'd say just remove the old description.
> 
> You're asking for trouble by describing the same thing in two different places.
> 
> >         vpcie-supply = <&reg_pcie>;
> 
> I would probably also take this chance to just convert to the proper PCI
> slot supply, and just add pwrctrl support into your PCIe driver.
> 

+1

- Mani

-- 
மணிவண்ணன் சதாசிவம்

