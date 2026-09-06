Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFC4C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzRnZqGCK4vQaDQlzB7tpWSJvujbPPPlfGioawuGr2U=; b=NlWOh7RTI7zll9hlR3xlteCGYd
	ymDEd2cmhnWBE0/HrkWY4XR/jkDQlCfVh+u+kW2Rd8+nGTM2tkWVNVkoP9mwqhIWB6U9YFaUz9dzN
	cBvW1ROG38EO2qX5wsz8+25NvDRn3qt13EC2KbrwZ+9ciQ/UCLhPjVKkJqNO9Z8zxyv1n/Ps2r0D8
	mZ43vTA5pnM1o5TN5l5iSZVY6BFL+iv1VirIRRhYAZE+sasjWwSYBzkpqr3FztYpbGLF9toe4ZPDW
	lFOCHyxsTJFtdG8v0ZcfFAc4/ZcyIMKikC2jClg0AlHgqdnE402tOR9XnJefm9g89eLGaldJQRBg9
	7wwQk+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EqT-000000058X1-3ztu;
	Sun, 06 Sep 2026 15:31:49 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EqP-000000058Vm-1s6n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 15:31:48 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 34F58222CE;
	Sun,  6 Sep 2026 17:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788708695;
	bh=ZzRnZqGCK4vQaDQlzB7tpWSJvujbPPPlfGioawuGr2U=; h=From:To:Subject;
	b=BAkmLRabM3PlM/H+7r0rbSqmgR3bhd/Nl1XNS86hjPd/WINU6tbl3ftmlZyJaj0DE
	 fUMM+6DitlVyws1ZEVVTshV7gKtfwPuRGbmTt9pCzWLKn/XciQbSp4uEu06ny2UxRP
	 ld7sOxSppSyXvqe3O9fN95B8kFK0iGwSxXrvTTzhv/WUOt9YKZcO+KXkPziCwA2m9y
	 c7ASe5BsT7iTp5pES4U1z8B/JdjrbXeI6+oHvrTigVocyepvtjybaGqBa1XX2BwX8N
	 cRvxQwUuBSR89R8Of7REd9qLz9QmMGxbHNwpyWTPzf/Kp4jQOEuNrezA++SzbFijQH
	 O4LTyQvLX5ROw==
Date: Sun, 6 Sep 2026 17:31:30 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
Message-ID: <20260906153114.GA3576@francesco-nb>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
 <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_083146_513557_B49BF93D 
X-CRM114-Status: GOOD (  16.43  )
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

On Sun, Sep 06, 2026 at 11:13:27AM +0530, Kumar, Udit wrote:
> 
> 
> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
> > Add the 'ethernet0' alias for the Ethernet interface corresponding to the
> > MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
> > Processor Board.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> > index 54dea36b153b..ac1c1ffe40b7 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> > @@ -24,6 +24,7 @@ aliases {
> >  		serial5 = &main_uart3;
> >  		mmc0 = &main_sdhci0;
> >  		mmc1 = &main_sdhci1;
> > +		ethernet0 = &cpsw_port1;
> 
> Hello Siddharth,
> As default only 1 cpsw port is enabled for all boards in this series.
> So ethernet0 will be cpsw_port1 always, In case you want to enable more
> port in default config then having aliasing will help.

I do not know for this specific board, but in general having the alias
when only one ethernet interface is present in the DT can still be
useful.

We might want it to ensure that the interface name is stable (`end0`
with systemd), or maybe you can have additional interfaces that are on
some discoverable bus (PCIe ?) or you need it for the bootloader to set
correctly the MAC address or ...

Francesco



