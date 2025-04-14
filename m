Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D417C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlW08uxmPGoEZDWa+cyNebNlWrztiqYqkRF1fWbvU+w=; b=dDLp5zUtVEaDzT1pcUQCizMUkG
	hqnM3Nl5mjnVvx4UcE+xguxcSsFPXZa9TCyHa1j6RPGe2OYGDcqnEK7B7Hh4bX8VmYvtAsiCZK772
	13KfgyWcfIX58/r3J5uGZq7Ukn7Zf58ax/xsTmFr3DvFYi0ztfZBQ48sUuUXmvo2xoEJzqycSps6r
	auaQtQTARtvRGOfTPfacKQJsJgSfWCinOSYjaDfgucKDP1CpnplC8WHx0wsCrVvI7OK/Ke/EDtWLO
	XOHHN45x8xfHwO6Ds+A7vWnuczt389M0kjuhGCFIVh5euOuZps+9sp+0hTlfzvZjOArsjnaQFveAn
	0osNue1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JEo-000000020HD-08dD;
	Mon, 14 Apr 2025 12:48:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J7j-00000001zKz-1BSI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72F7C5C4750;
	Mon, 14 Apr 2025 12:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA9AC4CEE2;
	Mon, 14 Apr 2025 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744634474;
	bh=QsIBr7PmztIyHLM9T+NpRun+FoqaEeRAxlPHdVqB1WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3vSR88V+CaMm4+J7dRa5OE26INA51ofAMCzDjqUAiTxIVJvOi7Yg4FS7DcXfHVV+
	 x3mNkGXK/ZB2QE3LjisppWC1XW7vSiVOx7yUJGHOPxw2wxGbPVwTYvskmVF6t6+2AC
	 IcQ6UUnBzg5tp5QxdE/xnnUi/z7ofHGHvbTsMlmNT4yb+NhuA73McjobP05Awwd5SZ
	 EzjBKtw72VN8m2jNELTtOP10l5h6qEHnSEFhdv7OnJHu2HBONwoXBZx/Ns60exlrGz
	 WamblujbQmJ9WeKD+X1PpW3sLrJGPltvpuFR3WgPGXRd1LWschSx1Of0LTkvQZvSre
	 miF4z++GRwgsA==
Date: Mon, 14 Apr 2025 14:41:03 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Use preferred node names for
 "simple-bus"
Message-ID: <6mj4bvaqho5oazrhkkzncbwlrcupe3zpweuk7aqr2wdgfphejb@sc6ojhybs26g>
References: <20250226214751.3751865-1-robh@kernel.org>
 <20250226214751.3751865-3-robh@kernel.org>
 <20250412001703.qbbfhtb6koofvner@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412001703.qbbfhtb6koofvner@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054115_409487_6F17C22A 
X-CRM114-Status: GOOD (  28.52  )
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

I will fix the U-Boot code in upstream, and schedule U-Boot upgrade
on MOXes running Turris OS...

Marek

On Sat, Apr 12, 2025 at 03:17:03AM +0300, Vladimir Oltean wrote:
> Hello,
> 
> On Wed, Feb 26, 2025 at 03:47:49PM -0600, Rob Herring (Arm) wrote:
> > The "simple-bus" binding has preferred node names such as "bus",
> > ".*-bus", or "soc". Rename the Marvell platforms to use these names.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi     | 2 +-
> >  arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
> >  arch/arm64/boot/dts/marvell/armada-ap806.dtsi     | 1 -
> >  arch/arm64/boot/dts/marvell/armada-ap807.dtsi     | 1 -
> >  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi     | 4 ++--
> >  arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi | 4 ++--
> >  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi     | 4 ++--
> >  7 files changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> > index 9603223dd761..6ec22eaaf816 100644
> > --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> > @@ -78,7 +78,7 @@ soc {
> >  		#size-cells = <2>;
> >  		ranges;
> >  
> > -		internal-regs@d0000000 {
> > +		bus@d0000000 {
> >  			#address-cells = <1>;
> >  			#size-cells = <1>;
> >  			compatible = "simple-bus";
> 
> Thank you for your patch, which is now commit
> ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95.
> 
> I have an off-the-shelf Turris MOX board, which was shipped with a
> U-Boot older than the commit linked below (does not contain it):
> https://github.com/u-boot/u-boot/commit/bcf6971d536793eb99e12ff857cc018963d7cd46
> 
> and as such, is incapable of loading current mainline device trees,
> which contain your change, because it is hardcoded to perform FDT fixups
> based on paths such as:
> #define ETH1_PATH	"/soc/internal-regs@d0000000/ethernet@40000"
> #define MDIO_PATH	"/soc/internal-regs@d0000000/mdio@32004"
> #define SFP_GPIO_PATH	"/soc/internal-regs@d0000000/spi@10600/moxtet@1/gpio@0"
> 
> which no longer exist.
> 
> Relevant portion of boot log:
> 
> ## Flattened Device Tree blob at 04f00000
>    Booting using the fdt blob at 0x4f00000
>    Loading Device Tree to 000000003bf16000, end 000000003bf1e11e ... OK
> ERROR: board-specific fdt fixup failed: FDT_ERR_NOTFOUND
>  - must RESET the board to recover.
> 
> FDT creation failed! hanging...### ERROR ### Please RESET the board ###
> 
> Note that the hint about what is wrong is only visible with a serial
> console which I happen to have. The board does not rely on it for normal
> operation, which could pose a problem to typical users.
> 
> Just bringing this to everyone's attention. In the meantime, I'm going
> off to figure out how to build and flash a new U-Boot using the steps at
> https://github.com/turris-cz/mox-boot-builder.
> 

