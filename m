Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20750606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+71DA+4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hXFo3vhK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keAdan3S+AhmivIc4eVUa7LHn5sNz32xNdidLDde5Rg=; b=S+71DA+4/3/qVOluEGJEisQRds
	zV46pPVkAL0XA31DbsKR3vIuV1dCBzdMGurB0yIAbQ7BOVAf67Fd2TSBRQu1fqjzJSm90JOVLhjSu
	QzC08faPU6w6J8ZH/NfqReiMOpMN9QJiEvT9z1t6ere+rBN73iB/q8LvHipP3OffnMCaHYZBzX6+/
	c/+/+tLitxjOkmClFN9Fo0WdzoydbxGFEC/DpfcRWTSVFghXagGMFkjBvCOzdYzjx+795gXx5eCpJ
	AGj2UdVFZk9eaIONNfFSk9Mh1BEXgDLkI0+xSAam2uVadqMgpD45xjRelRzHp3rnw6h7L5KD/ZWO6
	0l1p5Q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJb3i-0000000CeWe-24bl;
	Wed, 21 Oct 2026 18:29:06 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJb3f-0000000CeWC-3iaO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:29:05 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso522070e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792607342; x=1793212142; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keAdan3S+AhmivIc4eVUa7LHn5sNz32xNdidLDde5Rg=;
        b=hXFo3vhKxTKGZshS2GwMU7Wctbi+LRHIaG9J4IdEXhqmShUyZHCoQzqjJf7FQqMynt
         pZBzg3KnThD5AGFHyP0SAT+OPBvMzbfF6RfvbbW28UT/ljZf4tXOqOftXCvZUaEyEHAQ
         XFvWrnTmTis71lHKOoAKMHXLep6CcJtDNeHCraPgxzXCj5/5T1+nh4TqlYGFHxS6aSOa
         RM3GIUC/7c6aZpVYAUNpbyCVulPhtgm+CGNIgPyePRbf8zE+V0lO1+HSSebMZNJZo/KO
         DCbZD0MrU3Vns0ug6LmnnafkIrI/eS8fZ0Ob6OlCcWc2/x3+hm7p6Pyn6FSuAkVvLBY1
         v76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607342; x=1793212142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keAdan3S+AhmivIc4eVUa7LHn5sNz32xNdidLDde5Rg=;
        b=FhJtcEVhsc2ewiL5TXiTC6XOUpV8rlcVPl7wEE6+PNmuBXJ2ptK+5KAk2KtQPtab3m
         eNKbhKG4eLA+6VTrM7yiFhMH3H/PpdH51pDLnraS1XqlkUyf3b9KNTXKe0GzyPyxV+s8
         3gWbVzMJUnAv10GMtQ8UuUNdJx5H5RAvUy7YVh4a7ERaPjl+6wVqbrW42WIHtNQTxti8
         tGPJwPBzzUtmI6Kj5HCEaKh0XIR4uUtCyNZ6goTS2W4kBFareHrPb/1Y40NgbptTZ5pI
         MwtFlIdhT4QhbJ6fQy5hsFQDe/Rtu9nC/u7LSKJOudtPWvxRW1ius9LqAkuG8wWgycqA
         BSUA==
X-Forwarded-Encrypted: i=1; AKwUvBzAmkIuLTCisrqtUiweyBQ5JHboaT7MMlfJyDzp7PrW77SwnbAhPOT3lkosZSSwSpIulfiCDHcUqDA8N50Qw078@lists.infradead.org
X-Gm-Message-State: AFq9FYKp14an0dntXkqDjyB9DAbmgh1ShiAqWfzPV290KH830wTW1xXN
	MvIvgAntTF3MI/8qeP8kDxR+mwqxkyJpMNx2xMpXQahp9eNJLI31XHwj
X-Gm-Gg: AYBFou39ubxEMevOw9fLipel1+tdZh3bvHUfqLqgi1qJ8sCO6/pzNsw59NanDgrA+Ar
	TiU6rv80jfy/9vWeK0fef+kPWmivS82aSky9jHbwOazG8QGbRlxxZvqyPiMDuWqijvR5doG98L4
	9R6KFD/zbPGW/bkhg3TIVomlmWpShSeTTPb1uBDpUUEcNZ+pGJVLYM2amRKk6her2vw1szMdTAc
	VlxtZVweVy3U3ORgarVV0s4+LU0TY3/Or0MrP47ay6IoXvgnS5Gy2k7YnsVmX7BNxgbQ0fOh7KX
	ePMoyleHK8MmBLOnDFf/EP/yj06GMe1aQ0frYVlQNYoXPhoZm6b3AJ86AJgrUaHIvduZJOnyb9N
	OX/GIrSbAx3hC0SxpLjG1SDwb1qHa/xOJbDysxwAQReU/7C7YCqxkW4M7TrAs5Vnb45fs0Ygtck
	JdEj3oNhKoapWj2CPY9PAPHZDhKjKzrvYBpUicStUk6JeQelW3Fr5hwiTkWA8N7EgWqzZ2zn/71
	ZmGiLGfi+OVd1BaY7qc5Alq5B4AUOvtw8AEfToMXzfbT5l3v9axi5nTVyqLRYc=
X-Received: by 2002:a05:6122:54f:b0:5ea:e324:7c0c with SMTP id 71dfb90a1353d-5eaebea8e44mr1145897e0c.22.1792607342092;
        Wed, 21 Oct 2026 11:29:02 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97d336fsm4115246e0c.9.2026.10.21.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:29:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:28:54 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ernest.vanhoecke@toradex.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
 <atjShkhCdLzf921d@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atjShkhCdLzf921d@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_112903_952423_C3700B90 
X-CRM114-Status: GOOD (  51.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On Wed, Oct 21, 2026 at 09:56:06AM -0500, Frank Li wrote:
> On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> > Hi Frank,
> >
> > On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > >
> > > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > > >
> > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > ---
> > > > >
> > > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > > >
> > > > > why not share one dtso?
> > > > >
> > > > > Frank
> > > >
> > > > Hi Frank,
> > > >
> > > > There are two main differences:
> > > >
> > > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > > in the one without the mezzanine.
> > > >
> > > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > > mezzanine board.
> > >
> > >
> > > And there are for imx8mm
> > > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> > >
> > > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> > >
> > > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > > work on optimization solution.
> > >
> > > If use nexus connectors, we can share one dtso now if there are not
> > > clock settings.
> > >
> > > clock patches is close to pick up
> > > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> > >
> > > Frank
> >
> > We tried to make the change to have a single overlay for the boards with and
> > without the Mezzanine. However, in the current state of nexus connectors, this
> > can't be done cleanly yet. When trying to describe the hardware at the level it
> > exists in, following DT guidelines, and using nexus connectors, we still need
> > two separate overlays to enable the native LVDS with and without the Mezzanine,
> > so we don't really reduce the maintenance effort.
> >
> > See the changes at the end of the email, this is the closest we got to a
> > correct and clean implementation that would allow the usage of a single
> > overlay.
> >
> > The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> > and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> > Ideally, they would be defined in the nexus connector, as shown in the diff.
> > However, after enabling the connectors in the overlay, the pinctrl groups
> > remain unclaimed. The reason is that nexus connectors have no driver to claim
> > the groups.
> >
> >     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
> >     ...
> >     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> >     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> >     ...
> >
> > There is nowhere else in the carrier dtsi's where the pinctrls belong.
> >
> > The pinctrl groups thus need to be added to the touchscreen node defined in the
> > overlay. However, the pins on the Development Board (which uses the Mezzanine)
> > are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> > and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> > a different overlay, which doesn't claim any pinctrl.
> 
> I met similar problem, see below.
> 
> >
> > We like the idea of a single overlay for both carriers, but sadly the nexus
> > connectors, as they currently are, are not ready to enable this. We therefore
> > have to move forward normally and once connector support matures, we're happy
> > to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> > and for other modules.
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > index 72a4f846d694..d73a7e9042ea 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > @@ -4,6 +4,41 @@
> >   */
> >
> >  / {
> > +	lvds_connector: lvds-mezzanine-connector {
> > +		compatible = "toradex,lvds-connector";
> > +		#gpio-cells = <2>;
> > +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> > +		gpio-map = <0 0 &gpio1 6 0>;
> > +		gpio-map-mask = <0xffffffff 0x0>;
> > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > +
> > +		#pwm-cells = <3>;
> > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > +		pwm-map-mask = <0x0 0x0 0x0>;
> > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> > +	touch_connector: touch-mezzanine-connector {
> > +		compatible = "toradex,touch-connector";
> > +		#gpio-cells = <2>;
> > +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> > +		gpio-map = <0 0 &gpio1 1 0>;
> > +		gpio-map-mask = <0xffffffff 0x0>;
> > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > +
> > +		#address-cells = <0>;
> > +		#interrupt-cells = <2>;
> > +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> > +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> > +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> > +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> >  	native-hdmi-connector {
> >  		compatible = "hdmi-connector";
> >  		label = "X37";
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > index 846b36706821..736f034c7550 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > @@ -11,6 +11,46 @@
> >  #include <dt-bindings/leds/common.h>
> >
> >  / {
> > +	lvds_connector: lvds-connector {
> > +		compatible = "toradex,lvds-connector";
> > +
> > +		#gpio-cells = <2>;
> > +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> > +		gpio-map = <0 0 &gpio5 1 0>;
> > +		gpio-map-mask = <0xffffffff 0x0>;
> > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > +
> > +		#pwm-cells = <3>;
> > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > +		pwm-map-mask = <0x0 0x0 0x0>;
> > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> > +	touch_connector: touch-connector {
> > +		compatible = "toradex,touch-connector";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> > +			    <&pinctrl_i2s_2_sync_gpio>;
> 
> Thank you try this method.  Can make a pre-defined label for it, such
> such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....
> 
> So touch overlay use this label directly, like other port, i2c ...
> 
> After nexus improve by support mapping pinctrl, only few line needs be
> changes.
> 
> The bad things is that it need define NULL pintctrl for i2c gpio expander.
> 
> It is worth to try.

Just to clarify, do you mean doing something like this in the Dev Board
dtsi?

    &iomuxc {
        touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
            fsl,pins = <>;
        };

        touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {
            fsl,pins = <>;
        };
    };

This gives warnings in dtbs_check as it doesn't parse the pins array correctly:

    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio0grp:fsl,pins: True is not of type 'array'
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio1grp:fsl,pins: True is not of type 'array'
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml

Is this what you really meant, or did I misunderstand?

Leonardo

