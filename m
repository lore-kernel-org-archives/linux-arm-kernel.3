Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09713CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3MQLLai5Lv1jjJP3MPQy569OXhdTSwstmrfUBxF72w=; b=r4IDrVoVMDYOZBmfPBCXH1gtEM
	yTFzcxXqbB5qMJkFN57wnyz8bYxPt5QM8ZYt29+bSrXS0G7EOSWnuP+urW9VbcM2kNN5OCx4pyVPD
	wF9gtkJbCXKZpiuJ+wdMTKizlts24B7HUWmGiyNcrqUEF0gnv/6D82+Nk6cbyNkv/SowF32UsCmJB
	OV6jFdqMruAgiJmyMzYTJGH/CofIb3nqRvQYtgRhAkcOnN9DfCItNU451KNim4IFvjExQDol/ju4R
	CimW47OmwTCST1oXtFHlux1xO7k3NeIr3whWmgnhk2ljjxiD4POivqZ7qVTzLJS8k8CzKIkqq/5ek
	sUMvM6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hzn-0000000DA8l-3pqG;
	Mon, 13 Oct 2025 12:49:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hzk-0000000DA7e-3buY;
	Mon, 13 Oct 2025 12:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k3MQLLai5Lv1jjJP3MPQy569OXhdTSwstmrfUBxF72w=; b=IYz8hkJVfaP2cX4h8ZURsZZ4uF
	mKPN5lEiMWdLhGTGvlXkhhNTiX+V6ElB7rt+ErxHq2nWwSTGUKFpoF5Sg8Idcuf2MJi8Wa+grVvW4
	Fed16y9coFyDw/QXXQYs5I7htwlZLIz/reIUDsDX5TKjYWKtZ2aMJAkBzBIOvKjoAbMjkMvr15Tcl
	G590Viuqb+Xm6YMY7lweG+QjqEaz64p3KHCxQif1U5l8J3fgTigZ7luXotO5sKO/ECOtF2AeOXf7y
	nap9IUSzUxu1McVNIdhRmwT8/b6UD27i34sKNFzmVJy7CewBcJhCyubeppnsLP12nSJ7f2tsJ7x8e
	Mb1NJa8Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v8HzP-000000001zZ-0kKg;
	Mon, 13 Oct 2025 13:49:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v8HzH-000000000Le-1ZYr;
	Mon, 13 Oct 2025 13:49:15 +0100
Date: Mon, 13 Oct 2025 13:49:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Liangbin Lian <jjm2473@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, andrew@lunn.ch, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <aOz1SzpzGLDQjiYQ@shell.armlinux.org.uk>
References: <20251009084416.45542-1-jjm2473@gmail.com>
 <20251009084416.45542-4-jjm2473@gmail.com>
 <aOe_0EufouURu7R2@shell.armlinux.org.uk>
 <CAP_9mL4MfzagxiMD1VdOu=jBuN_XsOrvPQT=XTVgu2+G=+nD9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP_9mL4MfzagxiMD1VdOu=jBuN_XsOrvPQT=XTVgu2+G=+nD9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_054944_897294_CF129820 
X-CRM114-Status: GOOD (  28.12  )
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

On Fri, Oct 10, 2025 at 11:20:08AM +0800, Liangbin Lian wrote:
> Russell King (Oracle) <linux@armlinux.org.uk> 于2025年10月9日周四 21:59写道：
> >
> > On Thu, Oct 09, 2025 at 04:44:16PM +0800, Liangbin Lian wrote:
> > > +&gmac0 {
> > > +     phy-mode = "rgmii-id";
> > > +     clock_in_out = "input";
> > ...
> > > +&gmac1 {
> > > +     phy-mode = "rgmii-id";
> > > +     clock_in_out = "input";
> >
> > I am fine with what is being proposed here, but I think this
> > clock_in_out property needs fixing. The description for it is thus:
> >
> >   clock_in_out:
> >     description:
> >       For RGMII, it must be "input", means main clock(125MHz)
> >       is not sourced from SoC's PLL, but input from PHY.
> >       For RMII, "input" means PHY provides the reference clock(50MHz),
> >       "output" means GMAC provides the reference clock.
> >     $ref: /schemas/types.yaml#/definitions/string
> >     enum: [input, output]
> >     default: input
> >
> > The problems that I have here are:
> >
> > 1) the description states that the only possible value for this when in
> >    RGMII mode is "input" which is reasonable, because it's due to the
> >    RGMII specification. The driver code is perfectly able to determine
> >    whether RGMII has been specified, and set bsp_priv->clock_input
> >    itself, relieving DT of this need.
> >
> > 2) bsp_priv->clock_input is only used in gmac_clk_enable() when calling
> >    the SoC specific set_clock_selection() method. Only RK3528, RK3576,
> >    and RK3588 populate this method. Every other SoC supported by this
> >    driver still requires the property:
...
> >   clock_in_out:
> >     description:
> >       For RGMII, it must be "input"
> 
> This description does not match the actual situation,
> there are many dts using 'output':
> https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts#L235
> https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts#L241
> https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dts#L33
> https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts#L78

For all of the above, whether it is "input" or "output" has no effect
as these are all rk3568, and rk3568 does not implement the
set_clock_selection() method.

static const struct rk_gmac_ops rk3568_ops = {
        .set_phy_intf_sel = rk3568_set_phy_intf_sel,
        .set_to_rgmii = rk3568_set_to_rgmii,
        .set_to_rmii = rk3568_set_to_rmii,
        .set_speed = rk_set_clk_mac_speed,
        .regs_valid = true,
        .regs = {
                0xfe2a0000, /* gmac0 */
                0xfe010000, /* gmac1 */
                0x0, /* sentinel */
        },
};

I'm going to propose:

1) that the driver should only print an error if "clock_in_out" is
missing _and_ the SoC implements the required function.

2) that the driver should print a non-fatal error if this property is
specified in DT _and_ the SoC does not implement the function to
discourage its use.

3) [tr]x_delay should not print an error for non-RGMII phy interface
modes.

I consider it a bug that a driver prints errors for properties that
have not been specified that it does not actually require. By doing
so, it encourages people to add useless properties to their DT
description that will never ever be used (e.g. because they are not
relevant for hardware the operating mode that the board is setup
for.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

