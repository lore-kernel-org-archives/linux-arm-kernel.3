Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED37606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NsVuUlz/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mF8MqCn+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+z1Rhi72CLA+3ImnBbdKj5H+tRrYkqgiI5aTXiScNiA=; b=NsVuUlz/hx3Y7n6Gmru/tRbccU
	3ylnzD8C4zlEqeSPwGHvEQYFjd9gqJZGRj/POKuoQOtxD2z4YH4ZN5Mui1kejy7KO2gLi63J9349W
	VM/ptDy6G8AvTDVG33t2k4rSfM3iLmxwIGHoVSX0qoE+dkfIvZJeuItpHlo+doSlBxorrL1ZoOjns
	ZluAkROh/e4Ukk/5C4K4pSoFkge2sh6kDOTGFdhb0Q+Om2jrcPZKDM8/XtCy5F9xjkE1bLB3NH2Ny
	MJZkxyh8HJ9E0k/jc+Y79AsZkLNp3bsV3impU2rfI4SoKuIIwF6pWvOUoKsEDjckjBZqmyfC1A46m
	XBgUa+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJ1-0000000E6od-0PPG;
	Thu, 22 Oct 2026 12:54:03 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsIy-0000000E6mv-1puK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:54:01 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7cc603a168fso562137137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673639; x=1793278439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+z1Rhi72CLA+3ImnBbdKj5H+tRrYkqgiI5aTXiScNiA=;
        b=mF8MqCn+J3QpIss0WsOBy9kewvzl8kZX+pwXwkLAqyyC4oLRZKDGBE65NTOCxor3tP
         IzfrmY5iu9RZvLeoPWNOw+5Mp3Abg/sQmdlU0Z+i2sVrN/ruitF9g3a1khG+q+zTRVxS
         2oSHZgq6zmvOp5yMmIsKFNzkf4/Qt7jEVKEljT67Ta9fJDIF+57Xs0lstW1Z+Bja/Plz
         Gv7TDNhArfNKS138Y7dibJ/ZE2c1CevUfWnQeqYUAL3Shc1UHgJZ7+Thzv5fQPAA6Po7
         ixldTUIjwtXLZbR5FSEzNCn3Vw6SBLFc45DcguVf91/3j0uRidC9FyYYo/60z1oWTWb1
         nsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673639; x=1793278439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+z1Rhi72CLA+3ImnBbdKj5H+tRrYkqgiI5aTXiScNiA=;
        b=yCHmi7kYa+7xK5BluVBWbeLqOsgi6STdXdAz6hd+eKunQey36RkgIf+brNxxIMrub+
         R4enBkWNDSn1HgBflkepPDydB6N3aF0T7PW5FpgPMkzu0daVC+JWiyUQCg/B63NrfCAS
         8L5bTP7AEJAJftoLj56VwvyCRJRJeW6CqROmxi9v9zHkAeVTYVBhA4uK5x+ef8UpfrEM
         UR5hBXY9F/Fd11c5AGX//+5/0JE9kcnPH9z2oMWrCe+9I9oj61107gJdlW+5ODGjnwZp
         xAfTlqFA/kgMIBXdj8oeSNwM/XhHZFzhYuKNVF0XtYq2TX4Agn5KxkhCkJfkC6AiMo2v
         0o4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfPUskgu6VNxe8EHY2+H5fbdKOimb9a8gfYsP3mNyBZvjBOdGFsqQjm8hWs3D9UBuCtG/9GmAiGop2HUVM4ceP@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+zWVI11dWsmWBWCo4h16j7gmi35bsMRcorQs5TJ3vqADFJ/xU
	GnsVg71+g4AmnVYOJ6VP7bLnNbQbrD+1KrHdiRdoraJDiOPWnbpYoFWL
X-Gm-Gg: AYBFou2vQL6LaV58FoDVfkCCq3K6sdfuVnQ8PlkEhxhjXaeLWLqD6SQvmKIqAMRN056
	NkwV/u24gPcpbQ2a8OOUvz212fYI5pgalEr5EhfDK2fYYSScevKRZk70FVae+TUz5GOLRhUjpys
	w+nmjXwW36pm+7BzDZ+77fulCK6403kq36fRLfdc3OIc9LFLiW/bt57jVice3DrSxiXu4hgcqrN
	vAqLjClqcnusTKqokCiTUAzl1lV9U7R4iRpOZTBNSsvJZ+4yrER/pDlEe43Mfhkk58kzFsMN8FC
	ZTeBDmyixvN+CkvXlazApkxiktElrk5+MazuDXgWlBzJOPUJfMND7UePTdZ2dT3MMj77qFPcxAa
	imuBdRkaepGiiH671m8IV6svo5m13xvjw+wOUuHuworqdXxb6+BZBr+YSBnQ6TkrkBW/NyPULzK
	ClTfS7J03yJfJnia3lLMfbGjFaIlVbBRQmu1RXBdwUosHV3VVEuX09W4XfwZR3x+fe1H9XvaNMM
	jlZ0/cd2dkjLFfzhIVLdOc7TMqnT/6KjLp5u6YXQMAQdLocj4vDm08kZyflYATbgGbv+QGK+xID
	qQmVJF5SdUdcLtU2H2ip
X-Received: by 2002:a05:6102:149e:b0:7cc:9d46:f091 with SMTP id ada2fe7eead31-7cc9d470bbamr1373148137.24.1792673638506;
        Thu, 22 Oct 2026 05:53:58 -0700 (PDT)
Received: from leonardoc-nb (201-43-119-247.dsl.telesp.net.br. [201.43.119.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc921b5daasm6073113137.2.2026.10.22.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:53:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:53:51 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ernest.vanhoecke@toradex.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <k4khlrkmuqdigphq5q5irhkegtrxvb3z3sljt7blazq3bjtzlq@l25wykhzg7ys>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
 <atjShkhCdLzf921d@SMW015318>
 <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
 <atkGl7o2Z2D2qIcP@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atkGl7o2Z2D2qIcP@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055400_514059_019E9C06 
X-CRM114-Status: GOOD (  56.94  )
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

On Wed, Oct 21, 2026 at 01:38:15PM -0500, Frank Li wrote:
> On Wed, Oct 21, 2026 at 03:28:54PM -0300, Leonardo Costa wrote:
> > Hi Frank,
> >
> > On Wed, Oct 21, 2026 at 09:56:06AM -0500, Frank Li wrote:
> > > On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> > > > Hi Frank,
> > > >
> > > > On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > > > > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > > > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > >
> > > > > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > > > > >
> > > > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > > ---
> > > > > > >
> > > > > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > > > > >
> > > > > > > why not share one dtso?
> > > > > > >
> > > > > > > Frank
> > > > > >
> > > > > > Hi Frank,
> > > > > >
> > > > > > There are two main differences:
> > > > > >
> > > > > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > > > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > > > > in the one without the mezzanine.
> > > > > >
> > > > > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > > > > mezzanine board.
> > > > >
> > > > >
> > > > > And there are for imx8mm
> > > > > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> > > > >
> > > > > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> > > > >
> > > > > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > > > > work on optimization solution.
> > > > >
> > > > > If use nexus connectors, we can share one dtso now if there are not
> > > > > clock settings.
> > > > >
> > > > > clock patches is close to pick up
> > > > > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> > > > >
> > > > > Frank
> > > >
> > > > We tried to make the change to have a single overlay for the boards with and
> > > > without the Mezzanine. However, in the current state of nexus connectors, this
> > > > can't be done cleanly yet. When trying to describe the hardware at the level it
> > > > exists in, following DT guidelines, and using nexus connectors, we still need
> > > > two separate overlays to enable the native LVDS with and without the Mezzanine,
> > > > so we don't really reduce the maintenance effort.
> > > >
> > > > See the changes at the end of the email, this is the closest we got to a
> > > > correct and clean implementation that would allow the usage of a single
> > > > overlay.
> > > >
> > > > The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> > > > and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> > > > Ideally, they would be defined in the nexus connector, as shown in the diff.
> > > > However, after enabling the connectors in the overlay, the pinctrl groups
> > > > remain unclaimed. The reason is that nexus connectors have no driver to claim
> > > > the groups.
> > > >
> > > >     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
> > > >     ...
> > > >     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > > >     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > > >     ...
> > > >
> > > > There is nowhere else in the carrier dtsi's where the pinctrls belong.
> > > >
> > > > The pinctrl groups thus need to be added to the touchscreen node defined in the
> > > > overlay. However, the pins on the Development Board (which uses the Mezzanine)
> > > > are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> > > > and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> > > > a different overlay, which doesn't claim any pinctrl.
> > >
> > > I met similar problem, see below.
> > >
> > > >
> > > > We like the idea of a single overlay for both carriers, but sadly the nexus
> > > > connectors, as they currently are, are not ready to enable this. We therefore
> > > > have to move forward normally and once connector support matures, we're happy
> > > > to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> > > > and for other modules.
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > index 72a4f846d694..d73a7e9042ea 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > @@ -4,6 +4,41 @@
> > > >   */
> > > >
> > > >  / {
> > > > +	lvds_connector: lvds-mezzanine-connector {
> > > > +		compatible = "toradex,lvds-connector";
> > > > +		#gpio-cells = <2>;
> > > > +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> > > > +		gpio-map = <0 0 &gpio1 6 0>;
> > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > +
> > > > +		#pwm-cells = <3>;
> > > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > > +
> > > > +		status = "disabled";
> > > > +	};
> > > > +
> > > > +	touch_connector: touch-mezzanine-connector {
> > > > +		compatible = "toradex,touch-connector";
> > > > +		#gpio-cells = <2>;
> > > > +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> > > > +		gpio-map = <0 0 &gpio1 1 0>;
> > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > +
> > > > +		#address-cells = <0>;
> > > > +		#interrupt-cells = <2>;
> > > > +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> > > > +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> > > > +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> > > > +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> > > > +
> > > > +		status = "disabled";
> > > > +	};
> > > > +
> > > >  	native-hdmi-connector {
> > > >  		compatible = "hdmi-connector";
> > > >  		label = "X37";
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > index 846b36706821..736f034c7550 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > @@ -11,6 +11,46 @@
> > > >  #include <dt-bindings/leds/common.h>
> > > >
> > > >  / {
> > > > +	lvds_connector: lvds-connector {
> > > > +		compatible = "toradex,lvds-connector";
> > > > +
> > > > +		#gpio-cells = <2>;
> > > > +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> > > > +		gpio-map = <0 0 &gpio5 1 0>;
> > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > +
> > > > +		#pwm-cells = <3>;
> > > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > > +
> > > > +		status = "disabled";
> > > > +	};
> > > > +
> > > > +	touch_connector: touch-connector {
> > > > +		compatible = "toradex,touch-connector";
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> > > > +			    <&pinctrl_i2s_2_sync_gpio>;
> > >
> > > Thank you try this method.  Can make a pre-defined label for it, such
> > > such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....
> > >
> > > So touch overlay use this label directly, like other port, i2c ...
> > >
> > > After nexus improve by support mapping pinctrl, only few line needs be
> > > changes.
> > >
> > > The bad things is that it need define NULL pintctrl for i2c gpio expander.
> > >
> > > It is worth to try.
> >
> > Just to clarify, do you mean doing something like this in the Dev Board
> > dtsi?
> >
> >     &iomuxc {
> >         touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
> >             fsl,pins = <>;
> >         };
> 
> In your board,
> 	fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */
> 
> If use i2c gpio expander, which have not pinctrl, you can try
> 	touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};
> Do you meet this case in your board design?
> 
> Frank

On the dev board, these pins don't come from a GPIO expander, but I
tried both methods:

    &iomuxc {
        touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
            fsl,pins =
                <MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x1c4>;	/* SODIMM 208 */
        };

        touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {
            fsl,pins =
                <MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x184>;	/* SODIMM 210 */
        };
    };

This doesn't work, as the touch controller driver isn't able to claim
the pin muxes, and its probe function fails:

    [    8.181431] imx8mp-pinctrl 30330000.pinctrl: pin MX8MP_IOMUXC_GPIO1_IO01 already requested by 30330000.pinctrl; cannot claim for 1-0041
    [    8.181468] imx8mp-pinctrl 30330000.pinctrl: error -EINVAL: pin-6 (1-0041)
    [    8.181483] imx8mp-pinctrl 30330000.pinctrl: error -EINVAL: could not request pin 6 (MX8MP_IOMUXC_GPIO1_IO01) from group touchconn0gpio0grp on device 30330000.pinctrl

The other alternative was to use empty pinctrls:

    &iomuxc {
        touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};

        touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {};
    };

This does work, but it also gives warnings on the dtbs_check:

    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio0grp: 'fsl,pins' is a required property
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio1grp: 'fsl,pins' is a required property
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml

I also tried a few more configurations, but there is no alternative that
works and also adheres to DT guidelines, while passing dtbs_check.

Leonardo

