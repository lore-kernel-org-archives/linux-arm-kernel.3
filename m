Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93788C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHeHKjOtze9072uc9sAILGyF+VMbid8tJ1y/UenR6W0=; b=uPZFa2eVDdRiG+d+KgfOuSyA2V
	Y5zr408WeCuD9DFf8MFpFxul83cDz83TDnKvAc8qOgg01vt+oiKnN7zgb/lZooAqG4i/9OqUZ5hQJ
	4M8snS6XzhIf6vFfedMTLsKYVkIHHny2fqqHXRgdUwgqCAx880wZ0PENvrfRW/mz3ndgxTnf1khto
	CHWWasebpDlyQs7qrMHjSWRztgyvpjLT9vLf2aJLGJ920W4W3jK7P4pKasxOm77YQ31MypdyHpTvo
	lqboANvE355A9MOR2JMMo7qirRIY8JZQ1ZdQdz33P0w9a4DMGUtJ4gQOvzoFpInz2dahCcWDbCWoe
	8fS38hkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVEq-0000000A19D-1LiD;
	Tue, 18 Feb 2025 21:34:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUjh-00000009um8-0QvV;
	Tue, 18 Feb 2025 21:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AHeHKjOtze9072uc9sAILGyF+VMbid8tJ1y/UenR6W0=; b=bBIVAReRJedrRHTHwsVWyY22wF
	0hFbL3LKkAZu0oXBIOS3mGyw7QyT+gCrIxMVQNFbeX7Y2gIx66ctlcSU+M/m1VPEkTTRoDYPHBJB8
	F/DcwFxG8LgMCmebnn55OyaPwOEBE/g/WwRubSxWt+vJTWvHBfjTRZWfMNTVxjqeRCCrXbe0VM0q/
	TSOKHGFf2aS1yQZds0MQ2jWOZ6BUJ6A30LhfiSqVWD++a0G9flSWTmOq9cHP6yEmLXVmldZmEjX4D
	Du6n1yEnllm38n66pmKh80G8scf7R9mTva28IJspb5Lu/KUFBaCCjWERVTF4UlKnp9o52m4b1dQGK
	tNGNXfBg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tkUjf-0000eN-Cg; Tue, 18 Feb 2025 22:02:31 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
Date: Tue, 18 Feb 2025 22:02:30 +0100
Message-ID: <3140293.CbtlEUcBR6@diego>
In-Reply-To: <6cac5ab1-0b76-4f28-b8e1-72760464b3d1@cherry.de>
References: <20250213163013.1616467-1-heiko@sntech.de>
 <6cac5ab1-0b76-4f28-b8e1-72760464b3d1@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_130233_171183_97D5B21E 
X-CRM114-Status: GOOD (  46.90  )
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

Am Dienstag, 18. Februar 2025, 12:24:38 MEZ schrieb Quentin Schulz:
> Hi Heiko,
> 
> On 2/13/25 5:30 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Jaguar has two type-c ports connected to fusb302 controllers that can
> > work both in host and device mode and can also run in display-port
> > altmode.
> > 
> > While these ports can work in dual-role data mode, they do not support
> > powering the device itself as power-sink. This causes issues because
> > the current infrastructure does not cope well with dual-role data
> > without dual-role power.
> > 
> > So add the necessary nodes for the type-c controllers as well
> > as enable the relevant core usb nodes, but limit the mode to host-mode
> > for now until we figure out device mode.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >   .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 178 ++++++++++++++++++
> >   1 file changed, 178 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> > index 90f823b2c219..329d98011c60 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> > @@ -333,6 +333,52 @@ rtc_twi: rtc@6f {
> >   		};
> >   	};
> >   
> > +	usb-typec@22 {
> 
> We have a mix of node names in the Rockchip tree, some call it usb-typec 
> some call it typec-portc, including the device tree binding.

when in doubt, follow the binding :-) ... so changed to typec-portc


> > +		compatible = "fcs,fusb302";
> > +		reg = <0x22>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
> 
> Should we have a pinmux for the interrupt line in GPIO mode maybe?

added a pinctrl for each, as this the interrupt is triggered level-low,
pinctrl got a pull-up


> > +		vbus-supply = <&vcc_5v0_usb_c1>;
> > +
> > +		connector {
> > +			compatible = "usb-c-connector";
> 
> Reading the binding, I'm wondering if we shouldn't set self-powered 
> property in there as well? Jaguar cannot be powered (or at least wasn't 
> designed for being powered) via USB-C and I think self-powered means 
> that? Not sure to be honest.

added self-powered ... reading other DTS this seems used in a number of
boards and reading the code which uses this, it seems to ease a number
of places where the code would check if the device might loose power
when not self-powered.


> > +			data-role = "dual";
> > +			label = "USBC-1 P11";
> > +			power-role = "source";
> > +			source-pdos =
> > +				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
> > +
> 
> Should we have vbus-supply = <&vcc_5v0_usb_c1>; here too?

binding says so, so it shouldn't hurt ... added vbus-supply.


> > @@ -394,6 +440,52 @@ &i2c8 {
> >   	pinctrl-0 = <&i2c8m2_xfer>;
> >   	status = "okay";
> >   
> > +	usb-typec@22 {
> 
> All the same remarks as for P11 above.

done everything 2 times :-) .


> > @@ -851,6 +943,24 @@ &tsadc {
> >   	status = "okay";
> >   };
> >   
> 
> Please add a comment here that this is for USB-C P11 connector so it 
> gets easier to figure out what's for what.

added comment


> > +&u2phy0 {
> > +	status = "okay";
> > +};
> > +
> > +&u2phy0_otg {
> > +	phy-supply = <&vcc_5v0_usb_c1>;
> 
> This is a bit confusing at we have the OTG port needing to specify the 
> VBUS supply on the port, while the FUSB also specifies it and the 
> usb-c-connector node can as well.

Actually (or with the vbus-supply being part of the usb-c-connector now)
this isn't actually needed and the vbus regulator seems to be handled
correctly. So dropped that.


> > +&usbdp_phy0 {
> > +	orientation-switch;
> 
> It seems like we have SBU1 and SBU2 GPIOs as well. So I guess we want 
> something like:
> 
> sbu1-dc-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>; /* Q7_USB_C0_SBU1_DC */
> sbu2-dc-gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>; /* Q7_USB_C0_SBU2_DC */

added these

> > +	status = "okay";
> > +
> > +	port {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		usbdp_phy0_typec_ss: endpoint@0 {
> > +			reg = <0>;
> > +			remote-endpoint = <&usbc0_ss>;
> > +		};
> > +
> > +		usbdp_phy0_typec_sbu: endpoint@1 {
> > +			reg = <1>;
> > +			remote-endpoint = <&usbc0_sbu>;
> > +		};
> 
> Something's wrong with the dt-binding here as it only lists one possible 
> port, for the orientation.

I would assume that stems from the thing that the dp-phy is always just at
the far-end of any of_graph lookup. The dpphy does not itself do any
"thinking" but instead just gets told what to do from fusb302, dwc3 etc.

So the port needs to be present as the "other end" of an of-graph link
but the phy itself does not even use it at all.


> > @@ -903,6 +1053,34 @@ &usb_host0_ohci {
> >   	status = "okay";
> >   };
> >   
> 
> Comment for USB-C P11 connector.

ok

> > +&usb_host0_xhci {
> 
> Add a comment for highlighting it supports DRD, just that we aren't 
> ready to support it just yet.

ok

> > +	dr_mode = "host";
> > +	status = "okay";
> > +
> > +	port {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		usb_host0_xhci_drd_sw: endpoint {
> > +			remote-endpoint = <&usbc0_hs>;
> > +		};
> 
> Does this actually make sense without usb-role-switch; set? The binding 
> seems to indicate port is only useful when that is set.

The port _can_ do role-switch, so we will need that later anyway once I
figured out the switch part, so no harm in already having the link.


Heiko



